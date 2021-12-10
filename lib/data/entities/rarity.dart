// ignore_for_file: constant_identifier_names

enum Rarity {
  normal,
  rare,
  very_rare,
}

extension RarityExtension on Rarity {
  String toShortString() {
    switch (this) {
      case Rarity.normal:
        return 'Normal';
      case Rarity.rare:
        return 'Rare';
      case Rarity.very_rare:
        return 'Très rare';
    }
  }
}
