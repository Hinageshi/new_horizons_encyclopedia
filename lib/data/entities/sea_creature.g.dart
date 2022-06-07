// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sea_creature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SeaCreature _$$_SeaCreatureFromJson(Map<String, dynamic> json) =>
    _$_SeaCreature(
      id: json['id'] as String,
      name: json['name'] as String,
      hour: json['hour'] as String,
      month: json['month'] as String,
      price: json['price'] as int,
      size: $enumDecode(_$FishSizeEnumMap, json['size']),
      movement: $enumDecode(_$MovementEnumMap, json['movement']),
      rarity: $enumDecode(_$RarityEnumMap, json['rarity']),
      imageId: json['imageId'] as String,
    );

Map<String, dynamic> _$$_SeaCreatureToJson(_$_SeaCreature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hour': instance.hour,
      'month': instance.month,
      'price': instance.price,
      'size': _$FishSizeEnumMap[instance.size],
      'movement': _$MovementEnumMap[instance.movement],
      'rarity': _$RarityEnumMap[instance.rarity],
      'imageId': instance.imageId,
    };

const _$FishSizeEnumMap = {
  FishSize.tiny: 'tiny',
  FishSize.small: 'small',
  FishSize.small_average: 'small_average',
  FishSize.medium: 'medium',
  FishSize.medium_fin: 'medium_fin',
  FishSize.medium_large: 'medium_large',
  FishSize.large: 'large',
  FishSize.very_large: 'very_large',
  FishSize.huge: 'huge',
  FishSize.huge_fin: 'huge_fin',
  FishSize.thin: 'thin',
};

const _$MovementEnumMap = {
  Movement.still: 'still',
  Movement.very_slow: 'very_slow',
  Movement.slow: 'slow',
  Movement.medium: 'medium',
  Movement.fast: 'fast',
  Movement.very_fast: 'very_fast',
};

const _$RarityEnumMap = {
  Rarity.normal: 'normal',
  Rarity.rare: 'rare',
  Rarity.very_rare: 'very_rare',
};
