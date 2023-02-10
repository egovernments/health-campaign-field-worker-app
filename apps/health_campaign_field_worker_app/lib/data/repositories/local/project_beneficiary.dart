import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class ProjectBeneficiaryLocalRepository extends LocalRepository<
    ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  ProjectBeneficiaryLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<ProjectBeneficiaryModel>> search(
    ProjectBeneficiarySearchModel query,
  ) async {
    final selectQuery = sql.select(sql.projectBeneficiary).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.clientReferenceId != null)
                  sql.projectBeneficiary.clientReferenceId.equals(
                    query.clientReferenceId,
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
                    query.dateOfRegistrationTime,
                  ),
              ],
            ),
          ))
        .get();
  }

  @override
  DataModelType get type => DataModelType.projectBeneficiary;
}
