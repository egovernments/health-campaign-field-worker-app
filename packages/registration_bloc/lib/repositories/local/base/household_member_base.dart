import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/household_member.dart';

abstract class HouseholdMemberLocalBaseRepository
    extends LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  const HouseholdMemberLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.householdMember;

  TableInfo get table => sql.householdMember;
}
