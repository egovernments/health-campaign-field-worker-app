// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'household.dart';

class HouseholdSearchModelMapper
    extends SubClassMapperBase<HouseholdSearchModel> {
  HouseholdSearchModelMapper._();

  static HouseholdSearchModelMapper? _instance;
  static HouseholdSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HouseholdSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdSearchModel';

  static String? _$id(HouseholdSearchModel v) => v.id;
  static const Field<HouseholdSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static int? _$memberCount(HouseholdSearchModel v) => v.memberCount;
  static const Field<HouseholdSearchModel, int> _f$memberCount =
      Field('memberCount', _$memberCount, opt: true);
  static double? _$latitude(HouseholdSearchModel v) => v.latitude;
  static const Field<HouseholdSearchModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(HouseholdSearchModel v) => v.longitude;
  static const Field<HouseholdSearchModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static double? _$maxRadius(HouseholdSearchModel v) => v.maxRadius;
  static const Field<HouseholdSearchModel, double> _f$maxRadius =
      Field('maxRadius', _$maxRadius, opt: true);
  static bool? _$isProximityEnabled(HouseholdSearchModel v) =>
      v.isProximityEnabled;
  static const Field<HouseholdSearchModel, bool> _f$isProximityEnabled =
      Field('isProximityEnabled', _$isProximityEnabled, opt: true);
  static List<String>? _$clientReferenceId(HouseholdSearchModel v) =>
      v.clientReferenceId;
  static const Field<HouseholdSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(HouseholdSearchModel v) => v.tenantId;
  static const Field<HouseholdSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(HouseholdSearchModel v) => v.boundaryCode;
  static const Field<HouseholdSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HouseholdSearchModel v) => v.auditDetails;
  static const Field<HouseholdSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(HouseholdSearchModel v) =>
      v.additionalFields;
  static const Field<HouseholdSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HouseholdSearchModel> fields = const {
    #id: _f$id,
    #memberCount: _f$memberCount,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #maxRadius: _f$maxRadius,
    #isProximityEnabled: _f$isProximityEnabled,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntitySearchModelMapper.ensureInitialized();

  static HouseholdSearchModel _instantiate(DecodingData data) {
    return HouseholdSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        memberCount: data.dec(_f$memberCount),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        maxRadius: data.dec(_f$maxRadius),
        isProximityEnabled: data.dec(_f$isProximityEnabled),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdSearchModel>(map);
  }

  static HouseholdSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HouseholdSearchModel>(json);
  }
}

mixin HouseholdSearchModelMappable {
  String toJson() {
    return HouseholdSearchModelMapper.ensureInitialized()
        .encodeJson<HouseholdSearchModel>(this as HouseholdSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdSearchModelMapper.ensureInitialized()
        .encodeMap<HouseholdSearchModel>(this as HouseholdSearchModel);
  }

  HouseholdSearchModelCopyWith<HouseholdSearchModel, HouseholdSearchModel,
          HouseholdSearchModel>
      get copyWith => _HouseholdSearchModelCopyWithImpl(
          this as HouseholdSearchModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HouseholdSearchModel, other));
  }

  @override
  int get hashCode {
    return HouseholdSearchModelMapper.ensureInitialized()
        .hashValue(this as HouseholdSearchModel);
  }
}

