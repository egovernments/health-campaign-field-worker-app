// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'face_auth_event.dart';

class FaceAuthEventSearchModelMapper
    extends SubClassMapperBase<FaceAuthEventSearchModel> {
  FaceAuthEventSearchModelMapper._();

  static FaceAuthEventSearchModelMapper? _instance;
  static FaceAuthEventSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FaceAuthEventSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FaceAuthEventSearchModel';

  static String? _$individualId(FaceAuthEventSearchModel v) => v.individualId;
  static const Field<FaceAuthEventSearchModel, String> _f$individualId =
      Field('individualId', _$individualId);
  static String? _$eventType(FaceAuthEventSearchModel v) => v.eventType;
  static const Field<FaceAuthEventSearchModel, String> _f$eventType =
      Field('eventType', _$eventType);
  static String? _$outcome(FaceAuthEventSearchModel v) => v.outcome;
  static const Field<FaceAuthEventSearchModel, String> _f$outcome =
      Field('outcome', _$outcome);
  static String? _$projectId(FaceAuthEventSearchModel v) => v.projectId;
  static const Field<FaceAuthEventSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static List<String>? _$clientReferenceId(FaceAuthEventSearchModel v) =>
      v.clientReferenceId;
  static const Field<FaceAuthEventSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$boundaryCode(FaceAuthEventSearchModel v) => v.boundaryCode;
  static const Field<FaceAuthEventSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(FaceAuthEventSearchModel v) =>
      v.auditDetails;
  static const Field<FaceAuthEventSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static AdditionalFields? _$additionalFields(FaceAuthEventSearchModel v) =>
      v.additionalFields;
  static const Field<FaceAuthEventSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<FaceAuthEventSearchModel> fields = const {
    #individualId: _f$individualId,
    #eventType: _f$eventType,
    #outcome: _f$outcome,
    #projectId: _f$projectId,
    #clientReferenceId: _f$clientReferenceId,
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

  static FaceAuthEventSearchModel _instantiate(DecodingData data) {
    return FaceAuthEventSearchModel.ignoreDeleted(
        individualId: data.dec(_f$individualId),
        eventType: data.dec(_f$eventType),
        outcome: data.dec(_f$outcome),
        projectId: data.dec(_f$projectId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        boundaryCode: data.dec(_f$boundaryCode),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static FaceAuthEventSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FaceAuthEventSearchModel>(map);
  }

  static FaceAuthEventSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<FaceAuthEventSearchModel>(json);
  }
}

mixin FaceAuthEventSearchModelMappable {
  String toJson() {
    return FaceAuthEventSearchModelMapper.ensureInitialized()
        .encodeJson<FaceAuthEventSearchModel>(this as FaceAuthEventSearchModel);
  }

  Map<String, dynamic> toMap() {
    return FaceAuthEventSearchModelMapper.ensureInitialized()
        .encodeMap<FaceAuthEventSearchModel>(this as FaceAuthEventSearchModel);
  }

  FaceAuthEventSearchModelCopyWith<FaceAuthEventSearchModel,
          FaceAuthEventSearchModel, FaceAuthEventSearchModel>
      get copyWith => _FaceAuthEventSearchModelCopyWithImpl(
          this as FaceAuthEventSearchModel, $identity, $identity);
  @override
  String toString() {
    return FaceAuthEventSearchModelMapper.ensureInitialized()
        .stringifyValue(this as FaceAuthEventSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return FaceAuthEventSearchModelMapper.ensureInitialized()
        .equalsValue(this as FaceAuthEventSearchModel, other);
  }

  @override
  int get hashCode {
    return FaceAuthEventSearchModelMapper.ensureInitialized()
        .hashValue(this as FaceAuthEventSearchModel);
  }
}

extension FaceAuthEventSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FaceAuthEventSearchModel, $Out> {
  FaceAuthEventSearchModelCopyWith<$R, FaceAuthEventSearchModel, $Out>
      get $asFaceAuthEventSearchModel => $base
          .as((v, t, t2) => _FaceAuthEventSearchModelCopyWithImpl(v, t, t2));
}

abstract class FaceAuthEventSearchModelCopyWith<
    $R,
    $In extends FaceAuthEventSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? individualId,
      String? eventType,
      String? outcome,
      String? projectId,
      List<String>? clientReferenceId,
      String? boundaryCode,
      AuditDetails? auditDetails});
  FaceAuthEventSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FaceAuthEventSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FaceAuthEventSearchModel, $Out>
    implements
        FaceAuthEventSearchModelCopyWith<$R, FaceAuthEventSearchModel, $Out> {
  _FaceAuthEventSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FaceAuthEventSearchModel> $mapper =
      FaceAuthEventSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? individualId = $none,
          Object? eventType = $none,
          Object? outcome = $none,
          Object? projectId = $none,
          Object? clientReferenceId = $none,
          Object? boundaryCode = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (individualId != $none) #individualId: individualId,
        if (eventType != $none) #eventType: eventType,
        if (outcome != $none) #outcome: outcome,
        if (projectId != $none) #projectId: projectId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  FaceAuthEventSearchModel $make(CopyWithData data) =>
      FaceAuthEventSearchModel.ignoreDeleted(
          individualId: data.get(#individualId, or: $value.individualId),
          eventType: data.get(#eventType, or: $value.eventType),
          outcome: data.get(#outcome, or: $value.outcome),
          projectId: data.get(#projectId, or: $value.projectId),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  FaceAuthEventSearchModelCopyWith<$R2, FaceAuthEventSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FaceAuthEventSearchModelCopyWithImpl($value, $cast, t);
}

class FaceAuthEventModelMapper extends SubClassMapperBase<FaceAuthEventModel> {
  FaceAuthEventModelMapper._();

  static FaceAuthEventModelMapper? _instance;
  static FaceAuthEventModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FaceAuthEventModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FaceAuthEventModel';

  static FaceAuthEventAdditionalFields? _$additionalFields(
          FaceAuthEventModel v) =>
      v.additionalFields;
  static const Field<FaceAuthEventModel, FaceAuthEventAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$clientReferenceId(FaceAuthEventModel v) =>
      v.clientReferenceId;
  static const Field<FaceAuthEventModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String _$individualId(FaceAuthEventModel v) => v.individualId;
  static const Field<FaceAuthEventModel, String> _f$individualId =
      Field('individualId', _$individualId);
  static String _$deviceId(FaceAuthEventModel v) => v.deviceId;
  static const Field<FaceAuthEventModel, String> _f$deviceId =
      Field('deviceId', _$deviceId, opt: true, def: '');
  static String _$eventType(FaceAuthEventModel v) => v.eventType;
  static const Field<FaceAuthEventModel, String> _f$eventType =
      Field('eventType', _$eventType);
  static String _$outcome(FaceAuthEventModel v) => v.outcome;
  static const Field<FaceAuthEventModel, String> _f$outcome =
      Field('outcome', _$outcome);
  static double _$confidence(FaceAuthEventModel v) => v.confidence;
  static const Field<FaceAuthEventModel, double> _f$confidence =
      Field('confidence', _$confidence, opt: true, def: 0.0);
  static double _$latitude(FaceAuthEventModel v) => v.latitude;
  static const Field<FaceAuthEventModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true, def: 0.0);
  static double _$longitude(FaceAuthEventModel v) => v.longitude;
  static const Field<FaceAuthEventModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true, def: 0.0);
  static double _$locationAccuracy(FaceAuthEventModel v) => v.locationAccuracy;
  static const Field<FaceAuthEventModel, double> _f$locationAccuracy =
      Field('locationAccuracy', _$locationAccuracy, opt: true, def: 0.0);
  static int _$timestamp(FaceAuthEventModel v) => v.timestamp;
  static const Field<FaceAuthEventModel, int> _f$timestamp =
      Field('timestamp', _$timestamp);
  static int? _$syncTimestamp(FaceAuthEventModel v) => v.syncTimestamp;
  static const Field<FaceAuthEventModel, int> _f$syncTimestamp =
      Field('syncTimestamp', _$syncTimestamp, opt: true);
  static String? _$fallbackReason(FaceAuthEventModel v) => v.fallbackReason;
  static const Field<FaceAuthEventModel, String> _f$fallbackReason =
      Field('fallbackReason', _$fallbackReason, opt: true);
  static int _$failedAttemptCount(FaceAuthEventModel v) => v.failedAttemptCount;
  static const Field<FaceAuthEventModel, int> _f$failedAttemptCount =
      Field('failedAttemptCount', _$failedAttemptCount, opt: true, def: 0);
  static int? _$popupTime(FaceAuthEventModel v) => v.popupTime;
  static const Field<FaceAuthEventModel, int> _f$popupTime =
      Field('popupTime', _$popupTime, opt: true);
  static int? _$responseTime(FaceAuthEventModel v) => v.responseTime;
  static const Field<FaceAuthEventModel, int> _f$responseTime =
      Field('responseTime', _$responseTime, opt: true);
  static String? _$responseType(FaceAuthEventModel v) => v.responseType;
  static const Field<FaceAuthEventModel, String> _f$responseType =
      Field('responseType', _$responseType, opt: true);
  static String _$projectId(FaceAuthEventModel v) => v.projectId;
  static const Field<FaceAuthEventModel, String> _f$projectId =
      Field('projectId', _$projectId);
  static String? _$anomalyFlags(FaceAuthEventModel v) => v.anomalyFlags;
  static const Field<FaceAuthEventModel, String> _f$anomalyFlags =
      Field('anomalyFlags', _$anomalyFlags, opt: true);
  static String? _$faceImage(FaceAuthEventModel v) => v.faceImage;
  static const Field<FaceAuthEventModel, String> _f$faceImage =
      Field('faceImage', _$faceImage, opt: true);
  static bool _$isSync(FaceAuthEventModel v) => v.isSync;
  static const Field<FaceAuthEventModel, bool> _f$isSync =
      Field('isSync', _$isSync, opt: true, def: false);
  static String _$boundaryCode(FaceAuthEventModel v) => v.boundaryCode;
  static const Field<FaceAuthEventModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true, def: '');
  static bool? _$nonRecoverableError(FaceAuthEventModel v) =>
      v.nonRecoverableError;
  static const Field<FaceAuthEventModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(FaceAuthEventModel v) => v.tenantId;
  static const Field<FaceAuthEventModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(FaceAuthEventModel v) => v.rowVersion;
  static const Field<FaceAuthEventModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$id(FaceAuthEventModel v) => v.id;
  static const Field<FaceAuthEventModel, String> _f$id =
      Field('id', _$id, opt: true);
  static AuditDetails? _$auditDetails(FaceAuthEventModel v) => v.auditDetails;
  static const Field<FaceAuthEventModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(FaceAuthEventModel v) =>
      v.clientAuditDetails;
  static const Field<FaceAuthEventModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(FaceAuthEventModel v) => v.isDeleted;
  static const Field<FaceAuthEventModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<FaceAuthEventModel> fields = const {
    #additionalFields: _f$additionalFields,
    #clientReferenceId: _f$clientReferenceId,
    #individualId: _f$individualId,
    #deviceId: _f$deviceId,
    #eventType: _f$eventType,
    #outcome: _f$outcome,
    #confidence: _f$confidence,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #locationAccuracy: _f$locationAccuracy,
    #timestamp: _f$timestamp,
    #syncTimestamp: _f$syncTimestamp,
    #fallbackReason: _f$fallbackReason,
    #failedAttemptCount: _f$failedAttemptCount,
    #popupTime: _f$popupTime,
    #responseTime: _f$responseTime,
    #responseType: _f$responseType,
    #projectId: _f$projectId,
    #anomalyFlags: _f$anomalyFlags,
    #faceImage: _f$faceImage,
    #isSync: _f$isSync,
    #boundaryCode: _f$boundaryCode,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #id: _f$id,
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

  static FaceAuthEventModel _instantiate(DecodingData data) {
    return FaceAuthEventModel(
        additionalFields: data.dec(_f$additionalFields),
        clientReferenceId: data.dec(_f$clientReferenceId),
        individualId: data.dec(_f$individualId),
        deviceId: data.dec(_f$deviceId),
        eventType: data.dec(_f$eventType),
        outcome: data.dec(_f$outcome),
        confidence: data.dec(_f$confidence),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        locationAccuracy: data.dec(_f$locationAccuracy),
        timestamp: data.dec(_f$timestamp),
        syncTimestamp: data.dec(_f$syncTimestamp),
        fallbackReason: data.dec(_f$fallbackReason),
        failedAttemptCount: data.dec(_f$failedAttemptCount),
        popupTime: data.dec(_f$popupTime),
        responseTime: data.dec(_f$responseTime),
        responseType: data.dec(_f$responseType),
        projectId: data.dec(_f$projectId),
        anomalyFlags: data.dec(_f$anomalyFlags),
        faceImage: data.dec(_f$faceImage),
        isSync: data.dec(_f$isSync),
        boundaryCode: data.dec(_f$boundaryCode),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        id: data.dec(_f$id),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static FaceAuthEventModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FaceAuthEventModel>(map);
  }

  static FaceAuthEventModel fromJson(String json) {
    return ensureInitialized().decodeJson<FaceAuthEventModel>(json);
  }
}

mixin FaceAuthEventModelMappable {
  String toJson() {
    return FaceAuthEventModelMapper.ensureInitialized()
        .encodeJson<FaceAuthEventModel>(this as FaceAuthEventModel);
  }

  Map<String, dynamic> toMap() {
    return FaceAuthEventModelMapper.ensureInitialized()
        .encodeMap<FaceAuthEventModel>(this as FaceAuthEventModel);
  }

  FaceAuthEventModelCopyWith<FaceAuthEventModel, FaceAuthEventModel,
          FaceAuthEventModel>
      get copyWith => _FaceAuthEventModelCopyWithImpl(
          this as FaceAuthEventModel, $identity, $identity);
  @override
  String toString() {
    return FaceAuthEventModelMapper.ensureInitialized()
        .stringifyValue(this as FaceAuthEventModel);
  }

  @override
  bool operator ==(Object other) {
    return FaceAuthEventModelMapper.ensureInitialized()
        .equalsValue(this as FaceAuthEventModel, other);
  }

  @override
  int get hashCode {
    return FaceAuthEventModelMapper.ensureInitialized()
        .hashValue(this as FaceAuthEventModel);
  }
}

extension FaceAuthEventModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FaceAuthEventModel, $Out> {
  FaceAuthEventModelCopyWith<$R, FaceAuthEventModel, $Out>
      get $asFaceAuthEventModel =>
          $base.as((v, t, t2) => _FaceAuthEventModelCopyWithImpl(v, t, t2));
}

abstract class FaceAuthEventModelCopyWith<$R, $In extends FaceAuthEventModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  FaceAuthEventAdditionalFieldsCopyWith<$R, FaceAuthEventAdditionalFields,
      FaceAuthEventAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {FaceAuthEventAdditionalFields? additionalFields,
      String? clientReferenceId,
      String? individualId,
      String? deviceId,
      String? eventType,
      String? outcome,
      double? confidence,
      double? latitude,
      double? longitude,
      double? locationAccuracy,
      int? timestamp,
      int? syncTimestamp,
      String? fallbackReason,
      int? failedAttemptCount,
      int? popupTime,
      int? responseTime,
      String? responseType,
      String? projectId,
      String? anomalyFlags,
      String? faceImage,
      bool? isSync,
      String? boundaryCode,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      String? id,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  FaceAuthEventModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FaceAuthEventModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FaceAuthEventModel, $Out>
    implements FaceAuthEventModelCopyWith<$R, FaceAuthEventModel, $Out> {
  _FaceAuthEventModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FaceAuthEventModel> $mapper =
      FaceAuthEventModelMapper.ensureInitialized();
  @override
  FaceAuthEventAdditionalFieldsCopyWith<$R, FaceAuthEventAdditionalFields,
          FaceAuthEventAdditionalFields>?
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
          String? clientReferenceId,
          String? individualId,
          String? deviceId,
          String? eventType,
          String? outcome,
          double? confidence,
          double? latitude,
          double? longitude,
          double? locationAccuracy,
          int? timestamp,
          Object? syncTimestamp = $none,
          Object? fallbackReason = $none,
          int? failedAttemptCount,
          Object? popupTime = $none,
          Object? responseTime = $none,
          Object? responseType = $none,
          String? projectId,
          Object? anomalyFlags = $none,
          Object? faceImage = $none,
          bool? isSync,
          String? boundaryCode,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? id = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (individualId != null) #individualId: individualId,
        if (deviceId != null) #deviceId: deviceId,
        if (eventType != null) #eventType: eventType,
        if (outcome != null) #outcome: outcome,
        if (confidence != null) #confidence: confidence,
        if (latitude != null) #latitude: latitude,
        if (longitude != null) #longitude: longitude,
        if (locationAccuracy != null) #locationAccuracy: locationAccuracy,
        if (timestamp != null) #timestamp: timestamp,
        if (syncTimestamp != $none) #syncTimestamp: syncTimestamp,
        if (fallbackReason != $none) #fallbackReason: fallbackReason,
        if (failedAttemptCount != null) #failedAttemptCount: failedAttemptCount,
        if (popupTime != $none) #popupTime: popupTime,
        if (responseTime != $none) #responseTime: responseTime,
        if (responseType != $none) #responseType: responseType,
        if (projectId != null) #projectId: projectId,
        if (anomalyFlags != $none) #anomalyFlags: anomalyFlags,
        if (faceImage != $none) #faceImage: faceImage,
        if (isSync != null) #isSync: isSync,
        if (boundaryCode != null) #boundaryCode: boundaryCode,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (id != $none) #id: id,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  FaceAuthEventModel $make(CopyWithData data) => FaceAuthEventModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      individualId: data.get(#individualId, or: $value.individualId),
      deviceId: data.get(#deviceId, or: $value.deviceId),
      eventType: data.get(#eventType, or: $value.eventType),
      outcome: data.get(#outcome, or: $value.outcome),
      confidence: data.get(#confidence, or: $value.confidence),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      locationAccuracy:
          data.get(#locationAccuracy, or: $value.locationAccuracy),
      timestamp: data.get(#timestamp, or: $value.timestamp),
      syncTimestamp: data.get(#syncTimestamp, or: $value.syncTimestamp),
      fallbackReason: data.get(#fallbackReason, or: $value.fallbackReason),
      failedAttemptCount:
          data.get(#failedAttemptCount, or: $value.failedAttemptCount),
      popupTime: data.get(#popupTime, or: $value.popupTime),
      responseTime: data.get(#responseTime, or: $value.responseTime),
      responseType: data.get(#responseType, or: $value.responseType),
      projectId: data.get(#projectId, or: $value.projectId),
      anomalyFlags: data.get(#anomalyFlags, or: $value.anomalyFlags),
      faceImage: data.get(#faceImage, or: $value.faceImage),
      isSync: data.get(#isSync, or: $value.isSync),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      id: data.get(#id, or: $value.id),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  FaceAuthEventModelCopyWith<$R2, FaceAuthEventModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FaceAuthEventModelCopyWithImpl($value, $cast, t);
}

class FaceAuthEventAdditionalFieldsMapper
    extends SubClassMapperBase<FaceAuthEventAdditionalFields> {
  FaceAuthEventAdditionalFieldsMapper._();

  static FaceAuthEventAdditionalFieldsMapper? _instance;
  static FaceAuthEventAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FaceAuthEventAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FaceAuthEventAdditionalFields';

  static String _$schema(FaceAuthEventAdditionalFields v) => v.schema;
  static const Field<FaceAuthEventAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'FaceAuthEvent');
  static int _$version(FaceAuthEventAdditionalFields v) => v.version;
  static const Field<FaceAuthEventAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(FaceAuthEventAdditionalFields v) =>
      v.fields;
  static const Field<FaceAuthEventAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<FaceAuthEventAdditionalFields> fields = const {
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

  static FaceAuthEventAdditionalFields _instantiate(DecodingData data) {
    return FaceAuthEventAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static FaceAuthEventAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FaceAuthEventAdditionalFields>(map);
  }

  static FaceAuthEventAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<FaceAuthEventAdditionalFields>(json);
  }
}

mixin FaceAuthEventAdditionalFieldsMappable {
  String toJson() {
    return FaceAuthEventAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<FaceAuthEventAdditionalFields>(
            this as FaceAuthEventAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return FaceAuthEventAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<FaceAuthEventAdditionalFields>(
            this as FaceAuthEventAdditionalFields);
  }

  FaceAuthEventAdditionalFieldsCopyWith<FaceAuthEventAdditionalFields,
          FaceAuthEventAdditionalFields, FaceAuthEventAdditionalFields>
      get copyWith => _FaceAuthEventAdditionalFieldsCopyWithImpl(
          this as FaceAuthEventAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return FaceAuthEventAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as FaceAuthEventAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return FaceAuthEventAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as FaceAuthEventAdditionalFields, other);
  }

  @override
  int get hashCode {
    return FaceAuthEventAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as FaceAuthEventAdditionalFields);
  }
}

extension FaceAuthEventAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FaceAuthEventAdditionalFields, $Out> {
  FaceAuthEventAdditionalFieldsCopyWith<$R, FaceAuthEventAdditionalFields, $Out>
      get $asFaceAuthEventAdditionalFields => $base.as(
          (v, t, t2) => _FaceAuthEventAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class FaceAuthEventAdditionalFieldsCopyWith<
    $R,
    $In extends FaceAuthEventAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  FaceAuthEventAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FaceAuthEventAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FaceAuthEventAdditionalFields, $Out>
    implements
        FaceAuthEventAdditionalFieldsCopyWith<$R, FaceAuthEventAdditionalFields,
            $Out> {
  _FaceAuthEventAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FaceAuthEventAdditionalFields> $mapper =
      FaceAuthEventAdditionalFieldsMapper.ensureInitialized();
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
  FaceAuthEventAdditionalFields $make(CopyWithData data) =>
      FaceAuthEventAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  FaceAuthEventAdditionalFieldsCopyWith<$R2, FaceAuthEventAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FaceAuthEventAdditionalFieldsCopyWithImpl($value, $cast, t);
}
