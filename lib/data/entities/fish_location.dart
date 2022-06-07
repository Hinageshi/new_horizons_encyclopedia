// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum FishLocation {
  ocean,
  ocean_pontoon,
  ocean_rain_snow,
  pond,
  river,
  river_cliff,
  river_mouth,
}

extension FishLocationExtension on FishLocation {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case FishLocation.ocean:
        return l10n.fish_location_ocean;
      case FishLocation.ocean_pontoon:
        return l10n.fish_location_ocean_pontoon;
      case FishLocation.ocean_rain_snow:
        return l10n.fish_location_ocean_rain_snow;
      case FishLocation.pond:
        return l10n.fish_location_pond;
      case FishLocation.river:
        return l10n.fish_location_river;
      case FishLocation.river_cliff:
        return l10n.fish_location_river_cliff;
      case FishLocation.river_mouth:
        return l10n.fish_location_river_mouth;
    }
  }
}
