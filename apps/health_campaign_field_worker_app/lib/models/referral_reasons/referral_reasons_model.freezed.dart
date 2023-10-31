// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'referral_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_ReferralReasonsWrapperModelCopyWith<$Res>
    implements $ReferralReasonsWrapperModelCopyWith<$Res> {
  factory _$$_ReferralReasonsWrapperModelCopyWith(
          _$_ReferralReasonsWrapperModel value,
          $Res Function(_$_ReferralReasonsWrapperModel) then) =
      __$$_ReferralReasonsWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'referralReasons')
          List<ReferralReasonType>? referralReasonList});
}

/// @nodoc
class __$$_ReferralReasonsWrapperModelCopyWithImpl<$Res>
    extends _$ReferralReasonsWrapperModelCopyWithImpl<$Res,
        _$_ReferralReasonsWrapperModel>
    implements _$$_ReferralReasonsWrapperModelCopyWith<$Res> {
  __$$_ReferralReasonsWrapperModelCopyWithImpl(
      _$_ReferralReasonsWrapperModel _value,
      $Res Function(_$_ReferralReasonsWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralReasonList = freezed,
  }) {
    return _then(_$_ReferralReasonsWrapperModel(
      referralReasonList: freezed == referralReasonList
          ? _value._referralReasonList
          : referralReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReasonType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferralReasonsWrapperModel implements _ReferralReasonsWrapperModel {
  const _$_ReferralReasonsWrapperModel(
      {@JsonKey(name: 'referralReasons')
          final List<ReferralReasonType>? referralReasonList})
      : _referralReasonList = referralReasonList;

  factory _$_ReferralReasonsWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReferralReasonsWrapperModelFromJson(json);

  final List<ReferralReasonType>? _referralReasonList;
  @override
  @JsonKey(name: 'referralReasons')
  List<ReferralReasonType>? get referralReasonList {
    final value = _referralReasonList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReferralReasonsWrapperModel(referralReasonList: $referralReasonList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferralReasonsWrapperModel &&
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
  _$$_ReferralReasonsWrapperModelCopyWith<_$_ReferralReasonsWrapperModel>
      get copyWith => __$$_ReferralReasonsWrapperModelCopyWithImpl<
          _$_ReferralReasonsWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferralReasonsWrapperModelToJson(
      this,
    );
  }
}

abstract class _ReferralReasonsWrapperModel
    implements ReferralReasonsWrapperModel {
  const factory _ReferralReasonsWrapperModel(
          {@JsonKey(name: 'referralReasons')
              final List<ReferralReasonType>? referralReasonList}) =
      _$_ReferralReasonsWrapperModel;

  factory _ReferralReasonsWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_ReferralReasonsWrapperModel.fromJson;

  @override
  @JsonKey(name: 'referralReasons')
  List<ReferralReasonType>? get referralReasonList;
  @override
  @JsonKey(ignore: true)
  _$$_ReferralReasonsWrapperModelCopyWith<_$_ReferralReasonsWrapperModel>
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
abstract class _$$_ReferralReasonTypeCopyWith<$Res>
    implements $ReferralReasonTypeCopyWith<$Res> {
  factory _$$_ReferralReasonTypeCopyWith(_$_ReferralReasonType value,
          $Res Function(_$_ReferralReasonType) then) =
      __$$_ReferralReasonTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$_ReferralReasonTypeCopyWithImpl<$Res>
    extends _$ReferralReasonTypeCopyWithImpl<$Res, _$_ReferralReasonType>
    implements _$$_ReferralReasonTypeCopyWith<$Res> {
  __$$_ReferralReasonTypeCopyWithImpl(
      _$_ReferralReasonType _value, $Res Function(_$_ReferralReasonType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$_ReferralReasonType(
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
class _$_ReferralReasonType implements _ReferralReasonType {
  const _$_ReferralReasonType(
      {required this.code, required this.name, required this.active});

  factory _$_ReferralReasonType.fromJson(Map<String, dynamic> json) =>
      _$$_ReferralReasonTypeFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferralReasonType &&
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
  _$$_ReferralReasonTypeCopyWith<_$_ReferralReasonType> get copyWith =>
      __$$_ReferralReasonTypeCopyWithImpl<_$_ReferralReasonType>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferralReasonTypeToJson(
      this,
    );
  }
}

abstract class _ReferralReasonType implements ReferralReasonType {
  const factory _ReferralReasonType(
      {required final String code,
      required final String name,
      required final bool active}) = _$_ReferralReasonType;

  factory _ReferralReasonType.fromJson(Map<String, dynamic> json) =
      _$_ReferralReasonType.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_ReferralReasonTypeCopyWith<_$_ReferralReasonType> get copyWith =>
      throw _privateConstructorUsedError;
}
