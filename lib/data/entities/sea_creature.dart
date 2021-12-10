import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_size.dart';
import 'package:new_horizons_encyclopedia/data/entities/movement.dart';
import 'package:new_horizons_encyclopedia/data/entities/rarity.dart';

part 'sea_creature.freezed.dart';
part 'sea_creature.g.dart';

@freezed
class SeaCreature with _$SeaCreature {
  const factory SeaCreature({
    required String id,
    required String name,
    required String hour,
    required String month,
    required String price,
    required FishSize size,
    required Movement movement,
    required Rarity rarity,
    required String imageId,
  }) = _SeaCreature;

  const SeaCreature._();

  factory SeaCreature.fromJson(Map<String, dynamic> json) =>
      _$SeaCreatureFromJson(json);
}
