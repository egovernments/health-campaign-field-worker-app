import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

import 'lib/models.dart';

void run(HookContext context) async {
  final variables = context.vars;

  ConfigModel model = ConfigModelMapper.fromMap(variables);
  if (!model.createRepository) {
    final path = p.join(
      'data',
      'repositories',
      'remote',
      '${model.name.snakeCase}.dart',
    );
    await _deleteFile(path);
  }

  if (model.isEnum) {
    final path = p.join(
      'data',
      'local_store',
      'sql_store',
      'tables',
      '${model.name.snakeCase}.dart',
    );
    await _deleteFile(path);
  }
}

Future<void> _deleteFile(String path) async {
  final file = File(path);
  if (file.existsSync()) await file.delete();
}
