// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ineligibility_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_IneligibilityReasonsWrapperModelCopyWith<$Res>
    implements $IneligibilityReasonsWrapperModelCopyWith<$Res> {
  factory _$$_IneligibilityReasonsWrapperModelCopyWith(
          _$_IneligibilityReasonsWrapperModel value,
          $Res Function(_$_IneligibilityReasonsWrapperModel) then) =
      __$$_IneligibilityReasonsWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ineligibilityReasons')
          List<IneligibilityReasonType>? ineligibilityReasonsList});
}

/// @nodoc
class __$$_IneligibilityReasonsWrapperModelCopyWithImpl<$Res>
    extends _$IneligibilityReasonsWrapperModelCopyWithImpl<$Res,
        _$_IneligibilityReasonsWrapperModel>
    implements _$$_IneligibilityReasonsWrapperModelCopyWith<$Res> {
  __$$_IneligibilityReasonsWrapperModelCopyWithImpl(
      _$_IneligibilityReasonsWrapperModel _value,
      $Res Function(_$_IneligibilityReasonsWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ineligibilityReasonsList = freezed,
  }) {
    return _then(_$_IneligibilityReasonsWrapperModel(
      ineligibilityReasonsList: freezed == ineligibilityReasonsList
          ? _value._ineligibilityReasonsList
          : ineligibilityReasonsList // ignore: cast_nullable_to_non_nullable
              as List<IneligibilityReasonType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IneligibilityReasonsWrapperModel
    implements _IneligibilityReasonsWrapperModel {
  const _$_IneligibilityReasonsWrapperModel(
      {@JsonKey(name: 'ineligibilityReasons')
          final List<IneligibilityReasonType>? ineligibilityReasonsList})
      : _ineligibilityReasonsList = ineligibilityReasonsList;

  factory _$_IneligibilityReasonsWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_IneligibilityReasonsWrapperModelFromJson(json);

  final List<IneligibilityReasonType>? _ineligibilityReasonsList;
  @override
  @JsonKey(name: 'ineligibilityReasons')
  List<IneligibilityReasonType>? get ineligibilityReasonsList {
    final value = _ineligibilityReasonsList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IneligibilityReasonsWrapperModel(ineligibilityReasonsList: $ineligibilityReasonsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IneligibilityReasonsWrapperModel &&
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
  _$$_IneligibilityReasonsWrapperModelCopyWith<
          _$_IneligibilityReasonsWrapperModel>
      get copyWith => __$$_IneligibilityReasonsWrapperModelCopyWithImpl<
          _$_IneligibilityReasonsWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IneligibilityReasonsWrapperModelToJson(
      this,
    );
  }
}

abstract class _IneligibilityReasonsWrapperModel
    implements IneligibilityReasonsWrapperModel {
  const factory _IneligibilityReasonsWrapperModel(
          {@JsonKey(name: 'ineligibilityReasons')
              final List<IneligibilityReasonType>? ineligibilityReasonsList}) =
      _$_IneligibilityReasonsWrapperModel;

  factory _IneligibilityReasonsWrapperModel.fromJson(
      Map<String, dynamic> json) = _$_IneligibilityReasonsWrapperModel.fromJson;

  @override
  @JsonKey(name: 'ineligibilityReasons')
  List<IneligibilityReasonType>? get ineligibilityReasonsList;
  @override
  @JsonKey(ignore: true)
  _$$_IneligibilityReasonsWrapperModelCopyWith<
          _$_IneligibilityReasonsWrapperModel>
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
abstract class _$$_IneligibilityReasonTypeCopyWith<$Res>
    implements $IneligibilityReasonTypeCopyWith<$Res> {
  factory _$$_IneligibilityReasonTypeCopyWith(_$_IneligibilityReasonType value,
          $Res Function(_$_IneligibilityReasonType) then) =
      __$$_IneligibilityReasonTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$_IneligibilityReasonTypeCopyWithImpl<$Res>
    extends _$IneligibilityReasonTypeCopyWithImpl<$Res,
        _$_IneligibilityReasonType>
    implements _$$_IneligibilityReasonTypeCopyWith<$Res> {
  __$$_IneligibilityReasonTypeCopyWithImpl(_$_IneligibilityReasonType _value,
      $Res Function(_$_IneligibilityReasonType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$_IneligibilityReasonType(
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
class _$_IneligibilityReasonType implements _IneligibilityReasonType {
  const _$_IneligibilityReasonType(
      {required this.code, required this.name, required this.active});

  factory _$_IneligibilityReasonType.fromJson(Map<String, dynamic> json) =>
      _$$_IneligibilityReasonTypeFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IneligibilityReasonType &&
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
  _$$_IneligibilityReasonTypeCopyWith<_$_IneligibilityReasonType>
      get copyWith =>
          __$$_IneligibilityReasonTypeCopyWithImpl<_$_IneligibilityReasonType>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IneligibilityReasonTypeToJson(
      this,
    );
  }
}

abstract class _IneligibilityReasonType implements IneligibilityReasonType {
  const factory _IneligibilityReasonType(
      {required final String code,
      required final String name,
      required final bool active}) = _$_IneligibilityReasonType;

  factory _IneligibilityReasonType.fromJson(Map<String, dynamic> json) =
      _$_IneligibilityReasonType.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_IneligibilityReasonTypeCopyWith<_$_IneligibilityReasonType>
      get copyWith => throw _privateConstructorUsedError;
}
