// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_action.dart';

class UserActionSearchModelMapper
    extends SubClassMapperBase<UserActionSearchModel> {
  UserActionSearchModelMapper._();

  static UserActionSearchModelMapper? _instance;
  static UserActionSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserActionSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserActionSearchModel';

  static List<String>? _$id(UserActionSearchModel v) => v.id;
  static const Field<UserActionSearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(UserActionSearchModel v) => v.projectId;
  static const Field<UserActionSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$createdBy(UserActionSearchModel v) => v.createdBy;
  static const Field<UserActionSearchModel, String> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static String? _$status(UserActionSearchModel v) => v.status;
  static const Field<UserActionSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static int? _$offset(UserActionSearchModel v) => v.offset;
  static const Field<UserActionSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(UserActionSearchModel v) => v.limit;
  static const Field<UserActionSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static List<String>? _$clientReferenceId(UserActionSearchModel v) =>
      v.clientReferenceId;
  static const Field<UserActionSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(UserActionSearchModel v) => v.tenantId;
  static const Field<UserActionSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(UserActionSearchModel v) => v.boundaryCode;
  static const Field<UserActionSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(UserActionSearchModel v) =>
      v.auditDetails;
  static const Field<UserActionSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(UserActionSearchModel v) =>
      v.additionalFields;
  static const Field<UserActionSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<UserActionSearchModel> fields = const {
    #id: _f$id,
    #projectId: _f$projectId,
    #createdBy: _f$createdBy,
    #status: _f$status,
    #offset: _f$offset,
    #limit: _f$limit,
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

  static UserActionSearchModel _instantiate(DecodingData data) {
    return UserActionSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        createdBy: data.dec(_f$createdBy),
        status: data.dec(_f$status),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static UserActionSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserActionSearchModel>(map);
  }

  static UserActionSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserActionSearchModel>(json);
  }
}

mixin UserActionSearchModelMappable {
  String toJson() {
    return UserActionSearchModelMapper.ensureInitialized()
        .encodeJson<UserActionSearchModel>(this as UserActionSearchModel);
  }

  Map<String, dynamic> toMap() {
    return UserActionSearchModelMapper.ensureInitialized()
        .encodeMap<UserActionSearchModel>(this as UserActionSearchModel);
  }

  UserActionSearchModelCopyWith<UserActionSearchModel, UserActionSearchModel,
          UserActionSearchModel>
      get copyWith => _UserActionSearchModelCopyWithImpl(
          this as UserActionSearchModel, $identity, $identity);
  @override
  String toString() {
    return UserActionSearchModelMapper.ensureInitialized()
        .stringifyValue(this as UserActionSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserActionSearchModelMapper.ensureInitialized()
                .isValueEqual(this as UserActionSearchModel, other));
  }

  @override
  int get hashCode {
    return UserActionSearchModelMapper.ensureInitialized()
        .hashValue(this as UserActionSearchModel);
  }
}

extension UserActionSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserActionSearchModel, $Out> {
  UserActionSearchModelCopyWith<$R, UserActionSearchModel, $Out>
      get $asUserActionSearchModel =>
          $base.as((v, t, t2) => _UserActionSearchModelCopyWithImpl(v, t, t2));
}

