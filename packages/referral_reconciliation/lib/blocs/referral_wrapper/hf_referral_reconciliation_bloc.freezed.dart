// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hf_referral_reconciliation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HFReferalWrapperEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HFReferalWrapperEventCopyWith<$Res> {
  factory $HFReferalWrapperEventCopyWith(HFReferalWrapperEvent value,
          $Res Function(HFReferalWrapperEvent) then) =
      _$HFReferalWrapperEventCopyWithImpl<$Res, HFReferalWrapperEvent>;
}

/// @nodoc
class _$HFReferalWrapperEventCopyWithImpl<$Res,
        $Val extends HFReferalWrapperEvent>
    implements $HFReferalWrapperEventCopyWith<$Res> {
  _$HFReferalWrapperEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HFReferalWrapperLoadFromGlobalImplCopyWith<$Res> {
  factory _$$HFReferalWrapperLoadFromGlobalImplCopyWith(
          _$HFReferalWrapperLoadFromGlobalImpl value,
          $Res Function(_$HFReferalWrapperLoadFromGlobalImpl) then) =
      __$$HFReferalWrapperLoadFromGlobalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalSearchParameters searchParams});

  $GlobalSearchParametersCopyWith<$Res> get searchParams;
}

/// @nodoc
class __$$HFReferalWrapperLoadFromGlobalImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res,
        _$HFReferalWrapperLoadFromGlobalImpl>
    implements _$$HFReferalWrapperLoadFromGlobalImplCopyWith<$Res> {
  __$$HFReferalWrapperLoadFromGlobalImplCopyWithImpl(
      _$HFReferalWrapperLoadFromGlobalImpl _value,
      $Res Function(_$HFReferalWrapperLoadFromGlobalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchParams = null,
  }) {
    return _then(_$HFReferalWrapperLoadFromGlobalImpl(
      searchParams: null == searchParams
          ? _value.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as GlobalSearchParameters,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GlobalSearchParametersCopyWith<$Res> get searchParams {
    return $GlobalSearchParametersCopyWith<$Res>(_value.searchParams, (value) {
      return _then(_value.copyWith(searchParams: value));
    });
  }
}

/// @nodoc

class _$HFReferalWrapperLoadFromGlobalImpl
    implements HFReferalWrapperLoadFromGlobal {
  const _$HFReferalWrapperLoadFromGlobalImpl({required this.searchParams});

  @override
  final GlobalSearchParameters searchParams;

  @override
  String toString() {
    return 'HFReferalWrapperEvent.loadFromGlobal(searchParams: $searchParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferalWrapperLoadFromGlobalImpl &&
            (identical(other.searchParams, searchParams) ||
                other.searchParams == searchParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferalWrapperLoadFromGlobalImplCopyWith<
          _$HFReferalWrapperLoadFromGlobalImpl>
      get copyWith => __$$HFReferalWrapperLoadFromGlobalImplCopyWithImpl<
          _$HFReferalWrapperLoadFromGlobalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return loadFromGlobal(searchParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return loadFromGlobal?.call(searchParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (loadFromGlobal != null) {
      return loadFromGlobal(searchParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return loadFromGlobal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return loadFromGlobal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (loadFromGlobal != null) {
      return loadFromGlobal(this);
    }
    return orElse();
  }
}

abstract class HFReferalWrapperLoadFromGlobal implements HFReferalWrapperEvent {
  const factory HFReferalWrapperLoadFromGlobal(
          {required final GlobalSearchParameters searchParams}) =
      _$HFReferalWrapperLoadFromGlobalImpl;

  GlobalSearchParameters get searchParams;
  @JsonKey(ignore: true)
  _$$HFReferalWrapperLoadFromGlobalImplCopyWith<
          _$HFReferalWrapperLoadFromGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$CreateImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements Create {
  const _$CreateImpl({required final List<EntityModel> entities})
      : _entities = entities;

  final List<EntityModel> _entities;
  @override
  List<EntityModel> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'HFReferalWrapperEvent.create(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return create(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return create?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class Create implements HFReferalWrapperEvent {
  const factory Create({required final List<EntityModel> entities}) =
      _$CreateImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$UpdateImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements Update {
  const _$UpdateImpl({required final List<EntityModel> entities})
      : _entities = entities;

  final List<EntityModel> _entities;
  @override
  List<EntityModel> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'HFReferalWrapperEvent.update(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return update(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return update?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update implements HFReferalWrapperEvent {
  const factory Update({required final List<EntityModel> entities}) =
      _$UpdateImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$DeleteImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements Delete {
  const _$DeleteImpl({required final List<EntityModel> entities})
      : _entities = entities;

  final List<EntityModel> _entities;
  @override
  List<EntityModel> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'HFReferalWrapperEvent.delete(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return delete(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return delete?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements HFReferalWrapperEvent {
  const factory Delete({required final List<EntityModel> entities}) =
      _$DeleteImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateAndUpdateImplCopyWith<$Res> {
  factory _$$CreateAndUpdateImplCopyWith(_$CreateAndUpdateImpl value,
          $Res Function(_$CreateAndUpdateImpl) then) =
      __$$CreateAndUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EntityModel> entitiesToCreate, List<EntityModel> entitiesToUpdate});
}

/// @nodoc
class __$$CreateAndUpdateImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res, _$CreateAndUpdateImpl>
    implements _$$CreateAndUpdateImplCopyWith<$Res> {
  __$$CreateAndUpdateImplCopyWithImpl(
      _$CreateAndUpdateImpl _value, $Res Function(_$CreateAndUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entitiesToCreate = null,
    Object? entitiesToUpdate = null,
  }) {
    return _then(_$CreateAndUpdateImpl(
      entitiesToCreate: null == entitiesToCreate
          ? _value._entitiesToCreate
          : entitiesToCreate // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
      entitiesToUpdate: null == entitiesToUpdate
          ? _value._entitiesToUpdate
          : entitiesToUpdate // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CreateAndUpdateImpl implements CreateAndUpdate {
  const _$CreateAndUpdateImpl(
      {required final List<EntityModel> entitiesToCreate,
      required final List<EntityModel> entitiesToUpdate})
      : _entitiesToCreate = entitiesToCreate,
        _entitiesToUpdate = entitiesToUpdate;

  final List<EntityModel> _entitiesToCreate;
  @override
  List<EntityModel> get entitiesToCreate {
    if (_entitiesToCreate is EqualUnmodifiableListView)
      return _entitiesToCreate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entitiesToCreate);
  }

  final List<EntityModel> _entitiesToUpdate;
  @override
  List<EntityModel> get entitiesToUpdate {
    if (_entitiesToUpdate is EqualUnmodifiableListView)
      return _entitiesToUpdate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entitiesToUpdate);
  }

  @override
  String toString() {
    return 'HFReferalWrapperEvent.createAndUpdate(entitiesToCreate: $entitiesToCreate, entitiesToUpdate: $entitiesToUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAndUpdateImpl &&
            const DeepCollectionEquality()
                .equals(other._entitiesToCreate, _entitiesToCreate) &&
            const DeepCollectionEquality()
                .equals(other._entitiesToUpdate, _entitiesToUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entitiesToCreate),
      const DeepCollectionEquality().hash(_entitiesToUpdate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAndUpdateImplCopyWith<_$CreateAndUpdateImpl> get copyWith =>
      __$$CreateAndUpdateImplCopyWithImpl<_$CreateAndUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return createAndUpdate(entitiesToCreate, entitiesToUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return createAndUpdate?.call(entitiesToCreate, entitiesToUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (createAndUpdate != null) {
      return createAndUpdate(entitiesToCreate, entitiesToUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return createAndUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return createAndUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (createAndUpdate != null) {
      return createAndUpdate(this);
    }
    return orElse();
  }
}

abstract class CreateAndUpdate implements HFReferalWrapperEvent {
  const factory CreateAndUpdate(
          {required final List<EntityModel> entitiesToCreate,
          required final List<EntityModel> entitiesToUpdate}) =
      _$CreateAndUpdateImpl;

  List<EntityModel> get entitiesToCreate;
  List<EntityModel> get entitiesToUpdate;
  @JsonKey(ignore: true)
  _$$CreateAndUpdateImplCopyWith<_$CreateAndUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferalWrapperClearImplCopyWith<$Res> {
  factory _$$HFReferalWrapperClearImplCopyWith(
          _$HFReferalWrapperClearImpl value,
          $Res Function(_$HFReferalWrapperClearImpl) then) =
      __$$HFReferalWrapperClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferalWrapperClearImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperEventCopyWithImpl<$Res,
        _$HFReferalWrapperClearImpl>
    implements _$$HFReferalWrapperClearImplCopyWith<$Res> {
  __$$HFReferalWrapperClearImplCopyWithImpl(_$HFReferalWrapperClearImpl _value,
      $Res Function(_$HFReferalWrapperClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferalWrapperClearImpl implements HFReferalWrapperClear {
  const _$HFReferalWrapperClearImpl();

  @override
  String toString() {
    return 'HFReferalWrapperEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferalWrapperClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalSearchParameters searchParams)
        loadFromGlobal,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
    required TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)
        createAndUpdate,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
    TResult? Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalSearchParameters searchParams)? loadFromGlobal,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    TResult Function(List<EntityModel> entitiesToCreate,
            List<EntityModel> entitiesToUpdate)?
        createAndUpdate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferalWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(CreateAndUpdate value) createAndUpdate,
    required TResult Function(HFReferalWrapperClear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(CreateAndUpdate value)? createAndUpdate,
    TResult? Function(HFReferalWrapperClear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferalWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(CreateAndUpdate value)? createAndUpdate,
    TResult Function(HFReferalWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class HFReferalWrapperClear implements HFReferalWrapperEvent {
  const factory HFReferalWrapperClear() = _$HFReferalWrapperClearImpl;
}

/// @nodoc
mixin _$HFReferalWrapperState {
  bool get loading => throw _privateConstructorUsedError;
  List<HFReferalWrapper> get hFReferalMembers =>
      throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  HFReferalWrapperActionType get lastAction =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HFReferalWrapperStateCopyWith<HFReferalWrapperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HFReferalWrapperStateCopyWith<$Res> {
  factory $HFReferalWrapperStateCopyWith(HFReferalWrapperState value,
          $Res Function(HFReferalWrapperState) then) =
      _$HFReferalWrapperStateCopyWithImpl<$Res, HFReferalWrapperState>;
  @useResult
  $Res call(
      {bool loading,
      List<HFReferalWrapper> hFReferalMembers,
      int? offset,
      int? limit,
      String? error,
      int totalCount,
      HFReferalWrapperActionType lastAction});
}

/// @nodoc
class _$HFReferalWrapperStateCopyWithImpl<$Res,
        $Val extends HFReferalWrapperState>
    implements $HFReferalWrapperStateCopyWith<$Res> {
  _$HFReferalWrapperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hFReferalMembers = null,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? error = freezed,
    Object? totalCount = null,
    Object? lastAction = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hFReferalMembers: null == hFReferalMembers
          ? _value.hFReferalMembers
          : hFReferalMembers // ignore: cast_nullable_to_non_nullable
              as List<HFReferalWrapper>,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastAction: null == lastAction
          ? _value.lastAction
          : lastAction // ignore: cast_nullable_to_non_nullable
              as HFReferalWrapperActionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HFReferalWrapperStateImplCopyWith<$Res>
    implements $HFReferalWrapperStateCopyWith<$Res> {
  factory _$$HFReferalWrapperStateImplCopyWith(
          _$HFReferalWrapperStateImpl value,
          $Res Function(_$HFReferalWrapperStateImpl) then) =
      __$$HFReferalWrapperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<HFReferalWrapper> hFReferalMembers,
      int? offset,
      int? limit,
      String? error,
      int totalCount,
      HFReferalWrapperActionType lastAction});
}

/// @nodoc
class __$$HFReferalWrapperStateImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperStateCopyWithImpl<$Res,
        _$HFReferalWrapperStateImpl>
    implements _$$HFReferalWrapperStateImplCopyWith<$Res> {
  __$$HFReferalWrapperStateImplCopyWithImpl(_$HFReferalWrapperStateImpl _value,
      $Res Function(_$HFReferalWrapperStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hFReferalMembers = null,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? error = freezed,
    Object? totalCount = null,
    Object? lastAction = null,
  }) {
    return _then(_$HFReferalWrapperStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hFReferalMembers: null == hFReferalMembers
          ? _value._hFReferalMembers
          : hFReferalMembers // ignore: cast_nullable_to_non_nullable
              as List<HFReferalWrapper>,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastAction: null == lastAction
          ? _value.lastAction
          : lastAction // ignore: cast_nullable_to_non_nullable
              as HFReferalWrapperActionType,
    ));
  }
}

/// @nodoc

class _$HFReferalWrapperStateImpl implements _HFReferalWrapperState {
  const _$HFReferalWrapperStateImpl(
      {this.loading = false,
      final List<HFReferalWrapper> hFReferalMembers = const [],
      this.offset,
      this.limit,
      this.error,
      this.totalCount = 0,
      this.lastAction = HFReferalWrapperActionType.none})
      : _hFReferalMembers = hFReferalMembers;

  @override
  @JsonKey()
  final bool loading;
  final List<HFReferalWrapper> _hFReferalMembers;
  @override
  @JsonKey()
  List<HFReferalWrapper> get hFReferalMembers {
    if (_hFReferalMembers is EqualUnmodifiableListView)
      return _hFReferalMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hFReferalMembers);
  }

  @override
  final int? offset;
  @override
  final int? limit;
  @override
  final String? error;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final HFReferalWrapperActionType lastAction;

  @override
  String toString() {
    return 'HFReferalWrapperState(loading: $loading, hFReferalMembers: $hFReferalMembers, offset: $offset, limit: $limit, error: $error, totalCount: $totalCount, lastAction: $lastAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferalWrapperStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._hFReferalMembers, _hFReferalMembers) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.lastAction, lastAction) ||
                other.lastAction == lastAction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_hFReferalMembers),
      offset,
      limit,
      error,
      totalCount,
      lastAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferalWrapperStateImplCopyWith<_$HFReferalWrapperStateImpl>
      get copyWith => __$$HFReferalWrapperStateImplCopyWithImpl<
          _$HFReferalWrapperStateImpl>(this, _$identity);
}

abstract class _HFReferalWrapperState implements HFReferalWrapperState {
  const factory _HFReferalWrapperState(
          {final bool loading,
          final List<HFReferalWrapper> hFReferalMembers,
          final int? offset,
          final int? limit,
          final String? error,
          final int totalCount,
          final HFReferalWrapperActionType lastAction}) =
      _$HFReferalWrapperStateImpl;

  @override
  bool get loading;
  @override
  List<HFReferalWrapper> get hFReferalMembers;
  @override
  int? get offset;
  @override
  int? get limit;
  @override
  String? get error;
  @override
  int get totalCount;
  @override
  HFReferalWrapperActionType get lastAction;
  @override
  @JsonKey(ignore: true)
  _$$HFReferalWrapperStateImplCopyWith<_$HFReferalWrapperStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HFReferalWrapper {
  HFReferralModel? get hfReferrals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HFReferalWrapperCopyWith<HFReferalWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HFReferalWrapperCopyWith<$Res> {
  factory $HFReferalWrapperCopyWith(
          HFReferalWrapper value, $Res Function(HFReferalWrapper) then) =
      _$HFReferalWrapperCopyWithImpl<$Res, HFReferalWrapper>;
  @useResult
  $Res call({HFReferralModel? hfReferrals});
}

/// @nodoc
class _$HFReferalWrapperCopyWithImpl<$Res, $Val extends HFReferalWrapper>
    implements $HFReferalWrapperCopyWith<$Res> {
  _$HFReferalWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hfReferrals = freezed,
  }) {
    return _then(_value.copyWith(
      hfReferrals: freezed == hfReferrals
          ? _value.hfReferrals
          : hfReferrals // ignore: cast_nullable_to_non_nullable
              as HFReferralModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HFReferalWrapperImplCopyWith<$Res>
    implements $HFReferalWrapperCopyWith<$Res> {
  factory _$$HFReferalWrapperImplCopyWith(_$HFReferalWrapperImpl value,
          $Res Function(_$HFReferalWrapperImpl) then) =
      __$$HFReferalWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HFReferralModel? hfReferrals});
}

/// @nodoc
class __$$HFReferalWrapperImplCopyWithImpl<$Res>
    extends _$HFReferalWrapperCopyWithImpl<$Res, _$HFReferalWrapperImpl>
    implements _$$HFReferalWrapperImplCopyWith<$Res> {
  __$$HFReferalWrapperImplCopyWithImpl(_$HFReferalWrapperImpl _value,
      $Res Function(_$HFReferalWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hfReferrals = freezed,
  }) {
    return _then(_$HFReferalWrapperImpl(
      hfReferrals: freezed == hfReferrals
          ? _value.hfReferrals
          : hfReferrals // ignore: cast_nullable_to_non_nullable
              as HFReferralModel?,
    ));
  }
}

/// @nodoc

class _$HFReferalWrapperImpl implements _HFReferalWrapper {
  const _$HFReferalWrapperImpl({this.hfReferrals});

  @override
  final HFReferralModel? hfReferrals;

  @override
  String toString() {
    return 'HFReferalWrapper(hfReferrals: $hfReferrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferalWrapperImpl &&
            (identical(other.hfReferrals, hfReferrals) ||
                other.hfReferrals == hfReferrals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hfReferrals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferalWrapperImplCopyWith<_$HFReferalWrapperImpl> get copyWith =>
      __$$HFReferalWrapperImplCopyWithImpl<_$HFReferalWrapperImpl>(
          this, _$identity);
}

abstract class _HFReferalWrapper implements HFReferalWrapper {
  const factory _HFReferalWrapper({final HFReferralModel? hfReferrals}) =
      _$HFReferalWrapperImpl;

  @override
  HFReferralModel? get hfReferrals;
  @override
  @JsonKey(ignore: true)
  _$$HFReferalWrapperImplCopyWith<_$HFReferalWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
