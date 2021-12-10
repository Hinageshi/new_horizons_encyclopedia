import 'package:new_horizons_encyclopedia/core/config/config.dart';

/// Configuration for the `preprod` environment.
class PrpConfig extends Config {
  const PrpConfig() : super();

  @override
  String get appWriteEndpoint => 'http://localhost:4003/v1';

  @override
  String get projectId => '6192cad3623bd';
}
