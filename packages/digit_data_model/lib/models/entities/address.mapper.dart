// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address.dart';

class AddressSearchModelMapper extends SubClassMapperBase<AddressSearchModel> {
  AddressSearchModelMapper._();

  static AddressSearchModelMapper? _instance;
  static AddressSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressSearchModel';

  static String? _$id(AddressSearchModel v) => v.id;
  static const Field<AddressSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static double? _$latitude(AddressSearchModel v) => v.latitude;
  static const Field<AddressSearchModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(AddressSearchModel v) => v.longitude;
  static const Field<AddressSearchModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static int? _$limit(AddressSearchModel v) => v.limit;
  static const Field<AddressSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$offset(AddressSearchModel v) => v.offset;
  static const Field<AddressSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static double? _$maxRadius(AddressSearchModel v) => v.maxRadius;
  static const Field<AddressSearchModel, double> _f$maxRadius =
      Field('maxRadius', _$maxRadius, opt: true);
  static String? _$tenantId(AddressSearchModel v) => v.tenantId;
  static const Field<AddressSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(AddressSearchModel v) => v.boundaryCode;
  static const Field<AddressSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(AddressSearchModel v) => v.auditDetails;
  static const Field<AddressSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(AddressSearchModel v) =>
      v.additionalFields;
  static const Field<AddressSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<AddressSearchModel> fields = const {
    #id: _f$id,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #limit: _f$limit,
    #offset: _f$offset,
    #maxRadius: _f$maxRadius,
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

  static AddressSearchModel _instantiate(DecodingData data) {
    return AddressSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        limit: data.dec(_f$limit),
        offset: data.dec(_f$offset),
        maxRadius: data.dec(_f$maxRadius),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressSearchModel>(map);
  }

  static AddressSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AddressSearchModel>(json);
  }
}

mixin AddressSearchModelMappable {
  String toJson() {
    return AddressSearchModelMapper.ensureInitialized()
        .encodeJson<AddressSearchModel>(this as AddressSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AddressSearchModelMapper.ensureInitialized()
        .encodeMap<AddressSearchModel>(this as AddressSearchModel);
  }

  AddressSearchModelCopyWith<AddressSearchModel, AddressSearchModel,
          AddressSearchModel>
      get copyWith => _AddressSearchModelCopyWithImpl(
          this as AddressSearchModel, $identity, $identity);
  @override
  String toString() {
    return AddressSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AddressSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressSearchModelMapper.ensureInitialized()
                .isValueEqual(this as AddressSearchModel, other));
  }

  @override
  int get hashCode {
    return AddressSearchModelMapper.ensureInitialized()
        .hashValue(this as AddressSearchModel);
  }
}

extension AddressSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressSearchModel, $Out> {
  AddressSearchModelCopyWith<$R, AddressSearchModel, $Out>
      get $asAddressSearchModel =>
          $base.as((v, t, t2) => _AddressSearchModelCopyWithImpl(v, t, t2));
}

