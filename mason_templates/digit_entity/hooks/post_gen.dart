import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

import 'lib/models.dart';

void run(HookContext context) async {
  final variables = context.vars;

  ConfigModelMapper.ensureInitialized();
  AttributeModelMapper.ensureInitialized();
  EnumValuesMapper.ensureInitialized();
  TableReferenceModelMapper.ensureInitialized();

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
  } else {
    await _addImportStatement(model.name);
  }
}

Future<void> _deleteFile(String path) async {
  final file = File(path);
  if (file.existsSync()) await file.delete();
}

Future<void> _addImportStatement(String tableName) async {
  final path = p.join(
    'data',
    'local_store',
    'sql_store',
    'sql_store.dart',
  );
  final file = File(path);

  if (await file.exists()) {
    var content = await file.readAsString();
    final importStatement = "import 'tables/${tableName.snakeCase}.dart';";
    final tableStatement = '${tableName.pascalCase},';

    if (!content.contains(importStatement)) {
      // Add the import statement after the last import.
      final lastImportEnd = content.lastIndexOf(';') + 1;
      content = '$importStatement\n$content';
    }

    if (!content.contains(tableStatement)) {
      // Add the table to the tables list.
      final tablesListStart = content.indexOf('@DriftDatabase(tables: [') + '@DriftDatabase(tables: ['.length;
      content = '${content.substring(0, tablesListStart)}\n  $tableStatement${content.substring(tablesListStart)}';
    }

    await file.writeAsString(content);
  }
}