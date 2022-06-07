import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/core/widgets/page_route_builder.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/entities/sea_creature.dart';
import 'package:new_horizons_encyclopedia/data/repositories/sea_creatures.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/filters/view.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';

class SeaCreaturesNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier, LoadableNotifier {
  late SeaCreaturesRepository seaCreaturesRepository;
  late AppwriteStorage storage;

  List<SeaCreature> get seaCreatures => _seaCreatures;
  List<SeaCreature> _seaCreatures = [];
  set seaCreatures(List<SeaCreature> value) {
    if (_seaCreatures != value) {
      _seaCreatures = value;
      notifyListeners();
    }
  }

  List<Uint8List> get seaCreaturesImagesData => _seaCreaturesImagesData;
  List<Uint8List> _seaCreaturesImagesData = [];
  set seaCreaturesImagesData(List<Uint8List> value) {
    if (_seaCreaturesImagesData != value) {
      _seaCreaturesImagesData = value;
      notifyListeners();
    }
  }

  Future<void> _getSeaCreaturesImages() async {
    List<Uint8List> imagesData = [];
    await Future.forEach(seaCreatures, (SeaCreature element) async {
      final data = await storage.getImage(imageId: element.imageId);
      imagesData.add(data);
    });
    seaCreaturesImagesData = imagesData;
  }

  DatabaseFilters _databaseFilters = const DatabaseFilters(
    orderType: OrderType.id,
    orderSort: OrderSort.asc,
    orderCast: OrderCast.string,
    filterTime: FilterTime.currently,
    month: null,
    filterRarity: FilterRarity.all,
  );

  Future<void> pushFiltersViewAndReload(BuildContext context) async {
    final databaseFilters = await Navigator.push<DatabaseFilters>(
      context,
      FadeRouteBuilder(
        page: FiltersView(
          databaseFilters: _databaseFilters,
          backgroundPath: AppImages.backgroundYellow,
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

      seaCreatures.removeWhere((element) {
        bool monthOk = true;

        if (element.month == '1-12') {
          return false;
        }
        if ((element.month.length == 1 || element.month.length == 2) &&
            int.parse(element.month) == targetMonth) {
          return false;
        }
        if (element.month.contains(';')) {
          element.month.split(';').forEach((e1) {
            if ((e1.length == 1 || e1.length == 2) &&
                int.parse(e1) == targetMonth) {
              monthOk = false;
            } else if (e1.length > 2) {
              int monthStart = int.parse(e1.split('-')[0]);
              int monthEnd = int.parse(e1.split('-')[1]);
              if (monthStart > monthEnd) {
                int tmp = monthStart;
                monthStart = monthEnd;
                monthEnd = tmp;
                if (targetMonth <= monthStart || targetMonth >= monthEnd) {
                  monthOk = false;
                }
              } else if (targetMonth >= monthStart && targetMonth <= monthEnd) {
                monthOk = false;
              }
            }
          });
        } else if (element.month.contains('-')) {
          int monthStart = int.parse(element.month.split('-')[0]);
          int monthEnd = int.parse(element.month.split('-')[1]);
          if (monthStart > monthEnd) {
            int tmp = monthStart;
            monthStart = monthEnd;
            monthEnd = tmp;
            if (targetMonth <= monthStart || targetMonth >= monthEnd) {
              monthOk = false;
            }
          } else if (targetMonth >= monthStart && targetMonth <= monthEnd) {
            monthOk = false;
          }
        }

        return monthOk;
      });

      if (_databaseFilters.filterTime == FilterTime.currently) {
        final targetHour = DateTime.now().hour;

        seaCreatures.removeWhere((element) {
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

    seaCreatures = List<SeaCreature>.from(
      await seaCreaturesRepository.getAllSeaCreatures(
        databaseFilters: _databaseFilters,
      ),
    );
    _filterMonths();
    await _getSeaCreaturesImages();

    busy = false;
  }
}
