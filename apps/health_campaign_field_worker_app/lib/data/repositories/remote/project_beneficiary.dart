// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectBeneficiaryRemoteRepository extends RemoteRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  ProjectBeneficiaryRemoteRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectBeneficiary',
  });

  @override
  DataModelType get type => DataModelType.projectBeneficiary;
}
