import 'package:flutter/foundation.dart';
import 'package:new_horizons_encyclopedia/data/entities/bug.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_database.dart';
import 'package:quiver/cache.dart';

const _collectionId = 'bugs';

@immutable
class BugsRepository {
  BugsRepository({
    required AppwriteDatabase database,
    MapCache<String, List<Bug>>? cache,
  })  : _database = database,
        _cache = cache ?? MapCache<String, List<Bug>>.lru();

  factory BugsRepository.update({
    required AppwriteDatabase database,
    required BugsRepository? old,
  }) {
    if (old == null || database != old._database) {
      return BugsRepository(
        database: database,
      );
    } else {
      return old;
    }
  }

  final AppwriteDatabase _database;
  final MapCache<String, List<Bug>> _cache;

  Future<List<Bug>> getAllBugs({
    required DatabaseFilters databaseFilters,
  }) async =>
      await _cache.get(
        'bugs_${databaseFilters.orderType.toDatabaseField()}_${databaseFilters.orderSort.toDatabaseSort()}_${databaseFilters.filterRarity.toDatabaseFilter()}',
        ifAbsent: (key) async => _database.fetchDocuments<Bug>(
          collectionId: _collectionId,
          deserializer: (json) => Bug.fromJson(json as Map<String, dynamic>),
          databaseFilters: databaseFilters,
          limit: 80,
        ),
      ) ??
      <Bug>[];
}
