// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum Rarity {
  normal,
  rare,
  very_rare,
}

extension RarityExtension on Rarity {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case Rarity.normal:
        return l10n.rarity_normal;
      case Rarity.rare:
        return l10n.rarity_rare;
      case Rarity.very_rare:
        return l10n.rarity_very_rare;
    }
  }
}
