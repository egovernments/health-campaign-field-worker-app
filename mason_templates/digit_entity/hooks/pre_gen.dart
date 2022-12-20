import 'package:hooks/models.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final logger = context.logger;
  final variables = context.vars;

  final model = Mapper.fromMap<ConfigModel>(variables);
  logger.info(model.toJson());
  context.vars = model.toMap();

  final sqlAttributes = <AttributeModel>[
    ...model.attributes.map((e) {
      final type = _getSqlType(e.type);
      return e.copyWith(type: type);
    }),
  ];
}

String _getSqlType(String dartType) {
  String type;
  switch (dartType) {
    case 'String':
      type = 'Text';
      break;
    case 'int':
      type = 'Integer';
      break;
    case 'double':
      type = 'Real';
      break;
    case 'bool':
      type = 'Boolean';
      break;
    default:
      type = 'Text';
  }

  return type;
}