import 'package:collection/collection.dart';
import 'package:mason/mason.dart';

import 'lib/models.dart';

void run(HookContext context) {
  final variables = context.vars;

  ConfigModel model = Mapper.fromMap<ConfigModel>(variables);

  if (model.attributes
          .firstWhereOrNull((element) => element.name == 'clientReferenceId') ==
      null) {
    model = model.copyWith.attributes.add(
      AttributeModel(
        name: 'clientReferenceId',
        type: 'String',
        isPk: true,
        nullable: false,
      ),
    );
  }

  final sqlAttributes = <AttributeModel>[
    ...model.attributes.map((e) {
      final type = _getSqlType(e.type);
      final columnType = _getSqlColumnType(e.type);
      return e.copyWith(type: type, columnType: columnType);
    }),
    ...model.customAttributes.where((element) => element.isEnum),
  ];

  final references = [
    ...model.customAttributes
        .where((element) => element.createReference)
        .where((element) => !element.isEnum)
        .map((e) {
      return e.copyWith(references: [
        TableReferenceModel(table: e.type, column: e.name),
      ]);
    }),
  ];

  final updateModel = model.copyWith(
    sqlAttributes: sqlAttributes,
    referenceAttributes: references,
  );
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
