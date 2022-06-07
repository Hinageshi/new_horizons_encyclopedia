// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum Movement {
  still,
  very_slow,
  slow,
  medium,
  fast,
  very_fast,
}

extension MovementExtension on Movement {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case Movement.still:
        return l10n.movement_still;
      case Movement.very_slow:
        return l10n.movement_very_slow;
      case Movement.slow:
        return l10n.movement_slow;
      case Movement.medium:
        return l10n.movement_medium;
      case Movement.fast:
        return l10n.movement_fast;
      case Movement.very_fast:
        return l10n.movement_very_fast;
    }
  }
}
