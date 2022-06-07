import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_horizons_encyclopedia/core/config/config.dart';
import 'package:new_horizons_encyclopedia/modules/app/app.dart';

Future<void> run(Config config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(App(config: config));
}
