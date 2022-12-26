import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) {
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

  logger.info('Generating $name');

  final events = <String>[];
  final states = <String>[];

  logger.info(lightYellow
      .wrap('Provide names of triggered events. Leave empty to exit'));
  while (true) {
    final property = logger.prompt(':').replaceAll(RegExp('\\s+'), ' ').trim();
    if (property.trim().isEmpty) {
      break;
    }

    events.add(property);
  }

  logger.info(
      lightYellow.wrap('Provide names of emitted states. Leave empty to exit'));
  while (true) {
    final property = logger.prompt(':').replaceAll(RegExp('\\s+'), ' ').trim();
    if (property.trim().isEmpty) {
      break;
    }

    states.add(property);
  }

  context.vars['states'] = states;
  context.vars['events'] = events;
}
