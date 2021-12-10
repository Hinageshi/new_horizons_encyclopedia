// ignore_for_file: constant_identifier_names

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
  String toShortString() {
    switch (this) {
      case FishSize.tiny:
        return 'Minuscule';
      case FishSize.small:
        return 'Petite';
      case FishSize.small_average:
        return 'Petite/Moyenne';
      case FishSize.medium:
        return 'Moyenne';
      case FishSize.medium_fin:
        return 'Moyenne (aileron)';
      case FishSize.medium_large:
        return 'Moyenne/Grande';
      case FishSize.large:
        return 'Grande';
      case FishSize.very_large:
        return 'Très grande';
      case FishSize.huge:
        return 'Énorme';
      case FishSize.huge_fin:
        return 'Énorme (aileron)';
      case FishSize.thin:
        return 'Fine';
    }
  }
}
