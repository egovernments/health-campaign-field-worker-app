// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordStockEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime dateOfRecord, FacilityModel facilityModel)
        saveWarehouseDetails,
    required TResult Function(StockModel stockModel) saveStockDetails,
    required TResult Function() createStockEntry,
    required TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)
        saveTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult? Function(StockModel stockModel)? saveStockDetails,
    TResult? Function()? createStockEntry,
    TResult? Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult Function(StockModel stockModel)? saveStockDetails,
    TResult Function()? createStockEntry,
    TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockSaveWarehouseDetailsEvent value)
        saveWarehouseDetails,
    required TResult Function(RecordStockSaveStockDetailsEvent value)
        saveStockDetails,
    required TResult Function(RecordStockCreateStockEntryEvent value)
        createStockEntry,
    required TResult Function(RecordStockSaveTransactionDetailsEvent value)
        saveTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult? Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult? Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult? Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordStockEventCopyWith<$Res> {
  factory $RecordStockEventCopyWith(
          RecordStockEvent value, $Res Function(RecordStockEvent) then) =
      _$RecordStockEventCopyWithImpl<$Res, RecordStockEvent>;
}

/// @nodoc
class _$RecordStockEventCopyWithImpl<$Res, $Val extends RecordStockEvent>
    implements $RecordStockEventCopyWith<$Res> {
  _$RecordStockEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecordStockSaveWarehouseDetailsEventCopyWith<$Res> {
  factory _$$RecordStockSaveWarehouseDetailsEventCopyWith(
          _$RecordStockSaveWarehouseDetailsEvent value,
          $Res Function(_$RecordStockSaveWarehouseDetailsEvent) then) =
      __$$RecordStockSaveWarehouseDetailsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateOfRecord, FacilityModel facilityModel});
}

/// @nodoc
class __$$RecordStockSaveWarehouseDetailsEventCopyWithImpl<$Res>
    extends _$RecordStockEventCopyWithImpl<$Res,
        _$RecordStockSaveWarehouseDetailsEvent>
    implements _$$RecordStockSaveWarehouseDetailsEventCopyWith<$Res> {
  __$$RecordStockSaveWarehouseDetailsEventCopyWithImpl(
      _$RecordStockSaveWarehouseDetailsEvent _value,
      $Res Function(_$RecordStockSaveWarehouseDetailsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfRecord = null,
    Object? facilityModel = null,
  }) {
    return _then(_$RecordStockSaveWarehouseDetailsEvent(
      dateOfRecord: null == dateOfRecord
          ? _value.dateOfRecord
          : dateOfRecord // ignore: cast_nullable_to_non_nullable
              as DateTime,
      facilityModel: null == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel,
    ));
  }
}

/// @nodoc

class _$RecordStockSaveWarehouseDetailsEvent
    implements RecordStockSaveWarehouseDetailsEvent {
  const _$RecordStockSaveWarehouseDetailsEvent(
      {required this.dateOfRecord, required this.facilityModel});

  @override
  final DateTime dateOfRecord;
  @override
  final FacilityModel facilityModel;

  @override
  String toString() {
    return 'RecordStockEvent.saveWarehouseDetails(dateOfRecord: $dateOfRecord, facilityModel: $facilityModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockSaveWarehouseDetailsEvent &&
            (identical(other.dateOfRecord, dateOfRecord) ||
                other.dateOfRecord == dateOfRecord) &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateOfRecord, facilityModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordStockSaveWarehouseDetailsEventCopyWith<
          _$RecordStockSaveWarehouseDetailsEvent>
      get copyWith => __$$RecordStockSaveWarehouseDetailsEventCopyWithImpl<
          _$RecordStockSaveWarehouseDetailsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime dateOfRecord, FacilityModel facilityModel)
        saveWarehouseDetails,
    required TResult Function(StockModel stockModel) saveStockDetails,
    required TResult Function() createStockEntry,
    required TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)
        saveTransactionDetails,
  }) {
    return saveWarehouseDetails(dateOfRecord, facilityModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult? Function(StockModel stockModel)? saveStockDetails,
    TResult? Function()? createStockEntry,
    TResult? Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
  }) {
    return saveWarehouseDetails?.call(dateOfRecord, facilityModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult Function(StockModel stockModel)? saveStockDetails,
    TResult Function()? createStockEntry,
    TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveWarehouseDetails != null) {
      return saveWarehouseDetails(dateOfRecord, facilityModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockSaveWarehouseDetailsEvent value)
        saveWarehouseDetails,
    required TResult Function(RecordStockSaveStockDetailsEvent value)
        saveStockDetails,
    required TResult Function(RecordStockCreateStockEntryEvent value)
        createStockEntry,
    required TResult Function(RecordStockSaveTransactionDetailsEvent value)
        saveTransactionDetails,
  }) {
    return saveWarehouseDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult? Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult? Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult? Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
  }) {
    return saveWarehouseDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveWarehouseDetails != null) {
      return saveWarehouseDetails(this);
    }
    return orElse();
  }
}

