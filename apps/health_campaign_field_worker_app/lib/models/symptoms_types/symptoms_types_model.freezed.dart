// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symptoms_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomsTypesPrimaryWrapperModel _$SymptomsTypesPrimaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _SymptomsTypesPrimaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$SymptomsTypesPrimaryWrapperModel {
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  SymptomsTypesSecondaryWrapperModel? get symptomsTypes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomsTypesPrimaryWrapperModelCopyWith<SymptomsTypesPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  factory $SymptomsTypesPrimaryWrapperModelCopyWith(
          SymptomsTypesPrimaryWrapperModel value,
          $Res Function(SymptomsTypesPrimaryWrapperModel) then) =
      _$SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res,
          SymptomsTypesPrimaryWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SYMPTOMS-TYPES')
          SymptomsTypesSecondaryWrapperModel? symptomsTypes});

  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;
}

/// @nodoc
class _$SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res,
        $Val extends SymptomsTypesPrimaryWrapperModel>
    implements $SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  _$SymptomsTypesPrimaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomsTypes = freezed,
  }) {
    return _then(_value.copyWith(
      symptomsTypes: freezed == symptomsTypes
          ? _value.symptomsTypes
          : symptomsTypes // ignore: cast_nullable_to_non_nullable
              as SymptomsTypesSecondaryWrapperModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes {
    if (_value.symptomsTypes == null) {
      return null;
    }

    return $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>(
        _value.symptomsTypes!, (value) {
      return _then(_value.copyWith(symptomsTypes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SymptomsTypesPrimaryWrapperModelCopyWith<$Res>
    implements $SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  factory _$$_SymptomsTypesPrimaryWrapperModelCopyWith(
          _$_SymptomsTypesPrimaryWrapperModel value,
          $Res Function(_$_SymptomsTypesPrimaryWrapperModel) then) =
      __$$_SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SYMPTOMS-TYPES')
          SymptomsTypesSecondaryWrapperModel? symptomsTypes});

  @override
  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;
}

/// @nodoc
class __$$_SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res>
    extends _$SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res,
        _$_SymptomsTypesPrimaryWrapperModel>
    implements _$$_SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  __$$_SymptomsTypesPrimaryWrapperModelCopyWithImpl(
      _$_SymptomsTypesPrimaryWrapperModel _value,
      $Res Function(_$_SymptomsTypesPrimaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomsTypes = freezed,
  }) {
    return _then(_$_SymptomsTypesPrimaryWrapperModel(
      symptomsTypes: freezed == symptomsTypes
          ? _value.symptomsTypes
          : symptomsTypes // ignore: cast_nullable_to_non_nullable
              as SymptomsTypesSecondaryWrapperModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SymptomsTypesPrimaryWrapperModel
    implements _SymptomsTypesPrimaryWrapperModel {
  const _$_SymptomsTypesPrimaryWrapperModel(
      {@JsonKey(name: 'HCM-SYMPTOMS-TYPES') this.symptomsTypes});

  factory _$_SymptomsTypesPrimaryWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SymptomsTypesPrimaryWrapperModelFromJson(json);

  @override
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  final SymptomsTypesSecondaryWrapperModel? symptomsTypes;

  @override
  String toString() {
    return 'SymptomsTypesPrimaryWrapperModel(symptomsTypes: $symptomsTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomsTypesPrimaryWrapperModel &&
            (identical(other.symptomsTypes, symptomsTypes) ||
                other.symptomsTypes == symptomsTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symptomsTypes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomsTypesPrimaryWrapperModelCopyWith<
          _$_SymptomsTypesPrimaryWrapperModel>
      get copyWith => __$$_SymptomsTypesPrimaryWrapperModelCopyWithImpl<
          _$_SymptomsTypesPrimaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomsTypesPrimaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _SymptomsTypesPrimaryWrapperModel
    implements SymptomsTypesPrimaryWrapperModel {
  const factory _SymptomsTypesPrimaryWrapperModel(
          {@JsonKey(name: 'HCM-SYMPTOMS-TYPES')
              final SymptomsTypesSecondaryWrapperModel? symptomsTypes}) =
      _$_SymptomsTypesPrimaryWrapperModel;

  factory _SymptomsTypesPrimaryWrapperModel.fromJson(
      Map<String, dynamic> json) = _$_SymptomsTypesPrimaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  SymptomsTypesSecondaryWrapperModel? get symptomsTypes;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomsTypesPrimaryWrapperModelCopyWith<
          _$_SymptomsTypesPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

SymptomsTypesSecondaryWrapperModel _$SymptomsTypesSecondaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _SymptomsTypesSecondaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$SymptomsTypesSecondaryWrapperModel {
  @JsonKey(name: 'symptomsTypes')
  List<SymptomsType>? get symptomsTypeList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomsTypesSecondaryWrapperModelCopyWith<
          SymptomsTypesSecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  factory $SymptomsTypesSecondaryWrapperModelCopyWith(
          SymptomsTypesSecondaryWrapperModel value,
          $Res Function(SymptomsTypesSecondaryWrapperModel) then) =
      _$SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res,
          SymptomsTypesSecondaryWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'symptomsTypes') List<SymptomsType>? symptomsTypeList});
}

/// @nodoc
class _$SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res,
        $Val extends SymptomsTypesSecondaryWrapperModel>
    implements $SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  _$SymptomsTypesSecondaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomsTypeList = freezed,
  }) {
    return _then(_value.copyWith(
      symptomsTypeList: freezed == symptomsTypeList
          ? _value.symptomsTypeList
          : symptomsTypeList // ignore: cast_nullable_to_non_nullable
              as List<SymptomsType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SymptomsTypesSecondaryWrapperModelCopyWith<$Res>
    implements $SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  factory _$$_SymptomsTypesSecondaryWrapperModelCopyWith(
          _$_SymptomsTypesSecondaryWrapperModel value,
          $Res Function(_$_SymptomsTypesSecondaryWrapperModel) then) =
      __$$_SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'symptomsTypes') List<SymptomsType>? symptomsTypeList});
}

/// @nodoc
class __$$_SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res>
    extends _$SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res,
        _$_SymptomsTypesSecondaryWrapperModel>
    implements _$$_SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  __$$_SymptomsTypesSecondaryWrapperModelCopyWithImpl(
      _$_SymptomsTypesSecondaryWrapperModel _value,
      $Res Function(_$_SymptomsTypesSecondaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomsTypeList = freezed,
  }) {
    return _then(_$_SymptomsTypesSecondaryWrapperModel(
      symptomsTypeList: freezed == symptomsTypeList
          ? _value._symptomsTypeList
          : symptomsTypeList // ignore: cast_nullable_to_non_nullable
              as List<SymptomsType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SymptomsTypesSecondaryWrapperModel
    implements _SymptomsTypesSecondaryWrapperModel {
  const _$_SymptomsTypesSecondaryWrapperModel(
      {@JsonKey(name: 'symptomsTypes')
          final List<SymptomsType>? symptomsTypeList})
      : _symptomsTypeList = symptomsTypeList;

  factory _$_SymptomsTypesSecondaryWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SymptomsTypesSecondaryWrapperModelFromJson(json);

  final List<SymptomsType>? _symptomsTypeList;
  @override
  @JsonKey(name: 'symptomsTypes')
  List<SymptomsType>? get symptomsTypeList {
    final value = _symptomsTypeList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SymptomsTypesSecondaryWrapperModel(symptomsTypeList: $symptomsTypeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomsTypesSecondaryWrapperModel &&
            const DeepCollectionEquality()
                .equals(other._symptomsTypeList, _symptomsTypeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_symptomsTypeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomsTypesSecondaryWrapperModelCopyWith<
          _$_SymptomsTypesSecondaryWrapperModel>
      get copyWith => __$$_SymptomsTypesSecondaryWrapperModelCopyWithImpl<
          _$_SymptomsTypesSecondaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomsTypesSecondaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _SymptomsTypesSecondaryWrapperModel
    implements SymptomsTypesSecondaryWrapperModel {
  const factory _SymptomsTypesSecondaryWrapperModel(
          {@JsonKey(name: 'symptomsTypes')
              final List<SymptomsType>? symptomsTypeList}) =
      _$_SymptomsTypesSecondaryWrapperModel;

  factory _SymptomsTypesSecondaryWrapperModel.fromJson(
          Map<String, dynamic> json) =
      _$_SymptomsTypesSecondaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'symptomsTypes')
  List<SymptomsType>? get symptomsTypeList;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomsTypesSecondaryWrapperModelCopyWith<
          _$_SymptomsTypesSecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

SymptomsType _$SymptomsTypeFromJson(Map<String, dynamic> json) {
  return _SymptomsType.fromJson(json);
}

/// @nodoc
mixin _$SymptomsType {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomsTypeCopyWith<SymptomsType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomsTypeCopyWith<$Res> {
  factory $SymptomsTypeCopyWith(
          SymptomsType value, $Res Function(SymptomsType) then) =
      _$SymptomsTypeCopyWithImpl<$Res, SymptomsType>;
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class _$SymptomsTypeCopyWithImpl<$Res, $Val extends SymptomsType>
    implements $SymptomsTypeCopyWith<$Res> {
  _$SymptomsTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$_SymptomsTypeCopyWith<$Res>
    implements $SymptomsTypeCopyWith<$Res> {
  factory _$$_SymptomsTypeCopyWith(
          _$_SymptomsType value, $Res Function(_$_SymptomsType) then) =
      __$$_SymptomsTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, bool active});
}

/// @nodoc
class __$$_SymptomsTypeCopyWithImpl<$Res>
    extends _$SymptomsTypeCopyWithImpl<$Res, _$_SymptomsType>
    implements _$$_SymptomsTypeCopyWith<$Res> {
  __$$_SymptomsTypeCopyWithImpl(
      _$_SymptomsType _value, $Res Function(_$_SymptomsType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$_SymptomsType(
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
class _$_SymptomsType implements _SymptomsType {
  const _$_SymptomsType(
      {required this.code, required this.name, required this.active});

  factory _$_SymptomsType.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomsTypeFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString() {
    return 'SymptomsType(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomsType &&
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
  _$$_SymptomsTypeCopyWith<_$_SymptomsType> get copyWith =>
      __$$_SymptomsTypeCopyWithImpl<_$_SymptomsType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomsTypeToJson(
      this,
    );
  }
}

abstract class _SymptomsType implements SymptomsType {
  const factory _SymptomsType(
      {required final String code,
      required final String name,
      required final bool active}) = _$_SymptomsType;

  factory _SymptomsType.fromJson(Map<String, dynamic> json) =
      _$_SymptomsType.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomsTypeCopyWith<_$_SymptomsType> get copyWith =>
      throw _privateConstructorUsedError;
}
