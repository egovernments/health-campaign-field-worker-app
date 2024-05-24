import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProjectBeneficiaryLocalBaseRepository
    extends LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  const ProjectBeneficiaryLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectBeneficiary;

  @override
  TableInfo get table => sql.projectBeneficiary;
}