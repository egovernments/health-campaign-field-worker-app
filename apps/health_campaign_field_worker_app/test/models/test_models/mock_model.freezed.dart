// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
      _$MockDataModelCopyWithImpl<$Res, MockDataModel>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MockDataModelCopyWithImpl<$Res, $Val extends MockDataModel>
    implements $MockDataModelCopyWith<$Res> {
  _$MockDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MockDataModelImplCopyWith<$Res>
    implements $MockDataModelCopyWith<$Res> {
  factory _$$MockDataModelImplCopyWith(
          _$MockDataModelImpl value, $Res Function(_$MockDataModelImpl) then) =
      __$$MockDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MockDataModelImplCopyWithImpl<$Res>
    extends _$MockDataModelCopyWithImpl<$Res, _$MockDataModelImpl>
    implements _$$MockDataModelImplCopyWith<$Res> {
  __$$MockDataModelImplCopyWithImpl(
      _$MockDataModelImpl _value, $Res Function(_$MockDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MockDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MockDataModelImpl implements _MockDataModel {
  const _$MockDataModelImpl({required this.id});

  factory _$MockDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MockDataModelImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MockDataModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MockDataModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MockDataModelImplCopyWith<_$MockDataModelImpl> get copyWith =>
      __$$MockDataModelImplCopyWithImpl<_$MockDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MockDataModelImplToJson(
      this,
    );
  }
}

abstract class _MockDataModel implements MockDataModel {
  const factory _MockDataModel({required final String id}) =
      _$MockDataModelImpl;

  factory _MockDataModel.fromJson(Map<String, dynamic> json) =
      _$MockDataModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$MockDataModelImplCopyWith<_$MockDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
