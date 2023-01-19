import 'dart:io';
import 'package:recase/recase.dart';
import 'package:path/path.dart' as p;


import 'lib/models.dart';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final variables = context.vars;

  ConfigModel model = Mapper.fromMap<ConfigModel>(variables);
  if (model.createRepository) {
    return;
  }

  final path = p.join(
    'data',
    'repositories',
    'remote',
    '${model.name.snakeCase}.dart',
  );
  final file = File(path);
  if (file.existsSync()) {
    await file.delete();
  }
}