abstract class UserActionSearchModelCopyWith<
    $R,
    $In extends UserActionSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? id,
      String? projectId,
      String? createdBy,
      String? status,
      int? offset,
      int? limit,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  UserActionSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserActionSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserActionSearchModel, $Out>
    implements UserActionSearchModelCopyWith<$R, UserActionSearchModel, $Out> {
  _UserActionSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserActionSearchModel> $mapper =
      UserActionSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
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
          Object? projectId = $none,
          Object? createdBy = $none,
          Object? status = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (createdBy != $none) #createdBy: createdBy,
        if (status != $none) #status: status,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  UserActionSearchModel $make(CopyWithData data) =>
      UserActionSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectId: data.get(#projectId, or: $value.projectId),
          createdBy: data.get(#createdBy, or: $value.createdBy),
          status: data.get(#status, or: $value.status),
          offset: data.get(#offset, or: $value.offset),
          limit: data.get(#limit, or: $value.limit),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  UserActionSearchModelCopyWith<$R2, UserActionSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UserActionSearchModelCopyWithImpl($value, $cast, t);
}

class UserActionModelMapper extends SubClassMapperBase<UserActionModel> {
  UserActionModelMapper._();

  static UserActionModelMapper? _instance;
  static UserActionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserActionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserActionModel';

  static UserActionAdditionalFields? _$additionalFields(UserActionModel v) =>
      v.additionalFields;
  static const Field<UserActionModel, UserActionAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(UserActionModel v) => v.id;
  static const Field<UserActionModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(UserActionModel v) => v.projectId;
  static const Field<UserActionModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$status(UserActionModel v) => v.status;
  static const Field<UserActionModel, String> _f$status =
      Field('status', _$status, opt: true);
  static bool? _$nonRecoverableError(UserActionModel v) =>
      v.nonRecoverableError;
  static const Field<UserActionModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(UserActionModel v) => v.clientReferenceId;
  static const Field<UserActionModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(UserActionModel v) => v.tenantId;
  static const Field<UserActionModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(UserActionModel v) => v.boundaryCode;
  static const Field<UserActionModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static int? _$rowVersion(UserActionModel v) => v.rowVersion;
  static const Field<UserActionModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$beneficiaryTag(UserActionModel v) => v.beneficiaryTag;
  static const Field<UserActionModel, String> _f$beneficiaryTag =
      Field('beneficiaryTag', _$beneficiaryTag, opt: true);
  static String? _$resourceTag(UserActionModel v) => v.resourceTag;
  static const Field<UserActionModel, String> _f$resourceTag =
      Field('resourceTag', _$resourceTag, opt: true);
  static String? _$action(UserActionModel v) => v.action;
  static const Field<UserActionModel, String> _f$action =
      Field('action', _$action, opt: true);
  static double? _$longitude(UserActionModel v) => v.longitude;
  static const Field<UserActionModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static double? _$latitude(UserActionModel v) => v.latitude;
  static const Field<UserActionModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$locationAccuracy(UserActionModel v) => v.locationAccuracy;
  static const Field<UserActionModel, double> _f$locationAccuracy =
      Field('locationAccuracy', _$locationAccuracy, opt: true);
  static AuditDetails? _$auditDetails(UserActionModel v) => v.auditDetails;
  static const Field<UserActionModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(UserActionModel v) =>
      v.clientAuditDetails;
  static const Field<UserActionModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(UserActionModel v) => v.isDeleted;
  static const Field<UserActionModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<UserActionModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #status: _f$status,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #boundaryCode: _f$boundaryCode,
    #rowVersion: _f$rowVersion,
    #beneficiaryTag: _f$beneficiaryTag,
    #resourceTag: _f$resourceTag,
    #action: _f$action,
    #longitude: _f$longitude,
    #latitude: _f$latitude,
    #locationAccuracy: _f$locationAccuracy,
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

  static UserActionModel _instantiate(DecodingData data) {
    return UserActionModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        status: data.dec(_f$status),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode),
        rowVersion: data.dec(_f$rowVersion),
        beneficiaryTag: data.dec(_f$beneficiaryTag),
        resourceTag: data.dec(_f$resourceTag),
        action: data.dec(_f$action),
        longitude: data.dec(_f$longitude),
        latitude: data.dec(_f$latitude),
        locationAccuracy: data.dec(_f$locationAccuracy),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static UserActionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserActionModel>(map);
  }

  static UserActionModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserActionModel>(json);
  }
}

mixin UserActionModelMappable {
  String toJson() {
    return UserActionModelMapper.ensureInitialized()
        .encodeJson<UserActionModel>(this as UserActionModel);
  }

  Map<String, dynamic> toMap() {
    return UserActionModelMapper.ensureInitialized()
        .encodeMap<UserActionModel>(this as UserActionModel);
  }

  UserActionModelCopyWith<UserActionModel, UserActionModel, UserActionModel>
      get copyWith => _UserActionModelCopyWithImpl(
          this as UserActionModel, $identity, $identity);
  @override
  String toString() {
    return UserActionModelMapper.ensureInitialized()
        .stringifyValue(this as UserActionModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserActionModelMapper.ensureInitialized()
                .isValueEqual(this as UserActionModel, other));
  }

  @override
  int get hashCode {
    return UserActionModelMapper.ensureInitialized()
        .hashValue(this as UserActionModel);
  }
}

extension UserActionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserActionModel, $Out> {
  UserActionModelCopyWith<$R, UserActionModel, $Out> get $asUserActionModel =>
      $base.as((v, t, t2) => _UserActionModelCopyWithImpl(v, t, t2));
}

abstract class UserActionModelCopyWith<$R, $In extends UserActionModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  UserActionAdditionalFieldsCopyWith<$R, UserActionAdditionalFields,
      UserActionAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {UserActionAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      String? status,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      String? boundaryCode,
      int? rowVersion,
      String? beneficiaryTag,
      String? resourceTag,
      String? action,
      double? longitude,
      double? latitude,
      double? locationAccuracy,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  UserActionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserActionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserActionModel, $Out>
    implements UserActionModelCopyWith<$R, UserActionModel, $Out> {
  _UserActionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserActionModel> $mapper =
      UserActionModelMapper.ensureInitialized();
  @override
  UserActionAdditionalFieldsCopyWith<$R, UserActionAdditionalFields,
          UserActionAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
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
          Object? projectId = $none,
          Object? status = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? boundaryCode = $none,
          Object? rowVersion = $none,
          Object? beneficiaryTag = $none,
          Object? resourceTag = $none,
          Object? action = $none,
          Object? longitude = $none,
          Object? latitude = $none,
          Object? locationAccuracy = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (status != $none) #status: status,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (beneficiaryTag != $none) #beneficiaryTag: beneficiaryTag,
        if (resourceTag != $none) #resourceTag: resourceTag,
        if (action != $none) #action: action,
        if (longitude != $none) #longitude: longitude,
        if (latitude != $none) #latitude: latitude,
        if (locationAccuracy != $none) #locationAccuracy: locationAccuracy,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  UserActionModel $make(CopyWithData data) => UserActionModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      status: data.get(#status, or: $value.status),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      beneficiaryTag: data.get(#beneficiaryTag, or: $value.beneficiaryTag),
      resourceTag: data.get(#resourceTag, or: $value.resourceTag),
      action: data.get(#action, or: $value.action),
      longitude: data.get(#longitude, or: $value.longitude),
      latitude: data.get(#latitude, or: $value.latitude),
      locationAccuracy:
          data.get(#locationAccuracy, or: $value.locationAccuracy),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  UserActionModelCopyWith<$R2, UserActionModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserActionModelCopyWithImpl($value, $cast, t);
}

class UserActionAdditionalFieldsMapper
    extends SubClassMapperBase<UserActionAdditionalFields> {
  UserActionAdditionalFieldsMapper._();

  static UserActionAdditionalFieldsMapper? _instance;
  static UserActionAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UserActionAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserActionAdditionalFields';

  static String _$schema(UserActionAdditionalFields v) => v.schema;
  static const Field<UserActionAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'UserAction');
  static int _$version(UserActionAdditionalFields v) => v.version;
  static const Field<UserActionAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(UserActionAdditionalFields v) =>
      v.fields;
  static const Field<UserActionAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<UserActionAdditionalFields> fields = const {
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

  static UserActionAdditionalFields _instantiate(DecodingData data) {
    return UserActionAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static UserActionAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserActionAdditionalFields>(map);
  }

  static UserActionAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<UserActionAdditionalFields>(json);
  }
}

mixin UserActionAdditionalFieldsMappable {
  String toJson() {
    return UserActionAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<UserActionAdditionalFields>(
            this as UserActionAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return UserActionAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<UserActionAdditionalFields>(
            this as UserActionAdditionalFields);
  }

  UserActionAdditionalFieldsCopyWith<UserActionAdditionalFields,
          UserActionAdditionalFields, UserActionAdditionalFields>
      get copyWith => _UserActionAdditionalFieldsCopyWithImpl(
          this as UserActionAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return UserActionAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as UserActionAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserActionAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as UserActionAdditionalFields, other));
  }

  @override
  int get hashCode {
    return UserActionAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as UserActionAdditionalFields);
  }
}

extension UserActionAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserActionAdditionalFields, $Out> {
  UserActionAdditionalFieldsCopyWith<$R, UserActionAdditionalFields, $Out>
      get $asUserActionAdditionalFields => $base
          .as((v, t, t2) => _UserActionAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class UserActionAdditionalFieldsCopyWith<
    $R,
    $In extends UserActionAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  UserActionAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserActionAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserActionAdditionalFields, $Out>
    implements
        UserActionAdditionalFieldsCopyWith<$R, UserActionAdditionalFields,
            $Out> {
  _UserActionAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserActionAdditionalFields> $mapper =
      UserActionAdditionalFieldsMapper.ensureInitialized();
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
  UserActionAdditionalFields $make(CopyWithData data) =>
      UserActionAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  UserActionAdditionalFieldsCopyWith<$R2, UserActionAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UserActionAdditionalFieldsCopyWithImpl($value, $cast, t);
}
