import 'package:new_horizons_encyclopedia/core/config/config.dart';

/// Configuration for the `production` environment.
class ProdConfig extends Config {
  const ProdConfig() : super();

  @override
  String get appWriteEndpoint => '';

  @override
  String get projectId => '';
}