abstract class RecordStockSaveWarehouseDetailsEvent
    implements RecordStockEvent {
  const factory RecordStockSaveWarehouseDetailsEvent(
          {required final DateTime dateOfRecord,
          required final FacilityModel facilityModel}) =
      _$RecordStockSaveWarehouseDetailsEvent;

  DateTime get dateOfRecord;
  FacilityModel get facilityModel;
  @JsonKey(ignore: true)
  _$$RecordStockSaveWarehouseDetailsEventCopyWith<
          _$RecordStockSaveWarehouseDetailsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordStockSaveStockDetailsEventCopyWith<$Res> {
  factory _$$RecordStockSaveStockDetailsEventCopyWith(
          _$RecordStockSaveStockDetailsEvent value,
          $Res Function(_$RecordStockSaveStockDetailsEvent) then) =
      __$$RecordStockSaveStockDetailsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({StockModel stockModel});
}

/// @nodoc
class __$$RecordStockSaveStockDetailsEventCopyWithImpl<$Res>
    extends _$RecordStockEventCopyWithImpl<$Res,
        _$RecordStockSaveStockDetailsEvent>
    implements _$$RecordStockSaveStockDetailsEventCopyWith<$Res> {
  __$$RecordStockSaveStockDetailsEventCopyWithImpl(
      _$RecordStockSaveStockDetailsEvent _value,
      $Res Function(_$RecordStockSaveStockDetailsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockModel = null,
  }) {
    return _then(_$RecordStockSaveStockDetailsEvent(
      stockModel: null == stockModel
          ? _value.stockModel
          : stockModel // ignore: cast_nullable_to_non_nullable
              as StockModel,
    ));
  }
}

/// @nodoc

class _$RecordStockSaveStockDetailsEvent
    implements RecordStockSaveStockDetailsEvent {
  const _$RecordStockSaveStockDetailsEvent({required this.stockModel});

  @override
  final StockModel stockModel;

  @override
  String toString() {
    return 'RecordStockEvent.saveStockDetails(stockModel: $stockModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockSaveStockDetailsEvent &&
            (identical(other.stockModel, stockModel) ||
                other.stockModel == stockModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stockModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordStockSaveStockDetailsEventCopyWith<
          _$RecordStockSaveStockDetailsEvent>
      get copyWith => __$$RecordStockSaveStockDetailsEventCopyWithImpl<
          _$RecordStockSaveStockDetailsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime dateOfRecord, FacilityModel facilityModel)
        saveWarehouseDetails,
    required TResult Function(StockModel stockModel) saveStockDetails,
    required TResult Function() createStockEntry,
    required TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)
        saveTransactionDetails,
  }) {
    return saveStockDetails(stockModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult? Function(StockModel stockModel)? saveStockDetails,
    TResult? Function()? createStockEntry,
    TResult? Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
  }) {
    return saveStockDetails?.call(stockModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult Function(StockModel stockModel)? saveStockDetails,
    TResult Function()? createStockEntry,
    TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveStockDetails != null) {
      return saveStockDetails(stockModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockSaveWarehouseDetailsEvent value)
        saveWarehouseDetails,
    required TResult Function(RecordStockSaveStockDetailsEvent value)
        saveStockDetails,
    required TResult Function(RecordStockCreateStockEntryEvent value)
        createStockEntry,
    required TResult Function(RecordStockSaveTransactionDetailsEvent value)
        saveTransactionDetails,
  }) {
    return saveStockDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult? Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult? Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult? Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
  }) {
    return saveStockDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveStockDetails != null) {
      return saveStockDetails(this);
    }
    return orElse();
  }
}

