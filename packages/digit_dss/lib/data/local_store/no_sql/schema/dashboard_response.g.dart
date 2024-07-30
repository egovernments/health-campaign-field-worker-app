// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDashboardResponseCollection on Isar {
  IsarCollection<DashboardResponse> get dashboardResponses => this.collection();
}

const DashboardResponseSchema = CollectionSchema(
  name: r'DashboardResponse',
  id: -8573620870670679659,
  properties: {
    r'chartType': PropertySchema(
      id: 0,
      name: r'chartType',
      type: IsarType.string,
    ),
    r'data': PropertySchema(
      id: 1,
      name: r'data',
      type: IsarType.objectList,
      target: r'DashboardChartData',
    ),
    r'drillDownChartId': PropertySchema(
      id: 2,
      name: r'drillDownChartId',
      type: IsarType.string,
    ),
    r'hideHeaderDenomination': PropertySchema(
      id: 3,
      name: r'hideHeaderDenomination',
      type: IsarType.bool,
    ),
    r'hideInsights': PropertySchema(
      id: 4,
      name: r'hideInsights',
      type: IsarType.bool,
    ),
    r'lastSelectedDate': PropertySchema(
      id: 5,
      name: r'lastSelectedDate',
      type: IsarType.dateTime,
    ),
    r'projectId': PropertySchema(
      id: 6,
      name: r'projectId',
      type: IsarType.string,
    ),
    r'showLabel': PropertySchema(
      id: 7,
      name: r'showLabel',
      type: IsarType.bool,
    ),
    r'visualizationCode': PropertySchema(
      id: 8,
      name: r'visualizationCode',
      type: IsarType.string,
    )
  },
  estimateSize: _dashboardResponseEstimateSize,
  serialize: _dashboardResponseSerialize,
  deserialize: _dashboardResponseDeserialize,
  deserializeProp: _dashboardResponseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'DashboardChartData': DashboardChartDataSchema,
    r'DashboardPlot': DashboardPlotSchema,
    r'Insight': InsightSchema
  },
  getId: _dashboardResponseGetId,
  getLinks: _dashboardResponseGetLinks,
  attach: _dashboardResponseAttach,
  version: '3.1.0+1',
);

int _dashboardResponseEstimateSize(
  DashboardResponse object,
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
    final list = object.data;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DashboardChartData]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DashboardChartDataSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.drillDownChartId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.projectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.visualizationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dashboardResponseSerialize(
  DashboardResponse object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chartType);
  writer.writeObjectList<DashboardChartData>(
    offsets[1],
    allOffsets,
    DashboardChartDataSchema.serialize,
    object.data,
  );
  writer.writeString(offsets[2], object.drillDownChartId);
  writer.writeBool(offsets[3], object.hideHeaderDenomination);
  writer.writeBool(offsets[4], object.hideInsights);
  writer.writeDateTime(offsets[5], object.lastSelectedDate);
  writer.writeString(offsets[6], object.projectId);
  writer.writeBool(offsets[7], object.showLabel);
  writer.writeString(offsets[8], object.visualizationCode);
}

DashboardResponse _dashboardResponseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardResponse();
  object.chartType = reader.readStringOrNull(offsets[0]);
  object.data = reader.readObjectList<DashboardChartData>(
    offsets[1],
    DashboardChartDataSchema.deserialize,
    allOffsets,
    DashboardChartData(),
  );
  object.drillDownChartId = reader.readStringOrNull(offsets[2]);
  object.hideHeaderDenomination = reader.readBoolOrNull(offsets[3]);
  object.hideInsights = reader.readBoolOrNull(offsets[4]);
  object.id = id;
  object.lastSelectedDate = reader.readDateTimeOrNull(offsets[5]);
  object.projectId = reader.readStringOrNull(offsets[6]);
  object.showLabel = reader.readBoolOrNull(offsets[7]);
  object.visualizationCode = reader.readStringOrNull(offsets[8]);
  return object;
}

