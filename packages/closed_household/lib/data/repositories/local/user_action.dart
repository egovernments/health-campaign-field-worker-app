import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import '../../../models/entities/user_action.dart';

class ClosedHouseholdLocalRepository
    extends LocalRepository<UserActionModel, UserActionSearchModel> {
  ClosedHouseholdLocalRepository(
    super.sql,
    super.opLogManager,
  );

  void listenToChanges({
    required UserActionSearchModel query,
    required void Function(List<UserActionModel> data) listener,
  }) async {
    return retryLocalCallOperation(() async {
      final select = sql.select(sql.userAction)
        ..where((t) => buildOr([
              if (query.projectId != null) t.projectId.equals(query.projectId!),
            ]));

      select.watch().listen((results) {
        final data = results
            .map((userAction) {
              return UserActionModel(
                id: userAction.id,
                clientReferenceId: userAction.clientReferenceId,
                rowVersion: userAction.rowVersion,
                tenantId: userAction.tenantId,
                isDeleted: userAction.isDeleted,
                projectId: userAction.projectId,
                status: userAction.status,
                action: userAction.action,
              );
            })
            .whereNotNull()
            .where((element) => element.isDeleted != true)
            .toList();

        listener(data);
      });
    });
  }

  @override
  FutureOr<List<UserActionModel>> search(
    UserActionSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<UserActionModel>>(() async {
      final userAction = sql.select(sql.userAction).join([]);

      if (query.projectId != null) {
        userAction.where(
          sql.userAction.clientReferenceId
              .equals(query.clientReferenceId!.first),
        );
      }

      final results = await userAction.get();
      final userActionTable = results.map((e) => e.readTable(sql.userAction));
      return userActionTable
          .map((e) => UserActionModel(
                clientReferenceId: e.clientReferenceId,
                action: e.action,
                additionalFields: e.additionalFields != null
                    ? UserActionAdditionalFieldsMapper.fromJson(
                        e.additionalFields!.toString())
                    : null,
                auditDetails:
                    (e.auditCreatedBy != null && e.auditCreatedTime != null)
                        ? AuditDetails(
                            createdBy: e.auditCreatedBy!,
                            createdTime: e.auditCreatedTime!,
                            lastModifiedBy: e.auditModifiedBy,
                            lastModifiedTime: e.auditModifiedTime,
                          )
                        : null,
                clientAuditDetails:
                    (e.clientCreatedBy != null && e.clientCreatedTime != null)
                        ? ClientAuditDetails(
                            createdBy: e.clientCreatedBy!,
                            createdTime: e.clientCreatedTime!,
                            lastModifiedBy: e.clientModifiedBy,
                            lastModifiedTime: e.clientModifiedTime,
                          )
                        : null,
                beneficiaryTag: e.beneficiaryTag,
                boundaryCode: e.boundaryCode,
                id: e.id,
                projectId: e.projectId,
                rowVersion: e.rowVersion,
                status: e.status,
                tenantId: e.tenantId,
                isDeleted: e.isDeleted,
                latitude: e.latitude,
                locationAccuracy: e.locationAccuracy,
                longitude: e.longitude,
                nonRecoverableError: e.nonRecoverableError,
                resourceTag: e.resourceTag,
              ))
          .toList();
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<UserActionModel> entities,
  ) async {
    final userActionCompanions = entities.map((e) => e.companion).toList();

    await sql.batch((batch) async {
      batch.insertAll(
        sql.userAction,
        userActionCompanions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  FutureOr<void> update(
    UserActionModel entity, {
    bool createOpLog = true,
  }) async {
    final userActionCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.userAction,
        userActionCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<void> create(
    UserActionModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    retryLocalCallOperation(() async {
      final closedHouseholdCompanion = entity.companion;

      await sql.batch((batch) async {
        batch.insert(
          sql.userAction,
          closedHouseholdCompanion,
          mode: InsertMode.insertOrReplace,
        );
      });

      await super.create(entity, createOpLog: createOpLog);
    });
  }

  @override
  DataModelType get type => DataModelType.userAction;
}
