// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bug _$BugFromJson(Map<String, dynamic> json) {
  return _Bug.fromJson(json);
}

/// @nodoc
class _$BugTearOff {
  const _$BugTearOff();

  _Bug call(
      {required String id,
      required String name,
      required String hour,
      required String month,
      required int price,
      required BugLocation location,
      required Rarity rarity,
      required String imageId}) {
    return _Bug(
      id: id,
      name: name,
      hour: hour,
      month: month,
      price: price,
      location: location,
      rarity: rarity,
      imageId: imageId,
    );
  }

  Bug fromJson(Map<String, Object?> json) {
    return Bug.fromJson(json);
  }
}

/// @nodoc
const $Bug = _$BugTearOff();

/// @nodoc
mixin _$Bug {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hour => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  BugLocation get location => throw _privateConstructorUsedError;
  Rarity get rarity => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BugCopyWith<Bug> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BugCopyWith<$Res> {
  factory $BugCopyWith(Bug value, $Res Function(Bug) then) =
      _$BugCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String hour,
      String month,
      int price,
      BugLocation location,
      Rarity rarity,
      String imageId});
}

/// @nodoc
class _$BugCopyWithImpl<$Res> implements $BugCopyWith<$Res> {
  _$BugCopyWithImpl(this._value, this._then);

  final Bug _value;
  // ignore: unused_field
  final $Res Function(Bug) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hour = freezed,
    Object? month = freezed,
    Object? price = freezed,
    Object? location = freezed,
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
              as int,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BugLocation,
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
abstract class _$BugCopyWith<$Res> implements $BugCopyWith<$Res> {
  factory _$BugCopyWith(_Bug value, $Res Function(_Bug) then) =
      __$BugCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String hour,
      String month,
      int price,
      BugLocation location,
      Rarity rarity,
      String imageId});
}

/// @nodoc
class __$BugCopyWithImpl<$Res> extends _$BugCopyWithImpl<$Res>
    implements _$BugCopyWith<$Res> {
  __$BugCopyWithImpl(_Bug _value, $Res Function(_Bug) _then)
      : super(_value, (v) => _then(v as _Bug));

  @override
  _Bug get _value => super._value as _Bug;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hour = freezed,
    Object? month = freezed,
    Object? price = freezed,
    Object? location = freezed,
    Object? rarity = freezed,
    Object? imageId = freezed,
  }) {
    return _then(_Bug(
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
              as int,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BugLocation,
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
class _$_Bug extends _Bug {
  const _$_Bug(
      {required this.id,
      required this.name,
      required this.hour,
      required this.month,
      required this.price,
      required this.location,
      required this.rarity,
      required this.imageId})
      : super._();

  factory _$_Bug.fromJson(Map<String, dynamic> json) => _$$_BugFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String hour;
  @override
  final String month;
  @override
  final int price;
  @override
  final BugLocation location;
  @override
  final Rarity rarity;
  @override
  final String imageId;

  @override
  String toString() {
    return 'Bug(id: $id, name: $name, hour: $hour, month: $month, price: $price, location: $location, rarity: $rarity, imageId: $imageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bug &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, hour, month, price, location, rarity, imageId);

  @JsonKey(ignore: true)
  @override
  _$BugCopyWith<_Bug> get copyWith =>
      __$BugCopyWithImpl<_Bug>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BugToJson(this);
  }
}

abstract class _Bug extends Bug {
  const factory _Bug(
      {required String id,
      required String name,
      required String hour,
      required String month,
      required int price,
      required BugLocation location,
      required Rarity rarity,
      required String imageId}) = _$_Bug;
  const _Bug._() : super._();

  factory _Bug.fromJson(Map<String, dynamic> json) = _$_Bug.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get hour;
  @override
  String get month;
  @override
  int get price;
  @override
  BugLocation get location;
  @override
  Rarity get rarity;
  @override
  String get imageId;
  @override
  @JsonKey(ignore: true)
  _$BugCopyWith<_Bug> get copyWith => throw _privateConstructorUsedError;
}
