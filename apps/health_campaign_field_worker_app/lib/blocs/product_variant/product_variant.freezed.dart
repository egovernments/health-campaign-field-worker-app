// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductVariantEvent {
  ProjectResourceSearchModel get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectResourceSearchModel query) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectResourceSearchModel query)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectResourceSearchModel query)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantLoadEvent value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadEvent value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadEvent value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductVariantEventCopyWith<ProductVariantEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantEventCopyWith<$Res> {
  factory $ProductVariantEventCopyWith(
          ProductVariantEvent value, $Res Function(ProductVariantEvent) then) =
      _$ProductVariantEventCopyWithImpl<$Res, ProductVariantEvent>;
  @useResult
  $Res call({ProjectResourceSearchModel query});
}

/// @nodoc
class _$ProductVariantEventCopyWithImpl<$Res, $Val extends ProductVariantEvent>
    implements $ProductVariantEventCopyWith<$Res> {
  _$ProductVariantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectResourceSearchModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantLoadEventImplCopyWith<$Res>
    implements $ProductVariantEventCopyWith<$Res> {
  factory _$$ProductVariantLoadEventImplCopyWith(
          _$ProductVariantLoadEventImpl value,
          $Res Function(_$ProductVariantLoadEventImpl) then) =
      __$$ProductVariantLoadEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectResourceSearchModel query});
}

/// @nodoc
class __$$ProductVariantLoadEventImplCopyWithImpl<$Res>
    extends _$ProductVariantEventCopyWithImpl<$Res,
        _$ProductVariantLoadEventImpl>
    implements _$$ProductVariantLoadEventImplCopyWith<$Res> {
  __$$ProductVariantLoadEventImplCopyWithImpl(
      _$ProductVariantLoadEventImpl _value,
      $Res Function(_$ProductVariantLoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$ProductVariantLoadEventImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectResourceSearchModel,
    ));
  }
}

/// @nodoc

class _$ProductVariantLoadEventImpl implements ProductVariantLoadEvent {
  const _$ProductVariantLoadEventImpl({required this.query});

  @override
  final ProjectResourceSearchModel query;

  @override
  String toString() {
    return 'ProductVariantEvent.load(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantLoadEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantLoadEventImplCopyWith<_$ProductVariantLoadEventImpl>
      get copyWith => __$$ProductVariantLoadEventImplCopyWithImpl<
          _$ProductVariantLoadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectResourceSearchModel query) load,
  }) {
    return load(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectResourceSearchModel query)? load,
  }) {
    return load?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectResourceSearchModel query)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantLoadEvent value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadEvent value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadEvent value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProductVariantLoadEvent implements ProductVariantEvent {
  const factory ProductVariantLoadEvent(
          {required final ProjectResourceSearchModel query}) =
      _$ProductVariantLoadEventImpl;

  @override
  ProjectResourceSearchModel get query;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantLoadEventImplCopyWith<_$ProductVariantLoadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductVariantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantLoadingState value) loading,
    required TResult Function(ProductVariantEmptyState value) empty,
    required TResult Function(ProductVariantFetchedState value) fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadingState value)? loading,
    TResult? Function(ProductVariantEmptyState value)? empty,
    TResult? Function(ProductVariantFetchedState value)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadingState value)? loading,
    TResult Function(ProductVariantEmptyState value)? empty,
    TResult Function(ProductVariantFetchedState value)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantStateCopyWith<$Res> {
  factory $ProductVariantStateCopyWith(
          ProductVariantState value, $Res Function(ProductVariantState) then) =
      _$ProductVariantStateCopyWithImpl<$Res, ProductVariantState>;
}

