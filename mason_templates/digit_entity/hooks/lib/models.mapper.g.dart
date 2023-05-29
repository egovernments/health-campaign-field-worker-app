import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'models.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  ConfigModelMapper._(),
  AttributeModelMapper._(),
  TableReferenceModelMapper._(),
  EnumValuesMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class ConfigModelMapper extends BaseMapper<ConfigModel> {
  ConfigModelMapper._();

  @override Function get decoder => decode;
  ConfigModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ConfigModel fromMap(Map<String, dynamic> map) => ConfigModel(name: Mapper.i.$get(map, 'name'), persistBoundaryParameters: Mapper.i.$getOpt(map, 'persistBoundaryParameters') ?? false, ignoreFields: Mapper.i.$getOpt(map, 'ignoreFields') ?? const [], enumValues: Mapper.i.$getOpt(map, 'enumValues') ?? const [], attributes: Mapper.i.$getOpt(map, 'attributes') ?? const [], customAttributes: Mapper.i.$getOpt(map, 'customAttributes') ?? const [], dateTimeAttributes: Mapper.i.$getOpt(map, 'dateTimeAttributes') ?? const [], sqlAttributes: Mapper.i.$getOpt(map, 'sqlAttributes') ?? const [], referenceAttributes: Mapper.i.$getOpt(map, 'referenceAttributes') ?? const [], isEnum: Mapper.i.$getOpt(map, 'isEnum') ?? false, createRepository: Mapper.i.$getOpt(map, 'createRepository') ?? false, isPlural: Mapper.i.$getOpt(map, 'isPlural') ?? false, isSearchResponsePlural: Mapper.i.$getOpt(map, 'isSearchResponsePlural') ?? false);

  @override Function get encoder => (ConfigModel v) => encode(v);
  dynamic encode(ConfigModel v) => toMap(v);
  Map<String, dynamic> toMap(ConfigModel c) => {'name': Mapper.i.$enc(c.name, 'name'), 'persistBoundaryParameters': Mapper.i.$enc(c.persistBoundaryParameters, 'persistBoundaryParameters'), 'ignoreFields': Mapper.i.$enc(c.ignoreFields, 'ignoreFields'), 'enumValues': Mapper.i.$enc(c.enumValues, 'enumValues'), 'attributes': Mapper.i.$enc(c.attributes, 'attributes'), 'customAttributes': Mapper.i.$enc(c.customAttributes, 'customAttributes'), 'dateTimeAttributes': Mapper.i.$enc(c.dateTimeAttributes, 'dateTimeAttributes'), 'sqlAttributes': Mapper.i.$enc(c.sqlAttributes, 'sqlAttributes'), 'referenceAttributes': Mapper.i.$enc(c.referenceAttributes, 'referenceAttributes'), 'isEnum': Mapper.i.$enc(c.isEnum, 'isEnum'), 'createRepository': Mapper.i.$enc(c.createRepository, 'createRepository'), 'isPlural': Mapper.i.$enc(c.isPlural, 'isPlural'), 'isSearchResponsePlural': Mapper.i.$enc(c.isSearchResponsePlural, 'isSearchResponsePlural')};

  @override String stringify(ConfigModel self) => 'ConfigModel(name: ${Mapper.asString(self.name)}, persistBoundaryParameters: ${Mapper.asString(self.persistBoundaryParameters)}, ignoreFields: ${Mapper.asString(self.ignoreFields)}, enumValues: ${Mapper.asString(self.enumValues)}, attributes: ${Mapper.asString(self.attributes)}, customAttributes: ${Mapper.asString(self.customAttributes)}, dateTimeAttributes: ${Mapper.asString(self.dateTimeAttributes)}, sqlAttributes: ${Mapper.asString(self.sqlAttributes)}, referenceAttributes: ${Mapper.asString(self.referenceAttributes)}, isPlural: ${Mapper.asString(self.isPlural)}, isSearchResponsePlural: ${Mapper.asString(self.isSearchResponsePlural)}, createRepository: ${Mapper.asString(self.createRepository)}, isEnum: ${Mapper.asString(self.isEnum)})';
  @override int hash(ConfigModel self) => Mapper.hash(self.name) ^ Mapper.hash(self.persistBoundaryParameters) ^ Mapper.hash(self.ignoreFields) ^ Mapper.hash(self.enumValues) ^ Mapper.hash(self.attributes) ^ Mapper.hash(self.customAttributes) ^ Mapper.hash(self.dateTimeAttributes) ^ Mapper.hash(self.sqlAttributes) ^ Mapper.hash(self.referenceAttributes) ^ Mapper.hash(self.isPlural) ^ Mapper.hash(self.isSearchResponsePlural) ^ Mapper.hash(self.createRepository) ^ Mapper.hash(self.isEnum);
  @override bool equals(ConfigModel self, ConfigModel other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.persistBoundaryParameters, other.persistBoundaryParameters) && Mapper.isEqual(self.ignoreFields, other.ignoreFields) && Mapper.isEqual(self.enumValues, other.enumValues) && Mapper.isEqual(self.attributes, other.attributes) && Mapper.isEqual(self.customAttributes, other.customAttributes) && Mapper.isEqual(self.dateTimeAttributes, other.dateTimeAttributes) && Mapper.isEqual(self.sqlAttributes, other.sqlAttributes) && Mapper.isEqual(self.referenceAttributes, other.referenceAttributes) && Mapper.isEqual(self.isPlural, other.isPlural) && Mapper.isEqual(self.isSearchResponsePlural, other.isSearchResponsePlural) && Mapper.isEqual(self.createRepository, other.createRepository) && Mapper.isEqual(self.isEnum, other.isEnum);

  @override Function get typeFactory => (f) => f<ConfigModel>();
}

