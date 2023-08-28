import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class IndividualLocalBaseRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  const IndividualLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.individual;

  @override
  TableInfo get table => sql.individual;
}