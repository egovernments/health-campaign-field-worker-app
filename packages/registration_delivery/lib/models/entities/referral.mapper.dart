// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral.dart';

class ReferralSearchModelMapper
    extends SubClassMapperBase<ReferralSearchModel> {
  ReferralSearchModelMapper._();

  static ReferralSearchModelMapper? _instance;
  static ReferralSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReferralSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralSearchModel';

  static String? _$id(ReferralSearchModel v) => v.id;
  static const Field<ReferralSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$projectBeneficiaryClientReferenceId(
          ReferralSearchModel v) =>
      v.projectBeneficiaryClientReferenceId;
  static const Field<ReferralSearchModel, List<String>>
      _f$projectBeneficiaryClientReferenceId = Field(
          'projectBeneficiaryClientReferenceId',
          _$projectBeneficiaryClientReferenceId,
          opt: true);
  static String? _$projectId(ReferralSearchModel v) => v.projectId;
  static const Field<ReferralSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$referrerId(ReferralSearchModel v) => v.referrerId;
  static const Field<ReferralSearchModel, String> _f$referrerId =
      Field('referrerId', _$referrerId, opt: true);
  static String? _$recipientType(ReferralSearchModel v) => v.recipientType;
  static const Field<ReferralSearchModel, String> _f$recipientType =
      Field('recipientType', _$recipientType, opt: true);
  static String? _$recipientId(ReferralSearchModel v) => v.recipientId;
  static const Field<ReferralSearchModel, String> _f$recipientId =
      Field('recipientId', _$recipientId, opt: true);
  static List<String>? _$reasons(ReferralSearchModel v) => v.reasons;
  static const Field<ReferralSearchModel, List<String>> _f$reasons =
      Field('reasons', _$reasons, opt: true);
  static List<String>? _$clientReferenceId(ReferralSearchModel v) =>
      v.clientReferenceId;
  static const Field<ReferralSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ReferralSearchModel v) => v.tenantId;
  static const Field<ReferralSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ReferralSearchModel v) => v.boundaryCode;
  static const Field<ReferralSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ReferralSearchModel v) => v.auditDetails;
  static const Field<ReferralSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ReferralSearchModel v) =>
      v.additionalFields;
  static const Field<ReferralSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ReferralSearchModel> fields = const {
    #id: _f$id,
    #projectBeneficiaryClientReferenceId:
        _f$projectBeneficiaryClientReferenceId,
    #projectId: _f$projectId,
    #referrerId: _f$referrerId,
    #recipientType: _f$recipientType,
    #recipientId: _f$recipientId,
    #reasons: _f$reasons,
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

  static ReferralSearchModel _instantiate(DecodingData data) {
    return ReferralSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectBeneficiaryClientReferenceId:
            data.dec(_f$projectBeneficiaryClientReferenceId),
        projectId: data.dec(_f$projectId),
        referrerId: data.dec(_f$referrerId),
        recipientType: data.dec(_f$recipientType),
        recipientId: data.dec(_f$recipientId),
        reasons: data.dec(_f$reasons),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralSearchModel>(map);
  }

  static ReferralSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralSearchModel>(json);
  }
}

mixin ReferralSearchModelMappable {
  String toJson() {
    return ReferralSearchModelMapper.ensureInitialized()
        .encodeJson<ReferralSearchModel>(this as ReferralSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralSearchModelMapper.ensureInitialized()
        .encodeMap<ReferralSearchModel>(this as ReferralSearchModel);
  }

  ReferralSearchModelCopyWith<ReferralSearchModel, ReferralSearchModel,
          ReferralSearchModel>
      get copyWith => _ReferralSearchModelCopyWithImpl(
          this as ReferralSearchModel, $identity, $identity);
  @override
  String toString() {
    return ReferralSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ReferralSearchModel, other));
  }

  @override
  int get hashCode {
    return ReferralSearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralSearchModel);
  }
}

