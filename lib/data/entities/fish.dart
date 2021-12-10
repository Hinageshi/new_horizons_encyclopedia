import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_location.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_size.dart';
import 'package:new_horizons_encyclopedia/data/entities/rarity.dart';

part 'fish.freezed.dart';
part 'fish.g.dart';

@freezed
class Fish with _$Fish {
  const factory Fish({
    required String id,
    required String name,
    required String hour,
    required String month,
    required String price,
    required FishLocation location,
    required FishSize size,
    required Rarity rarity,
    required String imageId,
  }) = _Fish;

  const Fish._();

  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);
}
