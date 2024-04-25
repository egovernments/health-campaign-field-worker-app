import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/user.dart';

abstract class UserLocalBaseRepository
    extends LocalRepository<UserModel, UserSearchModel> {
  const UserLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.user;

  @override
  TableInfo get table => sql.user;
}