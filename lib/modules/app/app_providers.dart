import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/core/config/config.dart';
import 'package:new_horizons_encyclopedia/data/repositories/bugs.dart';
import 'package:new_horizons_encyclopedia/data/repositories/fish.dart';
import 'package:new_horizons_encyclopedia/data/repositories/sea_creatures.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_client.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_database.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    Key? key,
    required this.config,
    required this.child,
  }) : super(key: key);

  final Config config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Config
        Provider<Config>.value(value: config),

        /// Router
        Provider<RouteObserver<PageRoute>>(
          create: (_) => RouteObserver<PageRoute>(),
        ),

        /// Appwrite
        ProxyProvider0<AppwriteClient>(
          update: (context, old) => AppwriteClient.update(
            config: context.watch<Config>(),
            old: old,
          ),
        ),
        ProxyProvider0<AppwriteDatabase>(
          update: (context, old) => AppwriteDatabase.update(
            client: context.watch<AppwriteClient>(),
            old: old,
          ),
        ),
        ProxyProvider0<AppwriteStorage>(
          update: (context, old) => AppwriteStorage.update(
            client: context.watch<AppwriteClient>(),
            old: old,
          ),
        ),

        /// Repositories
        ProxyProvider0<FishRepository>(
          update: (context, old) => FishRepository.update(
            database: context.watch<AppwriteDatabase>(),
            old: old,
          ),
        ),
        ProxyProvider0<BugsRepository>(
          update: (context, old) => BugsRepository.update(
            database: context.watch<AppwriteDatabase>(),
            old: old,
          ),
        ),
        ProxyProvider0<SeaCreaturesRepository>(
          update: (context, old) => SeaCreaturesRepository.update(
            database: context.watch<AppwriteDatabase>(),
            old: old,
          ),
        ),
      ],
      child: child,
    );
  }
}
