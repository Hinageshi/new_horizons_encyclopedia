import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum FilterTime {
  currently,
  monthly,
  all,
}

extension FilterTimeExtension on FilterTime {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case FilterTime.currently:
        return l10n.filter_time_currently;
      case FilterTime.monthly:
        return l10n.filter_time_monthly;
      case FilterTime.all:
        return l10n.filter_time_all;
    }
  }
}
