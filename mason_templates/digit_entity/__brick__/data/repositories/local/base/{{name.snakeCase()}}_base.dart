import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class {{name.pascalCase()}}LocalBaseRepository
    extends LocalRepository<{{name.pascalCase()}}Model, {{name.pascalCase()}}SearchModel> {
  const {{name.pascalCase()}}LocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.{{name.camelCase()}};

  @override
  TableInfo get table => sql.{{name.camelCase()}};
}