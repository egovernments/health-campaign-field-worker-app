import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/user.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class UserLocalBaseRepository
    extends LocalRepository<UserModel, UserSearchModel> {
  const UserLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.user;

  @override
  TableInfo get table => sql.user;
}