extension ConfigModelMapperExtension  on ConfigModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ConfigModelCopyWith<ConfigModel> get copyWith => ConfigModelCopyWith(this, $identity);
}

abstract class ConfigModelCopyWith<$R> {
  factory ConfigModelCopyWith(ConfigModel value, Then<ConfigModel, $R> then) = _ConfigModelCopyWithImpl<$R>;
  ListCopyWith<$R, EnumValues, EnumValuesCopyWith<$R>> get enumValues;
  ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get attributes;
  ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get customAttributes;
  ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get dateTimeAttributes;
  ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get sqlAttributes;
  ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get referenceAttributes;
  $R call({String? name, bool? persistBoundaryParameters, List<String>? ignoreFields, List<EnumValues>? enumValues, List<AttributeModel>? attributes, List<AttributeModel>? customAttributes, List<AttributeModel>? dateTimeAttributes, List<AttributeModel>? sqlAttributes, List<AttributeModel>? referenceAttributes, bool? isEnum, bool? createRepository, bool? isPlural, bool? isSearchResponsePlural});
  $R apply(ConfigModel Function(ConfigModel) transform);
}

class _ConfigModelCopyWithImpl<$R> extends BaseCopyWith<ConfigModel, $R> implements ConfigModelCopyWith<$R> {
  _ConfigModelCopyWithImpl(ConfigModel value, Then<ConfigModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, EnumValues, EnumValuesCopyWith<$R>> get enumValues => ListCopyWith($value.enumValues, (v, t) => EnumValuesCopyWith(v, t), (v) => call(enumValues: v));
  @override ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get attributes => ListCopyWith($value.attributes, (v, t) => AttributeModelCopyWith(v, t), (v) => call(attributes: v));
  @override ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get customAttributes => ListCopyWith($value.customAttributes, (v, t) => AttributeModelCopyWith(v, t), (v) => call(customAttributes: v));
  @override ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get dateTimeAttributes => ListCopyWith($value.dateTimeAttributes, (v, t) => AttributeModelCopyWith(v, t), (v) => call(dateTimeAttributes: v));
  @override ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get sqlAttributes => ListCopyWith($value.sqlAttributes, (v, t) => AttributeModelCopyWith(v, t), (v) => call(sqlAttributes: v));
  @override ListCopyWith<$R, AttributeModel, AttributeModelCopyWith<$R>> get referenceAttributes => ListCopyWith($value.referenceAttributes, (v, t) => AttributeModelCopyWith(v, t), (v) => call(referenceAttributes: v));
  @override $R call({String? name, bool? persistBoundaryParameters, List<String>? ignoreFields, List<EnumValues>? enumValues, List<AttributeModel>? attributes, List<AttributeModel>? customAttributes, List<AttributeModel>? dateTimeAttributes, List<AttributeModel>? sqlAttributes, List<AttributeModel>? referenceAttributes, bool? isEnum, bool? createRepository, bool? isPlural, bool? isSearchResponsePlural}) => $then(ConfigModel(name: name ?? $value.name, persistBoundaryParameters: persistBoundaryParameters ?? $value.persistBoundaryParameters, ignoreFields: ignoreFields ?? $value.ignoreFields, enumValues: enumValues ?? $value.enumValues, attributes: attributes ?? $value.attributes, customAttributes: customAttributes ?? $value.customAttributes, dateTimeAttributes: dateTimeAttributes ?? $value.dateTimeAttributes, sqlAttributes: sqlAttributes ?? $value.sqlAttributes, referenceAttributes: referenceAttributes ?? $value.referenceAttributes, isEnum: isEnum ?? $value.isEnum, createRepository: createRepository ?? $value.createRepository, isPlural: isPlural ?? $value.isPlural, isSearchResponsePlural: isSearchResponsePlural ?? $value.isSearchResponsePlural));
}

class AttributeModelMapper extends BaseMapper<AttributeModel> {
  AttributeModelMapper._();

