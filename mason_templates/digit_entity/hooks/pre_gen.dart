import 'lib/models.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final variables = context.vars;

  final model = Mapper.fromMap<ConfigModel>(variables);

  final sqlAttributes = <AttributeModel>[
    ...model.attributes.map((e) {
      final type = _getSqlType(e.type);
      final columnType = _getSqlColumnType(e.type);
      return e.copyWith(type: type, columnType: columnType);
    }),
    ...model.customAttributes.where((element) => element.isEnum),
  ];

  final updateModel = model.copyWith(sqlAttributes: sqlAttributes);
  context.vars = updateModel.toMap();
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

String _getSqlColumnType(String dartType) {
  String type;
  switch (dartType) {
    case 'String':
      type = 'Text';
      break;
    case 'int':
      type = 'Int';
      break;
    case 'double':
      type = 'Real';
      break;
    case 'bool':
      type = 'Bool';
      break;
    default:
      type = 'Text';
  }

  return type;
}
