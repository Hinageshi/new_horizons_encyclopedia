// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fish _$$_FishFromJson(Map<String, dynamic> json) => _$_Fish(
      id: json['id'] as String,
      name: json['name'] as String,
      hour: json['hour'] as String,
      month: json['month'] as String,
      price: json['price'] as int,
      location: $enumDecode(_$FishLocationEnumMap, json['location']),
      size: $enumDecode(_$FishSizeEnumMap, json['size']),
      rarity: $enumDecode(_$RarityEnumMap, json['rarity']),
      imageId: json['imageId'] as String,
    );

Map<String, dynamic> _$$_FishToJson(_$_Fish instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hour': instance.hour,
      'month': instance.month,
      'price': instance.price,
      'location': _$FishLocationEnumMap[instance.location],
      'size': _$FishSizeEnumMap[instance.size],
      'rarity': _$RarityEnumMap[instance.rarity],
      'imageId': instance.imageId,
    };

const _$FishLocationEnumMap = {
  FishLocation.ocean: 'ocean',
  FishLocation.ocean_pontoon: 'ocean_pontoon',
  FishLocation.ocean_rain_snow: 'ocean_rain_snow',
  FishLocation.pond: 'pond',
  FishLocation.river: 'river',
  FishLocation.river_cliff: 'river_cliff',
  FishLocation.river_mouth: 'river_mouth',
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

const _$RarityEnumMap = {
  Rarity.normal: 'normal',
  Rarity.rare: 'rare',
  Rarity.very_rare: 'very_rare',
};
