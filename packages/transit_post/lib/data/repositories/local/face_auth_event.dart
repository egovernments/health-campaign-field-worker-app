import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:drift/drift.dart';

class FaceAuthEventLocalRepository
    extends LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel> {
  FaceAuthEventLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    FaceAuthEventModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.insert(
          sql.faceAuthEvent,
          entity.companion,
          mode: InsertMode.insertOrReplace,
        );
      });

      await super.create(
        entity,
        createOpLog: createOpLog,
      );
    });
  }

  @override
  FutureOr<void> update(
    FaceAuthEventModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.insert(
          sql.faceAuthEvent,
          entity.companion,
          mode: InsertMode.insertOrReplace,
        );
      });

      return super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<FaceAuthEventModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final companions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) {
        batch.insertAll(
          sql.faceAuthEvent,
          companions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  DataModelType get type => DataModelType.faceAuthEvent;

  @override
  FutureOr<List<FaceAuthEventModel>> search(
      FaceAuthEventSearchModel query) {
    return retryLocalCallOperation<List<FaceAuthEventModel>>(() async {
      final selectQuery = sql.select(sql.faceAuthEvent).join([]);
      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.individualId != null)
                    sql.faceAuthEvent.individualId
                        .equals(query.individualId!),
                  if (query.eventType != null)
                    sql.faceAuthEvent.eventType.equals(query.eventType!),
                  if (query.outcome != null)
                    sql.faceAuthEvent.outcome.equals(query.outcome!),
                  if (query.projectId != null)
                    sql.faceAuthEvent.projectId.equals(query.projectId!),
                  if (query.clientReferenceId != null)
                    sql.faceAuthEvent.clientReferenceId
                        .isIn(query.clientReferenceId!),
                ],
              ),
            ))
          .get();

      return results.map((e) {
        final data = e.readTable(sql.faceAuthEvent);

        final createdBy = data.auditCreatedBy;
        final createdTime = data.auditCreatedTime;

        FaceAuthEventAdditionalFields? additionalFields;
        if (data.additionalFields != null) {
          try {
            final decoded = jsonDecode(data.additionalFields!);
            if (decoded is Map<String, dynamic>) {
              additionalFields =
                  FaceAuthEventAdditionalFieldsMapper.fromMap(decoded);
            }
          } catch (_) {}
        }

        return FaceAuthEventModel(
          id: data.id,
          tenantId: data.tenantId,
          clientReferenceId: data.clientReferenceId,
          individualId: data.individualId,
          deviceId: data.deviceId,
          eventType: data.eventType,
          outcome: data.outcome,
          confidence: double.tryParse(data.confidence) ?? 0.0,
          latitude: double.tryParse(data.latitude) ?? 0.0,
          longitude: double.tryParse(data.longitude) ?? 0.0,
          locationAccuracy:
              double.tryParse(data.locationAccuracy) ?? 0.0,
          timestamp: data.timestamp,
          syncTimestamp: data.syncTimestamp,
          fallbackReason: data.fallbackReason,
          failedAttemptCount: data.failedAttemptCount,
          popupTime: data.popupTime,
          responseTime: data.responseTime,
          responseType: data.responseType,
          projectId: data.projectId,
          anomalyFlags: data.anomalyFlags,
          faceImage: data.faceImage,
          isSync: data.isSync,
          boundaryCode: data.boundaryCode,
          nonRecoverableError: data.nonRecoverableError,
          rowVersion: data.rowVersion,
          isDeleted: data.isDeleted,
          additionalFields: additionalFields,
          auditDetails: createdTime == null || createdBy == null
              ? null
              : AuditDetails(
                  createdTime: createdTime,
                  createdBy: createdBy,
                ),
          clientAuditDetails: data.clientCreatedTime == null ||
                  data.clientCreatedBy == null
              ? null
              : ClientAuditDetails(
                  createdTime: data.clientCreatedTime!,
                  createdBy: data.clientCreatedBy!,
                  lastModifiedBy: data.clientModifiedBy,
                  lastModifiedTime: data.clientModifiedTime,
                ),
        );
      }).toList();
    });
  }
}
