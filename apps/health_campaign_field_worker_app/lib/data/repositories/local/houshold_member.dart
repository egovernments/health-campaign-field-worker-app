import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

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
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final householdMember = e.readTable(sql.householdMember);

      return HouseholdMemberModel(
        householdId: householdMember.householdId,
        householdClientReferenceId: householdMember.householdClientReferenceId,
        individualId: householdMember.individualId,
        individualClientReferenceId:
            householdMember.individualClientReferenceId,
        isHeadOfHousehold: householdMember.isHeadOfHousehold,
        tenantId: householdMember.tenantId,
        rowVersion: householdMember.rowVersion,
        clientReferenceId: householdMember.clientReferenceId,
      );
    }).toList();
  }

  @override
  FutureOr<void> create(HouseholdMemberModel entity) async {
    final householdMemberCompanion = _getHouseholdMemberCompanion(entity);

    await sql.batch((batch) {
      batch.insert(sql.householdMember, householdMemberCompanion);
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(HouseholdMemberModel entity) async {
    final householdMemberCompanion = _getHouseholdMemberCompanion(entity);

    await sql.batch((batch) {
      batch.update(
        sql.householdMember,
        householdMemberCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity);
  }

  @override
  DataModelType get type => DataModelType.householdMember;

  HouseholdMemberCompanion _getHouseholdMemberCompanion(
    HouseholdMemberModel e,
  ) {
    return HouseholdMemberCompanion.insert(
      householdId: e.householdId,
      householdClientReferenceId: e.householdClientReferenceId,
      individualId: e.individualId,
      individualClientReferenceId: e.individualClientReferenceId,
      isHeadOfHousehold: e.isHeadOfHousehold,
      tenantId: e.tenantId,
      rowVersion: e.rowVersion,
      clientReferenceId: e.clientReferenceId,
    );
  }
}
