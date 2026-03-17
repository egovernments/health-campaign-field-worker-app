import 'dart:async';

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
  FutureOr<List<UserActionModel>> search(UserActionSearchModel query) async {
    return retryLocalCallOperation<List<UserActionModel>>(() async {
      final selectQuery = sql.select(sql.userAction).join([]);
      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.clientReferenceId != null &&
                      query.clientReferenceId!.isNotEmpty)
                    sql.userAction.clientReferenceId.isIn(
                      query.clientReferenceId!,
                    ),
                ],
              ),
            ))
          .get();

      return results.map((e) {
        final data = e.readTable(sql.userAction);

        final createdBy = data.auditCreatedBy;
        final createdTime = data.auditCreatedTime;

        UserActionAdditionalFields? additionalFields;
        if (data.additionalFields != null) {
          additionalFields = UserActionAdditionalFieldsMapper.fromJson(
            data.additionalFields!,
          );
        }

        return UserActionModel(
          id: data.id,
          tenantId: data.tenantId,
          projectId: data.projectId,
          boundaryCode: data.boundaryCode,
          action: data.action,
          clientReferenceId: data.clientReferenceId,
          latitude: double.tryParse(data.latitude) ?? 0.0,
          longitude: double.tryParse(data.longitude) ?? 0.0,
          locationAccuracy: double.tryParse(data.locationAccuracy) ?? 0.0,
          isSync: data.isSync,
          timestamp: data.timestamp,
          nonRecoverableError: data.nonRecoverableError,
          rowVersion: data.rowVersion,
          beneficiaryTag: data.beneficiaryTag,
          resourceTag: data.resourceTag,
          additionalFields: additionalFields,
          isDeleted: data.isDeleted ?? false,
          auditDetails: createdTime == null || createdBy == null
              ? null
              : AuditDetails(
                  createdTime: createdTime,
                  createdBy: createdBy,
                  lastModifiedBy: data.auditModifiedBy,
                  lastModifiedTime: data.auditModifiedTime,
                ),
          clientAuditDetails:
              data.clientCreatedTime == null || data.clientCreatedBy == null
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

  @override
  FutureOr<void> update(
    UserActionModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.update(
          sql.userAction,
          entity.companion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      return super.update(entity, createOpLog: createOpLog);
    });
  }
}
