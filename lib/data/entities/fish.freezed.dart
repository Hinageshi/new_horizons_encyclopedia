// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fish _$FishFromJson(Map<String, dynamic> json) {
  return _Fish.fromJson(json);
}

/// @nodoc
class _$FishTearOff {
  const _$FishTearOff();

  _Fish call(
      {required String id,
      required String name,
      required String hour,
      required String month,
      required String price,
      required FishLocation location,
      required FishSize size,
      required Rarity rarity,
      required String imageId}) {
    return _Fish(
      id: id,
      name: name,
      hour: hour,
      month: month,
      price: price,
      location: location,
      size: size,
      rarity: rarity,
      imageId: imageId,
    );
  }

  Fish fromJson(Map<String, Object?> json) {
    return Fish.fromJson(json);
  }
}

/// @nodoc
const $Fish = _$FishTearOff();

/// @nodoc
mixin _$Fish {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hour => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  FishLocation get location => throw _privateConstructorUsedError;
  FishSize get size => throw _privateConstructorUsedError;
  Rarity get rarity => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FishCopyWith<Fish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FishCopyWith<$Res> {
  factory $FishCopyWith(Fish value, $Res Function(Fish) then) =
      _$FishCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String hour,
      String month,
      String price,
      FishLocation location,
      FishSize size,
      Rarity rarity,
      String imageId});
}

/// @nodoc
class _$FishCopyWithImpl<$Res> implements $FishCopyWith<$Res> {
  _$FishCopyWithImpl(this._value, this._then);

  final Fish _value;
  // ignore: unused_field
  final $Res Function(Fish) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hour = freezed,
    Object? month = freezed,
    Object? price = freezed,
    Object? location = freezed,
    Object? size = freezed,
    Object? rarity = freezed,
    Object? imageId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as FishLocation,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FishSize,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FishCopyWith<$Res> implements $FishCopyWith<$Res> {
  factory _$FishCopyWith(_Fish value, $Res Function(_Fish) then) =
      __$FishCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String hour,
      String month,
      String price,
      FishLocation location,
      FishSize size,
      Rarity rarity,
      String imageId});
}

/// @nodoc
class __$FishCopyWithImpl<$Res> extends _$FishCopyWithImpl<$Res>
    implements _$FishCopyWith<$Res> {
  __$FishCopyWithImpl(_Fish _value, $Res Function(_Fish) _then)
      : super(_value, (v) => _then(v as _Fish));

  @override
  _Fish get _value => super._value as _Fish;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hour = freezed,
    Object? month = freezed,
    Object? price = freezed,
    Object? location = freezed,
    Object? size = freezed,
    Object? rarity = freezed,
    Object? imageId = freezed,
  }) {
    return _then(_Fish(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as FishLocation,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FishSize,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fish extends _Fish {
  const _$_Fish(
      {required this.id,
      required this.name,
      required this.hour,
      required this.month,
      required this.price,
      required this.location,
      required this.size,
      required this.rarity,
      required this.imageId})
      : super._();

  factory _$_Fish.fromJson(Map<String, dynamic> json) => _$$_FishFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String hour;
  @override
  final String month;
  @override
  final String price;
  @override
  final FishLocation location;
  @override
  final FishSize size;
  @override
  final Rarity rarity;
  @override
  final String imageId;

  @override
  String toString() {
    return 'Fish(id: $id, name: $name, hour: $hour, month: $month, price: $price, location: $location, size: $size, rarity: $rarity, imageId: $imageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fish &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, hour, month, price,
      location, size, rarity, imageId);

  @JsonKey(ignore: true)
  @override
  _$FishCopyWith<_Fish> get copyWith =>
      __$FishCopyWithImpl<_Fish>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FishToJson(this);
  }
}

abstract class _Fish extends Fish {
  const factory _Fish(
      {required String id,
      required String name,
      required String hour,
      required String month,
      required String price,
      required FishLocation location,
      required FishSize size,
      required Rarity rarity,
      required String imageId}) = _$_Fish;
  const _Fish._() : super._();

  factory _Fish.fromJson(Map<String, dynamic> json) = _$_Fish.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get hour;
  @override
  String get month;
  @override
  String get price;
  @override
  FishLocation get location;
  @override
  FishSize get size;
  @override
  Rarity get rarity;
  @override
  String get imageId;
  @override
  @JsonKey(ignore: true)
  _$FishCopyWith<_Fish> get copyWith => throw _privateConstructorUsedError;
}
