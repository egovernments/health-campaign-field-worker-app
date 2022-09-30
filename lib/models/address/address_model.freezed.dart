// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String? get addressId => throw _privateConstructorUsedError;
  String get addressText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call({String? addressId, String addressText});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? addressId = freezed,
    Object? addressText = freezed,
  }) {
    return _then(_value.copyWith(
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressText: addressText == freezed
          ? _value.addressText
          : addressText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$_AddressModelCopyWith(
          _$_AddressModel value, $Res Function(_$_AddressModel) then) =
      __$$_AddressModelCopyWithImpl<$Res>;
  @override
  $Res call({String? addressId, String addressText});
}

/// @nodoc
class __$$_AddressModelCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res>
    implements _$$_AddressModelCopyWith<$Res> {
  __$$_AddressModelCopyWithImpl(
      _$_AddressModel _value, $Res Function(_$_AddressModel) _then)
      : super(_value, (v) => _then(v as _$_AddressModel));

  @override
  _$_AddressModel get _value => super._value as _$_AddressModel;

  @override
  $Res call({
    Object? addressId = freezed,
    Object? addressText = freezed,
  }) {
    return _then(_$_AddressModel(
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressText: addressText == freezed
          ? _value.addressText
          : addressText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel({this.addressId, required this.addressText});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  final String? addressId;
  @override
  final String addressText;

  @override
  String toString() {
    return 'AddressModel(addressId: $addressId, addressText: $addressText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModel &&
            const DeepCollectionEquality().equals(other.addressId, addressId) &&
            const DeepCollectionEquality()
                .equals(other.addressText, addressText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addressId),
      const DeepCollectionEquality().hash(addressText));

  @JsonKey(ignore: true)
  @override
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      __$$_AddressModelCopyWithImpl<_$_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {final String? addressId,
      required final String addressText}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  String? get addressId;
  @override
  String get addressText;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LatLngModel _$LatLngModelFromJson(Map<String, dynamic> json) {
  return _LatLngModel.fromJson(json);
}

/// @nodoc
mixin _$LatLngModel {
  num get latitude => throw _privateConstructorUsedError;
  num get longitude => throw _privateConstructorUsedError;
  num get accuracy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLngModelCopyWith<LatLngModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngModelCopyWith<$Res> {
  factory $LatLngModelCopyWith(
          LatLngModel value, $Res Function(LatLngModel) then) =
      _$LatLngModelCopyWithImpl<$Res>;
  $Res call({num latitude, num longitude, num accuracy});
}

/// @nodoc
class _$LatLngModelCopyWithImpl<$Res> implements $LatLngModelCopyWith<$Res> {
  _$LatLngModelCopyWithImpl(this._value, this._then);

  final LatLngModel _value;
  // ignore: unused_field
  final $Res Function(LatLngModel) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$$_LatLngModelCopyWith<$Res>
    implements $LatLngModelCopyWith<$Res> {
  factory _$$_LatLngModelCopyWith(
          _$_LatLngModel value, $Res Function(_$_LatLngModel) then) =
      __$$_LatLngModelCopyWithImpl<$Res>;
  @override
  $Res call({num latitude, num longitude, num accuracy});
}

/// @nodoc
class __$$_LatLngModelCopyWithImpl<$Res> extends _$LatLngModelCopyWithImpl<$Res>
    implements _$$_LatLngModelCopyWith<$Res> {
  __$$_LatLngModelCopyWithImpl(
      _$_LatLngModel _value, $Res Function(_$_LatLngModel) _then)
      : super(_value, (v) => _then(v as _$_LatLngModel));

  @override
  _$_LatLngModel get _value => super._value as _$_LatLngModel;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_$_LatLngModel(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatLngModel implements _LatLngModel {
  const _$_LatLngModel(
      {required this.latitude, required this.longitude, this.accuracy = 0});

  factory _$_LatLngModel.fromJson(Map<String, dynamic> json) =>
      _$$_LatLngModelFromJson(json);

  @override
  final num latitude;
  @override
  final num longitude;
  @override
  @JsonKey()
  final num accuracy;

  @override
  String toString() {
    return 'LatLngModel(latitude: $latitude, longitude: $longitude, accuracy: $accuracy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLngModel &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.accuracy, accuracy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(accuracy));

  @JsonKey(ignore: true)
  @override
  _$$_LatLngModelCopyWith<_$_LatLngModel> get copyWith =>
      __$$_LatLngModelCopyWithImpl<_$_LatLngModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatLngModelToJson(
      this,
    );
  }
}

abstract class _LatLngModel implements LatLngModel {
  const factory _LatLngModel(
      {required final num latitude,
      required final num longitude,
      final num accuracy}) = _$_LatLngModel;

  factory _LatLngModel.fromJson(Map<String, dynamic> json) =
      _$_LatLngModel.fromJson;

  @override
  num get latitude;
  @override
  num get longitude;
  @override
  num get accuracy;
  @override
  @JsonKey(ignore: true)
  _$$_LatLngModelCopyWith<_$_LatLngModel> get copyWith =>
      throw _privateConstructorUsedError;
}
