// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  String? get additionalFields => throw _privateConstructorUsedError;
  String get campaignId => throw _privateConstructorUsedError;
  String get clientReferenceId => throw _privateConstructorUsedError;

  /// [deliveryDate] in millisecondsSinceEpoch
  int get deliveryDate => throw _privateConstructorUsedError;
  String get deliveredBy => throw _privateConstructorUsedError;
  ApiMode get apiMode => throw _privateConstructorUsedError;
  String get registrationId => throw _privateConstructorUsedError;
  List<DeliveryResourceModel> get resources =>
      throw _privateConstructorUsedError;
  DeliveryStatus get status => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  SyncObjectModelType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res>;
  $Res call(
      {String? additionalFields,
      String campaignId,
      String clientReferenceId,
      int deliveryDate,
      String deliveredBy,
      ApiMode apiMode,
      String registrationId,
      List<DeliveryResourceModel> resources,
      DeliveryStatus status,
      String tenantId,
      SyncObjectModelType type});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  final DeliveryModel _value;
  // ignore: unused_field
  final $Res Function(DeliveryModel) _then;

  @override
  $Res call({
    Object? additionalFields = freezed,
    Object? campaignId = freezed,
    Object? clientReferenceId = freezed,
    Object? deliveryDate = freezed,
    Object? deliveredBy = freezed,
    Object? apiMode = freezed,
    Object? registrationId = freezed,
    Object? resources = freezed,
    Object? status = freezed,
    Object? tenantId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: deliveryDate == freezed
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredBy: deliveredBy == freezed
          ? _value.deliveredBy
          : deliveredBy // ignore: cast_nullable_to_non_nullable
              as String,
      apiMode: apiMode == freezed
          ? _value.apiMode
          : apiMode // ignore: cast_nullable_to_non_nullable
              as ApiMode,
      registrationId: registrationId == freezed
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<DeliveryResourceModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
    ));
  }
}

/// @nodoc
abstract class _$$_DeliveryModelCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$_DeliveryModelCopyWith(
          _$_DeliveryModel value, $Res Function(_$_DeliveryModel) then) =
      __$$_DeliveryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? additionalFields,
      String campaignId,
      String clientReferenceId,
      int deliveryDate,
      String deliveredBy,
      ApiMode apiMode,
      String registrationId,
      List<DeliveryResourceModel> resources,
      DeliveryStatus status,
      String tenantId,
      SyncObjectModelType type});
}