abstract class RecordStockSaveStockDetailsEvent implements RecordStockEvent {
  const factory RecordStockSaveStockDetailsEvent(
          {required final StockModel stockModel}) =
      _$RecordStockSaveStockDetailsEvent;

  StockModel get stockModel;
  @JsonKey(ignore: true)
  _$$RecordStockSaveStockDetailsEventCopyWith<
          _$RecordStockSaveStockDetailsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordStockCreateStockEntryEventCopyWith<$Res> {
  factory _$$RecordStockCreateStockEntryEventCopyWith(
          _$RecordStockCreateStockEntryEvent value,
          $Res Function(_$RecordStockCreateStockEntryEvent) then) =
      __$$RecordStockCreateStockEntryEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordStockCreateStockEntryEventCopyWithImpl<$Res>
    extends _$RecordStockEventCopyWithImpl<$Res,
        _$RecordStockCreateStockEntryEvent>
    implements _$$RecordStockCreateStockEntryEventCopyWith<$Res> {
  __$$RecordStockCreateStockEntryEventCopyWithImpl(
      _$RecordStockCreateStockEntryEvent _value,
      $Res Function(_$RecordStockCreateStockEntryEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RecordStockCreateStockEntryEvent
    implements RecordStockCreateStockEntryEvent {
  const _$RecordStockCreateStockEntryEvent();

  @override
  String toString() {
    return 'RecordStockEvent.createStockEntry()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockCreateStockEntryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime dateOfRecord, FacilityModel facilityModel)
        saveWarehouseDetails,
    required TResult Function(StockModel stockModel) saveStockDetails,
    required TResult Function() createStockEntry,
    required TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)
        saveTransactionDetails,
  }) {
    return createStockEntry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult? Function(StockModel stockModel)? saveStockDetails,
    TResult? Function()? createStockEntry,
    TResult? Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
  }) {
    return createStockEntry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult Function(StockModel stockModel)? saveStockDetails,
    TResult Function()? createStockEntry,
    TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (createStockEntry != null) {
      return createStockEntry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockSaveWarehouseDetailsEvent value)
        saveWarehouseDetails,
    required TResult Function(RecordStockSaveStockDetailsEvent value)
        saveStockDetails,
    required TResult Function(RecordStockCreateStockEntryEvent value)
        createStockEntry,
    required TResult Function(RecordStockSaveTransactionDetailsEvent value)
        saveTransactionDetails,
  }) {
    return createStockEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult? Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult? Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult? Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
  }) {
    return createStockEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (createStockEntry != null) {
      return createStockEntry(this);
    }
    return orElse();
  }
}

abstract class RecordStockCreateStockEntryEvent implements RecordStockEvent {
  const factory RecordStockCreateStockEntryEvent() =
      _$RecordStockCreateStockEntryEvent;
}

/// @nodoc
abstract class _$$RecordStockSaveTransactionDetailsEventCopyWith<$Res> {
  factory _$$RecordStockSaveTransactionDetailsEventCopyWith(
          _$RecordStockSaveTransactionDetailsEvent value,
          $Res Function(_$RecordStockSaveTransactionDetailsEvent) then) =
      __$$RecordStockSaveTransactionDetailsEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime dateOfRecord,
      String primaryType,
      String primaryId,
      FacilityModel? facilityModel});
}

/// @nodoc
class __$$RecordStockSaveTransactionDetailsEventCopyWithImpl<$Res>
    extends _$RecordStockEventCopyWithImpl<$Res,
        _$RecordStockSaveTransactionDetailsEvent>
    implements _$$RecordStockSaveTransactionDetailsEventCopyWith<$Res> {
  __$$RecordStockSaveTransactionDetailsEventCopyWithImpl(
      _$RecordStockSaveTransactionDetailsEvent _value,
      $Res Function(_$RecordStockSaveTransactionDetailsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfRecord = null,
    Object? primaryType = null,
    Object? primaryId = null,
    Object? facilityModel = freezed,
  }) {
    return _then(_$RecordStockSaveTransactionDetailsEvent(
      dateOfRecord: null == dateOfRecord
          ? _value.dateOfRecord
          : dateOfRecord // ignore: cast_nullable_to_non_nullable
              as DateTime,
      primaryType: null == primaryType
          ? _value.primaryType
          : primaryType // ignore: cast_nullable_to_non_nullable
              as String,
      primaryId: null == primaryId
          ? _value.primaryId
          : primaryId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
    ));
  }
}

