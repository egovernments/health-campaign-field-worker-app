import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/household_member_base.dart';

class HouseholdMemberLocalRepository
    extends HouseholdMemberLocalBaseRepository {
  HouseholdMemberLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdMemberModel>> search(
    HouseholdMemberSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.householdMember).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.householdClientReferenceId != null)
                  sql.householdMember.householdClientReferenceId.equals(
                    query.householdClientReferenceId,
                  ),
                if (query.individualClientReferenceId != null)
                  sql.householdMember.individualClientReferenceId.equals(
                    query.individualClientReferenceId,
                  ),
                if (query.householdId != null)
                  sql.householdMember.householdId.equals(
                    query.householdId,
                  ),
                if (query.individualId != null)
                  sql.householdMember.individualId.equals(
                    query.individualId,
                  ),
                if (query.isHeadOfHousehold != null)
                  sql.householdMember.isHeadOfHousehold.equals(
                    query.isHeadOfHousehold,
                  ),
                if (userId != null)
                  sql.householdMember.auditCreatedBy.equals(
                    userId,
                  ),
              ],
            ),
          ))
        .get();

    return results
        .map((e) {
          final householdMember = e.readTable(sql.householdMember);

          return HouseholdMemberModel(
            id: householdMember.id,
            householdId: householdMember.householdId,
            householdClientReferenceId:
                householdMember.householdClientReferenceId,
            individualId: householdMember.individualId,
            individualClientReferenceId:
                householdMember.individualClientReferenceId,
            isHeadOfHousehold: householdMember.isHeadOfHousehold,
            isDeleted: householdMember.isDeleted,
            tenantId: householdMember.tenantId,
            rowVersion: householdMember.rowVersion,
            auditDetails: (householdMember.auditCreatedBy != null &&
                    householdMember.auditCreatedTime != null)
                ? AuditDetails(
                    createdBy: householdMember.auditCreatedBy!,
                    createdTime: householdMember.auditCreatedTime!,
                    lastModifiedBy: householdMember.auditModifiedBy,
                    lastModifiedTime: householdMember.auditModifiedTime,
                  )
                : null,
            clientAuditDetails: (householdMember.clientCreatedBy != null &&
                    householdMember.clientCreatedTime != null)
                ? ClientAuditDetails(
                    createdBy: householdMember.clientCreatedBy!,
                    createdTime: householdMember.clientCreatedTime!,
                    lastModifiedBy: householdMember.clientModifiedBy,
                    lastModifiedTime: householdMember.clientModifiedTime,
                  )
                : null,
            clientReferenceId: householdMember.clientReferenceId,
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final householdMemberCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.householdMember, householdMemberCompanion);
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
  }) async {
    final householdMemberCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.householdMember,
        householdMemberCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<void> delete(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
  }) async {
    final updated = entity.copyWith(
      isDeleted: true,
      clientAuditDetails: (entity.clientAuditDetails?.createdBy != null &&
              entity.clientAuditDetails?.createdTime != null)
          ? ClientAuditDetails(
              createdBy: entity.clientAuditDetails!.createdBy,
              createdTime: entity.clientAuditDetails!.createdTime,
              lastModifiedBy: entity.clientAuditDetails!.lastModifiedBy,
              lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            )
          : null,
      rowVersion: entity.rowVersion.increment,
    );
    await sql.batch((batch) {
      batch.update(
        sql.householdMember,
        updated.companion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.delete(updated, createOpLog: createOpLog);
  }
}
