// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config_schema.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DashboardConfigSchemaSchema = Schema(
  name: r'DashboardConfigSchema',
  id: 5327278717036238119,
  properties: {
    r'dashboardConfig': PropertySchema(
      id: 0,
      name: r'dashboardConfig',
      type: IsarType.object,
      target: r'DashboardChartListSchema',
    ),
    r'enableDashboard': PropertySchema(
      id: 1,
      name: r'enableDashboard',
      type: IsarType.bool,
    )
  },
  estimateSize: _dashboardConfigSchemaEstimateSize,
  serialize: _dashboardConfigSchemaSerialize,
  deserialize: _dashboardConfigSchemaDeserialize,
  deserializeProp: _dashboardConfigSchemaDeserializeProp,
);

int _dashboardConfigSchemaEstimateSize(
  DashboardConfigSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dashboardConfig;
    if (value != null) {
      bytesCount += 3 +
          DashboardChartListSchemaSchema.estimateSize(
              value, allOffsets[DashboardChartListSchema]!, allOffsets);
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
  writer.writeObject<DashboardChartListSchema>(
    offsets[0],
    allOffsets,
    DashboardChartListSchemaSchema.serialize,
    object.dashboardConfig,
  );
  writer.writeBool(offsets[1], object.enableDashboard);
}

DashboardConfigSchema _dashboardConfigSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardConfigSchema();
  object.dashboardConfig = reader.readObjectOrNull<DashboardChartListSchema>(
    offsets[0],
    DashboardChartListSchemaSchema.deserialize,
    allOffsets,
  );
  object.enableDashboard = reader.readBoolOrNull(offsets[1]);
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
      return (reader.readObjectOrNull<DashboardChartListSchema>(
        offset,
        DashboardChartListSchemaSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DashboardConfigSchemaQueryFilter on QueryBuilder<
    DashboardConfigSchema, DashboardConfigSchema, QFilterCondition> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> dashboardConfigIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dashboardConfig',
      ));
    });
  }

  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
      QAfterFilterCondition> dashboardConfigIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dashboardConfig',
      ));
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
}

extension DashboardConfigSchemaQueryObject on QueryBuilder<
    DashboardConfigSchema, DashboardConfigSchema, QFilterCondition> {
  QueryBuilder<DashboardConfigSchema, DashboardConfigSchema,
          QAfterFilterCondition>
      dashboardConfig(FilterQuery<DashboardChartListSchema> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dashboardConfig');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DashboardChartListSchemaSchema = Schema(
  name: r'DashboardChartListSchema',
  id: -8975241300227208677,
  properties: {
    r'METRIC': PropertySchema(
      id: 0,
      name: r'METRIC',
      type: IsarType.objectList,
      target: r'DashboardChartConfigSchema',
    ),
    r'TABLE': PropertySchema(
      id: 1,
      name: r'TABLE',
      type: IsarType.objectList,
      target: r'DashboardChartConfigSchema',
    )
  },
  estimateSize: _dashboardChartListSchemaEstimateSize,
  serialize: _dashboardChartListSchemaSerialize,
  deserialize: _dashboardChartListSchemaDeserialize,
  deserializeProp: _dashboardChartListSchemaDeserializeProp,
);

int _dashboardChartListSchemaEstimateSize(
  DashboardChartListSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.metricCharts;
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
    final list = object.tableCharts;
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
  return bytesCount;
}

void _dashboardChartListSchemaSerialize(
  DashboardChartListSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DashboardChartConfigSchema>(
    offsets[0],
    allOffsets,
    DashboardChartConfigSchemaSchema.serialize,
    object.metricCharts,
  );
  writer.writeObjectList<DashboardChartConfigSchema>(
    offsets[1],
    allOffsets,
    DashboardChartConfigSchemaSchema.serialize,
    object.tableCharts,
  );
}

DashboardChartListSchema _dashboardChartListSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardChartListSchema();
  object.metricCharts = reader.readObjectList<DashboardChartConfigSchema>(
    offsets[0],
    DashboardChartConfigSchemaSchema.deserialize,
    allOffsets,
    DashboardChartConfigSchema(),
  );
  object.tableCharts = reader.readObjectList<DashboardChartConfigSchema>(
    offsets[1],
    DashboardChartConfigSchemaSchema.deserialize,
    allOffsets,
    DashboardChartConfigSchema(),
  );
  return object;
}

P _dashboardChartListSchemaDeserializeProp<P>(
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
      return (reader.readObjectList<DashboardChartConfigSchema>(
        offset,
        DashboardChartConfigSchemaSchema.deserialize,
        allOffsets,
        DashboardChartConfigSchema(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DashboardChartListSchemaQueryFilter on QueryBuilder<
    DashboardChartListSchema, DashboardChartListSchema, QFilterCondition> {
  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'METRIC',
      ));
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'METRIC',
      ));
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> metricChartsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'METRIC',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'TABLE',
      ));
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'TABLE',
      ));
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
      QAfterFilterCondition> tableChartsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TABLE',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DashboardChartListSchemaQueryObject on QueryBuilder<
    DashboardChartListSchema, DashboardChartListSchema, QFilterCondition> {
  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
          QAfterFilterCondition>
      metricChartsElement(FilterQuery<DashboardChartConfigSchema> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'METRIC');
    });
  }

  QueryBuilder<DashboardChartListSchema, DashboardChartListSchema,
          QAfterFilterCondition>
      tableChartsElement(FilterQuery<DashboardChartConfigSchema> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'TABLE');
    });
  }
}

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
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'vizType': PropertySchema(
      id: 2,
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
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.vizType);
}

DashboardChartConfigSchema _dashboardChartConfigSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardChartConfigSchema();
  object.active = reader.readBoolOrNull(offsets[0]);
  object.name = reader.readStringOrNull(offsets[1]);
  object.vizType = reader.readStringOrNull(offsets[2]);
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
