import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

extension HourExtension on String {
  String toReadableHour(BuildContext context) {
    final l10n = context.l10n;

    if (this == '0-23') {
      return l10n.hour_all_day;
    } else {
      return '${replaceAll('-', 'h - ').replaceAll(';', ', ')}h';
    }
  }
}

extension MonthExtension on String {
  String toReadableMonth(BuildContext context) {
    final l10n = context.l10n;

    if (this == '1-12') {
      return l10n.month_all_year;
    } else {
      final replaced = replaceAll('-', ' - ')
          .replaceAll(';', ', ')
          .replaceAll('10', l10n.month_october)
          .replaceAll('11', l10n.month_november)
          .replaceAll('12', l10n.month_december)
          .replaceAll('1', l10n.month_january)
          .replaceAll('2', l10n.month_february)
          .replaceAll('3', l10n.month_march)
          .replaceAll('4', l10n.month_april)
          .replaceAll('5', l10n.month_may)
          .replaceAll('6', l10n.month_june)
          .replaceAll('7', l10n.month_july)
          .replaceAll('8', l10n.month_august)
          .replaceAll('9', l10n.month_september);
      return replaced;
    }
  }

  bool isSameFirstMonth() {
    if (length == 1 || length == 2) {
      return int.parse(this) == DateTime.now().month;
    }
    if (this == '1-12') {
      return false;
    }
    if (contains(';')) {
      split(';').map((e1) {
        if (int.parse(e1.split('-')[0]) == DateTime.now().month) {
          return true;
        }
      });
      return false;
    }
    return int.parse(split('-')[0]) == DateTime.now().month;
  }

  bool isSameLastMonth() {
    if (length == 1 || length == 2) {
      return int.parse(this) == DateTime.now().month;
    }
    if (this == '1-12') {
      return false;
    }
    if (contains(';')) {
      split(';').map((e1) {
        if (e1.length == 1 || e1.length == 2) {
          return int.parse(e1) == DateTime.now().month;
        }
        if (int.parse(e1.split('-')[1]) == DateTime.now().month) {
          return true;
        }
      });
      return false;
    }
    return int.parse(split('-')[1]) == DateTime.now().month;
  }
}
