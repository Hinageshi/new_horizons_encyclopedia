// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bug _$$_BugFromJson(Map<String, dynamic> json) => _$_Bug(
      id: json['id'] as String,
      name: json['name'] as String,
      hour: json['hour'] as String,
      month: json['month'] as String,
      price: json['price'] as int,
      location: $enumDecode(_$BugLocationEnumMap, json['location']),
      rarity: $enumDecode(_$RarityEnumMap, json['rarity']),
      imageId: json['imageId'] as String,
    );

Map<String, dynamic> _$$_BugToJson(_$_Bug instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hour': instance.hour,
      'month': instance.month,
      'price': instance.price,
      'location': _$BugLocationEnumMap[instance.location],
      'rarity': _$RarityEnumMap[instance.rarity],
      'imageId': instance.imageId,
    };

const _$BugLocationEnumMap = {
  BugLocation.beach: 'beach',
  BugLocation.beach_rocks: 'beach_rocks',
  BugLocation.bushes_rocks_rain: 'bushes_rocks_rain',
  BugLocation.flowers: 'flowers',
  BugLocation.ground: 'ground',
  BugLocation.lights: 'lights',
  BugLocation.near_water: 'near_water',
  BugLocation.palms: 'palms',
  BugLocation.rocks: 'rocks',
  BugLocation.rotten_turnips: 'rotten_turnips',
  BugLocation.sky: 'sky',
  BugLocation.sky_black_purple_blue_flowers: 'sky_black_purple_blue_flowers',
  BugLocation.snowballs: 'snowballs',
  BugLocation.trash_rotten_turnips: 'trash_rotten_turnips',
  BugLocation.tree_stumps: 'tree_stumps',
  BugLocation.trees: 'trees',
  BugLocation.trees_palms: 'trees_palms',
  BugLocation.underground: 'underground',
  BugLocation.villagers: 'villagers',
  BugLocation.water_surface: 'water_surface',
  BugLocation.white_flowers: 'white_flowers',
};

const _$RarityEnumMap = {
  Rarity.normal: 'normal',
  Rarity.rare: 'rare',
  Rarity.very_rare: 'very_rare',
};
