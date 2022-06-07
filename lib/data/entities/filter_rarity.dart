// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum FilterRarity {
  normal,
  rare,
  very_rare,
  all,
}

extension FilterRarityExtension on FilterRarity {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case FilterRarity.normal:
        return l10n.rarity_normal;
      case FilterRarity.rare:
        return l10n.rarity_rare;
      case FilterRarity.very_rare:
        return l10n.rarity_very_rare;
      case FilterRarity.all:
        return l10n.filter_rarity_all;
    }
  }

  String toDatabaseFilter() {
    switch (this) {
      case FilterRarity.normal:
        return 'normal';
      case FilterRarity.rare:
        return 'rare';
      case FilterRarity.very_rare:
        return 'very_rare';
      case FilterRarity.all:
        return 'all';
    }
  }
}
