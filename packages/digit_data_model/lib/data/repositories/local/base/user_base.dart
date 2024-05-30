import 'package:drift/drift.dart';

import '../../../../data_model.dart';

abstract class UserLocalBaseRepository
    extends LocalRepository<UserModel, UserSearchModel> {
  const UserLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.user;

  TableInfo get table => sql.user;
}