// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'models.dart';

class ConfigModelMapper extends ClassMapperBase<ConfigModel> {
  ConfigModelMapper._();

  static ConfigModelMapper? _instance;
  static ConfigModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ConfigModel';

  static String _$name(ConfigModel v) => v.name;
  static const Field<ConfigModel, String> _f$name = Field('name', _$name);
  static bool _$persistBoundaryParameters(ConfigModel v) =>
      v.persistBoundaryParameters;
  static const Field<ConfigModel, bool> _f$persistBoundaryParameters = Field(
      'persistBoundaryParameters', _$persistBoundaryParameters,
      opt: true, def: false);
  static List<String> _$ignoreFields(ConfigModel v) => v.ignoreFields;
  static const Field<ConfigModel, List<String>> _f$ignoreFields =
      Field('ignoreFields', _$ignoreFields, opt: true, def: const []);
  static List<EnumValues> _$enumValues(ConfigModel v) => v.enumValues;
  static const Field<ConfigModel, List<EnumValues>> _f$enumValues =
      Field('enumValues', _$enumValues, opt: true, def: const []);
  static List<AttributeModel> _$attributes(ConfigModel v) => v.attributes;
  static const Field<ConfigModel, List<AttributeModel>> _f$attributes =
      Field('attributes', _$attributes, opt: true, def: const []);
  static List<AttributeModel> _$customAttributes(ConfigModel v) =>
      v.customAttributes;
  static const Field<ConfigModel, List<AttributeModel>> _f$customAttributes =
      Field('customAttributes', _$customAttributes, opt: true, def: const []);
  static List<AttributeModel> _$dateTimeAttributes(ConfigModel v) =>
      v.dateTimeAttributes;
  static const Field<ConfigModel, List<AttributeModel>> _f$dateTimeAttributes =
      Field('dateTimeAttributes', _$dateTimeAttributes,
          opt: true, def: const []);
  static List<AttributeModel> _$sqlAttributes(ConfigModel v) => v.sqlAttributes;
  static const Field<ConfigModel, List<AttributeModel>> _f$sqlAttributes =
      Field('sqlAttributes', _$sqlAttributes, opt: true, def: const []);
  static List<AttributeModel> _$referenceAttributes(ConfigModel v) =>
      v.referenceAttributes;
  static const Field<ConfigModel, List<AttributeModel>> _f$referenceAttributes =
      Field('referenceAttributes', _$referenceAttributes,
          opt: true, def: const []);
  static bool _$isEnum(ConfigModel v) => v.isEnum;
  static const Field<ConfigModel, bool> _f$isEnum =
      Field('isEnum', _$isEnum, opt: true, def: false);
  static bool _$createRepository(ConfigModel v) => v.createRepository;
  static const Field<ConfigModel, bool> _f$createRepository =
      Field('createRepository', _$createRepository, opt: true, def: false);
  static bool _$isPlural(ConfigModel v) => v.isPlural;
  static const Field<ConfigModel, bool> _f$isPlural =
      Field('isPlural', _$isPlural, opt: true, def: false);
  static bool _$isSearchResponsePlural(ConfigModel v) =>
      v.isSearchResponsePlural;
  static const Field<ConfigModel, bool> _f$isSearchResponsePlural = Field(
      'isSearchResponsePlural', _$isSearchResponsePlural,
      opt: true, def: false);

  @override
  final MappableFields<ConfigModel> fields = const {
    #name: _f$name,
    #persistBoundaryParameters: _f$persistBoundaryParameters,
    #ignoreFields: _f$ignoreFields,
    #enumValues: _f$enumValues,
    #attributes: _f$attributes,
    #customAttributes: _f$customAttributes,
    #dateTimeAttributes: _f$dateTimeAttributes,
    #sqlAttributes: _f$sqlAttributes,
    #referenceAttributes: _f$referenceAttributes,
    #isEnum: _f$isEnum,
    #createRepository: _f$createRepository,
    #isPlural: _f$isPlural,
    #isSearchResponsePlural: _f$isSearchResponsePlural,
  };

