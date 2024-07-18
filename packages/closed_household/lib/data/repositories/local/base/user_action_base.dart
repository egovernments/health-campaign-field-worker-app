import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';


abstract class UserActionLocalBaseRepository
    extends LocalRepository<UserActionModel, UserActionSearchModel> {

  const UserActionLocalBaseRepository(
      super.sql, super.opLogManager,);

  @override
  DataModelType get type => DataModelType.task;

  @override
  TableInfo get table => sql.task;
}
