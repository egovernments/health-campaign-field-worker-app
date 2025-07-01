import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/household.dart';

abstract class HouseholdLocalBaseRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  const HouseholdLocalBaseRepository(
    super.sql,
    super.opLogManager,
  );

  @override
  DataModelType get type => DataModelType.household;

  TableInfo get table => sql.household;
}