  static ConfigModel _instantiate(DecodingData data) {
    return ConfigModel(
        name: data.dec(_f$name),
        persistBoundaryParameters: data.dec(_f$persistBoundaryParameters),
        ignoreFields: data.dec(_f$ignoreFields),
        enumValues: data.dec(_f$enumValues),
        attributes: data.dec(_f$attributes),
        customAttributes: data.dec(_f$customAttributes),
        dateTimeAttributes: data.dec(_f$dateTimeAttributes),
        sqlAttributes: data.dec(_f$sqlAttributes),
        referenceAttributes: data.dec(_f$referenceAttributes),
        isEnum: data.dec(_f$isEnum),
        createRepository: data.dec(_f$createRepository),
        isPlural: data.dec(_f$isPlural),
        isSearchResponsePlural: data.dec(_f$isSearchResponsePlural));
  }

  @override
  final Function instantiate = _instantiate;

  static ConfigModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConfigModel>(map);
  }

  static ConfigModel fromJson(String json) {
    return ensureInitialized().decodeJson<ConfigModel>(json);
  }
}

mixin ConfigModelMappable {
  String toJson() {
    return ConfigModelMapper.ensureInitialized()
        .encodeJson<ConfigModel>(this as ConfigModel);
  }

  Map<String, dynamic> toMap() {
    return ConfigModelMapper.ensureInitialized()
        .encodeMap<ConfigModel>(this as ConfigModel);
  }

  ConfigModelCopyWith<ConfigModel, ConfigModel, ConfigModel> get copyWith =>
      _ConfigModelCopyWithImpl(this as ConfigModel, $identity, $identity);
  @override
  String toString() {
    return ConfigModelMapper.ensureInitialized()
        .stringifyValue(this as ConfigModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfigModelMapper.ensureInitialized()
                .isValueEqual(this as ConfigModel, other));
  }

  @override
  int get hashCode {
    return ConfigModelMapper.ensureInitialized().hashValue(this as ConfigModel);
  }
}

extension ConfigModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConfigModel, $Out> {
  ConfigModelCopyWith<$R, ConfigModel, $Out> get $asConfigModel =>
      $base.as((v, t, t2) => _ConfigModelCopyWithImpl(v, t, t2));
}

