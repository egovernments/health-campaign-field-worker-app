import 'dart:async';

import 'package:collection/collection.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class AdverseEventLocalRepository
    extends LocalRepository<AdverseEventModel, AdverseEventSearchModel> {
  AdverseEventLocalRepository(super.sql, super.opLogManager);

  void listenToChanges({
    required AdverseEventSearchModel query,
    required void Function(List<AdverseEventModel> data) listener,
  }) {
    final select = sql.select(sql.adverseEvent).join([])
      ..where(
        buildOr([
          if (query.id != null)
            sql.adverseEvent.id.equals(
              query.id,
            ),
        ]),
      );

    select.watch().listen((results) {
      final data = results
          .map((e) {
            final adverseEvent = e.readTableOrNull(sql.adverseEvent);
            if (adverseEvent == null) return null;

            return AdverseEventModel(
              id: adverseEvent.id,
              clientReferenceId: adverseEvent.clientReferenceId,
              taskClientReferenceId: adverseEvent.taskClientReferenceId,
              reAttempts: adverseEvent.reAttempts,
              rowVersion: adverseEvent.rowVersion,
              tenantId: adverseEvent.tenantId,
              isDeleted: adverseEvent.isDeleted,
            );
          })
          .whereNotNull()
          .where((element) => element.isDeleted != true)
          .toList();

      listener(data);
    });
  }

  @override
  FutureOr<List<AdverseEventModel>> search(
    AdverseEventSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.adverseEvent).join([]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.clientReferenceId != null)
              sql.adverseEvent.clientReferenceId.isIn(
                query.clientReferenceId!,
              ),
            if (query.taskClientReferenceId != null)
              sql.adverseEvent.taskClientReferenceId.isIn(
                query.taskClientReferenceId!,
              ),
            if (userId != null)
              sql.adverseEvent.auditCreatedBy.equals(
                userId,
              ),
          ])))
        .get();

    return results
        .map((e) {
          final adverseEvent = e.readTableOrNull(sql.adverseEvent);
          if (adverseEvent == null) return null;

          return AdverseEventModel(
            id: adverseEvent.id,
            clientReferenceId: adverseEvent.clientReferenceId,
            rowVersion: adverseEvent.rowVersion,
            tenantId: adverseEvent.tenantId,
            isDeleted: adverseEvent.isDeleted,
            taskClientReferenceId: adverseEvent.taskClientReferenceId,
            auditDetails: AuditDetails(
              createdBy: adverseEvent.auditCreatedBy!,
              createdTime: adverseEvent.auditCreatedTime!,
              lastModifiedBy: adverseEvent.auditModifiedBy,
              lastModifiedTime: adverseEvent.auditModifiedTime,
            ),
          );
        })
        .whereNotNull()
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    AdverseEventModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final adverseEventsCompanion = entity.companion;
    await sql.batch((batch) async {
      batch.insert(sql.adverseEvent, adverseEventsCompanion);
      await super.create(entity);
    });
  }

  @override
  FutureOr<void> update(
    AdverseEventModel entity, {
    bool createOpLog = true,
  }) async {
    final adverseEventsCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.adverseEvent,
        adverseEventsCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.adverseEvent;
}
