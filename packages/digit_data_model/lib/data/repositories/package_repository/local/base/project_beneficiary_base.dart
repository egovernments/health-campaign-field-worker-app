import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class ProjectBeneficiaryLocalBaseRepository extends LocalRepository<
    ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  const ProjectBeneficiaryLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectBeneficiary;

  TableInfo get table => sql.projectBeneficiary;
}
