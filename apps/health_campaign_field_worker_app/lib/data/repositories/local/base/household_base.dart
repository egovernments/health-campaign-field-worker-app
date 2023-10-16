import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class HouseholdLocalBaseRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  const HouseholdLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.household;

  @override
  TableInfo get table => sql.household;
}