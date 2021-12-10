// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DatabaseFilters _$$_DatabaseFiltersFromJson(Map<String, dynamic> json) =>
    _$_DatabaseFilters(
      orderType: $enumDecode(_$OrderTypeEnumMap, json['orderType']),
      orderSort: $enumDecode(_$OrderSortEnumMap, json['orderSort']),
      orderCast: $enumDecode(_$OrderCastEnumMap, json['orderCast']),
      filterTime: $enumDecode(_$FilterTimeEnumMap, json['filterTime']),
      month: json['month'] as int?,
      filterRarity: $enumDecode(_$FilterRarityEnumMap, json['filterRarity']),
    );

Map<String, dynamic> _$$_DatabaseFiltersToJson(_$_DatabaseFilters instance) =>
    <String, dynamic>{
      'orderType': _$OrderTypeEnumMap[instance.orderType],
      'orderSort': _$OrderSortEnumMap[instance.orderSort],
      'orderCast': _$OrderCastEnumMap[instance.orderCast],
      'filterTime': _$FilterTimeEnumMap[instance.filterTime],
      'month': instance.month,
      'filterRarity': _$FilterRarityEnumMap[instance.filterRarity],
    };

const _$OrderTypeEnumMap = {
  OrderType.id: 'id',
  OrderType.name: 'name',
  OrderType.price: 'price',
  OrderType.rarity: 'rarity',
};

const _$OrderSortEnumMap = {
  OrderSort.asc: 'asc',
  OrderSort.desc: 'desc',
};

const _$OrderCastEnumMap = {
  OrderCast.int: 'int',
  OrderCast.string: 'string',
  OrderCast.date: 'date',
  OrderCast.time: 'time',
  OrderCast.datetime: 'datetime',
};

const _$FilterTimeEnumMap = {
  FilterTime.currently: 'currently',
  FilterTime.monthly: 'monthly',
  FilterTime.all: 'all',
};

const _$FilterRarityEnumMap = {
  FilterRarity.normal: 'normal',
  FilterRarity.rare: 'rare',
  FilterRarity.very_rare: 'very_rare',
  FilterRarity.all: 'all',
};
