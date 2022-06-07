// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum FishSize {
  tiny,
  small,
  small_average,
  medium,
  medium_fin,
  medium_large,
  large,
  very_large,
  huge,
  huge_fin,
  thin,
}

extension FishSizeExtension on FishSize {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case FishSize.tiny:
        return l10n.fish_size_tiny;
      case FishSize.small:
        return l10n.fish_size_small;
      case FishSize.small_average:
        return l10n.fish_size_small_average;
      case FishSize.medium:
        return l10n.fish_size_medium;
      case FishSize.medium_fin:
        return l10n.fish_size_medium_fin;
      case FishSize.medium_large:
        return l10n.fish_size_medium_large;
      case FishSize.large:
        return l10n.fish_size_large;
      case FishSize.very_large:
        return l10n.fish_size_very_large;
      case FishSize.huge:
        return l10n.fish_size_huge;
      case FishSize.huge_fin:
        return l10n.fish_size_huge_fin;
      case FishSize.thin:
        return l10n.fish_size_thin;
    }
  }
}
