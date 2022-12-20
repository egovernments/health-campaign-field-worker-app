import 'package:dart_mappable/dart_mappable.dart';

export 'models.mapper.g.dart';

@MappableClass()
class ConfigModel {
  final String name;
  final List<String> enumValues;
  final List<AttributeModel> attributes;
  final List<AttributeModel> customAttributes;
  final List<AttributeModel> dateTimeAttributes;
  final List<AttributeModel> sqlAttributes;

  final bool isEnum;

  const ConfigModel({
    required this.name,
    this.enumValues = const [],
    this.attributes = const [],
    this.customAttributes = const [],
    this.dateTimeAttributes = const [],
    this.sqlAttributes = const [],
    this.isEnum = false,
  });
}

@MappableClass()
class AttributeModel {
  final String name;
  final String type;
  final bool isList;
  final bool nullable;
  final bool isPk;
  final bool isEnum;

  const AttributeModel({
    required this.name,
    required this.type,
    this.isList = false,
    this.isPk = false,
    this.isEnum = false,
    this.nullable = false,
  });
}
