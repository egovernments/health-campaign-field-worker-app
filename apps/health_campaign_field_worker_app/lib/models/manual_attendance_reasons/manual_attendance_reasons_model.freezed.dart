// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manual_attendance_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ManualAttendanceReasonsWrapperModel
    _$ManualAttendanceReasonsWrapperModelFromJson(Map<String, dynamic> json) {
  return _ManualAttendanceReasonsWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$ManualAttendanceReasonsWrapperModel {
  @JsonKey(name: 'manualAttendanceReasons')
  List<ManualAttendanceReasonType>? get manualAttendanceReasons =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManualAttendanceReasonsWrapperModelCopyWith<
          ManualAttendanceReasonsWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  factory $ManualAttendanceReasonsWrapperModelCopyWith(
          ManualAttendanceReasonsWrapperModel value,
          $Res Function(ManualAttendanceReasonsWrapperModel) then) =
      _$ManualAttendanceReasonsWrapperModelCopyWithImpl<$Res,
          ManualAttendanceReasonsWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'manualAttendanceReasons')
      List<ManualAttendanceReasonType>? manualAttendanceReasons});
}

/// @nodoc
class _$ManualAttendanceReasonsWrapperModelCopyWithImpl<$Res,
        $Val extends ManualAttendanceReasonsWrapperModel>
    implements $ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  _$ManualAttendanceReasonsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manualAttendanceReasons = freezed,
  }) {
    return _then(_value.copyWith(
      manualAttendanceReasons: freezed == manualAttendanceReasons
          ? _value.manualAttendanceReasons
          : manualAttendanceReasons // ignore: cast_nullable_to_non_nullable
              as List<ManualAttendanceReasonType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManualAttendanceReasonsWrapperModelImplCopyWith<$Res>
    implements $ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  factory _$$ManualAttendanceReasonsWrapperModelImplCopyWith(
          _$ManualAttendanceReasonsWrapperModelImpl value,
          $Res Function(_$ManualAttendanceReasonsWrapperModelImpl) then) =
      __$$ManualAttendanceReasonsWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'manualAttendanceReasons')
      List<ManualAttendanceReasonType>? manualAttendanceReasons});
}

