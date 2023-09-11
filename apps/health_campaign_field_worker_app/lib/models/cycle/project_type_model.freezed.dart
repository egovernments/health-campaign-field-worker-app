// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectType _$ProjectTypeFromJson(Map<String, dynamic> json) {
  return _ProjectType.fromJson(json);
}

/// @nodoc
mixin _$ProjectType {
  @JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
  String? get mandatoryWaitSinceLastCycleInDays =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypeCopyWith<ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeCopyWith<$Res> {
  factory $ProjectTypeCopyWith(
          ProjectType value, $Res Function(ProjectType) then) =
      _$ProjectTypeCopyWithImpl<$Res, ProjectType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
          String? mandatoryWaitSinceLastCycleInDays,
      @JsonKey(name: 'deliveries')
          List<DeliveryModel>? deliveries});
}

/// @nodoc
class _$ProjectTypeCopyWithImpl<$Res, $Val extends ProjectType>
    implements $ProjectTypeCopyWith<$Res> {
  _$ProjectTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? deliveries = freezed,
  }) {
    return _then(_value.copyWith(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveries: freezed == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectTypeCopyWith<$Res>
    implements $ProjectTypeCopyWith<$Res> {
  factory _$$_ProjectTypeCopyWith(
          _$_ProjectType value, $Res Function(_$_ProjectType) then) =
      __$$_ProjectTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
          String? mandatoryWaitSinceLastCycleInDays,
      @JsonKey(name: 'deliveries')
          List<DeliveryModel>? deliveries});
}

/// @nodoc
class __$$_ProjectTypeCopyWithImpl<$Res>
    extends _$ProjectTypeCopyWithImpl<$Res, _$_ProjectType>
    implements _$$_ProjectTypeCopyWith<$Res> {
  __$$_ProjectTypeCopyWithImpl(
      _$_ProjectType _value, $Res Function(_$_ProjectType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? deliveries = freezed,
  }) {
    return _then(_$_ProjectType(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveries: freezed == deliveries
          ? _value._deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectType implements _ProjectType {
  const _$_ProjectType(
      {@JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
          this.mandatoryWaitSinceLastCycleInDays,
      @JsonKey(name: 'deliveries')
          final List<DeliveryModel>? deliveries})
      : _deliveries = deliveries;

  factory _$_ProjectType.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectTypeFromJson(json);

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
  final String? mandatoryWaitSinceLastCycleInDays;
  final List<DeliveryModel>? _deliveries;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries {
    final value = _deliveries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectType(mandatoryWaitSinceLastCycleInDays: $mandatoryWaitSinceLastCycleInDays, deliveries: $deliveries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectType &&
            (identical(other.mandatoryWaitSinceLastCycleInDays,
                    mandatoryWaitSinceLastCycleInDays) ||
                other.mandatoryWaitSinceLastCycleInDays ==
                    mandatoryWaitSinceLastCycleInDays) &&
            const DeepCollectionEquality()
                .equals(other._deliveries, _deliveries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryWaitSinceLastCycleInDays,
      const DeepCollectionEquality().hash(_deliveries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectTypeCopyWith<_$_ProjectType> get copyWith =>
      __$$_ProjectTypeCopyWithImpl<_$_ProjectType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectTypeToJson(
      this,
    );
  }
}

abstract class _ProjectType implements ProjectType {
  const factory _ProjectType(
      {@JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
          final String? mandatoryWaitSinceLastCycleInDays,
      @JsonKey(name: 'deliveries')
          final List<DeliveryModel>? deliveries}) = _$_ProjectType;

  factory _ProjectType.fromJson(Map<String, dynamic> json) =
      _$_ProjectType.fromJson;

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
  String? get mandatoryWaitSinceLastCycleInDays;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectTypeCopyWith<_$_ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductVariants')
  Map<String, String>? get productVariants =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res, DeliveryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'ProductVariants')
          Map<String, String>? productVariants,
      @JsonKey(name: 'deliveryStrategy')
          String? deliveryStrategy});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res, $Val extends DeliveryModel>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? productVariants = freezed,
    Object? deliveryStrategy = freezed,
  }) {
    return _then(_value.copyWith(
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value.productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryModelCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$_DeliveryModelCopyWith(
          _$_DeliveryModel value, $Res Function(_$_DeliveryModel) then) =
      __$$_DeliveryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'ProductVariants')
          Map<String, String>? productVariants,
      @JsonKey(name: 'deliveryStrategy')
          String? deliveryStrategy});
}

/// @nodoc
class __$$_DeliveryModelCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res, _$_DeliveryModel>
    implements _$$_DeliveryModelCopyWith<$Res> {
  __$$_DeliveryModelCopyWithImpl(
      _$_DeliveryModel _value, $Res Function(_$_DeliveryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? productVariants = freezed,
    Object? deliveryStrategy = freezed,
  }) {
    return _then(_$_DeliveryModel(
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value._productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryModel implements _DeliveryModel {
  const _$_DeliveryModel(
      {@JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          this.mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'ProductVariants')
          final Map<String, String>? productVariants,
      @JsonKey(name: 'deliveryStrategy')
          this.deliveryStrategy})
      : _productVariants = productVariants;

  factory _$_DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryModelFromJson(json);

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  final String? mandatoryWaitSinceLastDeliveryInDays;
  final Map<String, String>? _productVariants;
  @override
  @JsonKey(name: 'ProductVariants')
  Map<String, String>? get productVariants {
    final value = _productVariants;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'deliveryStrategy')
  final String? deliveryStrategy;

  @override
  String toString() {
    return 'DeliveryModel(mandatoryWaitSinceLastDeliveryInDays: $mandatoryWaitSinceLastDeliveryInDays, productVariants: $productVariants, deliveryStrategy: $deliveryStrategy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryModel &&
            (identical(other.mandatoryWaitSinceLastDeliveryInDays,
                    mandatoryWaitSinceLastDeliveryInDays) ||
                other.mandatoryWaitSinceLastDeliveryInDays ==
                    mandatoryWaitSinceLastDeliveryInDays) &&
            const DeepCollectionEquality()
                .equals(other._productVariants, _productVariants) &&
            (identical(other.deliveryStrategy, deliveryStrategy) ||
                other.deliveryStrategy == deliveryStrategy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryWaitSinceLastDeliveryInDays,
      const DeepCollectionEquality().hash(_productVariants),
      deliveryStrategy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      __$$_DeliveryModelCopyWithImpl<_$_DeliveryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryModelToJson(
      this,
    );
  }
}

abstract class _DeliveryModel implements DeliveryModel {
  const factory _DeliveryModel(
      {@JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          final String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'ProductVariants')
          final Map<String, String>? productVariants,
      @JsonKey(name: 'deliveryStrategy')
          final String? deliveryStrategy}) = _$_DeliveryModel;

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryModel.fromJson;

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays;
  @override
  @JsonKey(name: 'ProductVariants')
  Map<String, String>? get productVariants;
  @override
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
