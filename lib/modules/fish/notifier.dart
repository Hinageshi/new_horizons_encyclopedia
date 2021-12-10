import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/core/widgets/page_route_builder.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/repositories/fish.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/filters/view.dart';

class FishNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier, LoadableNotifier {
  late FishRepository fishRepository;
  late AppwriteStorage storage;

  List<Fish> get fish => _fish;
  List<Fish> _fish = [];
  set fish(List<Fish> value) {
    if (_fish != value) {
      _fish = value;
      notifyListeners();
    }
  }

  List<Uint8List> get fishImagesData => _fishImagesData;
  List<Uint8List> _fishImagesData = [];
  set fishImagesData(List<Uint8List> value) {
    if (_fishImagesData != value) {
      _fishImagesData = value;
      notifyListeners();
    }
  }

  Future<void> _getFishImages() async {
    List<Uint8List> imagesData = [];
    await Future.forEach(fish, (Fish element) async {
      final data = await storage.getImage(imageId: element.imageId);
      imagesData.add(data);
    });
    fishImagesData = imagesData;
  }

  DatabaseFilters _databaseFilters = const DatabaseFilters(
    orderType: OrderType.id,
    orderSort: OrderSort.asc,
    orderCast: OrderCast.string,
    filterTime: FilterTime.all,
    month: null,
    filterRarity: FilterRarity.all,
  );

  Future<void> pushFiltersViewAndReload(BuildContext context) async {
    final databaseFilters = await Navigator.push<DatabaseFilters>(
      context,
      FadeRouteBuilder(
        page: FiltersView(
          databaseFilters: _databaseFilters,
        ),
      ),
    );

    if (databaseFilters != null && _databaseFilters != databaseFilters) {
      _databaseFilters = databaseFilters;
      await load();
    }
  }

  void _filterMonths() {
    if (_databaseFilters.filterTime != FilterTime.all) {
      final targetMonth = _databaseFilters.filterTime == FilterTime.currently
          ? DateTime.now().month
          : _databaseFilters.month!;

      print('$targetMonth');
      fish.removeWhere((element) {
        print('${element.name} ${element.month}');
        bool monthOk = true;

        if (element.month == '1-12') {
          print('1');
          return false;
        }
        if ((element.month.length == 1 || element.month.length == 2) &&
            int.parse(element.month) == targetMonth) {
          print('2');
          return false;
        }
        if (element.month.contains(';')) {
          print('3');
          element.month.split(';').forEach((e1) {
            if ((e1.length == 1 || e1.length == 2) &&
                int.parse(e1) == targetMonth) {
              print('4');
              monthOk = false;
            } else {
              int monthStart = int.parse(e1.split('-')[0]);
              int monthEnd = int.parse(e1.split('-')[1]);
              print('5 $monthStart $monthEnd');
              if (monthStart > monthEnd) {
                int tmp = monthStart;
                monthStart = monthEnd;
                monthEnd = tmp;
                print('6 $monthStart $monthEnd');
                if (targetMonth <= monthStart || targetMonth >= monthEnd) {
                  print('7');
                  monthOk = false;
                }
              } else if (targetMonth >= monthStart && targetMonth <= monthEnd) {
                print('8');
                monthOk = false;
              }
            }
          });
        } else if (element.month.contains('-')) {
          int monthStart = int.parse(element.month.split('-')[0]);
          int monthEnd = int.parse(element.month.split('-')[1]);
          print('9 $monthStart $monthEnd');
          if (monthStart > monthEnd) {
            int tmp = monthStart;
            monthStart = monthEnd;
            monthEnd = tmp;
            print('10 $monthStart $monthEnd');
            if (targetMonth <= monthStart || targetMonth >= monthEnd) {
              print('11');
              monthOk = false;
            }
          } else if (targetMonth >= monthStart && targetMonth <= monthEnd) {
            print('12');
            monthOk = false;
          }
        }

        print('13 $monthOk');
        return monthOk;
      });

      if (_databaseFilters.filterTime == FilterTime.currently) {
        final targetHour = DateTime.now().hour;

        fish.removeWhere((element) {
          bool hourOk = true;

          if (element.hour == '0-23') {
            return false;
          }
          if ((element.hour.length == 1 || element.hour.length == 2) &&
              int.parse(element.hour) == targetHour) {
            return false;
          }
          if (element.hour.contains(';')) {
            element.hour.split(';').forEach((e1) {
              if ((e1.length == 1 || e1.length == 2) &&
                  int.parse(e1) == targetHour) {
                hourOk = false;
              } else {
                int hourStart = int.parse(e1.split('-')[0]);
                int hourEnd = int.parse(e1.split('-')[1]);
                if (hourStart > hourEnd) {
                  int tmp = hourStart;
                  hourStart = hourEnd;
                  hourEnd = tmp;
                  if (targetHour < hourStart || targetHour > hourEnd) {
                    hourOk = false;
                  }
                } else if (targetHour >= hourStart && targetHour <= hourEnd) {
                  hourOk = false;
                }
              }
            });
          } else if (element.hour.contains('-')) {
            int hourStart = int.parse(element.hour.split('-')[0]);
            int hourEnd = int.parse(element.hour.split('-')[1]);
            if (hourStart > hourEnd) {
              int tmp = hourStart;
              hourStart = hourEnd;
              hourEnd = tmp;
              if (targetHour < hourStart || targetHour > hourEnd) {
                hourOk = false;
              }
            } else if (targetHour >= hourStart && targetHour <= hourEnd) {
              hourOk = false;
            }
          }

          return hourOk;
        });
      }
    }
  }

  @override
  Future<void> load() async {
    busy = true;

    fish = List<Fish>.from(
      await fishRepository.getAllFish(
        databaseFilters: _databaseFilters,
      ),
    );
    _filterMonths();
    await _getFishImages();

    busy = false;
  }
}
