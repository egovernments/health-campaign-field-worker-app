// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudEventCopyWith<$Res> {
  factory $CrudEventCopyWith(CrudEvent value, $Res Function(CrudEvent) then) =
      _$CrudEventCopyWithImpl<$Res, CrudEvent>;
}

/// @nodoc
class _$CrudEventCopyWithImpl<$Res, $Val extends CrudEvent>
    implements $CrudEventCopyWith<$Res> {
  _$CrudEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CrudEventInitializeImplCopyWith<$Res> {
  factory _$$CrudEventInitializeImplCopyWith(_$CrudEventInitializeImpl value,
          $Res Function(_$CrudEventInitializeImpl) then) =
      __$$CrudEventInitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CrudEventInitializeImplCopyWithImpl<$Res>
    extends _$CrudEventCopyWithImpl<$Res, _$CrudEventInitializeImpl>
    implements _$$CrudEventInitializeImplCopyWith<$Res> {
  __$$CrudEventInitializeImplCopyWithImpl(_$CrudEventInitializeImpl _value,
      $Res Function(_$CrudEventInitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CrudEventInitializeImpl implements CrudEventInitialize {
  const _$CrudEventInitializeImpl();

  @override
  String toString() {
    return 'CrudEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudEventInitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class CrudEventInitialize implements CrudEvent {
  const factory CrudEventInitialize() = _$CrudEventInitializeImpl;
}

/// @nodoc
abstract class _$$CrudEventSearchImplCopyWith<$Res> {
  factory _$$CrudEventSearchImplCopyWith(_$CrudEventSearchImpl value,
          $Res Function(_$CrudEventSearchImpl) then) =
      __$$CrudEventSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalSearchParameters searchParams});

  $GlobalSearchParametersCopyWith<$Res> get searchParams;
}

/// @nodoc
class __$$CrudEventSearchImplCopyWithImpl<$Res>
    extends _$CrudEventCopyWithImpl<$Res, _$CrudEventSearchImpl>
    implements _$$CrudEventSearchImplCopyWith<$Res> {
  __$$CrudEventSearchImplCopyWithImpl(
      _$CrudEventSearchImpl _value, $Res Function(_$CrudEventSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchParams = null,
  }) {
    return _then(_$CrudEventSearchImpl(
      null == searchParams
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

class _$CrudEventSearchImpl implements CrudEventSearch {
  const _$CrudEventSearchImpl(this.searchParams);

  @override
  final GlobalSearchParameters searchParams;

  @override
  String toString() {
    return 'CrudEvent.search(searchParams: $searchParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudEventSearchImpl &&
            (identical(other.searchParams, searchParams) ||
                other.searchParams == searchParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudEventSearchImplCopyWith<_$CrudEventSearchImpl> get copyWith =>
      __$$CrudEventSearchImplCopyWithImpl<_$CrudEventSearchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) {
    return search(searchParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) {
    return search?.call(searchParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class CrudEventSearch implements CrudEvent {
  const factory CrudEventSearch(final GlobalSearchParameters searchParams) =
      _$CrudEventSearchImpl;

  GlobalSearchParameters get searchParams;
  @JsonKey(ignore: true)
  _$$CrudEventSearchImplCopyWith<_$CrudEventSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudEventCreateImplCopyWith<$Res> {
  factory _$$CrudEventCreateImplCopyWith(_$CrudEventCreateImpl value,
          $Res Function(_$CrudEventCreateImpl) then) =
      __$$CrudEventCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$CrudEventCreateImplCopyWithImpl<$Res>
    extends _$CrudEventCopyWithImpl<$Res, _$CrudEventCreateImpl>
    implements _$$CrudEventCreateImplCopyWith<$Res> {
  __$$CrudEventCreateImplCopyWithImpl(
      _$CrudEventCreateImpl _value, $Res Function(_$CrudEventCreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$CrudEventCreateImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CrudEventCreateImpl implements CrudEventCreate {
  const _$CrudEventCreateImpl({required final List<EntityModel> entities})
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
    return 'CrudEvent.create(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudEventCreateImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudEventCreateImplCopyWith<_$CrudEventCreateImpl> get copyWith =>
      __$$CrudEventCreateImplCopyWithImpl<_$CrudEventCreateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) {
    return create(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) {
    return create?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
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
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CrudEventCreate implements CrudEvent {
  const factory CrudEventCreate({required final List<EntityModel> entities}) =
      _$CrudEventCreateImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$CrudEventCreateImplCopyWith<_$CrudEventCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudEventUpdateImplCopyWith<$Res> {
  factory _$$CrudEventUpdateImplCopyWith(_$CrudEventUpdateImpl value,
          $Res Function(_$CrudEventUpdateImpl) then) =
      __$$CrudEventUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$CrudEventUpdateImplCopyWithImpl<$Res>
    extends _$CrudEventCopyWithImpl<$Res, _$CrudEventUpdateImpl>
    implements _$$CrudEventUpdateImplCopyWith<$Res> {
  __$$CrudEventUpdateImplCopyWithImpl(
      _$CrudEventUpdateImpl _value, $Res Function(_$CrudEventUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$CrudEventUpdateImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CrudEventUpdateImpl implements CrudEventUpdate {
  const _$CrudEventUpdateImpl({required final List<EntityModel> entities})
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
    return 'CrudEvent.update(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudEventUpdateImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudEventUpdateImplCopyWith<_$CrudEventUpdateImpl> get copyWith =>
      __$$CrudEventUpdateImplCopyWithImpl<_$CrudEventUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) {
    return update(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) {
    return update?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
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
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class CrudEventUpdate implements CrudEvent {
  const factory CrudEventUpdate({required final List<EntityModel> entities}) =
      _$CrudEventUpdateImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$CrudEventUpdateImplCopyWith<_$CrudEventUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudEventDeleteImplCopyWith<$Res> {
  factory _$$CrudEventDeleteImplCopyWith(_$CrudEventDeleteImpl value,
          $Res Function(_$CrudEventDeleteImpl) then) =
      __$$CrudEventDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$CrudEventDeleteImplCopyWithImpl<$Res>
    extends _$CrudEventCopyWithImpl<$Res, _$CrudEventDeleteImpl>
    implements _$$CrudEventDeleteImplCopyWith<$Res> {
  __$$CrudEventDeleteImplCopyWithImpl(
      _$CrudEventDeleteImpl _value, $Res Function(_$CrudEventDeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$CrudEventDeleteImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CrudEventDeleteImpl implements CrudEventDelete {
  const _$CrudEventDeleteImpl({required final List<EntityModel> entities})
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
    return 'CrudEvent.delete(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudEventDeleteImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudEventDeleteImplCopyWith<_$CrudEventDeleteImpl> get copyWith =>
      __$$CrudEventDeleteImplCopyWithImpl<_$CrudEventDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(GlobalSearchParameters searchParams) search,
    required TResult Function(List<EntityModel> entities) create,
    required TResult Function(List<EntityModel> entities) update,
    required TResult Function(List<EntityModel> entities) delete,
  }) {
    return delete(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(GlobalSearchParameters searchParams)? search,
    TResult? Function(List<EntityModel> entities)? create,
    TResult? Function(List<EntityModel> entities)? update,
    TResult? Function(List<EntityModel> entities)? delete,
  }) {
    return delete?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(GlobalSearchParameters searchParams)? search,
    TResult Function(List<EntityModel> entities)? create,
    TResult Function(List<EntityModel> entities)? update,
    TResult Function(List<EntityModel> entities)? delete,
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
    required TResult Function(CrudEventInitialize value) initialize,
    required TResult Function(CrudEventSearch value) search,
    required TResult Function(CrudEventCreate value) create,
    required TResult Function(CrudEventUpdate value) update,
    required TResult Function(CrudEventDelete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudEventInitialize value)? initialize,
    TResult? Function(CrudEventSearch value)? search,
    TResult? Function(CrudEventCreate value)? create,
    TResult? Function(CrudEventUpdate value)? update,
    TResult? Function(CrudEventDelete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudEventInitialize value)? initialize,
    TResult Function(CrudEventSearch value)? search,
    TResult Function(CrudEventCreate value)? create,
    TResult Function(CrudEventUpdate value)? update,
    TResult Function(CrudEventDelete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class CrudEventDelete implements CrudEvent {
  const factory CrudEventDelete({required final List<EntityModel> entities}) =
      _$CrudEventDeleteImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$CrudEventDeleteImplCopyWith<_$CrudEventDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudStateCopyWith<$Res> {
  factory $CrudStateCopyWith(CrudState value, $Res Function(CrudState) then) =
      _$CrudStateCopyWithImpl<$Res, CrudState>;
}

/// @nodoc
class _$CrudStateCopyWithImpl<$Res, $Val extends CrudState>
    implements $CrudStateCopyWith<$Res> {
  _$CrudStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CrudStateInitialImplCopyWith<$Res> {
  factory _$$CrudStateInitialImplCopyWith(_$CrudStateInitialImpl value,
          $Res Function(_$CrudStateInitialImpl) then) =
      __$$CrudStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CrudStateInitialImplCopyWithImpl<$Res>
    extends _$CrudStateCopyWithImpl<$Res, _$CrudStateInitialImpl>
    implements _$$CrudStateInitialImplCopyWith<$Res> {
  __$$CrudStateInitialImplCopyWithImpl(_$CrudStateInitialImpl _value,
      $Res Function(_$CrudStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CrudStateInitialImpl implements CrudStateInitial {
  const _$CrudStateInitialImpl();

  @override
  String toString() {
    return 'CrudState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CrudStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CrudStateInitial implements CrudState {
  const factory CrudStateInitial() = _$CrudStateInitialImpl;
}

/// @nodoc
abstract class _$$CrudStateLoadingImplCopyWith<$Res> {
  factory _$$CrudStateLoadingImplCopyWith(_$CrudStateLoadingImpl value,
          $Res Function(_$CrudStateLoadingImpl) then) =
      __$$CrudStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CrudStateLoadingImplCopyWithImpl<$Res>
    extends _$CrudStateCopyWithImpl<$Res, _$CrudStateLoadingImpl>
    implements _$$CrudStateLoadingImplCopyWith<$Res> {
  __$$CrudStateLoadingImplCopyWithImpl(_$CrudStateLoadingImpl _value,
      $Res Function(_$CrudStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CrudStateLoadingImpl implements CrudStateLoading {
  const _$CrudStateLoadingImpl();

  @override
  String toString() {
    return 'CrudState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CrudStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CrudStateLoading implements CrudState {
  const factory CrudStateLoading() = _$CrudStateLoadingImpl;
}

/// @nodoc
abstract class _$$CrudStateLoadedImplCopyWith<$Res> {
  factory _$$CrudStateLoadedImplCopyWith(_$CrudStateLoadedImpl value,
          $Res Function(_$CrudStateLoadedImpl) then) =
      __$$CrudStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<EntityModel>> results, int? totalCount});
}

/// @nodoc
class __$$CrudStateLoadedImplCopyWithImpl<$Res>
    extends _$CrudStateCopyWithImpl<$Res, _$CrudStateLoadedImpl>
    implements _$$CrudStateLoadedImplCopyWith<$Res> {
  __$$CrudStateLoadedImplCopyWithImpl(
      _$CrudStateLoadedImpl _value, $Res Function(_$CrudStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? totalCount = freezed,
  }) {
    return _then(_$CrudStateLoadedImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, List<EntityModel>>,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CrudStateLoadedImpl implements CrudStateLoaded {
  const _$CrudStateLoadedImpl(
      {required final Map<String, List<EntityModel>> results, this.totalCount})
      : _results = results;

  final Map<String, List<EntityModel>> _results;
  @override
  Map<String, List<EntityModel>> get results {
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_results);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'CrudState.loaded(results: $results, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudStateLoadedImplCopyWith<_$CrudStateLoadedImpl> get copyWith =>
      __$$CrudStateLoadedImplCopyWithImpl<_$CrudStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) {
    return loaded(results, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(results, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(results, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CrudStateLoaded implements CrudState {
  const factory CrudStateLoaded(
      {required final Map<String, List<EntityModel>> results,
      final int? totalCount}) = _$CrudStateLoadedImpl;

  Map<String, List<EntityModel>> get results;
  int? get totalCount;
  @JsonKey(ignore: true)
  _$$CrudStateLoadedImplCopyWith<_$CrudStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudStatePersistedImplCopyWith<$Res> {
  factory _$$CrudStatePersistedImplCopyWith(_$CrudStatePersistedImpl value,
          $Res Function(_$CrudStatePersistedImpl) then) =
      __$$CrudStatePersistedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EntityModel> entities});
}

/// @nodoc
class __$$CrudStatePersistedImplCopyWithImpl<$Res>
    extends _$CrudStateCopyWithImpl<$Res, _$CrudStatePersistedImpl>
    implements _$$CrudStatePersistedImplCopyWith<$Res> {
  __$$CrudStatePersistedImplCopyWithImpl(_$CrudStatePersistedImpl _value,
      $Res Function(_$CrudStatePersistedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$CrudStatePersistedImpl(
      null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
    ));
  }
}

/// @nodoc

class _$CrudStatePersistedImpl implements CrudStatePersisted {
  const _$CrudStatePersistedImpl(final List<EntityModel> entities)
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
    return 'CrudState.persisted(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudStatePersistedImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudStatePersistedImplCopyWith<_$CrudStatePersistedImpl> get copyWith =>
      __$$CrudStatePersistedImplCopyWithImpl<_$CrudStatePersistedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) {
    return persisted(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) {
    return persisted?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) {
    return persisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) {
    return persisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(this);
    }
    return orElse();
  }
}

abstract class CrudStatePersisted implements CrudState {
  const factory CrudStatePersisted(final List<EntityModel> entities) =
      _$CrudStatePersistedImpl;

  List<EntityModel> get entities;
  @JsonKey(ignore: true)
  _$$CrudStatePersistedImplCopyWith<_$CrudStatePersistedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudStateErrorImplCopyWith<$Res> {
  factory _$$CrudStateErrorImplCopyWith(_$CrudStateErrorImpl value,
          $Res Function(_$CrudStateErrorImpl) then) =
      __$$CrudStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CrudStateErrorImplCopyWithImpl<$Res>
    extends _$CrudStateCopyWithImpl<$Res, _$CrudStateErrorImpl>
    implements _$$CrudStateErrorImplCopyWith<$Res> {
  __$$CrudStateErrorImplCopyWithImpl(
      _$CrudStateErrorImpl _value, $Res Function(_$CrudStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CrudStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CrudStateErrorImpl implements CrudStateError {
  const _$CrudStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CrudState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudStateErrorImplCopyWith<_$CrudStateErrorImpl> get copyWith =>
      __$$CrudStateErrorImplCopyWithImpl<_$CrudStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<String, List<EntityModel>> results, int? totalCount)
        loaded,
    required TResult Function(List<EntityModel> entities) persisted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult? Function(List<EntityModel> entities)? persisted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<EntityModel>> results, int? totalCount)?
        loaded,
    TResult Function(List<EntityModel> entities)? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudStateInitial value) initial,
    required TResult Function(CrudStateLoading value) loading,
    required TResult Function(CrudStateLoaded value) loaded,
    required TResult Function(CrudStatePersisted value) persisted,
    required TResult Function(CrudStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudStateInitial value)? initial,
    TResult? Function(CrudStateLoading value)? loading,
    TResult? Function(CrudStateLoaded value)? loaded,
    TResult? Function(CrudStatePersisted value)? persisted,
    TResult? Function(CrudStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudStateInitial value)? initial,
    TResult Function(CrudStateLoading value)? loading,
    TResult Function(CrudStateLoaded value)? loaded,
    TResult Function(CrudStatePersisted value)? persisted,
    TResult Function(CrudStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CrudStateError implements CrudState {
  const factory CrudStateError(final String message) = _$CrudStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$CrudStateErrorImplCopyWith<_$CrudStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
