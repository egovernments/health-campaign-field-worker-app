// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sync_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncDataModel _$SyncDataModelFromJson(Map<String, dynamic> json) {
  return _SyncDataModel.fromJson(json);
}

/// @nodoc
mixin _$SyncDataModel {
  List<SyncObjectModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncDataModelCopyWith<SyncDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncDataModelCopyWith<$Res> {
  factory $SyncDataModelCopyWith(
          SyncDataModel value, $Res Function(SyncDataModel) then) =
      _$SyncDataModelCopyWithImpl<$Res>;
  $Res call({List<SyncObjectModel> data});
}

/// @nodoc
class _$SyncDataModelCopyWithImpl<$Res>
    implements $SyncDataModelCopyWith<$Res> {
  _$SyncDataModelCopyWithImpl(this._value, this._then);

  final SyncDataModel _value;
  // ignore: unused_field
  final $Res Function(SyncDataModel) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SyncObjectModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_SyncDataModelCopyWith<$Res>
    implements $SyncDataModelCopyWith<$Res> {
  factory _$$_SyncDataModelCopyWith(
          _$_SyncDataModel value, $Res Function(_$_SyncDataModel) then) =
      __$$_SyncDataModelCopyWithImpl<$Res>;
  @override
  $Res call({List<SyncObjectModel> data});
}

/// @nodoc
class __$$_SyncDataModelCopyWithImpl<$Res>
    extends _$SyncDataModelCopyWithImpl<$Res>
    implements _$$_SyncDataModelCopyWith<$Res> {
  __$$_SyncDataModelCopyWithImpl(
      _$_SyncDataModel _value, $Res Function(_$_SyncDataModel) _then)
      : super(_value, (v) => _then(v as _$_SyncDataModel));

  @override
  _$_SyncDataModel get _value => super._value as _$_SyncDataModel;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_SyncDataModel(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SyncObjectModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncDataModel implements _SyncDataModel {
  const _$_SyncDataModel({required final List<SyncObjectModel> data})
      : _data = data;

  factory _$_SyncDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_SyncDataModelFromJson(json);

  final List<SyncObjectModel> _data;
  @override
  List<SyncObjectModel> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SyncDataModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncDataModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_SyncDataModelCopyWith<_$_SyncDataModel> get copyWith =>
      __$$_SyncDataModelCopyWithImpl<_$_SyncDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncDataModelToJson(
      this,
    );
  }
}

abstract class _SyncDataModel implements SyncDataModel {
  const factory _SyncDataModel({required final List<SyncObjectModel> data}) =
      _$_SyncDataModel;

  factory _SyncDataModel.fromJson(Map<String, dynamic> json) =
      _$_SyncDataModel.fromJson;

  @override
  List<SyncObjectModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SyncDataModelCopyWith<_$_SyncDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SyncObjectModel<T> {
  SyncObjectModelType get type => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SyncObjectModelCopyWith<T, SyncObjectModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncObjectModelCopyWith<T, $Res> {
  factory $SyncObjectModelCopyWith(
          SyncObjectModel<T> value, $Res Function(SyncObjectModel<T>) then) =
      _$SyncObjectModelCopyWithImpl<T, $Res>;
  $Res call({SyncObjectModelType type, List<T> items});
}

/// @nodoc
class _$SyncObjectModelCopyWithImpl<T, $Res>
    implements $SyncObjectModelCopyWith<T, $Res> {
  _$SyncObjectModelCopyWithImpl(this._value, this._then);

  final SyncObjectModel<T> _value;
  // ignore: unused_field
  final $Res Function(SyncObjectModel<T>) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
abstract class _$$_SyncObjectModelCopyWith<T, $Res>
    implements $SyncObjectModelCopyWith<T, $Res> {
  factory _$$_SyncObjectModelCopyWith(_$_SyncObjectModel<T> value,
          $Res Function(_$_SyncObjectModel<T>) then) =
      __$$_SyncObjectModelCopyWithImpl<T, $Res>;
  @override
  $Res call({SyncObjectModelType type, List<T> items});
}

/// @nodoc
class __$$_SyncObjectModelCopyWithImpl<T, $Res>
    extends _$SyncObjectModelCopyWithImpl<T, $Res>
    implements _$$_SyncObjectModelCopyWith<T, $Res> {
  __$$_SyncObjectModelCopyWithImpl(
      _$_SyncObjectModel<T> _value, $Res Function(_$_SyncObjectModel<T>) _then)
      : super(_value, (v) => _then(v as _$_SyncObjectModel<T>));

  @override
  _$_SyncObjectModel<T> get _value => super._value as _$_SyncObjectModel<T>;

  @override
  $Res call({
    Object? type = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_SyncObjectModel<T>(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_SyncObjectModel<T> extends _SyncObjectModel<T> {
  const _$_SyncObjectModel({required this.type, required final List<T> items})
      : _items = items,
        super._();

  @override
  final SyncObjectModelType type;
  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SyncObjectModel<$T>(type: $type, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncObjectModel<T> &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_SyncObjectModelCopyWith<T, _$_SyncObjectModel<T>> get copyWith =>
      __$$_SyncObjectModelCopyWithImpl<T, _$_SyncObjectModel<T>>(
          this, _$identity);
}

abstract class _SyncObjectModel<T> extends SyncObjectModel<T> {
  const factory _SyncObjectModel(
      {required final SyncObjectModelType type,
      required final List<T> items}) = _$_SyncObjectModel<T>;
  const _SyncObjectModel._() : super._();

  @override
  SyncObjectModelType get type;
  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  _$$_SyncObjectModelCopyWith<T, _$_SyncObjectModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
