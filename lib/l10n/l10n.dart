import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/l10n/localizations.dart';

extension AppLocalizationsBuildContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
