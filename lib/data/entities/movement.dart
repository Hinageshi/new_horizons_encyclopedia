// ignore_for_file: constant_identifier_names

enum Movement {
  still,
  very_slow,
  slow,
  medium,
  fast,
  very_fast,
}

extension MovementExtension on Movement {
  String toShortString() {
    switch (this) {
      case Movement.still:
        return 'Immobile';
      case Movement.very_slow:
        return 'Très lent';
      case Movement.slow:
        return 'Lent';
      case Movement.medium:
        return 'Moyen';
      case Movement.fast:
        return 'Rapide';
      case Movement.very_fast:
        return 'Très rapide';
    }
  }
}
