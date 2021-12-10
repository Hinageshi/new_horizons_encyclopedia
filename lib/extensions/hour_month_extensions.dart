extension HourExtension on String {
  String toReadableHour() {
    if (this == '0-23') {
      return 'Toute la journée';
    } else {
      return '${replaceAll('-', 'h - ').replaceAll(';', ', ')}h';
    }
  }
}

extension MonthExtension on String {
  String toReadableMonth() {
    if (this == '1-12') {
      return 'Toute l\'année';
    } else {
      final replaced = replaceAll('-', ' - ')
          .replaceAll(';', ', ')
          .replaceAll('10', 'Octobre')
          .replaceAll('11', 'Novembre')
          .replaceAll('12', 'Décembre')
          .replaceAll('1', 'Janvier')
          .replaceAll('2', 'Février')
          .replaceAll('3', 'Mars')
          .replaceAll('4', 'Avril')
          .replaceAll('5', 'Mai')
          .replaceAll('6', 'Juin')
          .replaceAll('7', 'Juillet')
          .replaceAll('8', 'Août')
          .replaceAll('9', 'Septembre');
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
