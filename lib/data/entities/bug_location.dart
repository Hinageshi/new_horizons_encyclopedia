// ignore_for_file: constant_identifier_names

enum BugLocation {
  beach,
  beach_rocks,
  bushes_rocks_rain,
  flowers,
  ground,
  lights,
  near_water,
  palms,
  rocks,
  rotten_turnips,
  sky,
  sky_black_purple_blue_flowers,
  snowballs,
  trash_rotten_turnips,
  tree_stumps,
  trees,
  trees_palms,
  underground,
  villagers,
  water_surface,
  white_flowers,
}

extension BugLocationExtension on BugLocation {
  String toShortString() {
    switch (this) {
      case BugLocation.beach:
        return 'Plage';
      case BugLocation.beach_rocks:
        return 'Plage (rochers)';
      case BugLocation.bushes_rocks_rain:
        return 'Buissons/Rochers (pluie)';
      case BugLocation.flowers:
        return 'Fleurs';
      case BugLocation.ground:
        return 'Sol';
      case BugLocation.lights:
        return 'Lumières';
      case BugLocation.near_water:
        return 'Près de l\'eau';
      case BugLocation.palms:
        return 'Palmiers';
      case BugLocation.rocks:
        return 'Rockers';
      case BugLocation.rotten_turnips:
        return 'Navets pourris';
      case BugLocation.sky:
        return 'Ciel';
      case BugLocation.sky_black_purple_blue_flowers:
        return 'Ciel (fleurs hybrides noires, violettes et bleues)';
      case BugLocation.snowballs:
        return 'Boules de neige';
      case BugLocation.trash_rotten_turnips:
        return 'Déchets/Navets pourris';
      case BugLocation.tree_stumps:
        return 'Souches d\'arbres';
      case BugLocation.trees:
        return 'Arbres';
      case BugLocation.trees_palms:
        return 'Arbres et palmiers';
      case BugLocation.underground:
        return 'Sous la terre';
      case BugLocation.villagers:
        return 'Villageois';
      case BugLocation.water_surface:
        return 'Surface de l\'eau';
      case BugLocation.white_flowers:
        return 'Fleurs blanches';
    }
  }
}
