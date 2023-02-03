// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class {{name.pascalCase()}}RemoteRepository extends RemoteRepository<{{name.pascalCase()}}Model, {{name.pascalCase()}}SearchModel> {
  {{name.pascalCase()}}RemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = '{{name.pascalCase()}}',
  });

  @override
  DataModelType get type => DataModelType.{{name.camelCase()}};
}
