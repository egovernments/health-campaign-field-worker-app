// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDashboardConfigSchemaCollection on Isar {
  IsarCollection<DashboardConfigSchema> get dashboardConfigSchemas =>
      this.collection();
}

const DashboardConfigSchemaSchema = CollectionSchema(
  name: r'DashboardConfigSchema',
  id: 5327278717036238119,
  properties: {
    r'charts': PropertySchema(
      id: 0,
      name: r'charts',
      type: IsarType.objectList,
      target: r'DashboardChartConfigSchema',
    ),
    r'enableDashboard': PropertySchema(
      id: 1,
      name: r'enableDashboard',
      type: IsarType.bool,
    ),
    r'projectTypeCode': PropertySchema(
      id: 2,
      name: r'projectTypeCode',
      type: IsarType.string,
    )
  },
  estimateSize: _dashboardConfigSchemaEstimateSize,
  serialize: _dashboardConfigSchemaSerialize,
  deserialize: _dashboardConfigSchemaDeserialize,
  deserializeProp: _dashboardConfigSchemaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'DashboardChartConfigSchema': DashboardChartConfigSchemaSchema
  },
  getId: _dashboardConfigSchemaGetId,
  getLinks: _dashboardConfigSchemaGetLinks,
  attach: _dashboardConfigSchemaAttach,
  version: '3.1.0+1',
);

int _dashboardConfigSchemaEstimateSize(
  DashboardConfigSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.charts;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DashboardChartConfigSchema]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += DashboardChartConfigSchemaSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.projectTypeCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dashboardConfigSchemaSerialize(
  DashboardConfigSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DashboardChartConfigSchema>(
    offsets[0],
    allOffsets,
    DashboardChartConfigSchemaSchema.serialize,
    object.charts,
  );
  writer.writeBool(offsets[1], object.enableDashboard);
  writer.writeString(offsets[2], object.projectTypeCode);
}

DashboardConfigSchema _dashboardConfigSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardConfigSchema();
  object.charts = reader.readObjectList<DashboardChartConfigSchema>(
    offsets[0],
    DashboardChartConfigSchemaSchema.deserialize,
    allOffsets,
    DashboardChartConfigSchema(),
  );
  object.enableDashboard = reader.readBoolOrNull(offsets[1]);
  object.id = id;
  object.projectTypeCode = reader.readStringOrNull(offsets[2]);
  return object;
}

P _dashboardConfigSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DashboardChartConfigSchema>(
        offset,
        DashboardChartConfigSchemaSchema.deserialize,
        allOffsets,
        DashboardChartConfigSchema(),
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dashboardConfigSchemaGetId(DashboardConfigSchema object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dashboardConfigSchemaGetLinks(
    DashboardConfigSchema object) {
  return [];
}

void _dashboardConfigSchemaAttach(
    IsarCollection<dynamic> col, Id id, DashboardConfigSchema object) {
  object.id = id;
}

extension DashboardConfigSchemaQueryWhereSort
    on QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QWhere> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DashboardConfigSchemaQueryWhere on QueryBuilder<DashboardConfigSchema,
    DashboardConfigSchema, QWhereClause> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DashboardConfigSchemaQueryFilter on QueryBuilder<
    DashboardConfigSchema, DashboardConfigSchema, QFilterCondition> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'charts',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'charts',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> chartsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'charts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> enableDashboardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enableDashboard',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> enableDashboardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enableDashboard',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> enableDashboardEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableDashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectTypeCode',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectTypeCode',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectTypeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
          QAfterFilterCondition>
      projectTypeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
          QAfterFilterCondition>
      projectTypeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectTypeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectTypeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> projectTypeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectTypeCode',
        value: '',
      ));
    });
  }
}

extension DashboardConfigSchemaQueryObject on QueryBuilder<
    DashboardConfigSchema, DashboardConfigSchema, QFilterCondition> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
          QAfterFilterCondition>
      chartsElement(FilterQuery<DashboardChartConfigSchema> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'charts');
    });
  }
}

extension DashboardConfigSchemaQueryLinks on QueryBuilder<DashboardConfigSchema,
    DashboardConfigSchema, QFilterCondition> {}

extension DashboardConfigSchemaQuerySortBy
    on QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QSortBy> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      sortByEnableDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDashboard', Sort.asc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      sortByEnableDashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDashboard', Sort.desc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      sortByProjectTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeCode', Sort.asc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      sortByProjectTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeCode', Sort.desc);
    });
  }
}

extension DashboardConfigSchemaQuerySortThenBy
    on QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QSortThenBy> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenByEnableDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDashboard', Sort.asc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenByEnableDashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDashboard', Sort.desc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenByProjectTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeCode', Sort.asc);
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QAfterSortBy>
      thenByProjectTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeCode', Sort.desc);
    });
  }
}

extension DashboardConfigSchemaQueryWhereDistinct
    on QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QDistinct> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QDistinct>
      distinctByEnableDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableDashboard');
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema, QDistinct>
      distinctByProjectTypeCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectTypeCode',
          caseSensitive: caseSensitive);
    });
  }
}

extension DashboardConfigSchemaQueryProperty on QueryBuilder<
    DashboardConfigSchema, DashboardConfigSchema, QQueryProperty> {
  QueryBuilder<DashboardConfigSchema, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DashboardConfigSchema, List<DashboardChartConfigSchema>?,
      QQueryOperations> chartsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'charts');
    });
  }

  QueryBuilder<DashboardConfigSchema, bool?, QQueryOperations>
      enableDashboardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableDashboard');
    });
  }

  QueryBuilder<DashboardConfigSchema, String?, QQueryOperations>
      projectTypeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectTypeCode');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DashboardChartConfigSchemaSchema = Schema(
  name: r'DashboardChartConfigSchema',
  id: 6365317819446843132,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'chartType': PropertySchema(
      id: 1,
      name: r'chartType',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'vizType': PropertySchema(
      id: 3,
      name: r'vizType',
      type: IsarType.string,
    )
  },
  estimateSize: _dashboardChartConfigSchemaEstimateSize,
  serialize: _dashboardChartConfigSchemaSerialize,
  deserialize: _dashboardChartConfigSchemaDeserialize,
  deserializeProp: _dashboardChartConfigSchemaDeserializeProp,
);

int _dashboardChartConfigSchemaEstimateSize(
  DashboardChartConfigSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.chartType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vizType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dashboardChartConfigSchemaSerialize(
  DashboardChartConfigSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.chartType);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.vizType);
}

DashboardChartConfigSchema _dashboardChartConfigSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardChartConfigSchema();
  object.active = reader.readBoolOrNull(offsets[0]);
  object.chartType = reader.readStringOrNull(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  object.vizType = reader.readStringOrNull(offsets[3]);
  return object;
}

P _dashboardChartConfigSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DashboardChartConfigSchemaQueryFilter on QueryBuilder<
    DashboardChartConfigSchema, DashboardChartConfigSchema, QFilterCondition> {
  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> activeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'active',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> activeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'active',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> activeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chartType',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chartType',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chartType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      chartTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      chartTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chartType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartType',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> chartTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chartType',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vizType',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vizType',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vizType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      vizTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vizType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
          QAfterFilterCondition>
      vizTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vizType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vizType',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartConfigSchema, DashboardChartConfigSchema,
      QAfterFilterCondition> vizTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vizType',
        value: '',
      ));
    });
  }
}

extension DashboardChartConfigSchemaQueryObject on QueryBuilder<
    DashboardChartConfigSchema, DashboardChartConfigSchema, QFilterCondition> {}
