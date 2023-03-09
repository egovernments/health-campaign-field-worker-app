import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class HouseholdMemberLocalRepository
    extends LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  HouseholdMemberLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdMemberModel>> search(
    HouseholdMemberSearchModel query,
  ) async {
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
              ],
            ),
          ))
        .get();

    return results
        .map((e) {
          final householdMember = e.readTable(sql.householdMember);

          return HouseholdMemberModel(
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

    return super.delete(updated);
  }

  @override
  DataModelType get type => DataModelType.householdMember;
}
