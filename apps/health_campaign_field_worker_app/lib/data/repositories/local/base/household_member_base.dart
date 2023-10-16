import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class HouseholdMemberLocalBaseRepository
    extends LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  const HouseholdMemberLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.householdMember;

  @override
  TableInfo get table => sql.householdMember;
}