abstract class ConfigModelCopyWith<$R, $In extends ConfigModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get ignoreFields;
  ListCopyWith<$R, EnumValues, EnumValuesCopyWith<$R, EnumValues, EnumValues>>
      get enumValues;
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get attributes;
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get customAttributes;
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get dateTimeAttributes;
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get sqlAttributes;
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get referenceAttributes;
  $R call(
      {String? name,
      bool? persistBoundaryParameters,
      List<String>? ignoreFields,
      List<EnumValues>? enumValues,
      List<AttributeModel>? attributes,
      List<AttributeModel>? customAttributes,
      List<AttributeModel>? dateTimeAttributes,
      List<AttributeModel>? sqlAttributes,
      List<AttributeModel>? referenceAttributes,
      bool? isEnum,
      bool? createRepository,
      bool? isPlural,
      bool? isSearchResponsePlural});
  ConfigModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConfigModel, $Out>
    implements ConfigModelCopyWith<$R, ConfigModel, $Out> {
  _ConfigModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConfigModel> $mapper =
      ConfigModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get ignoreFields => ListCopyWith(
          $value.ignoreFields,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(ignoreFields: v));
  @override
  ListCopyWith<$R, EnumValues, EnumValuesCopyWith<$R, EnumValues, EnumValues>>
      get enumValues => ListCopyWith($value.enumValues,
          (v, t) => v.copyWith.$chain(t), (v) => call(enumValues: v));
  @override
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get attributes => ListCopyWith($value.attributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(attributes: v));
  @override
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get customAttributes => ListCopyWith($value.customAttributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(customAttributes: v));
  @override
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get dateTimeAttributes => ListCopyWith($value.dateTimeAttributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(dateTimeAttributes: v));
  @override
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get sqlAttributes => ListCopyWith($value.sqlAttributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(sqlAttributes: v));
  @override
  ListCopyWith<$R, AttributeModel,
          AttributeModelCopyWith<$R, AttributeModel, AttributeModel>>
      get referenceAttributes => ListCopyWith($value.referenceAttributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(referenceAttributes: v));
  @override
  $R call(
          {String? name,
          bool? persistBoundaryParameters,
          List<String>? ignoreFields,
          List<EnumValues>? enumValues,
          List<AttributeModel>? attributes,
          List<AttributeModel>? customAttributes,
          List<AttributeModel>? dateTimeAttributes,
          List<AttributeModel>? sqlAttributes,
          List<AttributeModel>? referenceAttributes,
          bool? isEnum,
          bool? createRepository,
          bool? isPlural,
          bool? isSearchResponsePlural}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (persistBoundaryParameters != null)
          #persistBoundaryParameters: persistBoundaryParameters,
        if (ignoreFields != null) #ignoreFields: ignoreFields,
        if (enumValues != null) #enumValues: enumValues,
        if (attributes != null) #attributes: attributes,
        if (customAttributes != null) #customAttributes: customAttributes,
        if (dateTimeAttributes != null) #dateTimeAttributes: dateTimeAttributes,
        if (sqlAttributes != null) #sqlAttributes: sqlAttributes,
        if (referenceAttributes != null)
          #referenceAttributes: referenceAttributes,
        if (isEnum != null) #isEnum: isEnum,
        if (createRepository != null) #createRepository: createRepository,
        if (isPlural != null) #isPlural: isPlural,
        if (isSearchResponsePlural != null)
          #isSearchResponsePlural: isSearchResponsePlural
      }));
  @override
  ConfigModel $make(CopyWithData data) => ConfigModel(
      name: data.get(#name, or: $value.name),
      persistBoundaryParameters: data.get(#persistBoundaryParameters,
          or: $value.persistBoundaryParameters),
      ignoreFields: data.get(#ignoreFields, or: $value.ignoreFields),
      enumValues: data.get(#enumValues, or: $value.enumValues),
      attributes: data.get(#attributes, or: $value.attributes),
      customAttributes:
          data.get(#customAttributes, or: $value.customAttributes),
      dateTimeAttributes:
          data.get(#dateTimeAttributes, or: $value.dateTimeAttributes),
      sqlAttributes: data.get(#sqlAttributes, or: $value.sqlAttributes),
      referenceAttributes:
          data.get(#referenceAttributes, or: $value.referenceAttributes),
      isEnum: data.get(#isEnum, or: $value.isEnum),
      createRepository:
          data.get(#createRepository, or: $value.createRepository),
      isPlural: data.get(#isPlural, or: $value.isPlural),
      isSearchResponsePlural:
          data.get(#isSearchResponsePlural, or: $value.isSearchResponsePlural));

  @override
  ConfigModelCopyWith<$R2, ConfigModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConfigModelCopyWithImpl($value, $cast, t);
}

class EnumValuesMapper extends ClassMapperBase<EnumValues> {
  EnumValuesMapper._();

  static EnumValuesMapper? _instance;
  static EnumValuesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnumValuesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnumValues';

  static String _$name(EnumValues v) => v.name;
  static const Field<EnumValues, String> _f$name = Field('name', _$name);
  static String _$value(EnumValues v) => v.value;
  static const Field<EnumValues, String> _f$value = Field('value', _$value);

  @override
  final MappableFields<EnumValues> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  static EnumValues _instantiate(DecodingData data) {
    return EnumValues(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static EnumValues fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnumValues>(map);
  }

  static EnumValues fromJson(String json) {
    return ensureInitialized().decodeJson<EnumValues>(json);
  }
}

mixin EnumValuesMappable {
  String toJson() {
    return EnumValuesMapper.ensureInitialized()
        .encodeJson<EnumValues>(this as EnumValues);
  }

  Map<String, dynamic> toMap() {
    return EnumValuesMapper.ensureInitialized()
        .encodeMap<EnumValues>(this as EnumValues);
  }

  EnumValuesCopyWith<EnumValues, EnumValues, EnumValues> get copyWith =>
      _EnumValuesCopyWithImpl(this as EnumValues, $identity, $identity);
  @override
  String toString() {
    return EnumValuesMapper.ensureInitialized()
        .stringifyValue(this as EnumValues);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            EnumValuesMapper.ensureInitialized()
                .isValueEqual(this as EnumValues, other));
  }

  @override
  int get hashCode {
    return EnumValuesMapper.ensureInitialized().hashValue(this as EnumValues);
  }
}

extension EnumValuesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnumValues, $Out> {
  EnumValuesCopyWith<$R, EnumValues, $Out> get $asEnumValues =>
      $base.as((v, t, t2) => _EnumValuesCopyWithImpl(v, t, t2));
}

abstract class EnumValuesCopyWith<$R, $In extends EnumValues, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? value});
  EnumValuesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnumValuesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnumValues, $Out>
    implements EnumValuesCopyWith<$R, EnumValues, $Out> {
  _EnumValuesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnumValues> $mapper =
      EnumValuesMapper.ensureInitialized();
  @override
  $R call({String? name, String? value}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (value != null) #value: value}));
  @override
  EnumValues $make(CopyWithData data) => EnumValues(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  EnumValuesCopyWith<$R2, EnumValues, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EnumValuesCopyWithImpl($value, $cast, t);
}

class AttributeModelMapper extends ClassMapperBase<AttributeModel> {
  AttributeModelMapper._();

  static AttributeModelMapper? _instance;
  static AttributeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttributeModel';

  static String _$name(AttributeModel v) => v.name;
  static const Field<AttributeModel, String> _f$name = Field('name', _$name);
  static String _$type(AttributeModel v) => v.type;
  static const Field<AttributeModel, String> _f$type = Field('type', _$type);
  static String _$columnType(AttributeModel v) => v.columnType;
  static const Field<AttributeModel, String> _f$columnType =
      Field('columnType', _$columnType, opt: true, def: '');
  static bool _$isList(AttributeModel v) => v.isList;
  static const Field<AttributeModel, bool> _f$isList =
      Field('isList', _$isList, opt: true, def: false);
  static bool _$isPk(AttributeModel v) => v.isPk;
  static const Field<AttributeModel, bool> _f$isPk =
      Field('isPk', _$isPk, opt: true, def: false);
  static bool _$isEnum(AttributeModel v) => v.isEnum;
  static const Field<AttributeModel, bool> _f$isEnum =
      Field('isEnum', _$isEnum, opt: true, def: false);
  static bool _$nullable(AttributeModel v) => v.nullable;
  static const Field<AttributeModel, bool> _f$nullable =
      Field('nullable', _$nullable, opt: true, def: true);
  static bool _$includeForTable(AttributeModel v) => v.includeForTable;
  static const Field<AttributeModel, bool> _f$includeForTable =
      Field('includeForTable', _$includeForTable, opt: true, def: true);
  static bool _$includeForQuery(AttributeModel v) => v.includeForQuery;
  static const Field<AttributeModel, bool> _f$includeForQuery =
      Field('includeForQuery', _$includeForQuery, opt: true, def: false);
  static bool _$includeForEntity(AttributeModel v) => v.includeForEntity;
  static const Field<AttributeModel, bool> _f$includeForEntity =
      Field('includeForEntity', _$includeForEntity, opt: true, def: true);
  static bool _$createReference(AttributeModel v) => v.createReference;
  static const Field<AttributeModel, bool> _f$createReference =
      Field('createReference', _$createReference, opt: true, def: false);
  static String? _$referencePkName(AttributeModel v) => v.referencePkName;
  static const Field<AttributeModel, String> _f$referencePkName =
      Field('referencePkName', _$referencePkName, opt: true);
  static String? _$defaultValue(AttributeModel v) => v.defaultValue;
  static const Field<AttributeModel, String> _f$defaultValue =
      Field('defaultValue', _$defaultValue, opt: true);
  static List<TableReferenceModel> _$references(AttributeModel v) =>
      v.references;
  static const Field<AttributeModel, List<TableReferenceModel>> _f$references =
      Field('references', _$references, opt: true, def: const []);

  @override
  final MappableFields<AttributeModel> fields = const {
    #name: _f$name,
    #type: _f$type,
    #columnType: _f$columnType,
    #isList: _f$isList,
    #isPk: _f$isPk,
    #isEnum: _f$isEnum,
    #nullable: _f$nullable,
    #includeForTable: _f$includeForTable,
    #includeForQuery: _f$includeForQuery,
    #includeForEntity: _f$includeForEntity,
    #createReference: _f$createReference,
    #referencePkName: _f$referencePkName,
    #defaultValue: _f$defaultValue,
    #references: _f$references,
  };

  static AttributeModel _instantiate(DecodingData data) {
    return AttributeModel(
        name: data.dec(_f$name),
        type: data.dec(_f$type),
        columnType: data.dec(_f$columnType),
        isList: data.dec(_f$isList),
        isPk: data.dec(_f$isPk),
        isEnum: data.dec(_f$isEnum),
        nullable: data.dec(_f$nullable),
        includeForTable: data.dec(_f$includeForTable),
        includeForQuery: data.dec(_f$includeForQuery),
        includeForEntity: data.dec(_f$includeForEntity),
        createReference: data.dec(_f$createReference),
        referencePkName: data.dec(_f$referencePkName),
        defaultValue: data.dec(_f$defaultValue),
        references: data.dec(_f$references));
  }

  @override
  final Function instantiate = _instantiate;

  static AttributeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttributeModel>(map);
  }

  static AttributeModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttributeModel>(json);
  }
}

mixin AttributeModelMappable {
  String toJson() {
    return AttributeModelMapper.ensureInitialized()
        .encodeJson<AttributeModel>(this as AttributeModel);
  }

  Map<String, dynamic> toMap() {
    return AttributeModelMapper.ensureInitialized()
        .encodeMap<AttributeModel>(this as AttributeModel);
  }

  AttributeModelCopyWith<AttributeModel, AttributeModel, AttributeModel>
      get copyWith => _AttributeModelCopyWithImpl(
          this as AttributeModel, $identity, $identity);
  @override
  String toString() {
    return AttributeModelMapper.ensureInitialized()
        .stringifyValue(this as AttributeModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributeModelMapper.ensureInitialized()
                .isValueEqual(this as AttributeModel, other));
  }

  @override
  int get hashCode {
    return AttributeModelMapper.ensureInitialized()
        .hashValue(this as AttributeModel);
  }
}

extension AttributeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttributeModel, $Out> {
  AttributeModelCopyWith<$R, AttributeModel, $Out> get $asAttributeModel =>
      $base.as((v, t, t2) => _AttributeModelCopyWithImpl(v, t, t2));
}

abstract class AttributeModelCopyWith<$R, $In extends AttributeModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      TableReferenceModel,
      TableReferenceModelCopyWith<$R, TableReferenceModel,
          TableReferenceModel>> get references;
  $R call(
      {String? name,
      String? type,
      String? columnType,
      bool? isList,
      bool? isPk,
      bool? isEnum,
      bool? nullable,
      bool? includeForTable,
      bool? includeForQuery,
      bool? includeForEntity,
      bool? createReference,
      String? referencePkName,
      String? defaultValue,
      List<TableReferenceModel>? references});
  AttributeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttributeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttributeModel, $Out>
    implements AttributeModelCopyWith<$R, AttributeModel, $Out> {
  _AttributeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttributeModel> $mapper =
      AttributeModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      TableReferenceModel,
      TableReferenceModelCopyWith<$R, TableReferenceModel,
          TableReferenceModel>> get references => ListCopyWith(
      $value.references,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(references: v));
  @override
  $R call(
          {String? name,
          String? type,
          String? columnType,
          bool? isList,
          bool? isPk,
          bool? isEnum,
          bool? nullable,
          bool? includeForTable,
          bool? includeForQuery,
          bool? includeForEntity,
          bool? createReference,
          Object? referencePkName = $none,
          Object? defaultValue = $none,
          List<TableReferenceModel>? references}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (type != null) #type: type,
        if (columnType != null) #columnType: columnType,
        if (isList != null) #isList: isList,
        if (isPk != null) #isPk: isPk,
        if (isEnum != null) #isEnum: isEnum,
        if (nullable != null) #nullable: nullable,
        if (includeForTable != null) #includeForTable: includeForTable,
        if (includeForQuery != null) #includeForQuery: includeForQuery,
        if (includeForEntity != null) #includeForEntity: includeForEntity,
        if (createReference != null) #createReference: createReference,
        if (referencePkName != $none) #referencePkName: referencePkName,
        if (defaultValue != $none) #defaultValue: defaultValue,
        if (references != null) #references: references
      }));
  @override
  AttributeModel $make(CopyWithData data) => AttributeModel(
      name: data.get(#name, or: $value.name),
      type: data.get(#type, or: $value.type),
      columnType: data.get(#columnType, or: $value.columnType),
      isList: data.get(#isList, or: $value.isList),
      isPk: data.get(#isPk, or: $value.isPk),
      isEnum: data.get(#isEnum, or: $value.isEnum),
      nullable: data.get(#nullable, or: $value.nullable),
      includeForTable: data.get(#includeForTable, or: $value.includeForTable),
      includeForQuery: data.get(#includeForQuery, or: $value.includeForQuery),
      includeForEntity:
          data.get(#includeForEntity, or: $value.includeForEntity),
      createReference: data.get(#createReference, or: $value.createReference),
      referencePkName: data.get(#referencePkName, or: $value.referencePkName),
      defaultValue: data.get(#defaultValue, or: $value.defaultValue),
      references: data.get(#references, or: $value.references));

  @override
  AttributeModelCopyWith<$R2, AttributeModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttributeModelCopyWithImpl($value, $cast, t);
}

class TableReferenceModelMapper extends ClassMapperBase<TableReferenceModel> {
  TableReferenceModelMapper._();

  static TableReferenceModelMapper? _instance;
  static TableReferenceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TableReferenceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TableReferenceModel';

  static String _$table(TableReferenceModel v) => v.table;
  static const Field<TableReferenceModel, String> _f$table =
      Field('table', _$table);
  static String _$column(TableReferenceModel v) => v.column;
  static const Field<TableReferenceModel, String> _f$column =
      Field('column', _$column);
  static String _$pkName(TableReferenceModel v) => v.pkName;
  static const Field<TableReferenceModel, String> _f$pkName =
      Field('pkName', _$pkName);

  @override
  final MappableFields<TableReferenceModel> fields = const {
    #table: _f$table,
    #column: _f$column,
    #pkName: _f$pkName,
  };

  static TableReferenceModel _instantiate(DecodingData data) {
    return TableReferenceModel(
        table: data.dec(_f$table),
        column: data.dec(_f$column),
        pkName: data.dec(_f$pkName));
  }

  @override
  final Function instantiate = _instantiate;

  static TableReferenceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TableReferenceModel>(map);
  }

  static TableReferenceModel fromJson(String json) {
    return ensureInitialized().decodeJson<TableReferenceModel>(json);
  }
}

mixin TableReferenceModelMappable {
  String toJson() {
    return TableReferenceModelMapper.ensureInitialized()
        .encodeJson<TableReferenceModel>(this as TableReferenceModel);
  }

  Map<String, dynamic> toMap() {
    return TableReferenceModelMapper.ensureInitialized()
        .encodeMap<TableReferenceModel>(this as TableReferenceModel);
  }

  TableReferenceModelCopyWith<TableReferenceModel, TableReferenceModel,
          TableReferenceModel>
      get copyWith => _TableReferenceModelCopyWithImpl(
          this as TableReferenceModel, $identity, $identity);
  @override
  String toString() {
    return TableReferenceModelMapper.ensureInitialized()
        .stringifyValue(this as TableReferenceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TableReferenceModelMapper.ensureInitialized()
                .isValueEqual(this as TableReferenceModel, other));
  }

  @override
  int get hashCode {
    return TableReferenceModelMapper.ensureInitialized()
        .hashValue(this as TableReferenceModel);
  }
}

extension TableReferenceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TableReferenceModel, $Out> {
  TableReferenceModelCopyWith<$R, TableReferenceModel, $Out>
      get $asTableReferenceModel =>
          $base.as((v, t, t2) => _TableReferenceModelCopyWithImpl(v, t, t2));
}

abstract class TableReferenceModelCopyWith<$R, $In extends TableReferenceModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? table, String? column, String? pkName});
  TableReferenceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TableReferenceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TableReferenceModel, $Out>
    implements TableReferenceModelCopyWith<$R, TableReferenceModel, $Out> {
  _TableReferenceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TableReferenceModel> $mapper =
      TableReferenceModelMapper.ensureInitialized();
  @override
  $R call({String? table, String? column, String? pkName}) =>
      $apply(FieldCopyWithData({
        if (table != null) #table: table,
        if (column != null) #column: column,
        if (pkName != null) #pkName: pkName
      }));
  @override
  TableReferenceModel $make(CopyWithData data) => TableReferenceModel(
      table: data.get(#table, or: $value.table),
      column: data.get(#column, or: $value.column),
      pkName: data.get(#pkName, or: $value.pkName));

  @override
  TableReferenceModelCopyWith<$R2, TableReferenceModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TableReferenceModelCopyWithImpl($value, $cast, t);
}
