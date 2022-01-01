// ignore_for_file: constant_identifier_names

enum FilterRarity {
  normal,
  rare,
  very_rare,
  all,
}

extension FilterRarityExtension on FilterRarity {
  String toShortString() {
    switch (this) {
      case FilterRarity.normal:
        return 'Normal';
      case FilterRarity.rare:
        return 'Rare';
      case FilterRarity.very_rare:
        return 'Très rare';
      case FilterRarity.all:
        return 'Tout';
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
