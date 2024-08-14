// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ineligibility_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IneligibilityReasonsWrapperModel _$IneligibilityReasonsWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _IneligibilityReasonsWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$IneligibilityReasonsWrapperModel {
  @JsonKey(name: 'ineligibilityReasons')
  List<IneligibilityReasonType>? get ineligibilityReasonsList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IneligibilityReasonsWrapperModelCopyWith<IneligibilityReasonsWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IneligibilityReasonsWrapperModelCopyWith<$Res> {
  factory $IneligibilityReasonsWrapperModelCopyWith(
          IneligibilityReasonsWrapperModel value,
          $Res Function(IneligibilityReasonsWrapperModel) then) =
      _$IneligibilityReasonsWrapperModelCopyWithImpl<$Res,
          IneligibilityReasonsWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ineligibilityReasons')
      List<IneligibilityReasonType>? ineligibilityReasonsList});
}

/// @nodoc
class _$IneligibilityReasonsWrapperModelCopyWithImpl<$Res,
        $Val extends IneligibilityReasonsWrapperModel>
    implements $IneligibilityReasonsWrapperModelCopyWith<$Res> {
  _$IneligibilityReasonsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ineligibilityReasonsList = freezed,
  }) {
    return _then(_value.copyWith(
      ineligibilityReasonsList: freezed == ineligibilityReasonsList
          ? _value.ineligibilityReasonsList
          : ineligibilityReasonsList // ignore: cast_nullable_to_non_nullable
              as List<IneligibilityReasonType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IneligibilityReasonsWrapperModelImplCopyWith<$Res>
    implements $IneligibilityReasonsWrapperModelCopyWith<$Res> {
  factory _$$IneligibilityReasonsWrapperModelImplCopyWith(
          _$IneligibilityReasonsWrapperModelImpl value,
          $Res Function(_$IneligibilityReasonsWrapperModelImpl) then) =
      __$$IneligibilityReasonsWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ineligibilityReasons')
      List<IneligibilityReasonType>? ineligibilityReasonsList});
}

/// @nodoc
class __$$IneligibilityReasonsWrapperModelImplCopyWithImpl<$Res>
    extends _$IneligibilityReasonsWrapperModelCopyWithImpl<$Res,
        _$IneligibilityReasonsWrapperModelImpl>
    implements _$$IneligibilityReasonsWrapperModelImplCopyWith<$Res> {
  __$$IneligibilityReasonsWrapperModelImplCopyWithImpl(
      _$IneligibilityReasonsWrapperModelImpl _value,
      $Res Function(_$IneligibilityReasonsWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ineligibilityReasonsList = freezed,
  }) {
    return _then(_$IneligibilityReasonsWrapperModelImpl(
      ineligibilityReasonsList: freezed == ineligibilityReasonsList
          ? _value._ineligibilityReasonsList
          : ineligibilityReasonsList // ignore: cast_nullable_to_non_nullable
              as List<IneligibilityReasonType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IneligibilityReasonsWrapperModelImpl
    implements _IneligibilityReasonsWrapperModel {
  const _$IneligibilityReasonsWrapperModelImpl(
      {@JsonKey(name: 'ineligibilityReasons')
      final List<IneligibilityReasonType>? ineligibilityReasonsList})
      : _ineligibilityReasonsList = ineligibilityReasonsList;

  factory _$IneligibilityReasonsWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$IneligibilityReasonsWrapperModelImplFromJson(json);

  final List<IneligibilityReasonType>? _ineligibilityReasonsList;
  @override
  @JsonKey(name: 'ineligibilityReasons')
  List<IneligibilityReasonType>? get ineligibilityReasonsList {
    final value = _ineligibilityReasonsList;
    if (value == null) return null;
    if (_ineligibilityReasonsList is EqualUnmodifiableListView)
      return _ineligibilityReasonsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IneligibilityReasonsWrapperModel(ineligibilityReasonsList: $ineligibilityReasonsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IneligibilityReasonsWrapperModelImpl &&
            const DeepCollectionEquality().equals(
                other._ineligibilityReasonsList, _ineligibilityReasonsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_ineligibilityReasonsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IneligibilityReasonsWrapperModelImplCopyWith<
          _$IneligibilityReasonsWrapperModelImpl>
      get copyWith => __$$IneligibilityReasonsWrapperModelImplCopyWithImpl<
          _$IneligibilityReasonsWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IneligibilityReasonsWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _IneligibilityReasonsWrapperModel
    implements IneligibilityReasonsWrapperModel {
  const factory _IneligibilityReasonsWrapperModel(
          {@JsonKey(name: 'ineligibilityReasons')
          final List<IneligibilityReasonType>? ineligibilityReasonsList}) =
      _$IneligibilityReasonsWrapperModelImpl;

  factory _IneligibilityReasonsWrapperModel.fromJson(
          Map<String, dynamic> json) =
      _$IneligibilityReasonsWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'ineligibilityReasons')
  List<IneligibilityReasonType>? get ineligibilityReasonsList;
  @override
  @JsonKey(ignore: true)
  _$$IneligibilityReasonsWrapperModelImplCopyWith<
          _$IneligibilityReasonsWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

IneligibilityReasonType _$IneligibilityReasonTypeFromJson(
    Map<String, dynamic> json) {
  return _IneligibilityReasonType.fromJson(json);
}

/// @nodoc
mixin _$IneligibilityReasonType {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IneligibilityReasonTypeCopyWith<IneligibilityReasonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IneligibilityReasonTypeCopyWith<$Res> {
  factory $IneligibilityReasonTypeCopyWith(IneligibilityReasonType value,
          $Res Function(IneligibilityReasonType) then) =
      _$IneligibilityReasonTypeCopyWithImpl<$Res, IneligibilityReasonType>;
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class _$IneligibilityReasonTypeCopyWithImpl<$Res,
        $Val extends IneligibilityReasonType>
    implements $IneligibilityReasonTypeCopyWith<$Res> {
  _$IneligibilityReasonTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$IneligibilityReasonTypeImplCopyWith<$Res>
    implements $IneligibilityReasonTypeCopyWith<$Res> {
  factory _$$IneligibilityReasonTypeImplCopyWith(
          _$IneligibilityReasonTypeImpl value,
          $Res Function(_$IneligibilityReasonTypeImpl) then) =
      __$$IneligibilityReasonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$IneligibilityReasonTypeImplCopyWithImpl<$Res>
    extends _$IneligibilityReasonTypeCopyWithImpl<$Res,
        _$IneligibilityReasonTypeImpl>
    implements _$$IneligibilityReasonTypeImplCopyWith<$Res> {
  __$$IneligibilityReasonTypeImplCopyWithImpl(
      _$IneligibilityReasonTypeImpl _value,
      $Res Function(_$IneligibilityReasonTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$IneligibilityReasonTypeImpl(
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
class _$IneligibilityReasonTypeImpl implements _IneligibilityReasonType {
  const _$IneligibilityReasonTypeImpl(
      {required this.code, required this.name, required this.active});

  factory _$IneligibilityReasonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IneligibilityReasonTypeImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString() {
    return 'IneligibilityReasonType(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IneligibilityReasonTypeImpl &&
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
  _$$IneligibilityReasonTypeImplCopyWith<_$IneligibilityReasonTypeImpl>
      get copyWith => __$$IneligibilityReasonTypeImplCopyWithImpl<
          _$IneligibilityReasonTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IneligibilityReasonTypeImplToJson(
      this,
    );
  }
}

abstract class _IneligibilityReasonType implements IneligibilityReasonType {
  const factory _IneligibilityReasonType(
      {required final String code,
      required final String name,
      required final bool active}) = _$IneligibilityReasonTypeImpl;

  factory _IneligibilityReasonType.fromJson(Map<String, dynamic> json) =
      _$IneligibilityReasonTypeImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$IneligibilityReasonTypeImplCopyWith<_$IneligibilityReasonTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
