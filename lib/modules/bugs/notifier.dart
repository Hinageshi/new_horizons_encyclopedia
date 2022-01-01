import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/entities/bug.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/repositories/bugs.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/filters/view.dart';

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
    filterTime: FilterTime.all,
    month: null,
    filterRarity: FilterRarity.all,
  );

  Future<void> pushFiltersViewAndReload(BuildContext context) async {
    final databaseFilters = await Navigator.push<DatabaseFilters>(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersView(
          databaseFilters: _databaseFilters,
        ),
      ),
    );

    if (databaseFilters != null && _databaseFilters != databaseFilters) {
      _databaseFilters = databaseFilters;
      load();
    }
  }

  @override
  Future<void> load() async {
    busy = true;

    bugs = await bugsRepository.getAllBugs(
      databaseFilters: _databaseFilters,
    );
    await _getBugsImages();

    busy = false;
  }
}
