import 'package:appwrite/appwrite.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_client.dart';

typedef Deserializer<T> = T Function(Object value);

class AppwriteDatabase {
  AppwriteDatabase({
    required AppwriteClient client,
  })  : _client = client,
        _database = Database(
          client.client,
        );

  factory AppwriteDatabase.update({
    required AppwriteClient client,
    required AppwriteDatabase? old,
  }) {
    if (old == null || client != old._client) {
      return AppwriteDatabase(
        client: client,
      );
    } else {
      return old;
    }
  }

  final AppwriteClient _client;
  final Database _database;

  Future<List<T>> fetchDocuments<T>({
    required String collectionId,
    required Deserializer<T> deserializer,
    required DatabaseFilters databaseFilters,
    int? limit,
  }) async {
    final documents = await _database
        .listDocuments(
          collectionId: collectionId,
          filters: [
            if (databaseFilters.filterRarity != FilterRarity.all)
              'rarity=${databaseFilters.filterRarity.toDatabaseFilter()}',
          ],
          limit: limit,
          orderField: databaseFilters.orderType.toDatabaseField(),
          orderType: databaseFilters.orderSort.toDatabaseSort(),
          orderCast: databaseFilters.orderCast.toDatabaseCast(),
        )
        .then((list) => list.documents);
    return documents.map((document) => deserializer(document.data)).toList();
  }
}
