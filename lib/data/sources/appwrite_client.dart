import 'package:appwrite/appwrite.dart';
import 'package:new_horizons_encyclopedia/core/config/config.dart';

class AppwriteClient {
  AppwriteClient({
    required Config config,
  })  : _config = config,
        client = Client()
            .setEndpoint(config.appWriteEndpoint)
            .setProject(config.projectId);

  factory AppwriteClient.update({
    required Config config,
    required AppwriteClient? old,
  }) {
    if (old == null || config != old._config) {
      return AppwriteClient(
        config: config,
      );
    } else {
      return old;
    }
  }

  final Config _config;
  final Client client;
}
