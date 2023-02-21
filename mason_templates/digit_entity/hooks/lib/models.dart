import 'package:dart_mappable/dart_mappable.dart';

export 'models.mapper.g.dart';

@MappableClass()
class ConfigModel {
  final String name;
  final List<String> ignoreFields;
  final List<EnumValues> enumValues;
  final List<AttributeModel> attributes;
  final List<AttributeModel> customAttributes;
  final List<AttributeModel> dateTimeAttributes;
  final List<AttributeModel> sqlAttributes;
  final List<AttributeModel> referenceAttributes;
  final bool isPlural;

  final bool createRepository;
  final bool isEnum;

  const ConfigModel({
    required this.name,
    this.ignoreFields = const [],
    this.enumValues = const [],
    this.attributes = const [],
    this.customAttributes = const [],
    this.dateTimeAttributes = const [],
    this.sqlAttributes = const [],
    this.referenceAttributes = const [],
    this.isEnum = false,
    this.createRepository = false,
    this.isPlural = false,
  });
}

@MappableClass()
class AttributeModel {
  final String name;
  final String type;
  final String columnType;
  final bool isList;
  final bool nullable;
  final bool isPk;
  final bool isEnum;
  final bool includeForQuery;
  final bool includeForEntity;
  final bool createReference;
  final List<TableReferenceModel> references;

  const AttributeModel({
    required this.name,
    required this.type,
    this.columnType = '',
    this.isList = false,
    this.isPk = false,
    this.isEnum = false,
    this.nullable = true,
    this.includeForQuery = false,
    this.includeForEntity = true,
    this.createReference = false,
    this.references = const [],
  });
}

@MappableClass()
class TableReferenceModel {
  final String table;
  final String column;

  const TableReferenceModel({required this.table, required this.column});
}

@MappableClass()
class EnumValues {
  final String name;
  final String value;

  const EnumValues({
    required this.name,
    required this.value,
  });
}
