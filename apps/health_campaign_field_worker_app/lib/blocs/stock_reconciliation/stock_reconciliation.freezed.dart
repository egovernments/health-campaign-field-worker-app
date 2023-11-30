// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_reconciliation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockReconciliationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FacilityModel facilityModel, bool isDistributor)
        selectFacility,
    required TResult Function(String? productVariantId, bool isDistributor)
        selectProduct,
    required TResult Function(bool isDistributor) calculate,
    required TResult Function(StockReconciliationModel stockReconciliationModel)
        create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult? Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult? Function(bool isDistributor)? calculate,
    TResult? Function(StockReconciliationModel stockReconciliationModel)?
        create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult Function(bool isDistributor)? calculate,
    TResult Function(StockReconciliationModel stockReconciliationModel)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockReconciliationSelectFacilityEvent value)
        selectFacility,
    required TResult Function(StockReconciliationSelectProductEvent value)
        selectProduct,
    required TResult Function(StockReconciliationCalculateEvent value)
        calculate,
    required TResult Function(StockReconciliationCreateEvent value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult? Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult? Function(StockReconciliationCalculateEvent value)? calculate,
    TResult? Function(StockReconciliationCreateEvent value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult Function(StockReconciliationCalculateEvent value)? calculate,
    TResult Function(StockReconciliationCreateEvent value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockReconciliationEventCopyWith<$Res> {
  factory $StockReconciliationEventCopyWith(StockReconciliationEvent value,
          $Res Function(StockReconciliationEvent) then) =
      _$StockReconciliationEventCopyWithImpl<$Res, StockReconciliationEvent>;
}

/// @nodoc
class _$StockReconciliationEventCopyWithImpl<$Res,
        $Val extends StockReconciliationEvent>
    implements $StockReconciliationEventCopyWith<$Res> {
  _$StockReconciliationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StockReconciliationSelectFacilityEventCopyWith<$Res> {
  factory _$$StockReconciliationSelectFacilityEventCopyWith(
          _$StockReconciliationSelectFacilityEvent value,
          $Res Function(_$StockReconciliationSelectFacilityEvent) then) =
      __$$StockReconciliationSelectFacilityEventCopyWithImpl<$Res>;
  @useResult
  $Res call({FacilityModel facilityModel, bool isDistributor});
}

/// @nodoc
class __$$StockReconciliationSelectFacilityEventCopyWithImpl<$Res>
    extends _$StockReconciliationEventCopyWithImpl<$Res,
        _$StockReconciliationSelectFacilityEvent>
    implements _$$StockReconciliationSelectFacilityEventCopyWith<$Res> {
  __$$StockReconciliationSelectFacilityEventCopyWithImpl(
      _$StockReconciliationSelectFacilityEvent _value,
      $Res Function(_$StockReconciliationSelectFacilityEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityModel = null,
    Object? isDistributor = null,
  }) {
    return _then(_$StockReconciliationSelectFacilityEvent(
      null == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel,
      isDistributor: null == isDistributor
          ? _value.isDistributor
          : isDistributor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockReconciliationSelectFacilityEvent
    implements StockReconciliationSelectFacilityEvent {
  const _$StockReconciliationSelectFacilityEvent(this.facilityModel,
      {this.isDistributor = false});

  @override
  final FacilityModel facilityModel;
  @override
  @JsonKey()
  final bool isDistributor;

  @override
  String toString() {
    return 'StockReconciliationEvent.selectFacility(facilityModel: $facilityModel, isDistributor: $isDistributor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockReconciliationSelectFacilityEvent &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel) &&
            (identical(other.isDistributor, isDistributor) ||
                other.isDistributor == isDistributor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, facilityModel, isDistributor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockReconciliationSelectFacilityEventCopyWith<
          _$StockReconciliationSelectFacilityEvent>
      get copyWith => __$$StockReconciliationSelectFacilityEventCopyWithImpl<
          _$StockReconciliationSelectFacilityEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FacilityModel facilityModel, bool isDistributor)
        selectFacility,
    required TResult Function(String? productVariantId, bool isDistributor)
        selectProduct,
    required TResult Function(bool isDistributor) calculate,
    required TResult Function(StockReconciliationModel stockReconciliationModel)
        create,
  }) {
    return selectFacility(facilityModel, isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult? Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult? Function(bool isDistributor)? calculate,
    TResult? Function(StockReconciliationModel stockReconciliationModel)?
        create,
  }) {
    return selectFacility?.call(facilityModel, isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult Function(bool isDistributor)? calculate,
    TResult Function(StockReconciliationModel stockReconciliationModel)? create,
    required TResult orElse(),
  }) {
    if (selectFacility != null) {
      return selectFacility(facilityModel, isDistributor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockReconciliationSelectFacilityEvent value)
        selectFacility,
    required TResult Function(StockReconciliationSelectProductEvent value)
        selectProduct,
    required TResult Function(StockReconciliationCalculateEvent value)
        calculate,
    required TResult Function(StockReconciliationCreateEvent value) create,
  }) {
    return selectFacility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult? Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult? Function(StockReconciliationCalculateEvent value)? calculate,
    TResult? Function(StockReconciliationCreateEvent value)? create,
  }) {
    return selectFacility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult Function(StockReconciliationCalculateEvent value)? calculate,
    TResult Function(StockReconciliationCreateEvent value)? create,
    required TResult orElse(),
  }) {
    if (selectFacility != null) {
      return selectFacility(this);
    }
    return orElse();
  }
}

abstract class StockReconciliationSelectFacilityEvent
    implements StockReconciliationEvent {
  const factory StockReconciliationSelectFacilityEvent(
      final FacilityModel facilityModel,
      {final bool isDistributor}) = _$StockReconciliationSelectFacilityEvent;

  FacilityModel get facilityModel;
  bool get isDistributor;
  @JsonKey(ignore: true)
  _$$StockReconciliationSelectFacilityEventCopyWith<
          _$StockReconciliationSelectFacilityEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockReconciliationSelectProductEventCopyWith<$Res> {
  factory _$$StockReconciliationSelectProductEventCopyWith(
          _$StockReconciliationSelectProductEvent value,
          $Res Function(_$StockReconciliationSelectProductEvent) then) =
      __$$StockReconciliationSelectProductEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String? productVariantId, bool isDistributor});
}

/// @nodoc
class __$$StockReconciliationSelectProductEventCopyWithImpl<$Res>
    extends _$StockReconciliationEventCopyWithImpl<$Res,
        _$StockReconciliationSelectProductEvent>
    implements _$$StockReconciliationSelectProductEventCopyWith<$Res> {
  __$$StockReconciliationSelectProductEventCopyWithImpl(
      _$StockReconciliationSelectProductEvent _value,
      $Res Function(_$StockReconciliationSelectProductEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariantId = freezed,
    Object? isDistributor = null,
  }) {
    return _then(_$StockReconciliationSelectProductEvent(
      freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDistributor: null == isDistributor
          ? _value.isDistributor
          : isDistributor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockReconciliationSelectProductEvent
    implements StockReconciliationSelectProductEvent {
  const _$StockReconciliationSelectProductEvent(this.productVariantId,
      {this.isDistributor = false});

  @override
  final String? productVariantId;
  @override
  @JsonKey()
  final bool isDistributor;

  @override
  String toString() {
    return 'StockReconciliationEvent.selectProduct(productVariantId: $productVariantId, isDistributor: $isDistributor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockReconciliationSelectProductEvent &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId) &&
            (identical(other.isDistributor, isDistributor) ||
                other.isDistributor == isDistributor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productVariantId, isDistributor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockReconciliationSelectProductEventCopyWith<
          _$StockReconciliationSelectProductEvent>
      get copyWith => __$$StockReconciliationSelectProductEventCopyWithImpl<
          _$StockReconciliationSelectProductEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FacilityModel facilityModel, bool isDistributor)
        selectFacility,
    required TResult Function(String? productVariantId, bool isDistributor)
        selectProduct,
    required TResult Function(bool isDistributor) calculate,
    required TResult Function(StockReconciliationModel stockReconciliationModel)
        create,
  }) {
    return selectProduct(productVariantId, isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult? Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult? Function(bool isDistributor)? calculate,
    TResult? Function(StockReconciliationModel stockReconciliationModel)?
        create,
  }) {
    return selectProduct?.call(productVariantId, isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult Function(bool isDistributor)? calculate,
    TResult Function(StockReconciliationModel stockReconciliationModel)? create,
    required TResult orElse(),
  }) {
    if (selectProduct != null) {
      return selectProduct(productVariantId, isDistributor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockReconciliationSelectFacilityEvent value)
        selectFacility,
    required TResult Function(StockReconciliationSelectProductEvent value)
        selectProduct,
    required TResult Function(StockReconciliationCalculateEvent value)
        calculate,
    required TResult Function(StockReconciliationCreateEvent value) create,
  }) {
    return selectProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult? Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult? Function(StockReconciliationCalculateEvent value)? calculate,
    TResult? Function(StockReconciliationCreateEvent value)? create,
  }) {
    return selectProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult Function(StockReconciliationCalculateEvent value)? calculate,
    TResult Function(StockReconciliationCreateEvent value)? create,
    required TResult orElse(),
  }) {
    if (selectProduct != null) {
      return selectProduct(this);
    }
    return orElse();
  }
}

abstract class StockReconciliationSelectProductEvent
    implements StockReconciliationEvent {
  const factory StockReconciliationSelectProductEvent(
      final String? productVariantId,
      {final bool isDistributor}) = _$StockReconciliationSelectProductEvent;

  String? get productVariantId;
  bool get isDistributor;
  @JsonKey(ignore: true)
  _$$StockReconciliationSelectProductEventCopyWith<
          _$StockReconciliationSelectProductEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockReconciliationCalculateEventCopyWith<$Res> {
  factory _$$StockReconciliationCalculateEventCopyWith(
          _$StockReconciliationCalculateEvent value,
          $Res Function(_$StockReconciliationCalculateEvent) then) =
      __$$StockReconciliationCalculateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDistributor});
}

/// @nodoc
class __$$StockReconciliationCalculateEventCopyWithImpl<$Res>
    extends _$StockReconciliationEventCopyWithImpl<$Res,
        _$StockReconciliationCalculateEvent>
    implements _$$StockReconciliationCalculateEventCopyWith<$Res> {
  __$$StockReconciliationCalculateEventCopyWithImpl(
      _$StockReconciliationCalculateEvent _value,
      $Res Function(_$StockReconciliationCalculateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDistributor = null,
  }) {
    return _then(_$StockReconciliationCalculateEvent(
      isDistributor: null == isDistributor
          ? _value.isDistributor
          : isDistributor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockReconciliationCalculateEvent
    implements StockReconciliationCalculateEvent {
  const _$StockReconciliationCalculateEvent({this.isDistributor = false});

  @override
  @JsonKey()
  final bool isDistributor;

  @override
  String toString() {
    return 'StockReconciliationEvent.calculate(isDistributor: $isDistributor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockReconciliationCalculateEvent &&
            (identical(other.isDistributor, isDistributor) ||
                other.isDistributor == isDistributor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDistributor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockReconciliationCalculateEventCopyWith<
          _$StockReconciliationCalculateEvent>
      get copyWith => __$$StockReconciliationCalculateEventCopyWithImpl<
          _$StockReconciliationCalculateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FacilityModel facilityModel, bool isDistributor)
        selectFacility,
    required TResult Function(String? productVariantId, bool isDistributor)
        selectProduct,
    required TResult Function(bool isDistributor) calculate,
    required TResult Function(StockReconciliationModel stockReconciliationModel)
        create,
  }) {
    return calculate(isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult? Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult? Function(bool isDistributor)? calculate,
    TResult? Function(StockReconciliationModel stockReconciliationModel)?
        create,
  }) {
    return calculate?.call(isDistributor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult Function(bool isDistributor)? calculate,
    TResult Function(StockReconciliationModel stockReconciliationModel)? create,
    required TResult orElse(),
  }) {
    if (calculate != null) {
      return calculate(isDistributor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockReconciliationSelectFacilityEvent value)
        selectFacility,
    required TResult Function(StockReconciliationSelectProductEvent value)
        selectProduct,
    required TResult Function(StockReconciliationCalculateEvent value)
        calculate,
    required TResult Function(StockReconciliationCreateEvent value) create,
  }) {
    return calculate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult? Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult? Function(StockReconciliationCalculateEvent value)? calculate,
    TResult? Function(StockReconciliationCreateEvent value)? create,
  }) {
    return calculate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult Function(StockReconciliationCalculateEvent value)? calculate,
    TResult Function(StockReconciliationCreateEvent value)? create,
    required TResult orElse(),
  }) {
    if (calculate != null) {
      return calculate(this);
    }
    return orElse();
  }
}

abstract class StockReconciliationCalculateEvent
    implements StockReconciliationEvent {
  const factory StockReconciliationCalculateEvent({final bool isDistributor}) =
      _$StockReconciliationCalculateEvent;

  bool get isDistributor;
  @JsonKey(ignore: true)
  _$$StockReconciliationCalculateEventCopyWith<
          _$StockReconciliationCalculateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockReconciliationCreateEventCopyWith<$Res> {
  factory _$$StockReconciliationCreateEventCopyWith(
          _$StockReconciliationCreateEvent value,
          $Res Function(_$StockReconciliationCreateEvent) then) =
      __$$StockReconciliationCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({StockReconciliationModel stockReconciliationModel});
}

/// @nodoc
class __$$StockReconciliationCreateEventCopyWithImpl<$Res>
    extends _$StockReconciliationEventCopyWithImpl<$Res,
        _$StockReconciliationCreateEvent>
    implements _$$StockReconciliationCreateEventCopyWith<$Res> {
  __$$StockReconciliationCreateEventCopyWithImpl(
      _$StockReconciliationCreateEvent _value,
      $Res Function(_$StockReconciliationCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockReconciliationModel = null,
  }) {
    return _then(_$StockReconciliationCreateEvent(
      null == stockReconciliationModel
          ? _value.stockReconciliationModel
          : stockReconciliationModel // ignore: cast_nullable_to_non_nullable
              as StockReconciliationModel,
    ));
  }
}

/// @nodoc

class _$StockReconciliationCreateEvent
    implements StockReconciliationCreateEvent {
  const _$StockReconciliationCreateEvent(this.stockReconciliationModel);

  @override
  final StockReconciliationModel stockReconciliationModel;

  @override
  String toString() {
    return 'StockReconciliationEvent.create(stockReconciliationModel: $stockReconciliationModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockReconciliationCreateEvent &&
            (identical(
                    other.stockReconciliationModel, stockReconciliationModel) ||
                other.stockReconciliationModel == stockReconciliationModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stockReconciliationModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockReconciliationCreateEventCopyWith<_$StockReconciliationCreateEvent>
      get copyWith => __$$StockReconciliationCreateEventCopyWithImpl<
          _$StockReconciliationCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FacilityModel facilityModel, bool isDistributor)
        selectFacility,
    required TResult Function(String? productVariantId, bool isDistributor)
        selectProduct,
    required TResult Function(bool isDistributor) calculate,
    required TResult Function(StockReconciliationModel stockReconciliationModel)
        create,
  }) {
    return create(stockReconciliationModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult? Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult? Function(bool isDistributor)? calculate,
    TResult? Function(StockReconciliationModel stockReconciliationModel)?
        create,
  }) {
    return create?.call(stockReconciliationModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FacilityModel facilityModel, bool isDistributor)?
        selectFacility,
    TResult Function(String? productVariantId, bool isDistributor)?
        selectProduct,
    TResult Function(bool isDistributor)? calculate,
    TResult Function(StockReconciliationModel stockReconciliationModel)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(stockReconciliationModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockReconciliationSelectFacilityEvent value)
        selectFacility,
    required TResult Function(StockReconciliationSelectProductEvent value)
        selectProduct,
    required TResult Function(StockReconciliationCalculateEvent value)
        calculate,
    required TResult Function(StockReconciliationCreateEvent value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult? Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult? Function(StockReconciliationCalculateEvent value)? calculate,
    TResult? Function(StockReconciliationCreateEvent value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockReconciliationSelectFacilityEvent value)?
        selectFacility,
    TResult Function(StockReconciliationSelectProductEvent value)?
        selectProduct,
    TResult Function(StockReconciliationCalculateEvent value)? calculate,
    TResult Function(StockReconciliationCreateEvent value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class StockReconciliationCreateEvent
    implements StockReconciliationEvent {
  const factory StockReconciliationCreateEvent(
          final StockReconciliationModel stockReconciliationModel) =
      _$StockReconciliationCreateEvent;

  StockReconciliationModel get stockReconciliationModel;
  @JsonKey(ignore: true)
  _$$StockReconciliationCreateEventCopyWith<_$StockReconciliationCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockReconciliationState {
  bool get loading => throw _privateConstructorUsedError;
  bool get persisted => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  DateTime get dateOfReconciliation => throw _privateConstructorUsedError;
  FacilityModel? get facilityModel => throw _privateConstructorUsedError;
  String? get productVariantId => throw _privateConstructorUsedError;
  List<StockModel> get stockModels => throw _privateConstructorUsedError;
  StockReconciliationModel? get stockReconciliationModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockReconciliationStateCopyWith<StockReconciliationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockReconciliationStateCopyWith<$Res> {
  factory $StockReconciliationStateCopyWith(StockReconciliationState value,
          $Res Function(StockReconciliationState) then) =
      _$StockReconciliationStateCopyWithImpl<$Res, StockReconciliationState>;
  @useResult
  $Res call(
      {bool loading,
      bool persisted,
      String projectId,
      DateTime dateOfReconciliation,
      FacilityModel? facilityModel,
      String? productVariantId,
      List<StockModel> stockModels,
      StockReconciliationModel? stockReconciliationModel});
}

/// @nodoc
class _$StockReconciliationStateCopyWithImpl<$Res,
        $Val extends StockReconciliationState>
    implements $StockReconciliationStateCopyWith<$Res> {
  _$StockReconciliationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? persisted = null,
    Object? projectId = null,
    Object? dateOfReconciliation = null,
    Object? facilityModel = freezed,
    Object? productVariantId = freezed,
    Object? stockModels = null,
    Object? stockReconciliationModel = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      persisted: null == persisted
          ? _value.persisted
          : persisted // ignore: cast_nullable_to_non_nullable
              as bool,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfReconciliation: null == dateOfReconciliation
          ? _value.dateOfReconciliation
          : dateOfReconciliation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      stockModels: null == stockModels
          ? _value.stockModels
          : stockModels // ignore: cast_nullable_to_non_nullable
              as List<StockModel>,
      stockReconciliationModel: freezed == stockReconciliationModel
          ? _value.stockReconciliationModel
          : stockReconciliationModel // ignore: cast_nullable_to_non_nullable
              as StockReconciliationModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockReconciliationStateCopyWith<$Res>
    implements $StockReconciliationStateCopyWith<$Res> {
  factory _$$_StockReconciliationStateCopyWith(
          _$_StockReconciliationState value,
          $Res Function(_$_StockReconciliationState) then) =
      __$$_StockReconciliationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool persisted,
      String projectId,
      DateTime dateOfReconciliation,
      FacilityModel? facilityModel,
      String? productVariantId,
      List<StockModel> stockModels,
      StockReconciliationModel? stockReconciliationModel});
}

/// @nodoc
class __$$_StockReconciliationStateCopyWithImpl<$Res>
    extends _$StockReconciliationStateCopyWithImpl<$Res,
        _$_StockReconciliationState>
    implements _$$_StockReconciliationStateCopyWith<$Res> {
  __$$_StockReconciliationStateCopyWithImpl(_$_StockReconciliationState _value,
      $Res Function(_$_StockReconciliationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? persisted = null,
    Object? projectId = null,
    Object? dateOfReconciliation = null,
    Object? facilityModel = freezed,
    Object? productVariantId = freezed,
    Object? stockModels = null,
    Object? stockReconciliationModel = freezed,
  }) {
    return _then(_$_StockReconciliationState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      persisted: null == persisted
          ? _value.persisted
          : persisted // ignore: cast_nullable_to_non_nullable
              as bool,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfReconciliation: null == dateOfReconciliation
          ? _value.dateOfReconciliation
          : dateOfReconciliation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      stockModels: null == stockModels
          ? _value._stockModels
          : stockModels // ignore: cast_nullable_to_non_nullable
              as List<StockModel>,
      stockReconciliationModel: freezed == stockReconciliationModel
          ? _value.stockReconciliationModel
          : stockReconciliationModel // ignore: cast_nullable_to_non_nullable
              as StockReconciliationModel?,
    ));
  }
}

/// @nodoc

class _$_StockReconciliationState extends _StockReconciliationState {
  _$_StockReconciliationState(
      {this.loading = false,
      this.persisted = false,
      required this.projectId,
      required this.dateOfReconciliation,
      this.facilityModel,
      this.productVariantId,
      final List<StockModel> stockModels = const [],
      this.stockReconciliationModel})
      : _stockModels = stockModels,
        super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool persisted;
  @override
  final String projectId;
  @override
  final DateTime dateOfReconciliation;
  @override
  final FacilityModel? facilityModel;
  @override
  final String? productVariantId;
  final List<StockModel> _stockModels;
  @override
  @JsonKey()
  List<StockModel> get stockModels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockModels);
  }

  @override
  final StockReconciliationModel? stockReconciliationModel;

  @override
  String toString() {
    return 'StockReconciliationState(loading: $loading, persisted: $persisted, projectId: $projectId, dateOfReconciliation: $dateOfReconciliation, facilityModel: $facilityModel, productVariantId: $productVariantId, stockModels: $stockModels, stockReconciliationModel: $stockReconciliationModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockReconciliationState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.persisted, persisted) ||
                other.persisted == persisted) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.dateOfReconciliation, dateOfReconciliation) ||
                other.dateOfReconciliation == dateOfReconciliation) &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel) &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId) &&
            const DeepCollectionEquality()
                .equals(other._stockModels, _stockModels) &&
            (identical(
                    other.stockReconciliationModel, stockReconciliationModel) ||
                other.stockReconciliationModel == stockReconciliationModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      persisted,
      projectId,
      dateOfReconciliation,
      facilityModel,
      productVariantId,
      const DeepCollectionEquality().hash(_stockModels),
      stockReconciliationModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockReconciliationStateCopyWith<_$_StockReconciliationState>
      get copyWith => __$$_StockReconciliationStateCopyWithImpl<
          _$_StockReconciliationState>(this, _$identity);
}

abstract class _StockReconciliationState extends StockReconciliationState {
  factory _StockReconciliationState(
          {final bool loading,
          final bool persisted,
          required final String projectId,
          required final DateTime dateOfReconciliation,
          final FacilityModel? facilityModel,
          final String? productVariantId,
          final List<StockModel> stockModels,
          final StockReconciliationModel? stockReconciliationModel}) =
      _$_StockReconciliationState;
  _StockReconciliationState._() : super._();

  @override
  bool get loading;
  @override
  bool get persisted;
  @override
  String get projectId;
  @override
  DateTime get dateOfReconciliation;
  @override
  FacilityModel? get facilityModel;
  @override
  String? get productVariantId;
  @override
  List<StockModel> get stockModels;
  @override
  StockReconciliationModel? get stockReconciliationModel;
  @override
  @JsonKey(ignore: true)
  _$$_StockReconciliationStateCopyWith<_$_StockReconciliationState>
      get copyWith => throw _privateConstructorUsedError;
}
