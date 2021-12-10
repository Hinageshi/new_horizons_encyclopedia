enum FilterTime {
  currently,
  monthly,
  all,
}

extension FilterTimeExtension on FilterTime {
  String toShortString() {
    switch (this) {
      case FilterTime.currently:
        return 'Actuellement';
      case FilterTime.monthly:
        return 'Par mois';
      case FilterTime.all:
        return 'Tous les mois';
    }
  }
}
