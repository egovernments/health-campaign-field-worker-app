import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/project_beneficiary.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ProjectBeneficiaryLocalBaseRepository
    extends LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  const ProjectBeneficiaryLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.projectBeneficiary;

  @override
  TableInfo get table => sql.projectBeneficiary;
}
