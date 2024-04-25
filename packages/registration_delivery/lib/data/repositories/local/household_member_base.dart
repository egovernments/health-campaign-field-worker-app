import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import '../../local_store/sql_store.dart';

abstract class HouseholdMemberLocalBaseRepository
    extends LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;

  const HouseholdMemberLocalBaseRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  @override
  DataModelType get type => DataModelType.householdMember;

  @override
  TableInfo get table => registrationLocalSqlDataStore.householdMember;
}
