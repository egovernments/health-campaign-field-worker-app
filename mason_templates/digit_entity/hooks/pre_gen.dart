import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  final logger = context.logger;
  final variables = context.vars;

  logger.info(variables.toString());
  return;

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

  final attributes = <Map<String, dynamic>>[];
  final customAttributes = <Map<String, dynamic>>[];
  final dateTimeAttributes = <Map<String, dynamic>>[];

  while (true) {
    final attribute =
        await logger.prompt('Name: ').replaceAll(RegExp('\\s+'), ' ').trim();
    if (attribute.trim().isEmpty) {
      break;
    }

    AttributeType type = await logger.chooseOne<AttributeType>(
      'Type: ',
      choices: AttributeType.values,
      defaultValue: AttributeType.STRING,
      display: (choice) => choice.name.pascalCase,
    );

    late String custom;
    if (type == AttributeType.CUSTOM) {
      custom = await logger
          .prompt('Enter custom type: ')
          .replaceAll(RegExp('\\s+'), ' ')
          .trim();
      custom = custom.isEmpty ? 'dynamic' : custom;
    }

    bool nullable = await logger.chooseOne(
      'Nullable?',
      choices: [true, false],
      defaultValue: false,
    );

    switch (type) {
      case AttributeType.CUSTOM:
        customAttributes.add(
          {
            'name': custom,
            'type': type.valueName,
            'nullable': nullable,
          },
        );
        break;
      case AttributeType.DATE_TIME:
        dateTimeAttributes.add(
          {
            'name': attribute,
            'type': type.valueName,
            'nullable': nullable,
          },
        );
        break;
      default:
        attributes.add({
          'name': attribute,
          'type': type.valueName,
          'nullable': nullable,
        });
    }
  }

  context.vars['attributes'] = attributes;
  context.vars['dateTimeAttributes'] = dateTimeAttributes;
  context.vars['customAttributes'] = customAttributes;
}

enum AttributeType {
  STRING('String'),
  INT('int'),
  NUM('num'),
  DOUBLE('double'),
  BOOL('bool'),
  DATE_TIME('DateTime'),
  CUSTOM('custom'),
  DYNAMIC('dynamic');

  final String type;

  const AttributeType(this.type);

  String get valueName => type;
}
