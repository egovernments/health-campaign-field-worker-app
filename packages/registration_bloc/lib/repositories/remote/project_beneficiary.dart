// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../models/entities/project_beneficiary.dart';

class ProjectBeneficiaryRemoteRepository extends RemoteRepository<
    ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  ProjectBeneficiaryRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectBeneficiary',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.projectBeneficiary;
}
