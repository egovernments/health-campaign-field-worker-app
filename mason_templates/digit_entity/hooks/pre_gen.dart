import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  final logger = context.logger;
  final variables = context.vars;

  if (!variables.containsKey('name')) {
    logger.err('`name` is required');
    throw Exception();
  }

  final name = variables['name'].toString().pascalCase;
  if (name.isEmpty) {
    logger.err('`name` is required');
    throw Exception();
  }

  logger.info('Generating entity for $name');

  logger.info(lightYellow.wrap('Add attributes`. Leave empty to exit'));

  List<Map<String, dynamic>> attributes = [];

  while (true) {
    final attribute =
        logger.prompt(': ').replaceAll(RegExp('\\s+'), ' ').trim();
    if (attribute.trim().isEmpty) {
      break;
    }

    String type = logger.chooseOne<String>(
      'Type: ',
      choices: ['String', 'int', 'num', 'double', 'bool', 'custom'],
      defaultValue: 'String',
    );

    if (type == 'custom') {
      type = logger
          .prompt('Enter custom type: ')
          .replaceAll(RegExp('\\s+'), ' ')
          .trim();
    }

    bool nullable = logger.chooseOne('Nullable?', choices: [true, false]);
  }
}
