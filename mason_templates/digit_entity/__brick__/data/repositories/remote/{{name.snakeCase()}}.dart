import '../../../models/data_model.dart';
import '../../data_repository.dart';

class {{name.pascalCase()}}Repository extends RemoteRepository<{{name.pascalCase()}}Model, {{name.pascalCase()}}RequestModel> {
  {{name.pascalCase()}}Repository(
    super.dio, {
    required super.path,
    super.entityName = '{{name.pascalCase()}}',
  });
}
