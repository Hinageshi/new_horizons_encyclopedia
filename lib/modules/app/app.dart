import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_horizons_encyclopedia/core/config/config.dart';
import 'package:new_horizons_encyclopedia/modules/app/app_providers.dart';
import 'package:new_horizons_encyclopedia/modules/home/view.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.config,
  }) : super(key: key);

  final Config config;

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      config: config,
      child: MaterialApp(
        builder: DevicePreview.appBuilder, // TODO: remove this after debug
        locale: DevicePreview.locale(context), // TODO: remove this after debug
        useInheritedMediaQuery: true, // TODO: remove this after debug
        title: 'New Horizons Encyclopedia',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fr', ''),
          Locale('en', ''),
        ],
        home: const HomeView(),
      ),
    );
  }
}
