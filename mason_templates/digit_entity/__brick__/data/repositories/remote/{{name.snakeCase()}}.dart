// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class {{name.pascalCase()}}RemoteRepository extends RemoteRepository<{{name.pascalCase()}}Model, {{name.pascalCase()}}SearchModel> {
  {{name.pascalCase()}}RemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = '{{entityName.pascalCase()}}',{{#isPlural}}
    super.isPlural = true,{{/isPlural}}{{#isSearchResponsePlural}}
    super.isSearchResponsePlural = true,{{/isSearchResponsePlural}}
  });

  @override
  DataModelType get type => DataModelType.{{name.camelCase()}};
}
