import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProjectBeneficiaryRepository extends RemoteRepository<ProjectBeneficiaryModel, ProjectBeneficiaryRequestModel> {
  ProjectBeneficiaryRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProjectBeneficiary',
  });
}
