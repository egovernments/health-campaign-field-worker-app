// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bandwidth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BandwidthModel _$BandwidthModelFromJson(Map<String, dynamic> json) {
  return _BandwidthModel.fromJson(json);
}

/// @nodoc
mixin _$BandwidthModel {
  String get userId => throw _privateConstructorUsedError;
  int get batchSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BandwidthModelCopyWith<BandwidthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BandwidthModelCopyWith<$Res> {
  factory $BandwidthModelCopyWith(
          BandwidthModel value, $Res Function(BandwidthModel) then) =
      _$BandwidthModelCopyWithImpl<$Res, BandwidthModel>;
  @useResult
  $Res call({String userId, int batchSize});
}

/// @nodoc
class _$BandwidthModelCopyWithImpl<$Res, $Val extends BandwidthModel>
    implements $BandwidthModelCopyWith<$Res> {
  _$BandwidthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? batchSize = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BandwidthModelCopyWith<$Res>
    implements $BandwidthModelCopyWith<$Res> {
  factory _$$_BandwidthModelCopyWith(
          _$_BandwidthModel value, $Res Function(_$_BandwidthModel) then) =
      __$$_BandwidthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int batchSize});
}

/// @nodoc
class __$$_BandwidthModelCopyWithImpl<$Res>
    extends _$BandwidthModelCopyWithImpl<$Res, _$_BandwidthModel>
    implements _$$_BandwidthModelCopyWith<$Res> {
  __$$_BandwidthModelCopyWithImpl(
      _$_BandwidthModel _value, $Res Function(_$_BandwidthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? batchSize = null,
  }) {
    return _then(_$_BandwidthModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BandwidthModel implements _BandwidthModel {
  const _$_BandwidthModel({required this.userId, required this.batchSize});

  factory _$_BandwidthModel.fromJson(Map<String, dynamic> json) =>
      _$$_BandwidthModelFromJson(json);

  @override
  final String userId;
  @override
  final int batchSize;

  @override
  String toString() {
    return 'BandwidthModel(userId: $userId, batchSize: $batchSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BandwidthModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, batchSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BandwidthModelCopyWith<_$_BandwidthModel> get copyWith =>
      __$$_BandwidthModelCopyWithImpl<_$_BandwidthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BandwidthModelToJson(
      this,
    );
  }
}

abstract class _BandwidthModel implements BandwidthModel {
  const factory _BandwidthModel(
      {required final String userId,
      required final int batchSize}) = _$_BandwidthModel;

  factory _BandwidthModel.fromJson(Map<String, dynamic> json) =
      _$_BandwidthModel.fromJson;

  @override
  String get userId;
  @override
  int get batchSize;
  @override
  @JsonKey(ignore: true)
  _$$_BandwidthModelCopyWith<_$_BandwidthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