/// @nodoc

class _$RecordStockSaveTransactionDetailsEvent
    implements RecordStockSaveTransactionDetailsEvent {
  const _$RecordStockSaveTransactionDetailsEvent(
      {required this.dateOfRecord,
      required this.primaryType,
      required this.primaryId,
      this.facilityModel});

  @override
  final DateTime dateOfRecord;
  @override
  final String primaryType;
  @override
  final String primaryId;
  @override
  final FacilityModel? facilityModel;

  @override
  String toString() {
    return 'RecordStockEvent.saveTransactionDetails(dateOfRecord: $dateOfRecord, primaryType: $primaryType, primaryId: $primaryId, facilityModel: $facilityModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockSaveTransactionDetailsEvent &&
            (identical(other.dateOfRecord, dateOfRecord) ||
                other.dateOfRecord == dateOfRecord) &&
            (identical(other.primaryType, primaryType) ||
                other.primaryType == primaryType) &&
            (identical(other.primaryId, primaryId) ||
                other.primaryId == primaryId) &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dateOfRecord, primaryType, primaryId, facilityModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordStockSaveTransactionDetailsEventCopyWith<
          _$RecordStockSaveTransactionDetailsEvent>
      get copyWith => __$$RecordStockSaveTransactionDetailsEventCopyWithImpl<
          _$RecordStockSaveTransactionDetailsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime dateOfRecord, FacilityModel facilityModel)
        saveWarehouseDetails,
    required TResult Function(StockModel stockModel) saveStockDetails,
    required TResult Function() createStockEntry,
    required TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)
        saveTransactionDetails,
  }) {
    return saveTransactionDetails(
        dateOfRecord, primaryType, primaryId, facilityModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult? Function(StockModel stockModel)? saveStockDetails,
    TResult? Function()? createStockEntry,
    TResult? Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
  }) {
    return saveTransactionDetails?.call(
        dateOfRecord, primaryType, primaryId, facilityModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfRecord, FacilityModel facilityModel)?
        saveWarehouseDetails,
    TResult Function(StockModel stockModel)? saveStockDetails,
    TResult Function()? createStockEntry,
    TResult Function(DateTime dateOfRecord, String primaryType,
            String primaryId, FacilityModel? facilityModel)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveTransactionDetails != null) {
      return saveTransactionDetails(
          dateOfRecord, primaryType, primaryId, facilityModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockSaveWarehouseDetailsEvent value)
        saveWarehouseDetails,
    required TResult Function(RecordStockSaveStockDetailsEvent value)
        saveStockDetails,
    required TResult Function(RecordStockCreateStockEntryEvent value)
        createStockEntry,
    required TResult Function(RecordStockSaveTransactionDetailsEvent value)
        saveTransactionDetails,
  }) {
    return saveTransactionDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult? Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult? Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult? Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
  }) {
    return saveTransactionDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockSaveWarehouseDetailsEvent value)?
        saveWarehouseDetails,
    TResult Function(RecordStockSaveStockDetailsEvent value)? saveStockDetails,
    TResult Function(RecordStockCreateStockEntryEvent value)? createStockEntry,
    TResult Function(RecordStockSaveTransactionDetailsEvent value)?
        saveTransactionDetails,
    required TResult orElse(),
  }) {
    if (saveTransactionDetails != null) {
      return saveTransactionDetails(this);
    }
    return orElse();
  }
}

