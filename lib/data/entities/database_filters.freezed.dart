// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'database_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DatabaseFilters _$DatabaseFiltersFromJson(Map<String, dynamic> json) {
  return _DatabaseFilters.fromJson(json);
}

/// @nodoc
class _$DatabaseFiltersTearOff {
  const _$DatabaseFiltersTearOff();

  _DatabaseFilters call(
      {required OrderType orderType,
      required OrderSort orderSort,
      required OrderCast orderCast,
      required FilterTime filterTime,
      required int? month,
      required FilterRarity filterRarity}) {
    return _DatabaseFilters(
      orderType: orderType,
      orderSort: orderSort,
      orderCast: orderCast,
      filterTime: filterTime,
      month: month,
      filterRarity: filterRarity,
    );
  }

  DatabaseFilters fromJson(Map<String, Object?> json) {
    return DatabaseFilters.fromJson(json);
  }
}

/// @nodoc
const $DatabaseFilters = _$DatabaseFiltersTearOff();

/// @nodoc
mixin _$DatabaseFilters {
  OrderType get orderType => throw _privateConstructorUsedError;
  OrderSort get orderSort => throw _privateConstructorUsedError;
  OrderCast get orderCast => throw _privateConstructorUsedError;
  FilterTime get filterTime => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  FilterRarity get filterRarity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatabaseFiltersCopyWith<DatabaseFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseFiltersCopyWith<$Res> {
  factory $DatabaseFiltersCopyWith(
          DatabaseFilters value, $Res Function(DatabaseFilters) then) =
      _$DatabaseFiltersCopyWithImpl<$Res>;
  $Res call(
      {OrderType orderType,
      OrderSort orderSort,
      OrderCast orderCast,
      FilterTime filterTime,
      int? month,
      FilterRarity filterRarity});
}

/// @nodoc
class _$DatabaseFiltersCopyWithImpl<$Res>
    implements $DatabaseFiltersCopyWith<$Res> {
  _$DatabaseFiltersCopyWithImpl(this._value, this._then);

  final DatabaseFilters _value;
  // ignore: unused_field
  final $Res Function(DatabaseFilters) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderSort = freezed,
    Object? orderCast = freezed,
    Object? filterTime = freezed,
    Object? month = freezed,
    Object? filterRarity = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
      orderSort: orderSort == freezed
          ? _value.orderSort
          : orderSort // ignore: cast_nullable_to_non_nullable
              as OrderSort,
      orderCast: orderCast == freezed
          ? _value.orderCast
          : orderCast // ignore: cast_nullable_to_non_nullable
              as OrderCast,
      filterTime: filterTime == freezed
          ? _value.filterTime
          : filterTime // ignore: cast_nullable_to_non_nullable
              as FilterTime,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      filterRarity: filterRarity == freezed
          ? _value.filterRarity
          : filterRarity // ignore: cast_nullable_to_non_nullable
              as FilterRarity,
    ));
  }
}

/// @nodoc
abstract class _$DatabaseFiltersCopyWith<$Res>
    implements $DatabaseFiltersCopyWith<$Res> {
  factory _$DatabaseFiltersCopyWith(
          _DatabaseFilters value, $Res Function(_DatabaseFilters) then) =
      __$DatabaseFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {OrderType orderType,
      OrderSort orderSort,
      OrderCast orderCast,
      FilterTime filterTime,
      int? month,
      FilterRarity filterRarity});
}

/// @nodoc
class __$DatabaseFiltersCopyWithImpl<$Res>
    extends _$DatabaseFiltersCopyWithImpl<$Res>
    implements _$DatabaseFiltersCopyWith<$Res> {
  __$DatabaseFiltersCopyWithImpl(
      _DatabaseFilters _value, $Res Function(_DatabaseFilters) _then)
      : super(_value, (v) => _then(v as _DatabaseFilters));

  @override
  _DatabaseFilters get _value => super._value as _DatabaseFilters;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderSort = freezed,
    Object? orderCast = freezed,
    Object? filterTime = freezed,
    Object? month = freezed,
    Object? filterRarity = freezed,
  }) {
    return _then(_DatabaseFilters(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
      orderSort: orderSort == freezed
          ? _value.orderSort
          : orderSort // ignore: cast_nullable_to_non_nullable
              as OrderSort,
      orderCast: orderCast == freezed
          ? _value.orderCast
          : orderCast // ignore: cast_nullable_to_non_nullable
              as OrderCast,
      filterTime: filterTime == freezed
          ? _value.filterTime
          : filterTime // ignore: cast_nullable_to_non_nullable
              as FilterTime,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      filterRarity: filterRarity == freezed
          ? _value.filterRarity
          : filterRarity // ignore: cast_nullable_to_non_nullable
              as FilterRarity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DatabaseFilters extends _DatabaseFilters {
  const _$_DatabaseFilters(
      {required this.orderType,
      required this.orderSort,
      required this.orderCast,
      required this.filterTime,
      required this.month,
      required this.filterRarity})
      : super._();

  factory _$_DatabaseFilters.fromJson(Map<String, dynamic> json) =>
      _$$_DatabaseFiltersFromJson(json);

  @override
  final OrderType orderType;
  @override
  final OrderSort orderSort;
  @override
  final OrderCast orderCast;
  @override
  final FilterTime filterTime;
  @override
  final int? month;
  @override
  final FilterRarity filterRarity;

  @override
  String toString() {
    return 'DatabaseFilters(orderType: $orderType, orderSort: $orderSort, orderCast: $orderCast, filterTime: $filterTime, month: $month, filterRarity: $filterRarity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DatabaseFilters &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderSort, orderSort) ||
                other.orderSort == orderSort) &&
            (identical(other.orderCast, orderCast) ||
                other.orderCast == orderCast) &&
            (identical(other.filterTime, filterTime) ||
                other.filterTime == filterTime) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.filterRarity, filterRarity) ||
                other.filterRarity == filterRarity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType, orderSort, orderCast,
      filterTime, month, filterRarity);

  @JsonKey(ignore: true)
  @override
  _$DatabaseFiltersCopyWith<_DatabaseFilters> get copyWith =>
      __$DatabaseFiltersCopyWithImpl<_DatabaseFilters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatabaseFiltersToJson(this);
  }
}

abstract class _DatabaseFilters extends DatabaseFilters {
  const factory _DatabaseFilters(
      {required OrderType orderType,
      required OrderSort orderSort,
      required OrderCast orderCast,
      required FilterTime filterTime,
      required int? month,
      required FilterRarity filterRarity}) = _$_DatabaseFilters;
  const _DatabaseFilters._() : super._();

  factory _DatabaseFilters.fromJson(Map<String, dynamic> json) =
      _$_DatabaseFilters.fromJson;

  @override
  OrderType get orderType;
  @override
  OrderSort get orderSort;
  @override
  OrderCast get orderCast;
  @override
  FilterTime get filterTime;
  @override
  int? get month;
  @override
  FilterRarity get filterRarity;
  @override
  @JsonKey(ignore: true)
  _$DatabaseFiltersCopyWith<_DatabaseFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
