// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disability_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DisabilityTypesWrapperModel _$DisabilityTypesWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _DisabilityTypesWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$DisabilityTypesWrapperModel {
  @JsonKey(name: 'disabilityTypes')
  List<DisabilityTypes>? get disabilityTypesList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisabilityTypesWrapperModelCopyWith<DisabilityTypesWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisabilityTypesWrapperModelCopyWith<$Res> {
  factory $DisabilityTypesWrapperModelCopyWith(
          DisabilityTypesWrapperModel value,
          $Res Function(DisabilityTypesWrapperModel) then) =
      _$DisabilityTypesWrapperModelCopyWithImpl<$Res,
          DisabilityTypesWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'disabilityTypes')
      List<DisabilityTypes>? disabilityTypesList});
}

/// @nodoc
class _$DisabilityTypesWrapperModelCopyWithImpl<$Res,
        $Val extends DisabilityTypesWrapperModel>
    implements $DisabilityTypesWrapperModelCopyWith<$Res> {
  _$DisabilityTypesWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabilityTypesList = freezed,
  }) {
    return _then(_value.copyWith(
      disabilityTypesList: freezed == disabilityTypesList
          ? _value.disabilityTypesList
          : disabilityTypesList // ignore: cast_nullable_to_non_nullable
              as List<DisabilityTypes>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisabilityTypesWrapperModelImplCopyWith<$Res>
    implements $DisabilityTypesWrapperModelCopyWith<$Res> {
  factory _$$DisabilityTypesWrapperModelImplCopyWith(
          _$DisabilityTypesWrapperModelImpl value,
          $Res Function(_$DisabilityTypesWrapperModelImpl) then) =
      __$$DisabilityTypesWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'disabilityTypes')
      List<DisabilityTypes>? disabilityTypesList});
}

/// @nodoc
class __$$DisabilityTypesWrapperModelImplCopyWithImpl<$Res>
    extends _$DisabilityTypesWrapperModelCopyWithImpl<$Res,
        _$DisabilityTypesWrapperModelImpl>
    implements _$$DisabilityTypesWrapperModelImplCopyWith<$Res> {
  __$$DisabilityTypesWrapperModelImplCopyWithImpl(
      _$DisabilityTypesWrapperModelImpl _value,
      $Res Function(_$DisabilityTypesWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabilityTypesList = freezed,
  }) {
    return _then(_$DisabilityTypesWrapperModelImpl(
      disabilityTypesList: freezed == disabilityTypesList
          ? _value._disabilityTypesList
          : disabilityTypesList // ignore: cast_nullable_to_non_nullable
              as List<DisabilityTypes>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisabilityTypesWrapperModelImpl
    implements _DisabilityTypesWrapperModel {
  const _$DisabilityTypesWrapperModelImpl(
      {@JsonKey(name: 'disabilityTypes')
      final List<DisabilityTypes>? disabilityTypesList})
      : _disabilityTypesList = disabilityTypesList;

  factory _$DisabilityTypesWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DisabilityTypesWrapperModelImplFromJson(json);

  final List<DisabilityTypes>? _disabilityTypesList;
  @override
  @JsonKey(name: 'disabilityTypes')
  List<DisabilityTypes>? get disabilityTypesList {
    final value = _disabilityTypesList;
    if (value == null) return null;
    if (_disabilityTypesList is EqualUnmodifiableListView)
      return _disabilityTypesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DisabilityTypesWrapperModel(disabilityTypesList: $disabilityTypesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisabilityTypesWrapperModelImpl &&
            const DeepCollectionEquality()
                .equals(other._disabilityTypesList, _disabilityTypesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_disabilityTypesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisabilityTypesWrapperModelImplCopyWith<_$DisabilityTypesWrapperModelImpl>
      get copyWith => __$$DisabilityTypesWrapperModelImplCopyWithImpl<
          _$DisabilityTypesWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisabilityTypesWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _DisabilityTypesWrapperModel
    implements DisabilityTypesWrapperModel {
  const factory _DisabilityTypesWrapperModel(
          {@JsonKey(name: 'disabilityTypes')
          final List<DisabilityTypes>? disabilityTypesList}) =
      _$DisabilityTypesWrapperModelImpl;

  factory _DisabilityTypesWrapperModel.fromJson(Map<String, dynamic> json) =
      _$DisabilityTypesWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'disabilityTypes')
  List<DisabilityTypes>? get disabilityTypesList;
  @override
  @JsonKey(ignore: true)
  _$$DisabilityTypesWrapperModelImplCopyWith<_$DisabilityTypesWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DisabilityTypes _$DisabilityTypesFromJson(Map<String, dynamic> json) {
  return _DisabilityTypes.fromJson(json);
}

/// @nodoc
mixin _$DisabilityTypes {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisabilityTypesCopyWith<DisabilityTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisabilityTypesCopyWith<$Res> {
  factory $DisabilityTypesCopyWith(
          DisabilityTypes value, $Res Function(DisabilityTypes) then) =
      _$DisabilityTypesCopyWithImpl<$Res, DisabilityTypes>;
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class _$DisabilityTypesCopyWithImpl<$Res, $Val extends DisabilityTypes>
    implements $DisabilityTypesCopyWith<$Res> {
  _$DisabilityTypesCopyWithImpl(this._value, this._then);

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
abstract class _$$DisabilityTypesImplCopyWith<$Res>
    implements $DisabilityTypesCopyWith<$Res> {
  factory _$$DisabilityTypesImplCopyWith(_$DisabilityTypesImpl value,
          $Res Function(_$DisabilityTypesImpl) then) =
      __$$DisabilityTypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$DisabilityTypesImplCopyWithImpl<$Res>
    extends _$DisabilityTypesCopyWithImpl<$Res, _$DisabilityTypesImpl>
    implements _$$DisabilityTypesImplCopyWith<$Res> {
  __$$DisabilityTypesImplCopyWithImpl(
      _$DisabilityTypesImpl _value, $Res Function(_$DisabilityTypesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$DisabilityTypesImpl(
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
class _$DisabilityTypesImpl implements _DisabilityTypes {
  const _$DisabilityTypesImpl(
      {required this.code, required this.name, required this.active});

  factory _$DisabilityTypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisabilityTypesImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString() {
    return 'DisabilityTypes(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisabilityTypesImpl &&
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
  _$$DisabilityTypesImplCopyWith<_$DisabilityTypesImpl> get copyWith =>
      __$$DisabilityTypesImplCopyWithImpl<_$DisabilityTypesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisabilityTypesImplToJson(
      this,
    );
  }
}

abstract class _DisabilityTypes implements DisabilityTypes {
  const factory _DisabilityTypes(
      {required final String code,
      required final String name,
      required final bool active}) = _$DisabilityTypesImpl;

  factory _DisabilityTypes.fromJson(Map<String, dynamic> json) =
      _$DisabilityTypesImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$DisabilityTypesImplCopyWith<_$DisabilityTypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