/// @nodoc
class _$ProductVariantStateCopyWithImpl<$Res, $Val extends ProductVariantState>
    implements $ProductVariantStateCopyWith<$Res> {
  _$ProductVariantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductVariantLoadingStateImplCopyWith<$Res> {
  factory _$$ProductVariantLoadingStateImplCopyWith(
          _$ProductVariantLoadingStateImpl value,
          $Res Function(_$ProductVariantLoadingStateImpl) then) =
      __$$ProductVariantLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductVariantLoadingStateImplCopyWithImpl<$Res>
    extends _$ProductVariantStateCopyWithImpl<$Res,
        _$ProductVariantLoadingStateImpl>
    implements _$$ProductVariantLoadingStateImplCopyWith<$Res> {
  __$$ProductVariantLoadingStateImplCopyWithImpl(
      _$ProductVariantLoadingStateImpl _value,
      $Res Function(_$ProductVariantLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductVariantLoadingStateImpl implements ProductVariantLoadingState {
  const _$ProductVariantLoadingStateImpl();

  @override
  String toString() {
    return 'ProductVariantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
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
    required TResult Function(ProductVariantLoadingState value) loading,
    required TResult Function(ProductVariantEmptyState value) empty,
    required TResult Function(ProductVariantFetchedState value) fetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadingState value)? loading,
    TResult? Function(ProductVariantEmptyState value)? empty,
    TResult? Function(ProductVariantFetchedState value)? fetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadingState value)? loading,
    TResult Function(ProductVariantEmptyState value)? empty,
    TResult Function(ProductVariantFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductVariantLoadingState implements ProductVariantState {
  const factory ProductVariantLoadingState() = _$ProductVariantLoadingStateImpl;
}

/// @nodoc
abstract class _$$ProductVariantEmptyStateImplCopyWith<$Res> {
  factory _$$ProductVariantEmptyStateImplCopyWith(
          _$ProductVariantEmptyStateImpl value,
          $Res Function(_$ProductVariantEmptyStateImpl) then) =
      __$$ProductVariantEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductVariantEmptyStateImplCopyWithImpl<$Res>
    extends _$ProductVariantStateCopyWithImpl<$Res,
        _$ProductVariantEmptyStateImpl>
    implements _$$ProductVariantEmptyStateImplCopyWith<$Res> {
  __$$ProductVariantEmptyStateImplCopyWithImpl(
      _$ProductVariantEmptyStateImpl _value,
      $Res Function(_$ProductVariantEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductVariantEmptyStateImpl implements ProductVariantEmptyState {
  const _$ProductVariantEmptyStateImpl();

  @override
  String toString() {
    return 'ProductVariantState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantLoadingState value) loading,
    required TResult Function(ProductVariantEmptyState value) empty,
    required TResult Function(ProductVariantFetchedState value) fetched,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadingState value)? loading,
    TResult? Function(ProductVariantEmptyState value)? empty,
    TResult? Function(ProductVariantFetchedState value)? fetched,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadingState value)? loading,
    TResult Function(ProductVariantEmptyState value)? empty,
    TResult Function(ProductVariantFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ProductVariantEmptyState implements ProductVariantState {
  const factory ProductVariantEmptyState() = _$ProductVariantEmptyStateImpl;
}

/// @nodoc
abstract class _$$ProductVariantFetchedStateImplCopyWith<$Res> {
  factory _$$ProductVariantFetchedStateImplCopyWith(
          _$ProductVariantFetchedStateImpl value,
          $Res Function(_$ProductVariantFetchedStateImpl) then) =
      __$$ProductVariantFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductVariantModel> productVariants});
}

/// @nodoc
class __$$ProductVariantFetchedStateImplCopyWithImpl<$Res>
    extends _$ProductVariantStateCopyWithImpl<$Res,
        _$ProductVariantFetchedStateImpl>
    implements _$$ProductVariantFetchedStateImplCopyWith<$Res> {
  __$$ProductVariantFetchedStateImplCopyWithImpl(
      _$ProductVariantFetchedStateImpl _value,
      $Res Function(_$ProductVariantFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariants = null,
  }) {
    return _then(_$ProductVariantFetchedStateImpl(
      productVariants: null == productVariants
          ? _value._productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantModel>,
    ));
  }
}

/// @nodoc

class _$ProductVariantFetchedStateImpl implements ProductVariantFetchedState {
  const _$ProductVariantFetchedStateImpl(
      {required final List<ProductVariantModel> productVariants})
      : _productVariants = productVariants;

  final List<ProductVariantModel> _productVariants;
  @override
  List<ProductVariantModel> get productVariants {
    if (_productVariants is EqualUnmodifiableListView) return _productVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productVariants);
  }

  @override
  String toString() {
    return 'ProductVariantState.fetched(productVariants: $productVariants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._productVariants, _productVariants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productVariants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantFetchedStateImplCopyWith<_$ProductVariantFetchedStateImpl>
      get copyWith => __$$ProductVariantFetchedStateImplCopyWithImpl<
          _$ProductVariantFetchedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return fetched(productVariants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return fetched?.call(productVariants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(productVariants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantLoadingState value) loading,
    required TResult Function(ProductVariantEmptyState value) empty,
    required TResult Function(ProductVariantFetchedState value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantLoadingState value)? loading,
    TResult? Function(ProductVariantEmptyState value)? empty,
    TResult? Function(ProductVariantFetchedState value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantLoadingState value)? loading,
    TResult Function(ProductVariantEmptyState value)? empty,
    TResult Function(ProductVariantFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ProductVariantFetchedState implements ProductVariantState {
  const factory ProductVariantFetchedState(
          {required final List<ProductVariantModel> productVariants}) =
      _$ProductVariantFetchedStateImpl;

  List<ProductVariantModel> get productVariants;
  @JsonKey(ignore: true)
  _$$ProductVariantFetchedStateImplCopyWith<_$ProductVariantFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
