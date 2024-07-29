// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralReasonsWrapperModel _$ReferralReasonsWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _ReferralReasonsWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$ReferralReasonsWrapperModel {
  @JsonKey(name: 'referralReasons')
  List<ReferralReasonType>? get referralReasonList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralReasonsWrapperModelCopyWith<ReferralReasonsWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReasonsWrapperModelCopyWith<$Res> {
  factory $ReferralReasonsWrapperModelCopyWith(
          ReferralReasonsWrapperModel value,
          $Res Function(ReferralReasonsWrapperModel) then) =
      _$ReferralReasonsWrapperModelCopyWithImpl<$Res,
          ReferralReasonsWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'referralReasons')
      List<ReferralReasonType>? referralReasonList});
}

/// @nodoc
class _$ReferralReasonsWrapperModelCopyWithImpl<$Res,
        $Val extends ReferralReasonsWrapperModel>
    implements $ReferralReasonsWrapperModelCopyWith<$Res> {
  _$ReferralReasonsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralReasonList = freezed,
  }) {
    return _then(_value.copyWith(
      referralReasonList: freezed == referralReasonList
          ? _value.referralReasonList
          : referralReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReasonType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralReasonsWrapperModelImplCopyWith<$Res>
    implements $ReferralReasonsWrapperModelCopyWith<$Res> {
  factory _$$ReferralReasonsWrapperModelImplCopyWith(
          _$ReferralReasonsWrapperModelImpl value,
          $Res Function(_$ReferralReasonsWrapperModelImpl) then) =
      __$$ReferralReasonsWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'referralReasons')
      List<ReferralReasonType>? referralReasonList});
}

/// @nodoc
class __$$ReferralReasonsWrapperModelImplCopyWithImpl<$Res>
    extends _$ReferralReasonsWrapperModelCopyWithImpl<$Res,
        _$ReferralReasonsWrapperModelImpl>
    implements _$$ReferralReasonsWrapperModelImplCopyWith<$Res> {
  __$$ReferralReasonsWrapperModelImplCopyWithImpl(
      _$ReferralReasonsWrapperModelImpl _value,
      $Res Function(_$ReferralReasonsWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralReasonList = freezed,
  }) {
    return _then(_$ReferralReasonsWrapperModelImpl(
      referralReasonList: freezed == referralReasonList
          ? _value._referralReasonList
          : referralReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReasonType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralReasonsWrapperModelImpl
    implements _ReferralReasonsWrapperModel {
  const _$ReferralReasonsWrapperModelImpl(
      {@JsonKey(name: 'referralReasons')
      final List<ReferralReasonType>? referralReasonList})
      : _referralReasonList = referralReasonList;

  factory _$ReferralReasonsWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReferralReasonsWrapperModelImplFromJson(json);

  final List<ReferralReasonType>? _referralReasonList;
  @override
  @JsonKey(name: 'referralReasons')
  List<ReferralReasonType>? get referralReasonList {
    final value = _referralReasonList;
    if (value == null) return null;
    if (_referralReasonList is EqualUnmodifiableListView)
      return _referralReasonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReferralReasonsWrapperModel(referralReasonList: $referralReasonList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReasonsWrapperModelImpl &&
            const DeepCollectionEquality()
                .equals(other._referralReasonList, _referralReasonList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_referralReasonList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReasonsWrapperModelImplCopyWith<_$ReferralReasonsWrapperModelImpl>
      get copyWith => __$$ReferralReasonsWrapperModelImplCopyWithImpl<
          _$ReferralReasonsWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralReasonsWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _ReferralReasonsWrapperModel
    implements ReferralReasonsWrapperModel {
  const factory _ReferralReasonsWrapperModel(
          {@JsonKey(name: 'referralReasons')
          final List<ReferralReasonType>? referralReasonList}) =
      _$ReferralReasonsWrapperModelImpl;

  factory _ReferralReasonsWrapperModel.fromJson(Map<String, dynamic> json) =
      _$ReferralReasonsWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'referralReasons')
  List<ReferralReasonType>? get referralReasonList;
  @override
  @JsonKey(ignore: true)
  _$$ReferralReasonsWrapperModelImplCopyWith<_$ReferralReasonsWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReferralReasonType _$ReferralReasonTypeFromJson(Map<String, dynamic> json) {
  return _ReferralReasonType.fromJson(json);
}

/// @nodoc
mixin _$ReferralReasonType {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralReasonTypeCopyWith<ReferralReasonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReasonTypeCopyWith<$Res> {
  factory $ReferralReasonTypeCopyWith(
          ReferralReasonType value, $Res Function(ReferralReasonType) then) =
      _$ReferralReasonTypeCopyWithImpl<$Res, ReferralReasonType>;
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class _$ReferralReasonTypeCopyWithImpl<$Res, $Val extends ReferralReasonType>
    implements $ReferralReasonTypeCopyWith<$Res> {
  _$ReferralReasonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralReasonTypeImplCopyWith<$Res>
    implements $ReferralReasonTypeCopyWith<$Res> {
  factory _$$ReferralReasonTypeImplCopyWith(_$ReferralReasonTypeImpl value,
          $Res Function(_$ReferralReasonTypeImpl) then) =
      __$$ReferralReasonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$ReferralReasonTypeImplCopyWithImpl<$Res>
    extends _$ReferralReasonTypeCopyWithImpl<$Res, _$ReferralReasonTypeImpl>
    implements _$$ReferralReasonTypeImplCopyWith<$Res> {
  __$$ReferralReasonTypeImplCopyWithImpl(_$ReferralReasonTypeImpl _value,
      $Res Function(_$ReferralReasonTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$ReferralReasonTypeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralReasonTypeImpl implements _ReferralReasonType {
  const _$ReferralReasonTypeImpl(
      {required this.code, required this.name, required this.active});

  factory _$ReferralReasonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralReasonTypeImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString() {
    return 'ReferralReasonType(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReasonTypeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReasonTypeImplCopyWith<_$ReferralReasonTypeImpl> get copyWith =>
      __$$ReferralReasonTypeImplCopyWithImpl<_$ReferralReasonTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralReasonTypeImplToJson(
      this,
    );
  }
}

abstract class _ReferralReasonType implements ReferralReasonType {
  const factory _ReferralReasonType(
      {required final String code,
      required final String name,
      required final bool active}) = _$ReferralReasonTypeImpl;

  factory _ReferralReasonType.fromJson(Map<String, dynamic> json) =
      _$ReferralReasonTypeImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$ReferralReasonTypeImplCopyWith<_$ReferralReasonTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