P _dashboardResponseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<DashboardChartData>(
        offset,
        DashboardChartDataSchema.deserialize,
        allOffsets,
        DashboardChartData(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dashboardResponseGetId(DashboardResponse object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dashboardResponseGetLinks(
    DashboardResponse object) {
  return [];
}

void _dashboardResponseAttach(
    IsarCollection<dynamic> col, Id id, DashboardResponse object) {
  object.id = id;
}

extension DashboardResponseQueryWhereSort
    on QueryBuilder<DashboardResponse, DashboardResponse, QWhere> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DashboardResponseQueryWhere
    on QueryBuilder<DashboardResponse, DashboardResponse, QWhereClause> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhereClause>
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterWhereClause>
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

extension DashboardResponseQueryFilter
    on QueryBuilder<DashboardResponse, DashboardResponse, QFilterCondition> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chartType',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chartType',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeEqualTo(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeGreaterThan(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeLessThan(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeBetween(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeStartsWith(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeEndsWith(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chartType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chartType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartType',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      chartTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chartType',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'drillDownChartId',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'drillDownChartId',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drillDownChartId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'drillDownChartId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'drillDownChartId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drillDownChartId',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      drillDownChartIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'drillDownChartId',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideHeaderDenominationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hideHeaderDenomination',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideHeaderDenominationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hideHeaderDenomination',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideHeaderDenominationEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideHeaderDenomination',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideInsightsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hideInsights',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideInsightsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hideInsights',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      hideInsightsEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideInsights',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSelectedDate',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSelectedDate',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSelectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSelectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSelectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      lastSelectedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSelectedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectId',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectId',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      showLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'showLabel',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      showLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'showLabel',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      showLabelEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showLabel',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visualizationCode',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visualizationCode',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visualizationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visualizationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visualizationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualizationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      visualizationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visualizationCode',
        value: '',
      ));
    });
  }
}

extension DashboardResponseQueryObject
    on QueryBuilder<DashboardResponse, DashboardResponse, QFilterCondition> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterFilterCondition>
      dataElement(FilterQuery<DashboardChartData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'data');
    });
  }
}

extension DashboardResponseQueryLinks
    on QueryBuilder<DashboardResponse, DashboardResponse, QFilterCondition> {}

extension DashboardResponseQuerySortBy
    on QueryBuilder<DashboardResponse, DashboardResponse, QSortBy> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByChartType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartType', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByChartTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartType', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByDrillDownChartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drillDownChartId', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByDrillDownChartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drillDownChartId', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByHideHeaderDenomination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideHeaderDenomination', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByHideHeaderDenominationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideHeaderDenomination', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByHideInsights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideInsights', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByHideInsightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideInsights', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByLastSelectedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSelectedDate', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByLastSelectedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSelectedDate', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByShowLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLabel', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByShowLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLabel', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByVisualizationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualizationCode', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      sortByVisualizationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualizationCode', Sort.desc);
    });
  }
}

extension DashboardResponseQuerySortThenBy
    on QueryBuilder<DashboardResponse, DashboardResponse, QSortThenBy> {
  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByChartType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartType', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByChartTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartType', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByDrillDownChartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drillDownChartId', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByDrillDownChartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drillDownChartId', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByHideHeaderDenomination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideHeaderDenomination', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByHideHeaderDenominationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideHeaderDenomination', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByHideInsights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideInsights', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByHideInsightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideInsights', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByLastSelectedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSelectedDate', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByLastSelectedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSelectedDate', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByShowLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLabel', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByShowLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLabel', Sort.desc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByVisualizationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualizationCode', Sort.asc);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QAfterSortBy>
      thenByVisualizationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualizationCode', Sort.desc);
    });
  }
}