/// @nodoc
class __$$ManualAttendanceReasonsWrapperModelImplCopyWithImpl<$Res>
    extends _$ManualAttendanceReasonsWrapperModelCopyWithImpl<$Res,
        _$ManualAttendanceReasonsWrapperModelImpl>
    implements _$$ManualAttendanceReasonsWrapperModelImplCopyWith<$Res> {
  __$$ManualAttendanceReasonsWrapperModelImplCopyWithImpl(
      _$ManualAttendanceReasonsWrapperModelImpl _value,
      $Res Function(_$ManualAttendanceReasonsWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manualAttendanceReasons = freezed,
  }) {
    return _then(_$ManualAttendanceReasonsWrapperModelImpl(
      manualAttendanceReasons: freezed == manualAttendanceReasons
          ? _value._manualAttendanceReasons
          : manualAttendanceReasons // ignore: cast_nullable_to_non_nullable
              as List<ManualAttendanceReasonType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManualAttendanceReasonsWrapperModelImpl
    implements _ManualAttendanceReasonsWrapperModel {
  const _$ManualAttendanceReasonsWrapperModelImpl(
      {@JsonKey(name: 'manualAttendanceReasons')
      final List<ManualAttendanceReasonType>? manualAttendanceReasons})
      : _manualAttendanceReasons = manualAttendanceReasons;

  factory _$ManualAttendanceReasonsWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ManualAttendanceReasonsWrapperModelImplFromJson(json);

  final List<ManualAttendanceReasonType>? _manualAttendanceReasons;
  @override
  @JsonKey(name: 'manualAttendanceReasons')
  List<ManualAttendanceReasonType>? get manualAttendanceReasons {
    final value = _manualAttendanceReasons;
    if (value == null) return null;
    if (_manualAttendanceReasons is EqualUnmodifiableListView)
      return _manualAttendanceReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManualAttendanceReasonsWrapperModel(manualAttendanceReasons: $manualAttendanceReasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualAttendanceReasonsWrapperModelImpl &&
            const DeepCollectionEquality().equals(
                other._manualAttendanceReasons, _manualAttendanceReasons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_manualAttendanceReasons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManualAttendanceReasonsWrapperModelImplCopyWith<
          _$ManualAttendanceReasonsWrapperModelImpl>
      get copyWith => __$$ManualAttendanceReasonsWrapperModelImplCopyWithImpl<
          _$ManualAttendanceReasonsWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManualAttendanceReasonsWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _ManualAttendanceReasonsWrapperModel
    implements ManualAttendanceReasonsWrapperModel {
  const factory _ManualAttendanceReasonsWrapperModel(
          {@JsonKey(name: 'manualAttendanceReasons')
          final List<ManualAttendanceReasonType>? manualAttendanceReasons}) =
      _$ManualAttendanceReasonsWrapperModelImpl;

  factory _ManualAttendanceReasonsWrapperModel.fromJson(
          Map<String, dynamic> json) =
      _$ManualAttendanceReasonsWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'manualAttendanceReasons')
  List<ManualAttendanceReasonType>? get manualAttendanceReasons;
  @override
  @JsonKey(ignore: true)
  _$$ManualAttendanceReasonsWrapperModelImplCopyWith<
          _$ManualAttendanceReasonsWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ManualAttendanceReasonType _$ManualAttendanceReasonTypeFromJson(
    Map<String, dynamic> json) {
  return _ManualAttendanceReasonType.fromJson(json);
}

/// @nodoc
mixin _$ManualAttendanceReasonType {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManualAttendanceReasonTypeCopyWith<ManualAttendanceReasonType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManualAttendanceReasonTypeCopyWith<$Res> {
  factory $ManualAttendanceReasonTypeCopyWith(ManualAttendanceReasonType value,
          $Res Function(ManualAttendanceReasonType) then) =
      _$ManualAttendanceReasonTypeCopyWithImpl<$Res,
          ManualAttendanceReasonType>;
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class _$ManualAttendanceReasonTypeCopyWithImpl<$Res,
        $Val extends ManualAttendanceReasonType>
    implements $ManualAttendanceReasonTypeCopyWith<$Res> {
  _$ManualAttendanceReasonTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$ManualAttendanceReasonTypeImplCopyWith<$Res>
    implements $ManualAttendanceReasonTypeCopyWith<$Res> {
  factory _$$ManualAttendanceReasonTypeImplCopyWith(
          _$ManualAttendanceReasonTypeImpl value,
          $Res Function(_$ManualAttendanceReasonTypeImpl) then) =
      __$$ManualAttendanceReasonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$ManualAttendanceReasonTypeImplCopyWithImpl<$Res>
    extends _$ManualAttendanceReasonTypeCopyWithImpl<$Res,
        _$ManualAttendanceReasonTypeImpl>
    implements _$$ManualAttendanceReasonTypeImplCopyWith<$Res> {
  __$$ManualAttendanceReasonTypeImplCopyWithImpl(
      _$ManualAttendanceReasonTypeImpl _value,
      $Res Function(_$ManualAttendanceReasonTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$ManualAttendanceReasonTypeImpl(
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
class _$ManualAttendanceReasonTypeImpl implements _ManualAttendanceReasonType {
  const _$ManualAttendanceReasonTypeImpl(
      {required this.code, required this.name, required this.active});

  factory _$ManualAttendanceReasonTypeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ManualAttendanceReasonTypeImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString() {
    return 'ManualAttendanceReasonType(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualAttendanceReasonTypeImpl &&
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
  _$$ManualAttendanceReasonTypeImplCopyWith<_$ManualAttendanceReasonTypeImpl>
      get copyWith => __$$ManualAttendanceReasonTypeImplCopyWithImpl<
          _$ManualAttendanceReasonTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManualAttendanceReasonTypeImplToJson(
      this,
    );
  }
}

abstract class _ManualAttendanceReasonType
    implements ManualAttendanceReasonType {
  const factory _ManualAttendanceReasonType(
      {required final String code,
      required final String name,
      required final bool active}) = _$ManualAttendanceReasonTypeImpl;

  factory _ManualAttendanceReasonType.fromJson(Map<String, dynamic> json) =
      _$ManualAttendanceReasonTypeImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$ManualAttendanceReasonTypeImplCopyWith<_$ManualAttendanceReasonTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