extension HouseholdSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdSearchModel, $Out> {
  HouseholdSearchModelCopyWith<$R, HouseholdSearchModel, $Out>
      get $asHouseholdSearchModel =>
          $base.as((v, t, t2) => _HouseholdSearchModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdSearchModelCopyWith<
    $R,
    $In extends HouseholdSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      int? memberCount,
      double? latitude,
      double? longitude,
      double? maxRadius,
      bool? isProximityEnabled,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  HouseholdSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdSearchModel, $Out>
    implements HouseholdSearchModelCopyWith<$R, HouseholdSearchModel, $Out> {
  _HouseholdSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdSearchModel> $mapper =
      HouseholdSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? memberCount = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? maxRadius = $none,
          Object? isProximityEnabled = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (memberCount != $none) #memberCount: memberCount,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (maxRadius != $none) #maxRadius: maxRadius,
        if (isProximityEnabled != $none)
          #isProximityEnabled: isProximityEnabled,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HouseholdSearchModel $make(CopyWithData data) =>
      HouseholdSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          memberCount: data.get(#memberCount, or: $value.memberCount),
          latitude: data.get(#latitude, or: $value.latitude),
          longitude: data.get(#longitude, or: $value.longitude),
          maxRadius: data.get(#maxRadius, or: $value.maxRadius),
          isProximityEnabled:
              data.get(#isProximityEnabled, or: $value.isProximityEnabled),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HouseholdSearchModelCopyWith<$R2, HouseholdSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HouseholdSearchModelCopyWithImpl($value, $cast, t);
}

class HouseholdModelMapper extends SubClassMapperBase<HouseholdModel> {
  HouseholdModelMapper._();

  static HouseholdModelMapper? _instance;
  static HouseholdModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HouseholdModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdModel';

  static HouseholdAdditionalFields? _$additionalFields(HouseholdModel v) =>
      v.additionalFields;
  static const Field<HouseholdModel, HouseholdAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(HouseholdModel v) => v.id;
  static const Field<HouseholdModel, String> _f$id =
      Field('id', _$id, opt: true);
  static int? _$memberCount(HouseholdModel v) => v.memberCount;
  static const Field<HouseholdModel, int> _f$memberCount =
      Field('memberCount', _$memberCount, opt: true);
  static double? _$latitude(HouseholdModel v) => v.latitude;
  static const Field<HouseholdModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(HouseholdModel v) => v.longitude;
  static const Field<HouseholdModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static bool? _$nonRecoverableError(HouseholdModel v) => v.nonRecoverableError;
  static const Field<HouseholdModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(HouseholdModel v) => v.clientReferenceId;
  static const Field<HouseholdModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(HouseholdModel v) => v.tenantId;
  static const Field<HouseholdModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(HouseholdModel v) => v.rowVersion;
  static const Field<HouseholdModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressModel? _$address(HouseholdModel v) => v.address;
  static const Field<HouseholdModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static AuditDetails? _$auditDetails(HouseholdModel v) => v.auditDetails;
  static const Field<HouseholdModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HouseholdModel v) =>
      v.clientAuditDetails;
  static const Field<HouseholdModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HouseholdModel v) => v.isDeleted;
  static const Field<HouseholdModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HouseholdModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #memberCount: _f$memberCount,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static HouseholdModel _instantiate(DecodingData data) {
    return HouseholdModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        memberCount: data.dec(_f$memberCount),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdModel>(map);
  }

  static HouseholdModel fromJson(String json) {
    return ensureInitialized().decodeJson<HouseholdModel>(json);
  }
}

mixin HouseholdModelMappable {
  String toJson() {
    return HouseholdModelMapper.ensureInitialized()
        .encodeJson<HouseholdModel>(this as HouseholdModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdModelMapper.ensureInitialized()
        .encodeMap<HouseholdModel>(this as HouseholdModel);
  }

  HouseholdModelCopyWith<HouseholdModel, HouseholdModel, HouseholdModel>
      get copyWith => _HouseholdModelCopyWithImpl(
          this as HouseholdModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdModelMapper.ensureInitialized()
                .isValueEqual(this as HouseholdModel, other));
  }

  @override
  int get hashCode {
    return HouseholdModelMapper.ensureInitialized()
        .hashValue(this as HouseholdModel);
  }
}

extension HouseholdModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdModel, $Out> {
  HouseholdModelCopyWith<$R, HouseholdModel, $Out> get $asHouseholdModel =>
      $base.as((v, t, t2) => _HouseholdModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdModelCopyWith<$R, $In extends HouseholdModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  HouseholdAdditionalFieldsCopyWith<$R, HouseholdAdditionalFields,
      HouseholdAdditionalFields>? get additionalFields;
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {HouseholdAdditionalFields? additionalFields,
      String? id,
      int? memberCount,
      double? latitude,
      double? longitude,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AddressModel? address,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HouseholdModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdModel, $Out>
    implements HouseholdModelCopyWith<$R, HouseholdModel, $Out> {
  _HouseholdModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdModel> $mapper =
      HouseholdModelMapper.ensureInitialized();
  @override
  HouseholdAdditionalFieldsCopyWith<$R, HouseholdAdditionalFields,
          HouseholdAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? memberCount = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? address = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (memberCount != $none) #memberCount: memberCount,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (address != $none) #address: address,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HouseholdModel $make(CopyWithData data) => HouseholdModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      memberCount: data.get(#memberCount, or: $value.memberCount),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HouseholdModelCopyWith<$R2, HouseholdModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HouseholdModelCopyWithImpl($value, $cast, t);
}

class HouseholdAdditionalFieldsMapper
    extends SubClassMapperBase<HouseholdAdditionalFields> {
  HouseholdAdditionalFieldsMapper._();

  static HouseholdAdditionalFieldsMapper? _instance;
  static HouseholdAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HouseholdAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdAdditionalFields';

  static String _$schema(HouseholdAdditionalFields v) => v.schema;
  static const Field<HouseholdAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Household');
  static int _$version(HouseholdAdditionalFields v) => v.version;
  static const Field<HouseholdAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HouseholdAdditionalFields v) =>
      v.fields;
  static const Field<HouseholdAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HouseholdAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static HouseholdAdditionalFields _instantiate(DecodingData data) {
    return HouseholdAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdAdditionalFields>(map);
  }

  static HouseholdAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<HouseholdAdditionalFields>(json);
  }
}

mixin HouseholdAdditionalFieldsMappable {
  String toJson() {
    return HouseholdAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HouseholdAdditionalFields>(
            this as HouseholdAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HouseholdAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HouseholdAdditionalFields>(
            this as HouseholdAdditionalFields);
  }

  HouseholdAdditionalFieldsCopyWith<HouseholdAdditionalFields,
          HouseholdAdditionalFields, HouseholdAdditionalFields>
      get copyWith => _HouseholdAdditionalFieldsCopyWithImpl(
          this as HouseholdAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HouseholdAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HouseholdAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as HouseholdAdditionalFields, other));
  }

  @override
  int get hashCode {
    return HouseholdAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HouseholdAdditionalFields);
  }
}

extension HouseholdAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdAdditionalFields, $Out> {
  HouseholdAdditionalFieldsCopyWith<$R, HouseholdAdditionalFields, $Out>
      get $asHouseholdAdditionalFields => $base
          .as((v, t, t2) => _HouseholdAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HouseholdAdditionalFieldsCopyWith<
    $R,
    $In extends HouseholdAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HouseholdAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdAdditionalFields, $Out>
    implements
        HouseholdAdditionalFieldsCopyWith<$R, HouseholdAdditionalFields, $Out> {
  _HouseholdAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdAdditionalFields> $mapper =
      HouseholdAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  HouseholdAdditionalFields $make(CopyWithData data) =>
      HouseholdAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HouseholdAdditionalFieldsCopyWith<$R2, HouseholdAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HouseholdAdditionalFieldsCopyWithImpl($value, $cast, t);
}
