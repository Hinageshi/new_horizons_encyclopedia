// ignore_for_file: constant_identifier_names

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
  String toShortString() {
    switch (this) {
      case FishLocation.ocean:
        return 'Océan';
      case FishLocation.ocean_pontoon:
        return 'Océan (ponton)';
      case FishLocation.ocean_rain_snow:
        return 'Océan (pluie/neige)';
      case FishLocation.pond:
        return 'Étang';
      case FishLocation.river:
        return 'Rivière';
      case FishLocation.river_cliff:
        return 'Rivière (falaise)';
      case FishLocation.river_mouth:
        return 'Embouchure de rivière';
    }
  }
}