/// @nodoc
class __$$_DeliveryModelCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res>
    implements _$$_DeliveryModelCopyWith<$Res> {
  __$$_DeliveryModelCopyWithImpl(
      _$_DeliveryModel _value, $Res Function(_$_DeliveryModel) _then)
      : super(_value, (v) => _then(v as _$_DeliveryModel));

  @override
  _$_DeliveryModel get _value => super._value as _$_DeliveryModel;

  @override
  $Res call({
    Object? additionalFields = freezed,
    Object? campaignId = freezed,
    Object? clientReferenceId = freezed,
    Object? deliveryDate = freezed,
    Object? deliveredBy = freezed,
    Object? apiMode = freezed,
    Object? registrationId = freezed,
    Object? resources = freezed,
    Object? status = freezed,
    Object? tenantId = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_DeliveryModel(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: deliveryDate == freezed
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredBy: deliveredBy == freezed
          ? _value.deliveredBy
          : deliveredBy // ignore: cast_nullable_to_non_nullable
              as String,
      apiMode: apiMode == freezed
          ? _value.apiMode
          : apiMode // ignore: cast_nullable_to_non_nullable
              as ApiMode,
      registrationId: registrationId == freezed
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String,
      resources: resources == freezed
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<DeliveryResourceModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DeliveryModel implements _DeliveryModel {
  const _$_DeliveryModel(
      {this.additionalFields,
      required this.campaignId,
      required this.clientReferenceId,
      required this.deliveryDate,
      required this.deliveredBy,
      required this.apiMode,
      required this.registrationId,
      required final List<DeliveryResourceModel> resources,
      required this.status,
      required this.tenantId,
      required this.type})
      : _resources = resources;

  factory _$_DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryModelFromJson(json);

  @override
  final String? additionalFields;
  @override
  final String campaignId;
  @override
  final String clientReferenceId;

  /// [deliveryDate] in millisecondsSinceEpoch
  @override
  final int deliveryDate;
  @override
  final String deliveredBy;
  @override
  final ApiMode apiMode;
  @override
  final String registrationId;
  final List<DeliveryResourceModel> _resources;
  @override
  List<DeliveryResourceModel> get resources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  @override
  final DeliveryStatus status;
  @override
  final String tenantId;
  @override
  final SyncObjectModelType type;

  @override
  String toString() {
    return 'DeliveryModel(additionalFields: $additionalFields, campaignId: $campaignId, clientReferenceId: $clientReferenceId, deliveryDate: $deliveryDate, deliveredBy: $deliveredBy, apiMode: $apiMode, registrationId: $registrationId, resources: $resources, status: $status, tenantId: $tenantId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryModel &&
            const DeepCollectionEquality()
                .equals(other.additionalFields, additionalFields) &&
            const DeepCollectionEquality()
                .equals(other.campaignId, campaignId) &&
            const DeepCollectionEquality()
                .equals(other.clientReferenceId, clientReferenceId) &&
            const DeepCollectionEquality()
                .equals(other.deliveryDate, deliveryDate) &&
            const DeepCollectionEquality()
                .equals(other.deliveredBy, deliveredBy) &&
            const DeepCollectionEquality().equals(other.apiMode, apiMode) &&
            const DeepCollectionEquality()
                .equals(other.registrationId, registrationId) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.tenantId, tenantId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(additionalFields),
      const DeepCollectionEquality().hash(campaignId),
      const DeepCollectionEquality().hash(clientReferenceId),
      const DeepCollectionEquality().hash(deliveryDate),
      const DeepCollectionEquality().hash(deliveredBy),
      const DeepCollectionEquality().hash(apiMode),
      const DeepCollectionEquality().hash(registrationId),
      const DeepCollectionEquality().hash(_resources),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(tenantId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
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
      {final String? additionalFields,
      required final String campaignId,
      required final String clientReferenceId,
      required final int deliveryDate,
      required final String deliveredBy,
      required final ApiMode apiMode,
      required final String registrationId,
      required final List<DeliveryResourceModel> resources,
      required final DeliveryStatus status,
      required final String tenantId,
      required final SyncObjectModelType type}) = _$_DeliveryModel;

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryModel.fromJson;

  @override
  String? get additionalFields;
  @override
  String get campaignId;
  @override
  String get clientReferenceId;
  @override

  /// [deliveryDate] in millisecondsSinceEpoch
  int get deliveryDate;
  @override
  String get deliveredBy;
  @override
  ApiMode get apiMode;
  @override
  String get registrationId;
  @override
  List<DeliveryResourceModel> get resources;
  @override
  DeliveryStatus get status;
  @override
  String get tenantId;
  @override
  SyncObjectModelType get type;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryResourceModel _$DeliveryResourceModelFromJson(
    Map<String, dynamic> json) {
  return _DeliveryResourceModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryResourceModel {
  String get resourceId => throw _privateConstructorUsedError;
  int get quantityToBeDelivered => throw _privateConstructorUsedError;
  int get quantityDelivered => throw _privateConstructorUsedError;
  String? get reasonIfNotDelivered => throw _privateConstructorUsedError;
  bool get isDelivered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryResourceModelCopyWith<DeliveryResourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryResourceModelCopyWith<$Res> {
  factory $DeliveryResourceModelCopyWith(DeliveryResourceModel value,
          $Res Function(DeliveryResourceModel) then) =
      _$DeliveryResourceModelCopyWithImpl<$Res>;
  $Res call(
      {String resourceId,
      int quantityToBeDelivered,
      int quantityDelivered,
      String? reasonIfNotDelivered,
      bool isDelivered});
}

/// @nodoc
class _$DeliveryResourceModelCopyWithImpl<$Res>
    implements $DeliveryResourceModelCopyWith<$Res> {
  _$DeliveryResourceModelCopyWithImpl(this._value, this._then);

  final DeliveryResourceModel _value;
  // ignore: unused_field
  final $Res Function(DeliveryResourceModel) _then;

  @override
  $Res call({
    Object? resourceId = freezed,
    Object? quantityToBeDelivered = freezed,
    Object? quantityDelivered = freezed,
    Object? reasonIfNotDelivered = freezed,
    Object? isDelivered = freezed,
  }) {
    return _then(_value.copyWith(
      resourceId: resourceId == freezed
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityToBeDelivered: quantityToBeDelivered == freezed
          ? _value.quantityToBeDelivered
          : quantityToBeDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      quantityDelivered: quantityDelivered == freezed
          ? _value.quantityDelivered
          : quantityDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      reasonIfNotDelivered: reasonIfNotDelivered == freezed
          ? _value.reasonIfNotDelivered
          : reasonIfNotDelivered // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelivered: isDelivered == freezed
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DeliveryResourceModelCopyWith<$Res>
    implements $DeliveryResourceModelCopyWith<$Res> {
  factory _$$_DeliveryResourceModelCopyWith(_$_DeliveryResourceModel value,
          $Res Function(_$_DeliveryResourceModel) then) =
      __$$_DeliveryResourceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String resourceId,
      int quantityToBeDelivered,
      int quantityDelivered,
      String? reasonIfNotDelivered,
      bool isDelivered});
}

/// @nodoc
class __$$_DeliveryResourceModelCopyWithImpl<$Res>
    extends _$DeliveryResourceModelCopyWithImpl<$Res>
    implements _$$_DeliveryResourceModelCopyWith<$Res> {
  __$$_DeliveryResourceModelCopyWithImpl(_$_DeliveryResourceModel _value,
      $Res Function(_$_DeliveryResourceModel) _then)
      : super(_value, (v) => _then(v as _$_DeliveryResourceModel));

  @override
  _$_DeliveryResourceModel get _value =>
      super._value as _$_DeliveryResourceModel;

  @override
  $Res call({
    Object? resourceId = freezed,
    Object? quantityToBeDelivered = freezed,
    Object? quantityDelivered = freezed,
    Object? reasonIfNotDelivered = freezed,
    Object? isDelivered = freezed,
  }) {
    return _then(_$_DeliveryResourceModel(
      resourceId: resourceId == freezed
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityToBeDelivered: quantityToBeDelivered == freezed
          ? _value.quantityToBeDelivered
          : quantityToBeDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      quantityDelivered: quantityDelivered == freezed
          ? _value.quantityDelivered
          : quantityDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      reasonIfNotDelivered: reasonIfNotDelivered == freezed
          ? _value.reasonIfNotDelivered
          : reasonIfNotDelivered // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelivered: isDelivered == freezed
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryResourceModel implements _DeliveryResourceModel {
  const _$_DeliveryResourceModel(
      {required this.resourceId,
      required this.quantityToBeDelivered,
      required this.quantityDelivered,
      this.reasonIfNotDelivered,
      this.isDelivered = false});

  factory _$_DeliveryResourceModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryResourceModelFromJson(json);

  @override
  final String resourceId;
  @override
  final int quantityToBeDelivered;
  @override
  final int quantityDelivered;
  @override
  final String? reasonIfNotDelivered;
  @override
  @JsonKey()
  final bool isDelivered;

  @override
  String toString() {
    return 'DeliveryResourceModel(resourceId: $resourceId, quantityToBeDelivered: $quantityToBeDelivered, quantityDelivered: $quantityDelivered, reasonIfNotDelivered: $reasonIfNotDelivered, isDelivered: $isDelivered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryResourceModel &&
            const DeepCollectionEquality()
                .equals(other.resourceId, resourceId) &&
            const DeepCollectionEquality()
                .equals(other.quantityToBeDelivered, quantityToBeDelivered) &&
            const DeepCollectionEquality()
                .equals(other.quantityDelivered, quantityDelivered) &&
            const DeepCollectionEquality()
                .equals(other.reasonIfNotDelivered, reasonIfNotDelivered) &&
            const DeepCollectionEquality()
                .equals(other.isDelivered, isDelivered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(resourceId),
      const DeepCollectionEquality().hash(quantityToBeDelivered),
      const DeepCollectionEquality().hash(quantityDelivered),
      const DeepCollectionEquality().hash(reasonIfNotDelivered),
      const DeepCollectionEquality().hash(isDelivered));

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryResourceModelCopyWith<_$_DeliveryResourceModel> get copyWith =>
      __$$_DeliveryResourceModelCopyWithImpl<_$_DeliveryResourceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryResourceModelToJson(
      this,
    );
  }
}

abstract class _DeliveryResourceModel implements DeliveryResourceModel {
  const factory _DeliveryResourceModel(
      {required final String resourceId,
      required final int quantityToBeDelivered,
      required final int quantityDelivered,
      final String? reasonIfNotDelivered,
      final bool isDelivered}) = _$_DeliveryResourceModel;

  factory _DeliveryResourceModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryResourceModel.fromJson;

  @override
  String get resourceId;
  @override
  int get quantityToBeDelivered;
  @override
  int get quantityDelivered;
  @override
  String? get reasonIfNotDelivered;
  @override
  bool get isDelivered;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryResourceModelCopyWith<_$_DeliveryResourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