abstract class RecordStockSaveTransactionDetailsEvent
    implements RecordStockEvent {
  const factory RecordStockSaveTransactionDetailsEvent(
          {required final DateTime dateOfRecord,
          required final String primaryType,
          required final String primaryId,
          final FacilityModel? facilityModel}) =
      _$RecordStockSaveTransactionDetailsEvent;

  DateTime get dateOfRecord;
  String get primaryType;
  String get primaryId;
  FacilityModel? get facilityModel;
  @JsonKey(ignore: true)
  _$$RecordStockSaveTransactionDetailsEventCopyWith<
          _$RecordStockSaveTransactionDetailsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordStockState {
  StockRecordEntryType get entryType => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  DateTime? get dateOfRecord => throw _privateConstructorUsedError;
  String? get primaryType => throw _privateConstructorUsedError;
  String? get primaryId => throw _privateConstructorUsedError;
  FacilityModel? get facilityModel => throw _privateConstructorUsedError;
  StockModel? get stockModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)
        create,
    required TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)
        persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult? Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockCreateState value) create,
    required TResult Function(RecordStockPersistedState value) persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockCreateState value)? create,
    TResult? Function(RecordStockPersistedState value)? persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockCreateState value)? create,
    TResult Function(RecordStockPersistedState value)? persisted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordStockStateCopyWith<RecordStockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordStockStateCopyWith<$Res> {
  factory $RecordStockStateCopyWith(
          RecordStockState value, $Res Function(RecordStockState) then) =
      _$RecordStockStateCopyWithImpl<$Res, RecordStockState>;
  @useResult
  $Res call(
      {StockRecordEntryType entryType,
      String projectId,
      DateTime? dateOfRecord,
      String? primaryType,
      String? primaryId,
      FacilityModel? facilityModel,
      StockModel? stockModel});
}

