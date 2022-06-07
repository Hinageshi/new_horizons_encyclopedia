// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

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
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case BugLocation.beach:
        return l10n.bug_location_beach;
      case BugLocation.beach_rocks:
        return l10n.bug_location_beach_rocks;
      case BugLocation.bushes_rocks_rain:
        return l10n.bug_location_bushes_rocks_rain;
      case BugLocation.flowers:
        return l10n.bug_location_flowers;
      case BugLocation.ground:
        return l10n.bug_location_ground;
      case BugLocation.lights:
        return l10n.bug_location_lights;
      case BugLocation.near_water:
        return l10n.bug_location_near_water;
      case BugLocation.palms:
        return l10n.bug_location_palms;
      case BugLocation.rocks:
        return l10n.bug_location_rocks;
      case BugLocation.rotten_turnips:
        return l10n.bug_location_rotten_turnips;
      case BugLocation.sky:
        return l10n.bug_location_sky;
      case BugLocation.sky_black_purple_blue_flowers:
        return l10n.bug_location_sky_black_purple_blue_flowers;
      case BugLocation.snowballs:
        return l10n.bug_location_snowballs;
      case BugLocation.trash_rotten_turnips:
        return l10n.bug_location_trash_rotten_turnips;
      case BugLocation.tree_stumps:
        return l10n.bug_location_tree_stumps;
      case BugLocation.trees:
        return l10n.bug_location_trees;
      case BugLocation.trees_palms:
        return l10n.bug_location_trees_palms;
      case BugLocation.underground:
        return l10n.bug_location_underground;
      case BugLocation.villagers:
        return l10n.bug_location_villagers;
      case BugLocation.water_surface:
        return l10n.bug_location_water_surface;
      case BugLocation.white_flowers:
        return l10n.bug_location_white_flowers;
    }
  }
}