  @override Function get decoder => decode;
  AttributeModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttributeModel fromMap(Map<String, dynamic> map) => AttributeModel(name: Mapper.i.$get(map, 'name'), type: Mapper.i.$get(map, 'type'), columnType: Mapper.i.$getOpt(map, 'columnType') ?? '', isList: Mapper.i.$getOpt(map, 'isList') ?? false, isPk: Mapper.i.$getOpt(map, 'isPk') ?? false, isEnum: Mapper.i.$getOpt(map, 'isEnum') ?? false, nullable: Mapper.i.$getOpt(map, 'nullable') ?? true, includeForTable: Mapper.i.$getOpt(map, 'includeForTable') ?? true, includeForQuery: Mapper.i.$getOpt(map, 'includeForQuery') ?? false, includeForEntity: Mapper.i.$getOpt(map, 'includeForEntity') ?? true, createReference: Mapper.i.$getOpt(map, 'createReference') ?? false, referencePkName: Mapper.i.$getOpt(map, 'referencePkName'), defaultValue: Mapper.i.$getOpt(map, 'defaultValue'), references: Mapper.i.$getOpt(map, 'references') ?? const []);

  @override Function get encoder => (AttributeModel v) => encode(v);
  dynamic encode(AttributeModel v) => toMap(v);
  Map<String, dynamic> toMap(AttributeModel a) => {'name': Mapper.i.$enc(a.name, 'name'), 'type': Mapper.i.$enc(a.type, 'type'), 'columnType': Mapper.i.$enc(a.columnType, 'columnType'), 'isList': Mapper.i.$enc(a.isList, 'isList'), 'isPk': Mapper.i.$enc(a.isPk, 'isPk'), 'isEnum': Mapper.i.$enc(a.isEnum, 'isEnum'), 'nullable': Mapper.i.$enc(a.nullable, 'nullable'), 'includeForTable': Mapper.i.$enc(a.includeForTable, 'includeForTable'), 'includeForQuery': Mapper.i.$enc(a.includeForQuery, 'includeForQuery'), 'includeForEntity': Mapper.i.$enc(a.includeForEntity, 'includeForEntity'), 'createReference': Mapper.i.$enc(a.createReference, 'createReference'), 'referencePkName': Mapper.i.$enc(a.referencePkName, 'referencePkName'), 'defaultValue': Mapper.i.$enc(a.defaultValue, 'defaultValue'), 'references': Mapper.i.$enc(a.references, 'references')};

