import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/config/prod.dart';
import 'package:new_horizons_encyclopedia/core/config/prp.dart';

/// Configuration for an application.
@immutable
abstract class Config {
  const Config();

  /// Configuration for the `preprod` environment.
  factory Config.prp() => const PrpConfig();

  /// Configuration for the `production` environment.
  factory Config.prod() => const ProdConfig();

  /// AppWrite endpoint
  String get appWriteEndpoint;

  /// AppWrite project ID
  String get projectId;
}
