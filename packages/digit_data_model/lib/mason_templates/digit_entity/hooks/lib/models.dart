import 'package:dart_mappable/dart_mappable.dart';

part 'models.mapper.dart';

@MappableClass()
class ConfigModel with ConfigModelMappable {
  final String name;
  final bool persistBoundaryParameters;
  final List<String> ignoreFields;
  final List<EnumValues> enumValues;
  final List<AttributeModel> attributes;
  final List<AttributeModel> customAttributes;
  final List<AttributeModel> dateTimeAttributes;
  final List<AttributeModel> sqlAttributes;
  final List<AttributeModel> referenceAttributes;
  final bool isPlural;
  final bool isSearchResponsePlural;

  final bool createRepository;
  final bool isEnum;

  const ConfigModel({
    required this.name,
    this.persistBoundaryParameters = false,
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
    this.isSearchResponsePlural = false,
  });
}

@MappableClass()
class AttributeModel with AttributeModelMappable {
  final String name;
  final String type;
  final String columnType;
  final bool isList;
  final bool nullable;
  final bool isPk;
  final bool isEnum;
  final bool includeForQuery;
  final bool includeForEntity;
  final bool includeForTable;
  final bool createReference;
  final String? referencePkName;
  final String? defaultValue;
  final List<TableReferenceModel> references;

  const AttributeModel({
    required this.name,
    required this.type,
    this.columnType = '',
    this.isList = false,
    this.isPk = false,
    this.isEnum = false,
    this.nullable = true,
    this.includeForTable = true,
    this.includeForQuery = false,
    this.includeForEntity = true,
    this.createReference = false,
    this.referencePkName,
    this.defaultValue,
    this.references = const [],
  });
}

@MappableClass()
class TableReferenceModel with TableReferenceModelMappable {
  final String table;
  final String column;
  final String pkName;

  const TableReferenceModel({
    required this.table,
    required this.column,
    required this.pkName,
  });
}

@MappableClass()
class EnumValues with EnumValuesMappable {
  final String name;
  final String value;

  const EnumValues({
    required this.name,
    required this.value,
  });
}