/// @nodoc
class _$RecordStockStateCopyWithImpl<$Res, $Val extends RecordStockState>
    implements $RecordStockStateCopyWith<$Res> {
  _$RecordStockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = null,
    Object? projectId = null,
    Object? dateOfRecord = freezed,
    Object? primaryType = freezed,
    Object? primaryId = freezed,
    Object? facilityModel = freezed,
    Object? stockModel = freezed,
  }) {
    return _then(_value.copyWith(
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as StockRecordEntryType,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfRecord: freezed == dateOfRecord
          ? _value.dateOfRecord
          : dateOfRecord // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      primaryType: freezed == primaryType
          ? _value.primaryType
          : primaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryId: freezed == primaryId
          ? _value.primaryId
          : primaryId // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
      stockModel: freezed == stockModel
          ? _value.stockModel
          : stockModel // ignore: cast_nullable_to_non_nullable
              as StockModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordStockCreateStateCopyWith<$Res>
    implements $RecordStockStateCopyWith<$Res> {
  factory _$$RecordStockCreateStateCopyWith(_$RecordStockCreateState value,
          $Res Function(_$RecordStockCreateState) then) =
      __$$RecordStockCreateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StockRecordEntryType entryType,
      bool loading,
      String projectId,
      DateTime? dateOfRecord,
      String? primaryType,
      String? primaryId,
      FacilityModel? facilityModel,
      StockModel? stockModel});
}

/// @nodoc
class __$$RecordStockCreateStateCopyWithImpl<$Res>
    extends _$RecordStockStateCopyWithImpl<$Res, _$RecordStockCreateState>
    implements _$$RecordStockCreateStateCopyWith<$Res> {
  __$$RecordStockCreateStateCopyWithImpl(_$RecordStockCreateState _value,
      $Res Function(_$RecordStockCreateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = null,
    Object? loading = null,
    Object? projectId = null,
    Object? dateOfRecord = freezed,
    Object? primaryType = freezed,
    Object? primaryId = freezed,
    Object? facilityModel = freezed,
    Object? stockModel = freezed,
  }) {
    return _then(_$RecordStockCreateState(
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as StockRecordEntryType,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfRecord: freezed == dateOfRecord
          ? _value.dateOfRecord
          : dateOfRecord // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      primaryType: freezed == primaryType
          ? _value.primaryType
          : primaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryId: freezed == primaryId
          ? _value.primaryId
          : primaryId // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
      stockModel: freezed == stockModel
          ? _value.stockModel
          : stockModel // ignore: cast_nullable_to_non_nullable
              as StockModel?,
    ));
  }
}

/// @nodoc

class _$RecordStockCreateState implements RecordStockCreateState {
  const _$RecordStockCreateState(
      {required this.entryType,
      this.loading = false,
      required this.projectId,
      this.dateOfRecord,
      this.primaryType,
      this.primaryId,
      this.facilityModel,
      this.stockModel});

  @override
  final StockRecordEntryType entryType;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String projectId;
  @override
  final DateTime? dateOfRecord;
  @override
  final String? primaryType;
  @override
  final String? primaryId;
  @override
  final FacilityModel? facilityModel;
  @override
  final StockModel? stockModel;

  @override
  String toString() {
    return 'RecordStockState.create(entryType: $entryType, loading: $loading, projectId: $projectId, dateOfRecord: $dateOfRecord, primaryType: $primaryType, primaryId: $primaryId, facilityModel: $facilityModel, stockModel: $stockModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockCreateState &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.dateOfRecord, dateOfRecord) ||
                other.dateOfRecord == dateOfRecord) &&
            (identical(other.primaryType, primaryType) ||
                other.primaryType == primaryType) &&
            (identical(other.primaryId, primaryId) ||
                other.primaryId == primaryId) &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel) &&
            (identical(other.stockModel, stockModel) ||
                other.stockModel == stockModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entryType, loading, projectId,
      dateOfRecord, primaryType, primaryId, facilityModel, stockModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordStockCreateStateCopyWith<_$RecordStockCreateState> get copyWith =>
      __$$RecordStockCreateStateCopyWithImpl<_$RecordStockCreateState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)
        create,
    required TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)
        persisted,
  }) {
    return create(entryType, loading, projectId, dateOfRecord, primaryType,
        primaryId, facilityModel, stockModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult? Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
  }) {
    return create?.call(entryType, loading, projectId, dateOfRecord,
        primaryType, primaryId, facilityModel, stockModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(entryType, loading, projectId, dateOfRecord, primaryType,
          primaryId, facilityModel, stockModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockCreateState value) create,
    required TResult Function(RecordStockPersistedState value) persisted,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockCreateState value)? create,
    TResult? Function(RecordStockPersistedState value)? persisted,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockCreateState value)? create,
    TResult Function(RecordStockPersistedState value)? persisted,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class RecordStockCreateState implements RecordStockState {
  const factory RecordStockCreateState(
      {required final StockRecordEntryType entryType,
      final bool loading,
      required final String projectId,
      final DateTime? dateOfRecord,
      final String? primaryType,
      final String? primaryId,
      final FacilityModel? facilityModel,
      final StockModel? stockModel}) = _$RecordStockCreateState;

  @override
  StockRecordEntryType get entryType;
  bool get loading;
  @override
  String get projectId;
  @override
  DateTime? get dateOfRecord;
  @override
  String? get primaryType;
  @override
  String? get primaryId;
  @override
  FacilityModel? get facilityModel;
  @override
  StockModel? get stockModel;
  @override
  @JsonKey(ignore: true)
  _$$RecordStockCreateStateCopyWith<_$RecordStockCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordStockPersistedStateCopyWith<$Res>
    implements $RecordStockStateCopyWith<$Res> {
  factory _$$RecordStockPersistedStateCopyWith(
          _$RecordStockPersistedState value,
          $Res Function(_$RecordStockPersistedState) then) =
      __$$RecordStockPersistedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StockRecordEntryType entryType,
      String projectId,
      DateTime? dateOfRecord,
      FacilityModel? facilityModel,
      String? primaryType,
      String? primaryId,
      StockModel? stockModel});
}

/// @nodoc
class __$$RecordStockPersistedStateCopyWithImpl<$Res>
    extends _$RecordStockStateCopyWithImpl<$Res, _$RecordStockPersistedState>
    implements _$$RecordStockPersistedStateCopyWith<$Res> {
  __$$RecordStockPersistedStateCopyWithImpl(_$RecordStockPersistedState _value,
      $Res Function(_$RecordStockPersistedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = null,
    Object? projectId = null,
    Object? dateOfRecord = freezed,
    Object? facilityModel = freezed,
    Object? primaryType = freezed,
    Object? primaryId = freezed,
    Object? stockModel = freezed,
  }) {
    return _then(_$RecordStockPersistedState(
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as StockRecordEntryType,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfRecord: freezed == dateOfRecord
          ? _value.dateOfRecord
          : dateOfRecord // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      facilityModel: freezed == facilityModel
          ? _value.facilityModel
          : facilityModel // ignore: cast_nullable_to_non_nullable
              as FacilityModel?,
      primaryType: freezed == primaryType
          ? _value.primaryType
          : primaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryId: freezed == primaryId
          ? _value.primaryId
          : primaryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stockModel: freezed == stockModel
          ? _value.stockModel
          : stockModel // ignore: cast_nullable_to_non_nullable
              as StockModel?,
    ));
  }
}

