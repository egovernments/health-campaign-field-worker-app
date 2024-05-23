// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'document.dart';

class DocumentSearchModelMapper
    extends SubClassMapperBase<DocumentSearchModel> {
  DocumentSearchModelMapper._();

  static DocumentSearchModelMapper? _instance;
  static DocumentSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DocumentSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DocumentSearchModel';

  static List<String>? _$clientReferenceId(DocumentSearchModel v) =>
      v.clientReferenceId;
  static const Field<DocumentSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(DocumentSearchModel v) => v.tenantId;
  static const Field<DocumentSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(DocumentSearchModel v) => v.boundaryCode;
  static const Field<DocumentSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(DocumentSearchModel v) => v.auditDetails;
  static const Field<DocumentSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(DocumentSearchModel v) =>
      v.additionalFields;
  static const Field<DocumentSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<DocumentSearchModel> fields = const {
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

  static DocumentSearchModel _instantiate(DecodingData data) {
    return DocumentSearchModel.ignoreDeleted(
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static DocumentSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DocumentSearchModel>(map);
  }

  static DocumentSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<DocumentSearchModel>(json);
  }
}

mixin DocumentSearchModelMappable {
  String toJson() {
    return DocumentSearchModelMapper.ensureInitialized()
        .encodeJson<DocumentSearchModel>(this as DocumentSearchModel);
  }

  Map<String, dynamic> toMap() {
    return DocumentSearchModelMapper.ensureInitialized()
        .encodeMap<DocumentSearchModel>(this as DocumentSearchModel);
  }

  DocumentSearchModelCopyWith<DocumentSearchModel, DocumentSearchModel,
          DocumentSearchModel>
      get copyWith => _DocumentSearchModelCopyWithImpl(
          this as DocumentSearchModel, $identity, $identity);
  @override
  String toString() {
    return DocumentSearchModelMapper.ensureInitialized()
        .stringifyValue(this as DocumentSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DocumentSearchModelMapper.ensureInitialized()
                .isValueEqual(this as DocumentSearchModel, other));
  }

  @override
  int get hashCode {
    return DocumentSearchModelMapper.ensureInitialized()
        .hashValue(this as DocumentSearchModel);
  }
}

extension DocumentSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DocumentSearchModel, $Out> {
  DocumentSearchModelCopyWith<$R, DocumentSearchModel, $Out>
      get $asDocumentSearchModel =>
          $base.as((v, t, t2) => _DocumentSearchModelCopyWithImpl(v, t, t2));
}

abstract class DocumentSearchModelCopyWith<$R, $In extends DocumentSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  DocumentSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DocumentSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DocumentSearchModel, $Out>
    implements DocumentSearchModelCopyWith<$R, DocumentSearchModel, $Out> {
  _DocumentSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DocumentSearchModel> $mapper =
      DocumentSearchModelMapper.ensureInitialized();
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
          {Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  DocumentSearchModel $make(
          CopyWithData data) =>
      DocumentSearchModel.ignoreDeleted(
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  DocumentSearchModelCopyWith<$R2, DocumentSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DocumentSearchModelCopyWithImpl($value, $cast, t);
}

class DocumentModelMapper extends SubClassMapperBase<DocumentModel> {
  DocumentModelMapper._();

  static DocumentModelMapper? _instance;
  static DocumentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DocumentModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DocumentModel';

  static DocumentAdditionalFields? _$additionalFields(DocumentModel v) =>
      v.additionalFields;
  static const Field<DocumentModel, DocumentAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(DocumentModel v) => v.id;
  static const Field<DocumentModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$documentType(DocumentModel v) => v.documentType;
  static const Field<DocumentModel, String> _f$documentType =
      Field('documentType', _$documentType, opt: true);
  static String? _$fileStoreId(DocumentModel v) => v.fileStoreId;
  static const Field<DocumentModel, String> _f$fileStoreId =
      Field('fileStoreId', _$fileStoreId, opt: true);
  static String? _$documentUid(DocumentModel v) => v.documentUid;
  static const Field<DocumentModel, String> _f$documentUid =
      Field('documentUid', _$documentUid, opt: true);
  static bool? _$nonRecoverableError(DocumentModel v) => v.nonRecoverableError;
  static const Field<DocumentModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(DocumentModel v) => v.clientReferenceId;
  static const Field<DocumentModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(DocumentModel v) => v.tenantId;
  static const Field<DocumentModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(DocumentModel v) => v.rowVersion;
  static const Field<DocumentModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(DocumentModel v) => v.auditDetails;
  static const Field<DocumentModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(DocumentModel v) =>
      v.clientAuditDetails;
  static const Field<DocumentModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(DocumentModel v) => v.isDeleted;
  static const Field<DocumentModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<DocumentModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #documentType: _f$documentType,
    #fileStoreId: _f$fileStoreId,
    #documentUid: _f$documentUid,
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

  static DocumentModel _instantiate(DecodingData data) {
    return DocumentModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        documentType: data.dec(_f$documentType),
        fileStoreId: data.dec(_f$fileStoreId),
        documentUid: data.dec(_f$documentUid),
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

  static DocumentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DocumentModel>(map);
  }

  static DocumentModel fromJson(String json) {
    return ensureInitialized().decodeJson<DocumentModel>(json);
  }
}

mixin DocumentModelMappable {
  String toJson() {
    return DocumentModelMapper.ensureInitialized()
        .encodeJson<DocumentModel>(this as DocumentModel);
  }

  Map<String, dynamic> toMap() {
    return DocumentModelMapper.ensureInitialized()
        .encodeMap<DocumentModel>(this as DocumentModel);
  }

  DocumentModelCopyWith<DocumentModel, DocumentModel, DocumentModel>
      get copyWith => _DocumentModelCopyWithImpl(
          this as DocumentModel, $identity, $identity);
  @override
  String toString() {
    return DocumentModelMapper.ensureInitialized()
        .stringifyValue(this as DocumentModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DocumentModelMapper.ensureInitialized()
                .isValueEqual(this as DocumentModel, other));
  }

  @override
  int get hashCode {
    return DocumentModelMapper.ensureInitialized()
        .hashValue(this as DocumentModel);
  }
}

extension DocumentModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DocumentModel, $Out> {
  DocumentModelCopyWith<$R, DocumentModel, $Out> get $asDocumentModel =>
      $base.as((v, t, t2) => _DocumentModelCopyWithImpl(v, t, t2));
}

abstract class DocumentModelCopyWith<$R, $In extends DocumentModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  DocumentAdditionalFieldsCopyWith<$R, DocumentAdditionalFields,
      DocumentAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {DocumentAdditionalFields? additionalFields,
      String? id,
      String? documentType,
      String? fileStoreId,
      String? documentUid,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  DocumentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DocumentModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DocumentModel, $Out>
    implements DocumentModelCopyWith<$R, DocumentModel, $Out> {
  _DocumentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DocumentModel> $mapper =
      DocumentModelMapper.ensureInitialized();
  @override
  DocumentAdditionalFieldsCopyWith<$R, DocumentAdditionalFields,
          DocumentAdditionalFields>?
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
          Object? documentType = $none,
          Object? fileStoreId = $none,
          Object? documentUid = $none,
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
        if (documentType != $none) #documentType: documentType,
        if (fileStoreId != $none) #fileStoreId: fileStoreId,
        if (documentUid != $none) #documentUid: documentUid,
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
  DocumentModel $make(CopyWithData data) => DocumentModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      documentType: data.get(#documentType, or: $value.documentType),
      fileStoreId: data.get(#fileStoreId, or: $value.fileStoreId),
      documentUid: data.get(#documentUid, or: $value.documentUid),
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
  DocumentModelCopyWith<$R2, DocumentModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DocumentModelCopyWithImpl($value, $cast, t);
}

class DocumentAdditionalFieldsMapper
    extends SubClassMapperBase<DocumentAdditionalFields> {
  DocumentAdditionalFieldsMapper._();

  static DocumentAdditionalFieldsMapper? _instance;
  static DocumentAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DocumentAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DocumentAdditionalFields';

  static String _$schema(DocumentAdditionalFields v) => v.schema;
  static const Field<DocumentAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Document');
  static int _$version(DocumentAdditionalFields v) => v.version;
  static const Field<DocumentAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(DocumentAdditionalFields v) => v.fields;
  static const Field<DocumentAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<DocumentAdditionalFields> fields = const {
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

  static DocumentAdditionalFields _instantiate(DecodingData data) {
    return DocumentAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static DocumentAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DocumentAdditionalFields>(map);
  }

  static DocumentAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<DocumentAdditionalFields>(json);
  }
}

mixin DocumentAdditionalFieldsMappable {
  String toJson() {
    return DocumentAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<DocumentAdditionalFields>(this as DocumentAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return DocumentAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<DocumentAdditionalFields>(this as DocumentAdditionalFields);
  }

  DocumentAdditionalFieldsCopyWith<DocumentAdditionalFields,
          DocumentAdditionalFields, DocumentAdditionalFields>
      get copyWith => _DocumentAdditionalFieldsCopyWithImpl(
          this as DocumentAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return DocumentAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as DocumentAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DocumentAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as DocumentAdditionalFields, other));
  }

  @override
  int get hashCode {
    return DocumentAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as DocumentAdditionalFields);
  }
}

extension DocumentAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DocumentAdditionalFields, $Out> {
  DocumentAdditionalFieldsCopyWith<$R, DocumentAdditionalFields, $Out>
      get $asDocumentAdditionalFields => $base
          .as((v, t, t2) => _DocumentAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class DocumentAdditionalFieldsCopyWith<
    $R,
    $In extends DocumentAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  DocumentAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DocumentAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DocumentAdditionalFields, $Out>
    implements
        DocumentAdditionalFieldsCopyWith<$R, DocumentAdditionalFields, $Out> {
  _DocumentAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DocumentAdditionalFields> $mapper =
      DocumentAdditionalFieldsMapper.ensureInitialized();
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
  DocumentAdditionalFields $make(CopyWithData data) => DocumentAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  DocumentAdditionalFieldsCopyWith<$R2, DocumentAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DocumentAdditionalFieldsCopyWithImpl($value, $cast, t);
}
