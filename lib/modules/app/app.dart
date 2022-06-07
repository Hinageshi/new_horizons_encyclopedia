import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_horizons_encyclopedia/core/config/config.dart';
import 'package:new_horizons_encyclopedia/l10n/localizations.dart';
import 'package:new_horizons_encyclopedia/modules/app/app_providers.dart';
import 'package:new_horizons_encyclopedia/modules/splash/view.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';

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
        theme: ThemeData(
          primaryColor: AppColors.primary,
          colorScheme: const ColorScheme(
            primary: AppColors.primary,
            primaryVariant: AppColors.primary,
            secondary: AppColors.secondary,
            secondaryVariant: AppColors.secondary,
            surface: AppColors.surface,
            background: AppColors.shadow,
            error: AppColors.red,
            onPrimary: AppColors.text,
            onSecondary: AppColors.text,
            onSurface: AppColors.text,
            onBackground: AppColors.text,
            onError: AppColors.text,
            brightness: Brightness.light,
          ),
        ),
        title: 'New Horizons Encyclopedia',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fr', ''),
          Locale('en', ''),
        ],
        home: const SplashView(),
      ),
    );
  }
}
