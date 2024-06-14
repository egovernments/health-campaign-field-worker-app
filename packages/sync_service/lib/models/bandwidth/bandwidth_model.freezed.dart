// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bandwidth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$BandwidthModelImplCopyWith<$Res>
    implements $BandwidthModelCopyWith<$Res> {
  factory _$$BandwidthModelImplCopyWith(_$BandwidthModelImpl value,
          $Res Function(_$BandwidthModelImpl) then) =
      __$$BandwidthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int batchSize});
}

/// @nodoc
class __$$BandwidthModelImplCopyWithImpl<$Res>
    extends _$BandwidthModelCopyWithImpl<$Res, _$BandwidthModelImpl>
    implements _$$BandwidthModelImplCopyWith<$Res> {
  __$$BandwidthModelImplCopyWithImpl(
      _$BandwidthModelImpl _value, $Res Function(_$BandwidthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? batchSize = null,
  }) {
    return _then(_$BandwidthModelImpl(
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
class _$BandwidthModelImpl implements _BandwidthModel {
  const _$BandwidthModelImpl({required this.userId, required this.batchSize});

  factory _$BandwidthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BandwidthModelImplFromJson(json);

  @override
  final String userId;
  @override
  final int batchSize;

  @override
  String toString() {
    return 'BandwidthModel(userId: $userId, batchSize: $batchSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BandwidthModelImpl &&
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
  _$$BandwidthModelImplCopyWith<_$BandwidthModelImpl> get copyWith =>
      __$$BandwidthModelImplCopyWithImpl<_$BandwidthModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BandwidthModelImplToJson(
      this,
    );
  }
}

abstract class _BandwidthModel implements BandwidthModel {
  const factory _BandwidthModel(
      {required final String userId,
      required final int batchSize}) = _$BandwidthModelImpl;

  factory _BandwidthModel.fromJson(Map<String, dynamic> json) =
      _$BandwidthModelImpl.fromJson;

  @override
  String get userId;
  @override
  int get batchSize;
  @override
  @JsonKey(ignore: true)
  _$$BandwidthModelImplCopyWith<_$BandwidthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