  @override String stringify(AttributeModel self) => 'AttributeModel(name: ${Mapper.asString(self.name)}, type: ${Mapper.asString(self.type)}, columnType: ${Mapper.asString(self.columnType)}, isList: ${Mapper.asString(self.isList)}, nullable: ${Mapper.asString(self.nullable)}, isPk: ${Mapper.asString(self.isPk)}, isEnum: ${Mapper.asString(self.isEnum)}, includeForQuery: ${Mapper.asString(self.includeForQuery)}, includeForEntity: ${Mapper.asString(self.includeForEntity)}, includeForTable: ${Mapper.asString(self.includeForTable)}, createReference: ${Mapper.asString(self.createReference)}, referencePkName: ${Mapper.asString(self.referencePkName)}, defaultValue: ${Mapper.asString(self.defaultValue)}, references: ${Mapper.asString(self.references)})';
  @override int hash(AttributeModel self) => Mapper.hash(self.name) ^ Mapper.hash(self.type) ^ Mapper.hash(self.columnType) ^ Mapper.hash(self.isList) ^ Mapper.hash(self.nullable) ^ Mapper.hash(self.isPk) ^ Mapper.hash(self.isEnum) ^ Mapper.hash(self.includeForQuery) ^ Mapper.hash(self.includeForEntity) ^ Mapper.hash(self.includeForTable) ^ Mapper.hash(self.createReference) ^ Mapper.hash(self.referencePkName) ^ Mapper.hash(self.defaultValue) ^ Mapper.hash(self.references);
  @override bool equals(AttributeModel self, AttributeModel other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.type, other.type) && Mapper.isEqual(self.columnType, other.columnType) && Mapper.isEqual(self.isList, other.isList) && Mapper.isEqual(self.nullable, other.nullable) && Mapper.isEqual(self.isPk, other.isPk) && Mapper.isEqual(self.isEnum, other.isEnum) && Mapper.isEqual(self.includeForQuery, other.includeForQuery) && Mapper.isEqual(self.includeForEntity, other.includeForEntity) && Mapper.isEqual(self.includeForTable, other.includeForTable) && Mapper.isEqual(self.createReference, other.createReference) && Mapper.isEqual(self.referencePkName, other.referencePkName) && Mapper.isEqual(self.defaultValue, other.defaultValue) && Mapper.isEqual(self.references, other.references);

  @override Function get typeFactory => (f) => f<AttributeModel>();
}

extension AttributeModelMapperExtension  on AttributeModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttributeModelCopyWith<AttributeModel> get copyWith => AttributeModelCopyWith(this, $identity);
}

abstract class AttributeModelCopyWith<$R> {
  factory AttributeModelCopyWith(AttributeModel value, Then<AttributeModel, $R> then) = _AttributeModelCopyWithImpl<$R>;
  ListCopyWith<$R, TableReferenceModel, TableReferenceModelCopyWith<$R>> get references;
  $R call({String? name, String? type, String? columnType, bool? isList, bool? isPk, bool? isEnum, bool? nullable, bool? includeForTable, bool? includeForQuery, bool? includeForEntity, bool? createReference, String? referencePkName, String? defaultValue, List<TableReferenceModel>? references});
  $R apply(AttributeModel Function(AttributeModel) transform);
}

class _AttributeModelCopyWithImpl<$R> extends BaseCopyWith<AttributeModel, $R> implements AttributeModelCopyWith<$R> {
  _AttributeModelCopyWithImpl(AttributeModel value, Then<AttributeModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, TableReferenceModel, TableReferenceModelCopyWith<$R>> get references => ListCopyWith($value.references, (v, t) => TableReferenceModelCopyWith(v, t), (v) => call(references: v));
  @override $R call({String? name, String? type, String? columnType, bool? isList, bool? isPk, bool? isEnum, bool? nullable, bool? includeForTable, bool? includeForQuery, bool? includeForEntity, bool? createReference, Object? referencePkName = $none, Object? defaultValue = $none, List<TableReferenceModel>? references}) => $then(AttributeModel(name: name ?? $value.name, type: type ?? $value.type, columnType: columnType ?? $value.columnType, isList: isList ?? $value.isList, isPk: isPk ?? $value.isPk, isEnum: isEnum ?? $value.isEnum, nullable: nullable ?? $value.nullable, includeForTable: includeForTable ?? $value.includeForTable, includeForQuery: includeForQuery ?? $value.includeForQuery, includeForEntity: includeForEntity ?? $value.includeForEntity, createReference: createReference ?? $value.createReference, referencePkName: or(referencePkName, $value.referencePkName), defaultValue: or(defaultValue, $value.defaultValue), references: references ?? $value.references));
}

class TableReferenceModelMapper extends BaseMapper<TableReferenceModel> {
  TableReferenceModelMapper._();

