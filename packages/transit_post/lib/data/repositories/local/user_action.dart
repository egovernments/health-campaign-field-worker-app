import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:drift/drift.dart';

// This will create , update and search data from local Repository
class UserActionLocalRepository
    extends LocalRepository<UserActionModel, UserActionSearchModel> {
  UserActionLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    UserActionModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.insert(
          sql.userAction,
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
    UserActionModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.insert(
          sql.userAction,
          entity.companion,
          mode: InsertMode.insertOrReplace,
        );
      });

      return super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<UserActionModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final companions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) {
        batch.insertAll(
          sql.userAction,
          companions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  FutureOr<int> fetchCount(
    String? userId, {
    UserActionSearchModel? query,
  }) async {
    return retryLocalCallOperation<int>(() async {
      final selectQuery = sql.selectOnly(sql.userAction)
        ..addColumns(
            [sql.userAction.clientReferenceId.count()]); // Count all records

      // Build conditions dynamically
      final conditions = <Expression<bool>>[];

      if (userId != null) {
        conditions.add(sql.userAction.clientCreatedBy.equalsNullable(userId));
      }

      if (query?.auditDetails?.createdTime != null) {
        DateTime createdDate;

        // Convert epoch (milliseconds) to DateTime
        createdDate = DateTime.fromMillisecondsSinceEpoch(
            query?.auditDetails!.createdTime as int);

        // Get start & end of the day in epoch (milliseconds)
        int startOfDayEpoch =
            DateTime(createdDate.year, createdDate.month, createdDate.day)
                .millisecondsSinceEpoch;
        int endOfDayEpoch = DateTime(createdDate.year, createdDate.month,
                createdDate.day, 23, 59, 59)
            .millisecondsSinceEpoch;

        // Add condition to filter records between start and end of the day
        conditions.add(sql.userAction.clientCreatedTime
            .isBetweenValues(startOfDayEpoch, endOfDayEpoch));
      }

      // Apply conditions using buildAnd()
      if (conditions.isNotEmpty) {
        selectQuery.where(buildAnd(conditions));
      }

      final result = await selectQuery.getSingleOrNull(); // Fetch the count

      return (result?.read(sql.userAction.clientReferenceId.count()) ??
          0); // Return count or 0
    });
  }

  @override
  DataModelType get type => DataModelType.userAction;

  @override
  FutureOr<List<UserActionModel>> search(UserActionSearchModel query) {
    return retryLocalCallOperation<List<UserActionModel>>(() async {
      final selectQuery = sql.select(sql.userAction).join([]);
      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.action != null)
                    sql.userAction.action.equals(query.action!),
                  if (query.projectId != null)
                    sql.userAction.projectId.equals(query.projectId!),
                  if (query.clientReferenceId != null)
                    sql.userAction.clientReferenceId
                        .isIn(query.clientReferenceId!),
                  if (query.boundaryCode != null)
                    sql.userAction.boundaryCode.equals(query.boundaryCode!),
                ],
              ),
            ))
          .get();

      return results.map((e) {
        final data = e.readTable(sql.userAction);

        final createdBy = data.auditCreatedBy;
        final createdTime = data.auditCreatedTime;

        // Parse additionalFields JSON
        UserActionAdditionalFields? additionalFields;
        if (data.additionalFields != null) {
          try {
            final decoded = jsonDecode(data.additionalFields!);
            if (decoded is Map<String, dynamic>) {
              additionalFields =
                  UserActionAdditionalFieldsMapper.fromMap(decoded);
            }
          } catch (_) {}
        }

        return UserActionModel(
          id: data.id,
          tenantId: data.tenantId,
          latitude: double.tryParse(data.latitude) ?? 0.0,
          longitude: double.tryParse(data.longitude) ?? 0.0,
          locationAccuracy:
              double.tryParse(data.locationAccuracy) ?? 0.0,
          clientReferenceId: data.clientReferenceId,
          isSync: data.isSync,
          timestamp: data.timestamp,
          projectId: data.projectId,
          boundaryCode: data.boundaryCode,
          action: data.action,
          beneficiaryTag: data.beneficiaryTag,
          resourceTag: data.resourceTag,
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
