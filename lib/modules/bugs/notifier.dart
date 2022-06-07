import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/core/widgets/page_route_builder.dart';
import 'package:new_horizons_encyclopedia/data/entities/bug.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/repositories/bugs.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/filters/view.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';

class BugsNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier, LoadableNotifier {
  late BugsRepository bugsRepository;
  late AppwriteStorage storage;

  List<Bug> get bugs => _bugs;
  List<Bug> _bugs = [];
  set bugs(List<Bug> value) {
    if (_bugs != value) {
      _bugs = value;
      notifyListeners();
    }
  }

  List<Uint8List> get bugsImagesData => _bugsImagesData;
  List<Uint8List> _bugsImagesData = [];
  set bugsImagesData(List<Uint8List> value) {
    if (_bugsImagesData != value) {
      _bugsImagesData = value;
      notifyListeners();
    }
  }

  Future<void> _getBugsImages() async {
    List<Uint8List> imagesData = [];
    await Future.forEach(bugs, (Bug element) async {
      final data = await storage.getImage(imageId: element.imageId);
      imagesData.add(data);
    });
    bugsImagesData = imagesData;
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
          backgroundPath: AppImages.backgroundGreen,
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

      bugs.removeWhere((element) {
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

        bugs.removeWhere((element) {
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

    bugs = List<Bug>.from(
      await bugsRepository.getAllBugs(
        databaseFilters: _databaseFilters,
      ),
    );
    _filterMonths();
    await _getBugsImages();

    busy = false;
  }
}