extension DashboardResponseQueryWhereDistinct
    on QueryBuilder<DashboardResponse, DashboardResponse, QDistinct> {
  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByChartType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chartType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByDrillDownChartId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drillDownChartId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByHideHeaderDenomination() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideHeaderDenomination');
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByHideInsights() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideInsights');
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByLastSelectedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSelectedDate');
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByProjectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByShowLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showLabel');
    });
  }

  QueryBuilder<DashboardResponse, DashboardResponse, QDistinct>
      distinctByVisualizationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visualizationCode',
          caseSensitive: caseSensitive);
    });
  }
}

extension DashboardResponseQueryProperty
    on QueryBuilder<DashboardResponse, DashboardResponse, QQueryProperty> {
  QueryBuilder<DashboardResponse, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DashboardResponse, String?, QQueryOperations>
      chartTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chartType');
    });
  }

  QueryBuilder<DashboardResponse, List<DashboardChartData>?, QQueryOperations>
      dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<DashboardResponse, String?, QQueryOperations>
      drillDownChartIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drillDownChartId');
    });
  }

  QueryBuilder<DashboardResponse, bool?, QQueryOperations>
      hideHeaderDenominationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideHeaderDenomination');
    });
  }

  QueryBuilder<DashboardResponse, bool?, QQueryOperations>
      hideInsightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideInsights');
    });
  }

  QueryBuilder<DashboardResponse, DateTime?, QQueryOperations>
      lastSelectedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSelectedDate');
    });
  }

  QueryBuilder<DashboardResponse, String?, QQueryOperations>
      projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<DashboardResponse, bool?, QQueryOperations> showLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showLabel');
    });
  }

  QueryBuilder<DashboardResponse, String?, QQueryOperations>
      visualizationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visualizationCode');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DashboardChartDataSchema = Schema(
  name: r'DashboardChartData',
  id: -4200617381045034431,
  properties: {
    r'headerName': PropertySchema(
      id: 0,
      name: r'headerName',
      type: IsarType.string,
    ),
    r'headerSymbol': PropertySchema(
      id: 1,
      name: r'headerSymbol',
      type: IsarType.string,
    ),
    r'headerValue': PropertySchema(
      id: 2,
      name: r'headerValue',
      type: IsarType.string,
    ),
    r'insight': PropertySchema(
      id: 3,
      name: r'insight',
      type: IsarType.object,
      target: r'Insight',
    ),
    r'plots': PropertySchema(
      id: 4,
      name: r'plots',
      type: IsarType.objectList,
      target: r'DashboardPlot',
    )
  },
  estimateSize: _dashboardChartDataEstimateSize,
  serialize: _dashboardChartDataSerialize,
  deserialize: _dashboardChartDataDeserialize,
  deserializeProp: _dashboardChartDataDeserializeProp,
);

int _dashboardChartDataEstimateSize(
  DashboardChartData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.headerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.headerSymbol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.headerValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.insight;
    if (value != null) {
      bytesCount += 3 +
          InsightSchema.estimateSize(value, allOffsets[Insight]!, allOffsets);
    }
  }
  {
    final list = object.plots;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DashboardPlot]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DashboardPlotSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _dashboardChartDataSerialize(
  DashboardChartData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.headerName);
  writer.writeString(offsets[1], object.headerSymbol);
  writer.writeString(offsets[2], object.headerValue);
  writer.writeObject<Insight>(
    offsets[3],
    allOffsets,
    InsightSchema.serialize,
    object.insight,
  );
  writer.writeObjectList<DashboardPlot>(
    offsets[4],
    allOffsets,
    DashboardPlotSchema.serialize,
    object.plots,
  );
}

DashboardChartData _dashboardChartDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardChartData();
  object.headerName = reader.readStringOrNull(offsets[0]);
  object.headerSymbol = reader.readStringOrNull(offsets[1]);
  object.headerValue = reader.readStringOrNull(offsets[2]);
  object.insight = reader.readObjectOrNull<Insight>(
    offsets[3],
    InsightSchema.deserialize,
    allOffsets,
  );
  object.plots = reader.readObjectList<DashboardPlot>(
    offsets[4],
    DashboardPlotSchema.deserialize,
    allOffsets,
    DashboardPlot(),
  );
  return object;
}

