import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_client.dart';
import 'package:quiver/cache.dart';

class AppwriteStorage {
  AppwriteStorage({
    required AppwriteClient client,
    MapCache<String, Uint8List>? cache,
  })  : _client = client,
        _storage = Storage(client.client),
        _cache = cache ?? MapCache<String, Uint8List>.lru(maximumSize: 200);

  factory AppwriteStorage.update({
    required AppwriteClient client,
    required AppwriteStorage? old,
  }) {
    if (old == null || client != old._client) {
      return AppwriteStorage(
        client: client,
      );
    } else {
      return old;
    }
  }

  final AppwriteClient _client;
  final Storage _storage;
  final MapCache<String, Uint8List> _cache;

  Future<Uint8List> getImage({
    required String imageId,
  }) async =>
      await _cache.get(
        imageId,
        ifAbsent: (key) async => _storage.getFileView(
          fileId: imageId,
        ),
      ) ??
      Uint8List(0);
}
