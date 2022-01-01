import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/entities/sea_creature.dart';
import 'package:new_horizons_encyclopedia/data/repositories/sea_creatures.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/filters/view.dart';

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

    seaCreatures = await seaCreaturesRepository.getAllSeaCreatures(
      databaseFilters: _databaseFilters,
    );
    await _getSeaCreaturesImages();

    busy = false;
  }
}
