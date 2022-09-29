// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MockDataModel _$MockDataModelFromJson(Map<String, dynamic> json) {
  return _MockDataModel.fromJson(json);
}

/// @nodoc
mixin _$MockDataModel {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MockDataModelCopyWith<MockDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MockDataModelCopyWith<$Res> {
  factory $MockDataModelCopyWith(
          MockDataModel value, $Res Function(MockDataModel) then) =
      _$MockDataModelCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$MockDataModelCopyWithImpl<$Res>
    implements $MockDataModelCopyWith<$Res> {
  _$MockDataModelCopyWithImpl(this._value, this._then);

  final MockDataModel _value;
  // ignore: unused_field
  final $Res Function(MockDataModel) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MockDataModelCopyWith<$Res>
    implements $MockDataModelCopyWith<$Res> {
  factory _$$_MockDataModelCopyWith(
          _$_MockDataModel value, $Res Function(_$_MockDataModel) then) =
      __$$_MockDataModelCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$$_MockDataModelCopyWithImpl<$Res>
    extends _$MockDataModelCopyWithImpl<$Res>
    implements _$$_MockDataModelCopyWith<$Res> {
  __$$_MockDataModelCopyWithImpl(
      _$_MockDataModel _value, $Res Function(_$_MockDataModel) _then)
      : super(_value, (v) => _then(v as _$_MockDataModel));

  @override
  _$_MockDataModel get _value => super._value as _$_MockDataModel;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_MockDataModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MockDataModel implements _MockDataModel {
  const _$_MockDataModel({required this.id});

  factory _$_MockDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_MockDataModelFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MockDataModel(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MockDataModel &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_MockDataModelCopyWith<_$_MockDataModel> get copyWith =>
      __$$_MockDataModelCopyWithImpl<_$_MockDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MockDataModelToJson(
      this,
    );
  }
}

abstract class _MockDataModel implements MockDataModel {
  const factory _MockDataModel({required final String id}) = _$_MockDataModel;

  factory _MockDataModel.fromJson(Map<String, dynamic> json) =
      _$_MockDataModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_MockDataModelCopyWith<_$_MockDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