abstract class AddressSearchModelCopyWith<$R, $In extends AddressSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      double? latitude,
      double? longitude,
      int? limit,
      int? offset,
      double? maxRadius,
      String? tenantId,
      String? boundaryCode});
  AddressSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddressSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressSearchModel, $Out>
    implements AddressSearchModelCopyWith<$R, AddressSearchModel, $Out> {
  _AddressSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressSearchModel> $mapper =
      AddressSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? limit = $none,
          Object? offset = $none,
          Object? maxRadius = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (limit != $none) #limit: limit,
        if (offset != $none) #offset: offset,
        if (maxRadius != $none) #maxRadius: maxRadius,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  AddressSearchModel $make(CopyWithData data) =>
      AddressSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          latitude: data.get(#latitude, or: $value.latitude),
          longitude: data.get(#longitude, or: $value.longitude),
          limit: data.get(#limit, or: $value.limit),
          offset: data.get(#offset, or: $value.offset),
          maxRadius: data.get(#maxRadius, or: $value.maxRadius),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  AddressSearchModelCopyWith<$R2, AddressSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressSearchModelCopyWithImpl($value, $cast, t);
}

class AddressAdditionalFieldsMapper
    extends SubClassMapperBase<AddressAdditionalFields> {
  AddressAdditionalFieldsMapper._();

  static AddressAdditionalFieldsMapper? _instance;
  static AddressAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AddressAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressAdditionalFields';

  static String _$schema(AddressAdditionalFields v) => v.schema;
  static const Field<AddressAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Address');
  static int _$version(AddressAdditionalFields v) => v.version;
  static const Field<AddressAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(AddressAdditionalFields v) => v.fields;
  static const Field<AddressAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<AddressAdditionalFields> fields = const {
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

  static AddressAdditionalFields _instantiate(DecodingData data) {
    return AddressAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressAdditionalFields>(map);
  }

  static AddressAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AddressAdditionalFields>(json);
  }
}

mixin AddressAdditionalFieldsMappable {
  String toJson() {
    return AddressAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<AddressAdditionalFields>(this as AddressAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return AddressAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<AddressAdditionalFields>(this as AddressAdditionalFields);
  }

  AddressAdditionalFieldsCopyWith<AddressAdditionalFields,
          AddressAdditionalFields, AddressAdditionalFields>
      get copyWith => _AddressAdditionalFieldsCopyWithImpl(
          this as AddressAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return AddressAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as AddressAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as AddressAdditionalFields, other));
  }

  @override
  int get hashCode {
    return AddressAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as AddressAdditionalFields);
  }
}

extension AddressAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressAdditionalFields, $Out> {
  AddressAdditionalFieldsCopyWith<$R, AddressAdditionalFields, $Out>
      get $asAddressAdditionalFields => $base
          .as((v, t, t2) => _AddressAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class AddressAdditionalFieldsCopyWith<
    $R,
    $In extends AddressAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  AddressAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddressAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressAdditionalFields, $Out>
    implements
        AddressAdditionalFieldsCopyWith<$R, AddressAdditionalFields, $Out> {
  _AddressAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressAdditionalFields> $mapper =
      AddressAdditionalFieldsMapper.ensureInitialized();
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
  AddressAdditionalFields $make(CopyWithData data) => AddressAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  AddressAdditionalFieldsCopyWith<$R2, AddressAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AddressAdditionalFieldsCopyWithImpl($value, $cast, t);
}

class AddressModelMapper extends SubClassMapperBase<AddressModel> {
  AddressModelMapper._();

  static AddressModelMapper? _instance;
  static AddressModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressModel';

  static AddressAdditionalFields? _$additionalFields(AddressModel v) =>
      v.additionalFields;
  static const Field<AddressModel, AddressAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(AddressModel v) => v.id;
  static const Field<AddressModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$relatedClientReferenceId(AddressModel v) =>
      v.relatedClientReferenceId;
  static const Field<AddressModel, String> _f$relatedClientReferenceId =
      Field('relatedClientReferenceId', _$relatedClientReferenceId, opt: true);
  static String? _$doorNo(AddressModel v) => v.doorNo;
  static const Field<AddressModel, String> _f$doorNo =
      Field('doorNo', _$doorNo, opt: true);
  static double? _$latitude(AddressModel v) => v.latitude;
  static const Field<AddressModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(AddressModel v) => v.longitude;
  static const Field<AddressModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static double? _$locationAccuracy(AddressModel v) => v.locationAccuracy;
  static const Field<AddressModel, double> _f$locationAccuracy =
      Field('locationAccuracy', _$locationAccuracy, opt: true);
  static String? _$addressLine1(AddressModel v) => v.addressLine1;
  static const Field<AddressModel, String> _f$addressLine1 =
      Field('addressLine1', _$addressLine1, opt: true);
  static String? _$addressLine2(AddressModel v) => v.addressLine2;
  static const Field<AddressModel, String> _f$addressLine2 =
      Field('addressLine2', _$addressLine2, opt: true);
  static String? _$landmark(AddressModel v) => v.landmark;
  static const Field<AddressModel, String> _f$landmark =
      Field('landmark', _$landmark, opt: true);
  static String? _$city(AddressModel v) => v.city;
  static const Field<AddressModel, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$pincode(AddressModel v) => v.pincode;
  static const Field<AddressModel, String> _f$pincode =
      Field('pincode', _$pincode, opt: true);
  static String? _$buildingName(AddressModel v) => v.buildingName;
  static const Field<AddressModel, String> _f$buildingName =
      Field('buildingName', _$buildingName, opt: true);
  static String? _$street(AddressModel v) => v.street;
  static const Field<AddressModel, String> _f$street =
      Field('street', _$street, opt: true);
  static String? _$boundaryType(AddressModel v) => v.boundaryType;
  static const Field<AddressModel, String> _f$boundaryType =
      Field('boundaryType', _$boundaryType, opt: true);
  static String? _$boundary(AddressModel v) => v.boundary;
  static const Field<AddressModel, String> _f$boundary =
      Field('boundary', _$boundary, opt: true);
  static bool? _$nonRecoverableError(AddressModel v) => v.nonRecoverableError;
  static const Field<AddressModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(AddressModel v) => v.tenantId;
  static const Field<AddressModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(AddressModel v) => v.rowVersion;
  static const Field<AddressModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressType? _$type(AddressModel v) => v.type;
  static const Field<AddressModel, AddressType> _f$type =
      Field('type', _$type, opt: true);
  static LocalityModel? _$locality(AddressModel v) => v.locality;
  static const Field<AddressModel, LocalityModel> _f$locality =
      Field('locality', _$locality, opt: true);
  static AuditDetails? _$auditDetails(AddressModel v) => v.auditDetails;
  static const Field<AddressModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(AddressModel v) =>
      v.clientAuditDetails;
  static const Field<AddressModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(AddressModel v) => v.isDeleted;
  static const Field<AddressModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<AddressModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #relatedClientReferenceId: _f$relatedClientReferenceId,
    #doorNo: _f$doorNo,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #locationAccuracy: _f$locationAccuracy,
    #addressLine1: _f$addressLine1,
    #addressLine2: _f$addressLine2,
    #landmark: _f$landmark,
    #city: _f$city,
    #pincode: _f$pincode,
    #buildingName: _f$buildingName,
    #street: _f$street,
    #boundaryType: _f$boundaryType,
    #boundary: _f$boundary,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #type: _f$type,
    #locality: _f$locality,
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

  static AddressModel _instantiate(DecodingData data) {
    return AddressModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        relatedClientReferenceId: data.dec(_f$relatedClientReferenceId),
        doorNo: data.dec(_f$doorNo),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        locationAccuracy: data.dec(_f$locationAccuracy),
        addressLine1: data.dec(_f$addressLine1),
        addressLine2: data.dec(_f$addressLine2),
        landmark: data.dec(_f$landmark),
        city: data.dec(_f$city),
        pincode: data.dec(_f$pincode),
        buildingName: data.dec(_f$buildingName),
        street: data.dec(_f$street),
        boundaryType: data.dec(_f$boundaryType),
        boundary: data.dec(_f$boundary),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        type: data.dec(_f$type),
        locality: data.dec(_f$locality),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressModel>(map);
  }

  static AddressModel fromJson(String json) {
    return ensureInitialized().decodeJson<AddressModel>(json);
  }
}

mixin AddressModelMappable {
  String toJson() {
    return AddressModelMapper.ensureInitialized()
        .encodeJson<AddressModel>(this as AddressModel);
  }

  Map<String, dynamic> toMap() {
    return AddressModelMapper.ensureInitialized()
        .encodeMap<AddressModel>(this as AddressModel);
  }

  AddressModelCopyWith<AddressModel, AddressModel, AddressModel> get copyWith =>
      _AddressModelCopyWithImpl(this as AddressModel, $identity, $identity);
  @override
  String toString() {
    return AddressModelMapper.ensureInitialized()
        .stringifyValue(this as AddressModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressModelMapper.ensureInitialized()
                .isValueEqual(this as AddressModel, other));
  }

  @override
  int get hashCode {
    return AddressModelMapper.ensureInitialized()
        .hashValue(this as AddressModel);
  }
}

extension AddressModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressModel, $Out> {
  AddressModelCopyWith<$R, AddressModel, $Out> get $asAddressModel =>
      $base.as((v, t, t2) => _AddressModelCopyWithImpl(v, t, t2));
}

abstract class AddressModelCopyWith<$R, $In extends AddressModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  AddressAdditionalFieldsCopyWith<$R, AddressAdditionalFields,
      AddressAdditionalFields>? get additionalFields;
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {AddressAdditionalFields? additionalFields,
      String? id,
      String? relatedClientReferenceId,
      String? doorNo,
      double? latitude,
      double? longitude,
      double? locationAccuracy,
      String? addressLine1,
      String? addressLine2,
      String? landmark,
      String? city,
      String? pincode,
      String? buildingName,
      String? street,
      String? boundaryType,
      String? boundary,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressType? type,
      LocalityModel? locality,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  AddressModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddressModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressModel, $Out>
    implements AddressModelCopyWith<$R, AddressModel, $Out> {
  _AddressModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressModel> $mapper =
      AddressModelMapper.ensureInitialized();
  @override
  AddressAdditionalFieldsCopyWith<$R, AddressAdditionalFields,
          AddressAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality =>
      $value.locality?.copyWith.$chain((v) => call(locality: v));
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
          Object? relatedClientReferenceId = $none,
          Object? doorNo = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? locationAccuracy = $none,
          Object? addressLine1 = $none,
          Object? addressLine2 = $none,
          Object? landmark = $none,
          Object? city = $none,
          Object? pincode = $none,
          Object? buildingName = $none,
          Object? street = $none,
          Object? boundaryType = $none,
          Object? boundary = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? type = $none,
          Object? locality = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (relatedClientReferenceId != $none)
          #relatedClientReferenceId: relatedClientReferenceId,
        if (doorNo != $none) #doorNo: doorNo,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (locationAccuracy != $none) #locationAccuracy: locationAccuracy,
        if (addressLine1 != $none) #addressLine1: addressLine1,
        if (addressLine2 != $none) #addressLine2: addressLine2,
        if (landmark != $none) #landmark: landmark,
        if (city != $none) #city: city,
        if (pincode != $none) #pincode: pincode,
        if (buildingName != $none) #buildingName: buildingName,
        if (street != $none) #street: street,
        if (boundaryType != $none) #boundaryType: boundaryType,
        if (boundary != $none) #boundary: boundary,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (type != $none) #type: type,
        if (locality != $none) #locality: locality,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  AddressModel $make(CopyWithData data) => AddressModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      relatedClientReferenceId: data.get(#relatedClientReferenceId,
          or: $value.relatedClientReferenceId),
      doorNo: data.get(#doorNo, or: $value.doorNo),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      locationAccuracy:
          data.get(#locationAccuracy, or: $value.locationAccuracy),
      addressLine1: data.get(#addressLine1, or: $value.addressLine1),
      addressLine2: data.get(#addressLine2, or: $value.addressLine2),
      landmark: data.get(#landmark, or: $value.landmark),
      city: data.get(#city, or: $value.city),
      pincode: data.get(#pincode, or: $value.pincode),
      buildingName: data.get(#buildingName, or: $value.buildingName),
      street: data.get(#street, or: $value.street),
      boundaryType: data.get(#boundaryType, or: $value.boundaryType),
      boundary: data.get(#boundary, or: $value.boundary),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      type: data.get(#type, or: $value.type),
      locality: data.get(#locality, or: $value.locality),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  AddressModelCopyWith<$R2, AddressModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressModelCopyWithImpl($value, $cast, t);
}
