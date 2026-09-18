import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data_model.dart';

part 'face_auth_event.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FaceAuthEventSearchModel extends EntitySearchModel
    with FaceAuthEventSearchModelMappable {
  final String? individualId;
  final String? eventType;
  final String? outcome;
  final String? projectId;
  final List<String>? clientReferenceId;

  FaceAuthEventSearchModel({
    this.individualId,
    this.eventType,
    this.outcome,
    this.projectId,
    this.clientReferenceId,
    super.isDeleted,
    super.boundaryCode,
    super.auditDetails,
  }) : super();

  @MappableConstructor()
  FaceAuthEventSearchModel.ignoreDeleted({
    required this.individualId,
    required this.eventType,
    required this.outcome,
    this.projectId,
    this.clientReferenceId,
    super.boundaryCode,
    super.auditDetails,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FaceAuthEventModel extends EntityModel with FaceAuthEventModelMappable {
  static const schemaName = 'FaceAuthEvent';
  final String clientReferenceId;
  final String individualId;
  final String deviceId;
  final String eventType; // LOGIN, CHECK_IN, RE_VERIFY, ENROLLMENT
  final String outcome; // FACE_SUCCESS, FACE_REJECTED, PIN_FALLBACK, HCM_FALLBACK, MISSED
  final double confidence;
  final double latitude;
  final double longitude;
  final double locationAccuracy;
  final int timestamp;
  final int? syncTimestamp;
  final String? fallbackReason;
  final int failedAttemptCount;
  final int? popupTime; // epoch ms when re-verification popup appeared
  final int? responseTime; // epoch ms when user responded
  final String? responseType; // FACE, PIN, DISMISS, TIMEOUT
  final String projectId;
  final String? anomalyFlags; // comma-separated flags
  final String? faceImage; // base64-encoded JPEG of cropped face
  final bool isSync;
  final bool? nonRecoverableError;
  final String? tenantId;
  final String? id;
  final int? rowVersion;
  final String boundaryCode;
  final FaceAuthEventAdditionalFields? additionalFields;

  FaceAuthEventModel({
    this.additionalFields,
    required this.clientReferenceId,
    required this.individualId,
    this.deviceId = '',
    required this.eventType,
    required this.outcome,
    this.confidence = 0.0,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.locationAccuracy = 0.0,
    required this.timestamp,
    this.syncTimestamp,
    this.fallbackReason,
    this.failedAttemptCount = 0,
    this.popupTime,
    this.responseTime,
    this.responseType,
    required this.projectId,
    this.anomalyFlags,
    this.faceImage,
    this.isSync = false,
    this.boundaryCode = '',
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.id,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  FaceAuthEventCompanion get companion {
    return FaceAuthEventCompanion(
      clientReferenceId: Value(clientReferenceId),
      individualId: Value(individualId),
      deviceId: Value(deviceId),
      eventType: Value(eventType),
      outcome: Value(outcome),
      confidence: Value(confidence.toString()),
      latitude: Value(latitude.toString()),
      longitude: Value(longitude.toString()),
      locationAccuracy: Value(locationAccuracy.toString()),
      timestamp: Value(timestamp),
      syncTimestamp: Value(syncTimestamp),
      fallbackReason: Value(fallbackReason),
      failedAttemptCount: Value(failedAttemptCount),
      popupTime: Value(popupTime),
      responseTime: Value(responseTime),
      responseType: Value(responseType),
      projectId: Value(projectId),
      anomalyFlags: Value(anomalyFlags),
      faceImage: Value(faceImage),
      isSync: Value(isSync),
      boundaryCode: Value(boundaryCode),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      id: Value(id),
      additionalFields: Value(additionalFields?.toJson()),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      isDeleted: Value(isDeleted),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FaceAuthEventAdditionalFields extends AdditionalFields
    with FaceAuthEventAdditionalFieldsMappable {
  FaceAuthEventAdditionalFields({
    super.schema = 'FaceAuthEvent',
    required super.version,
    super.fields,
  });
}