P _dashboardChartDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Insight>(
        offset,
        InsightSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectList<DashboardPlot>(
        offset,
        DashboardPlotSchema.deserialize,
        allOffsets,
        DashboardPlot(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DashboardChartDataQueryFilter
    on QueryBuilder<DashboardChartData, DashboardChartData, QFilterCondition> {
  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'headerName',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'headerName',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'headerSymbol',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'headerSymbol',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headerSymbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headerSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headerSymbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerSymbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headerSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'headerValue',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'headerValue',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headerValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headerValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headerValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      headerValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headerValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      insightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'insight',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      insightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'insight',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plots',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plots',
      ));
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DashboardChartDataQueryObject
    on QueryBuilder<DashboardChartData, DashboardChartData, QFilterCondition> {
  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      insight(FilterQuery<Insight> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'insight');
    });
  }

  QueryBuilder<DashboardChartData, DashboardChartData, QAfterFilterCondition>
      plotsElement(FilterQuery<DashboardPlot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plots');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DashboardPlotSchema = Schema(
  name: r'DashboardPlot',
  id: -4159917448319374876,
  properties: {
    r'label': PropertySchema(
      id: 0,
      name: r'label',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'strValue': PropertySchema(
      id: 2,
      name: r'strValue',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 3,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 4,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _dashboardPlotEstimateSize,
  serialize: _dashboardPlotSerialize,
  deserialize: _dashboardPlotDeserialize,
  deserializeProp: _dashboardPlotDeserializeProp,
);

int _dashboardPlotEstimateSize(
  DashboardPlot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.label;
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
    final value = object.strValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.symbol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dashboardPlotSerialize(
  DashboardPlot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.label);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.strValue);
  writer.writeString(offsets[3], object.symbol);
  writer.writeString(offsets[4], object.value);
}

DashboardPlot _dashboardPlotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardPlot();
  object.label = reader.readStringOrNull(offsets[0]);
  object.name = reader.readStringOrNull(offsets[1]);
  object.strValue = reader.readStringOrNull(offsets[2]);
  object.symbol = reader.readStringOrNull(offsets[3]);
  object.value = reader.readStringOrNull(offsets[4]);
  return object;
}

P _dashboardPlotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DashboardPlotQueryFilter
    on QueryBuilder<DashboardPlot, DashboardPlot, QFilterCondition> {
  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'strValue',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'strValue',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'strValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'strValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      strValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'strValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<DashboardPlot, DashboardPlot, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension DashboardPlotQueryObject
    on QueryBuilder<DashboardPlot, DashboardPlot, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const InsightSchema = Schema(
  name: r'Insight',
  id: -5337822884227880275,
  properties: {
    r'colorCode': PropertySchema(
      id: 0,
      name: r'colorCode',
      type: IsarType.string,
    ),
    r'indicator': PropertySchema(
      id: 1,
      name: r'indicator',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 3,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _insightEstimateSize,
  serialize: _insightSerialize,
  deserialize: _insightDeserialize,
  deserializeProp: _insightDeserializeProp,
);

int _insightEstimateSize(
  Insight object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.colorCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.indicator;
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
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _insightSerialize(
  Insight object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorCode);
  writer.writeString(offsets[1], object.indicator);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.value);
}

Insight _insightDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Insight();
  object.colorCode = reader.readStringOrNull(offsets[0]);
  object.indicator = reader.readStringOrNull(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  object.value = reader.readStringOrNull(offsets[3]);
  return object;
}

P _insightDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension InsightQueryFilter
    on QueryBuilder<Insight, Insight, QFilterCondition> {
  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorCode',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorCode',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> colorCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicator',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicator',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'indicator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'indicator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'indicator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicator',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> indicatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'indicator',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<Insight, Insight, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension InsightQueryObject
    on QueryBuilder<Insight, Insight, QFilterCondition> {}
