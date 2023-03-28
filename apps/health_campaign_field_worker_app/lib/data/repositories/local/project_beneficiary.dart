import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class ProjectBeneficiaryLocalRepository extends LocalRepository<
    ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  ProjectBeneficiaryLocalRepository(super.sql, super.opLogManager);

  void listenToChanges({
    required ProjectBeneficiarySearchModel query,
    required void Function(List<ProjectBeneficiaryModel> data) listener,
  }) {
    final select = sql.select(sql.projectBeneficiary)
      ..where(
        (tbl) => buildOr([
          if (query.projectId != null) tbl.projectId.equals(query.projectId),
        ]),
      );

    select.watch().listen((event) {
      final data = event.map((e) {
        return ProjectBeneficiaryModel(
          clientReferenceId: e.clientReferenceId,
          dateOfRegistration: e.dateOfRegistration,
          projectId: e.projectId,
          tenantId: e.tenantId,
          beneficiaryClientReferenceId: e.beneficiaryClientReferenceId,
          id: e.id,
          rowVersion: e.rowVersion,
          isDeleted: e.isDeleted,
          beneficiaryId: e.beneficiaryId,
        );
      }).toList();

      listener(data);
    });
  }

  @override
  FutureOr<List<ProjectBeneficiaryModel>> search(
    ProjectBeneficiarySearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.projectBeneficiary).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.clientReferenceId != null)
                  sql.projectBeneficiary.clientReferenceId.isIn(
                    query.clientReferenceId!,
                  ),
                if (query.beneficiaryClientReferenceId != null)
                  sql.projectBeneficiary.beneficiaryClientReferenceId.equals(
                    query.beneficiaryClientReferenceId,
                  ),
                if (query.id != null)
                  sql.projectBeneficiary.id.equals(
                    query.id,
                  ),
                if (query.projectId != null)
                  sql.projectBeneficiary.projectId.equals(
                    query.projectId,
                  ),
                if (query.beneficiaryId != null)
                  sql.projectBeneficiary.beneficiaryId.equals(
                    query.beneficiaryId,
                  ),
                if (query.dateOfRegistrationTime != null)
                  sql.projectBeneficiary.dateOfRegistration.equals(
                    query.dateOfRegistration,
                  ),
                if (userId != null)
                  sql.projectBeneficiary.auditCreatedBy.equals(
                    userId,
                  ),
              ],
            ),
          ))
        .get();

    return results
        .map((e) {
          final projectBeneficiary = e.readTable(sql.projectBeneficiary);

          return ProjectBeneficiaryModel(
            clientReferenceId: projectBeneficiary.clientReferenceId,
            tenantId: projectBeneficiary.tenantId,
            rowVersion: projectBeneficiary.rowVersion,
            id: projectBeneficiary.id,
            isDeleted: projectBeneficiary.isDeleted,
            beneficiaryClientReferenceId:
                projectBeneficiary.beneficiaryClientReferenceId,
            beneficiaryId: projectBeneficiary.beneficiaryId,
            dateOfRegistration: projectBeneficiary.dateOfRegistration,
            projectId: projectBeneficiary.projectId,
            auditDetails: AuditDetails(
              createdTime: projectBeneficiary.auditCreatedTime!,
              createdBy: projectBeneficiary.auditCreatedBy!,
            ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    ProjectBeneficiaryModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final projectBeneficiaryCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.projectBeneficiary, projectBeneficiaryCompanion);
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(
    ProjectBeneficiaryModel entity, {
    bool createOpLog = true,
  }) async {
    final projectBeneficiaryCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.projectBeneficiary,
        projectBeneficiaryCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.update(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<void> delete(
    ProjectBeneficiaryModel entity, {
    bool createOpLog = true,
  }) async {
    final updated = entity.copyWith(
      isDeleted: true,
      rowVersion: entity.rowVersion,
    );
    await sql.batch((batch) {
      batch.update(
        sql.projectBeneficiary,
        updated.companion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.delete(updated);
  }

  @override
  DataModelType get type => DataModelType.projectBeneficiary;
}
