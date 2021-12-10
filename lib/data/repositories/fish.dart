import 'package:flutter/foundation.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_database.dart';
import 'package:quiver/cache.dart';

const _collectionId = '6192cafdc55a8';

@immutable
class FishRepository {
  FishRepository({
    required AppwriteDatabase database,
    MapCache<String, List<Fish>>? cache,
  })  : _database = database,
        _cache = cache ?? MapCache<String, List<Fish>>.lru();

  factory FishRepository.update({
    required AppwriteDatabase database,
    required FishRepository? old,
  }) {
    if (old == null || database != old._database) {
      return FishRepository(
        database: database,
      );
    } else {
      return old;
    }
  }

  final AppwriteDatabase _database;
  final MapCache<String, List<Fish>> _cache;

  Future<List<Fish>> getAllFish({
    required DatabaseFilters databaseFilters,
  }) async =>
      await _cache.get(
        'fish_${databaseFilters.orderType.toDatabaseField()}_${databaseFilters.orderSort.toDatabaseSort()}_${databaseFilters.filterRarity.toDatabaseFilter()}',
        ifAbsent: (key) async => _database.fetchDocuments<Fish>(
          collectionId: _collectionId,
          deserializer: (json) => Fish.fromJson(json as Map<String, dynamic>),
          databaseFilters: databaseFilters,
          limit: 80,
        ),
      ) ??
      <Fish>[];
}