  @override Function get decoder => decode;
  TableReferenceModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TableReferenceModel fromMap(Map<String, dynamic> map) => TableReferenceModel(table: Mapper.i.$get(map, 'table'), column: Mapper.i.$get(map, 'column'), pkName: Mapper.i.$get(map, 'pkName'));

  @override Function get encoder => (TableReferenceModel v) => encode(v);
  dynamic encode(TableReferenceModel v) => toMap(v);
  Map<String, dynamic> toMap(TableReferenceModel t) => {'table': Mapper.i.$enc(t.table, 'table'), 'column': Mapper.i.$enc(t.column, 'column'), 'pkName': Mapper.i.$enc(t.pkName, 'pkName')};

  @override String stringify(TableReferenceModel self) => 'TableReferenceModel(table: ${Mapper.asString(self.table)}, column: ${Mapper.asString(self.column)}, pkName: ${Mapper.asString(self.pkName)})';
  @override int hash(TableReferenceModel self) => Mapper.hash(self.table) ^ Mapper.hash(self.column) ^ Mapper.hash(self.pkName);
  @override bool equals(TableReferenceModel self, TableReferenceModel other) => Mapper.isEqual(self.table, other.table) && Mapper.isEqual(self.column, other.column) && Mapper.isEqual(self.pkName, other.pkName);

  @override Function get typeFactory => (f) => f<TableReferenceModel>();
}

extension TableReferenceModelMapperExtension  on TableReferenceModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TableReferenceModelCopyWith<TableReferenceModel> get copyWith => TableReferenceModelCopyWith(this, $identity);
}

abstract class TableReferenceModelCopyWith<$R> {
  factory TableReferenceModelCopyWith(TableReferenceModel value, Then<TableReferenceModel, $R> then) = _TableReferenceModelCopyWithImpl<$R>;
  $R call({String? table, String? column, String? pkName});
  $R apply(TableReferenceModel Function(TableReferenceModel) transform);
}

class _TableReferenceModelCopyWithImpl<$R> extends BaseCopyWith<TableReferenceModel, $R> implements TableReferenceModelCopyWith<$R> {
  _TableReferenceModelCopyWithImpl(TableReferenceModel value, Then<TableReferenceModel, $R> then) : super(value, then);

  @override $R call({String? table, String? column, String? pkName}) => $then(TableReferenceModel(table: table ?? $value.table, column: column ?? $value.column, pkName: pkName ?? $value.pkName));
}

class EnumValuesMapper extends BaseMapper<EnumValues> {
  EnumValuesMapper._();

  @override Function get decoder => decode;
  EnumValues decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  EnumValues fromMap(Map<String, dynamic> map) => EnumValues(name: Mapper.i.$get(map, 'name'), value: Mapper.i.$get(map, 'value'));

  @override Function get encoder => (EnumValues v) => encode(v);
  dynamic encode(EnumValues v) => toMap(v);
  Map<String, dynamic> toMap(EnumValues e) => {'name': Mapper.i.$enc(e.name, 'name'), 'value': Mapper.i.$enc(e.value, 'value')};

  @override String stringify(EnumValues self) => 'EnumValues(name: ${Mapper.asString(self.name)}, value: ${Mapper.asString(self.value)})';
  @override int hash(EnumValues self) => Mapper.hash(self.name) ^ Mapper.hash(self.value);
  @override bool equals(EnumValues self, EnumValues other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.value, other.value);

  @override Function get typeFactory => (f) => f<EnumValues>();
}

extension EnumValuesMapperExtension  on EnumValues {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  EnumValuesCopyWith<EnumValues> get copyWith => EnumValuesCopyWith(this, $identity);
}

abstract class EnumValuesCopyWith<$R> {
  factory EnumValuesCopyWith(EnumValues value, Then<EnumValues, $R> then) = _EnumValuesCopyWithImpl<$R>;
  $R call({String? name, String? value});
  $R apply(EnumValues Function(EnumValues) transform);
}

class _EnumValuesCopyWithImpl<$R> extends BaseCopyWith<EnumValues, $R> implements EnumValuesCopyWith<$R> {
  _EnumValuesCopyWithImpl(EnumValues value, Then<EnumValues, $R> then) : super(value, then);

  @override $R call({String? name, String? value}) => $then(EnumValues(name: name ?? $value.name, value: value ?? $value.value));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