/// @nodoc

class _$RecordStockPersistedState implements RecordStockPersistedState {
  const _$RecordStockPersistedState(
      {required this.entryType,
      required this.projectId,
      this.dateOfRecord,
      this.facilityModel,
      this.primaryType,
      this.primaryId,
      this.stockModel});

  @override
  final StockRecordEntryType entryType;
  @override
  final String projectId;
  @override
  final DateTime? dateOfRecord;
  @override
  final FacilityModel? facilityModel;
  @override
  final String? primaryType;
  @override
  final String? primaryId;
  @override
  final StockModel? stockModel;

  @override
  String toString() {
    return 'RecordStockState.persisted(entryType: $entryType, projectId: $projectId, dateOfRecord: $dateOfRecord, facilityModel: $facilityModel, primaryType: $primaryType, primaryId: $primaryId, stockModel: $stockModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordStockPersistedState &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.dateOfRecord, dateOfRecord) ||
                other.dateOfRecord == dateOfRecord) &&
            (identical(other.facilityModel, facilityModel) ||
                other.facilityModel == facilityModel) &&
            (identical(other.primaryType, primaryType) ||
                other.primaryType == primaryType) &&
            (identical(other.primaryId, primaryId) ||
                other.primaryId == primaryId) &&
            (identical(other.stockModel, stockModel) ||
                other.stockModel == stockModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entryType, projectId,
      dateOfRecord, facilityModel, primaryType, primaryId, stockModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordStockPersistedStateCopyWith<_$RecordStockPersistedState>
      get copyWith => __$$RecordStockPersistedStateCopyWithImpl<
          _$RecordStockPersistedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)
        create,
    required TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)
        persisted,
  }) {
    return persisted(entryType, projectId, dateOfRecord, facilityModel,
        primaryType, primaryId, stockModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult? Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
  }) {
    return persisted?.call(entryType, projectId, dateOfRecord, facilityModel,
        primaryType, primaryId, stockModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StockRecordEntryType entryType,
            bool loading,
            String projectId,
            DateTime? dateOfRecord,
            String? primaryType,
            String? primaryId,
            FacilityModel? facilityModel,
            StockModel? stockModel)?
        create,
    TResult Function(
            StockRecordEntryType entryType,
            String projectId,
            DateTime? dateOfRecord,
            FacilityModel? facilityModel,
            String? primaryType,
            String? primaryId,
            StockModel? stockModel)?
        persisted,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(entryType, projectId, dateOfRecord, facilityModel,
          primaryType, primaryId, stockModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordStockCreateState value) create,
    required TResult Function(RecordStockPersistedState value) persisted,
  }) {
    return persisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordStockCreateState value)? create,
    TResult? Function(RecordStockPersistedState value)? persisted,
  }) {
    return persisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordStockCreateState value)? create,
    TResult Function(RecordStockPersistedState value)? persisted,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(this);
    }
    return orElse();
  }
}

abstract class RecordStockPersistedState implements RecordStockState {
  const factory RecordStockPersistedState(
      {required final StockRecordEntryType entryType,
      required final String projectId,
      final DateTime? dateOfRecord,
      final FacilityModel? facilityModel,
      final String? primaryType,
      final String? primaryId,
      final StockModel? stockModel}) = _$RecordStockPersistedState;

  @override
  StockRecordEntryType get entryType;
  @override
  String get projectId;
  @override
  DateTime? get dateOfRecord;
  @override
  FacilityModel? get facilityModel;
  @override
  String? get primaryType;
  @override
  String? get primaryId;
  @override
  StockModel? get stockModel;
  @override
  @JsonKey(ignore: true)
  _$$RecordStockPersistedStateCopyWith<_$RecordStockPersistedState>
      get copyWith => throw _privateConstructorUsedError;
}
