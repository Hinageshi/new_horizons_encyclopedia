import 'package:flutter/foundation.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/entities/sea_creature.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_database.dart';
import 'package:quiver/cache.dart';

const _collectionId = 'sea_creatures';

@immutable
class SeaCreaturesRepository {
  SeaCreaturesRepository({
    required AppwriteDatabase database,
    MapCache<String, List<SeaCreature>>? cache,
  })  : _database = database,
        _cache = cache ?? MapCache<String, List<SeaCreature>>.lru();

  factory SeaCreaturesRepository.update({
    required AppwriteDatabase database,
    required SeaCreaturesRepository? old,
  }) {
    if (old == null || database != old._database) {
      return SeaCreaturesRepository(
        database: database,
      );
    } else {
      return old;
    }
  }

  final AppwriteDatabase _database;
  final MapCache<String, List<SeaCreature>> _cache;

  Future<List<SeaCreature>> getAllSeaCreatures({
    required DatabaseFilters databaseFilters,
  }) async =>
      await _cache.get(
        'seaCreatures_${databaseFilters.orderType.toDatabaseField()}_${databaseFilters.orderSort.toDatabaseSort()}_${databaseFilters.filterRarity.toDatabaseFilter()}',
        ifAbsent: (key) async => _database.fetchDocuments<SeaCreature>(
          collectionId: _collectionId,
          deserializer: (json) => SeaCreature.fromJson(
            json as Map<String, dynamic>,
          ),
          databaseFilters: databaseFilters,
          limit: 80,
        ),
      ) ??
      <SeaCreature>[];
}
