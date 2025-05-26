import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration/models/entities/project_beneficiary.dart';

abstract class ProjectBeneficiaryLocalBaseDeliveryRepository
    extends LocalRepository<ProjectBeneficiaryModel,
        ProjectBeneficiarySearchModel> {
  const ProjectBeneficiaryLocalBaseDeliveryRepository(
      super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectBeneficiary;

  TableInfo get table => sql.projectBeneficiary;
}
