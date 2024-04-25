import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/individual.dart';

abstract class IndividualLocalBaseRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  const IndividualLocalBaseRepository(
      super.sql, super.opLogManager,);

  @override
  DataModelType get type => DataModelType.individual;

  @override
  TableInfo get table => sql.individual;
}