extension ReferralSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralSearchModel, $Out> {
  ReferralSearchModelCopyWith<$R, ReferralSearchModel, $Out>
      get $asReferralSearchModel =>
          $base.as((v, t, t2) => _ReferralSearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralSearchModelCopyWith<$R, $In extends ReferralSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryClientReferenceId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reasons;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      List<String>? projectBeneficiaryClientReferenceId,
      String? projectId,
      String? referrerId,
      String? recipientType,
      String? recipientId,
      List<String>? reasons,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  ReferralSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralSearchModel, $Out>
    implements ReferralSearchModelCopyWith<$R, ReferralSearchModel, $Out> {
  _ReferralSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralSearchModel> $mapper =
      ReferralSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryClientReferenceId =>
          $value.projectBeneficiaryClientReferenceId != null
              ? ListCopyWith(
                  $value.projectBeneficiaryClientReferenceId!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(projectBeneficiaryClientReferenceId: v))
              : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reasons =>
      $value.reasons != null
          ? ListCopyWith(
              $value.reasons!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(reasons: v))
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
          Object? projectBeneficiaryClientReferenceId = $none,
          Object? projectId = $none,
          Object? referrerId = $none,
          Object? recipientType = $none,
          Object? recipientId = $none,
          Object? reasons = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectBeneficiaryClientReferenceId != $none)
          #projectBeneficiaryClientReferenceId:
              projectBeneficiaryClientReferenceId,
        if (projectId != $none) #projectId: projectId,
        if (referrerId != $none) #referrerId: referrerId,
        if (recipientType != $none) #recipientType: recipientType,
        if (recipientId != $none) #recipientId: recipientId,
        if (reasons != $none) #reasons: reasons,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ReferralSearchModel
      $make(CopyWithData data) =>
          ReferralSearchModel.ignoreDeleted(
              id: data.get(#id, or: $value.id),
              projectBeneficiaryClientReferenceId: data.get(
                  #projectBeneficiaryClientReferenceId,
                  or: $value.projectBeneficiaryClientReferenceId),
              projectId: data.get(#projectId, or: $value.projectId),
              referrerId: data.get(#referrerId, or: $value.referrerId),
              recipientType: data.get(#recipientType, or: $value.recipientType),
              recipientId: data.get(#recipientId, or: $value.recipientId),
              reasons: data.get(#reasons, or: $value.reasons),
              clientReferenceId:
                  data.get(#clientReferenceId, or: $value.clientReferenceId),
              tenantId: data.get(#tenantId, or: $value.tenantId),
              boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ReferralSearchModelCopyWith<$R2, ReferralSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralSearchModelCopyWithImpl($value, $cast, t);
}

class ReferralModelMapper extends SubClassMapperBase<ReferralModel> {
  ReferralModelMapper._();

  static ReferralModelMapper? _instance;
  static ReferralModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReferralModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralModel';

  static ReferralAdditionalFields? _$additionalFields(ReferralModel v) =>
      v.additionalFields;
  static const Field<ReferralModel, ReferralAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ReferralModel v) => v.id;
  static const Field<ReferralModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(ReferralModel v) => v.projectId;
  static const Field<ReferralModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$projectBeneficiaryClientReferenceId(ReferralModel v) =>
      v.projectBeneficiaryClientReferenceId;
  static const Field<ReferralModel, String>
      _f$projectBeneficiaryClientReferenceId = Field(
          'projectBeneficiaryClientReferenceId',
          _$projectBeneficiaryClientReferenceId,
          opt: true);
  static String? _$referrerId(ReferralModel v) => v.referrerId;
  static const Field<ReferralModel, String> _f$referrerId =
      Field('referrerId', _$referrerId, opt: true);
  static String? _$recipientType(ReferralModel v) => v.recipientType;
  static const Field<ReferralModel, String> _f$recipientType =
      Field('recipientType', _$recipientType, opt: true);
  static String? _$recipientId(ReferralModel v) => v.recipientId;
  static const Field<ReferralModel, String> _f$recipientId =
      Field('recipientId', _$recipientId, opt: true);
  static List<String>? _$reasons(ReferralModel v) => v.reasons;
  static const Field<ReferralModel, List<String>> _f$reasons =
      Field('reasons', _$reasons, opt: true);
  static bool? _$nonRecoverableError(ReferralModel v) => v.nonRecoverableError;
  static const Field<ReferralModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(ReferralModel v) => v.clientReferenceId;
  static const Field<ReferralModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ReferralModel v) => v.tenantId;
  static const Field<ReferralModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ReferralModel v) => v.rowVersion;
  static const Field<ReferralModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(ReferralModel v) => v.auditDetails;
  static const Field<ReferralModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ReferralModel v) =>
      v.clientAuditDetails;
  static const Field<ReferralModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ReferralModel v) => v.isDeleted;
  static const Field<ReferralModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ReferralModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #projectBeneficiaryClientReferenceId:
        _f$projectBeneficiaryClientReferenceId,
    #referrerId: _f$referrerId,
    #recipientType: _f$recipientType,
    #recipientId: _f$recipientId,
    #reasons: _f$reasons,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
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

  static ReferralModel _instantiate(DecodingData data) {
    return ReferralModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        projectBeneficiaryClientReferenceId:
            data.dec(_f$projectBeneficiaryClientReferenceId),
        referrerId: data.dec(_f$referrerId),
        recipientType: data.dec(_f$recipientType),
        recipientId: data.dec(_f$recipientId),
        reasons: data.dec(_f$reasons),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralModel>(map);
  }

  static ReferralModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralModel>(json);
  }
}

mixin ReferralModelMappable {
  String toJson() {
    return ReferralModelMapper.ensureInitialized()
        .encodeJson<ReferralModel>(this as ReferralModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralModelMapper.ensureInitialized()
        .encodeMap<ReferralModel>(this as ReferralModel);
  }

  ReferralModelCopyWith<ReferralModel, ReferralModel, ReferralModel>
      get copyWith => _ReferralModelCopyWithImpl(
          this as ReferralModel, $identity, $identity);
  @override
  String toString() {
    return ReferralModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralModelMapper.ensureInitialized()
                .isValueEqual(this as ReferralModel, other));
  }

  @override
  int get hashCode {
    return ReferralModelMapper.ensureInitialized()
        .hashValue(this as ReferralModel);
  }
}

extension ReferralModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralModel, $Out> {
  ReferralModelCopyWith<$R, ReferralModel, $Out> get $asReferralModel =>
      $base.as((v, t, t2) => _ReferralModelCopyWithImpl(v, t, t2));
}

abstract class ReferralModelCopyWith<$R, $In extends ReferralModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields,
      ReferralAdditionalFields>? get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reasons;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ReferralAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      String? projectBeneficiaryClientReferenceId,
      String? referrerId,
      String? recipientType,
      String? recipientId,
      List<String>? reasons,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ReferralModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralModel, $Out>
    implements ReferralModelCopyWith<$R, ReferralModel, $Out> {
  _ReferralModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralModel> $mapper =
      ReferralModelMapper.ensureInitialized();
  @override
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields,
          ReferralAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reasons =>
      $value.reasons != null
          ? ListCopyWith(
              $value.reasons!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(reasons: v))
          : null;
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
          Object? projectBeneficiaryClientReferenceId = $none,
          Object? referrerId = $none,
          Object? recipientType = $none,
          Object? recipientId = $none,
          Object? reasons = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (projectBeneficiaryClientReferenceId != $none)
          #projectBeneficiaryClientReferenceId:
              projectBeneficiaryClientReferenceId,
        if (referrerId != $none) #referrerId: referrerId,
        if (recipientType != $none) #recipientType: recipientType,
        if (recipientId != $none) #recipientId: recipientId,
        if (reasons != $none) #reasons: reasons,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ReferralModel $make(CopyWithData data) => ReferralModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      projectBeneficiaryClientReferenceId: data.get(
          #projectBeneficiaryClientReferenceId,
          or: $value.projectBeneficiaryClientReferenceId),
      referrerId: data.get(#referrerId, or: $value.referrerId),
      recipientType: data.get(#recipientType, or: $value.recipientType),
      recipientId: data.get(#recipientId, or: $value.recipientId),
      reasons: data.get(#reasons, or: $value.reasons),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ReferralModelCopyWith<$R2, ReferralModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralModelCopyWithImpl($value, $cast, t);
}

class ReferralAdditionalFieldsMapper
    extends SubClassMapperBase<ReferralAdditionalFields> {
  ReferralAdditionalFieldsMapper._();

  static ReferralAdditionalFieldsMapper? _instance;
  static ReferralAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralAdditionalFields';

  static String _$schema(ReferralAdditionalFields v) => v.schema;
  static const Field<ReferralAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Referral');
  static int _$version(ReferralAdditionalFields v) => v.version;
  static const Field<ReferralAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ReferralAdditionalFields v) => v.fields;
  static const Field<ReferralAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ReferralAdditionalFields> fields = const {
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

  static ReferralAdditionalFields _instantiate(DecodingData data) {
    return ReferralAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralAdditionalFields>(map);
  }

  static ReferralAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralAdditionalFields>(json);
  }
}

mixin ReferralAdditionalFieldsMappable {
  String toJson() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ReferralAdditionalFields>(this as ReferralAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ReferralAdditionalFields>(this as ReferralAdditionalFields);
  }

  ReferralAdditionalFieldsCopyWith<ReferralAdditionalFields,
          ReferralAdditionalFields, ReferralAdditionalFields>
      get copyWith => _ReferralAdditionalFieldsCopyWithImpl(
          this as ReferralAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ReferralAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ReferralAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ReferralAdditionalFields);
  }
}

extension ReferralAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralAdditionalFields, $Out> {
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields, $Out>
      get $asReferralAdditionalFields => $base
          .as((v, t, t2) => _ReferralAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ReferralAdditionalFieldsCopyWith<
    $R,
    $In extends ReferralAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ReferralAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralAdditionalFields, $Out>
    implements
        ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields, $Out> {
  _ReferralAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralAdditionalFields> $mapper =
      ReferralAdditionalFieldsMapper.ensureInitialized();
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
  ReferralAdditionalFields $make(CopyWithData data) => ReferralAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  ReferralAdditionalFieldsCopyWith<$R2, ReferralAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralAdditionalFieldsCopyWithImpl($value, $cast, t);
}
