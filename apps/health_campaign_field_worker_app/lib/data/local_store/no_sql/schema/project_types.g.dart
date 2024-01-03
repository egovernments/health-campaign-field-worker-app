// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_types.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProjectTypeListCycleCollection on Isar {
  IsarCollection<ProjectTypeListCycle> get projectTypeListCycles =>
      this.collection();
}

const ProjectTypeListCycleSchema = CollectionSchema(
  name: r'ProjectTypeListCycle',
  id: -6921173925142853273,
  properties: {
    r'beneficiaryType': PropertySchema(
      id: 0,
      name: r'beneficiaryType',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'cycles': PropertySchema(
      id: 2,
      name: r'cycles',
      type: IsarType.objectList,
      target: r'Cycles',
    ),
    r'group': PropertySchema(
      id: 3,
      name: r'group',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'observationStrategy': PropertySchema(
      id: 5,
      name: r'observationStrategy',
      type: IsarType.string,
    ),
    r'projectTypeId': PropertySchema(
      id: 6,
      name: r'projectTypeId',
      type: IsarType.string,
    ),
    r'resources': PropertySchema(
      id: 7,
      name: r'resources',
      type: IsarType.objectList,
      target: r'ProductVariants',
    )
  },
  estimateSize: _projectTypeListCycleEstimateSize,
  serialize: _projectTypeListCycleSerialize,
  deserialize: _projectTypeListCycleDeserialize,
  deserializeProp: _projectTypeListCycleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ProductVariants': ProductVariantsSchema,
    r'Cycles': CyclesSchema,
    r'Deliveries': DeliveriesSchema,
    r'DoseCriteria': DoseCriteriaSchema
  },
  getId: _projectTypeListCycleGetId,
  getLinks: _projectTypeListCycleGetLinks,
  attach: _projectTypeListCycleAttach,
  version: '3.1.0+1',
);

int _projectTypeListCycleEstimateSize(
  ProjectTypeListCycle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.beneficiaryType.length * 3;
  bytesCount += 3 + object.code.length * 3;
  {
    final list = object.cycles;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Cycles]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += CyclesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.group.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.observationStrategy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.projectTypeId.length * 3;
  {
    final list = object.resources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ProductVariants]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ProductVariantsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _projectTypeListCycleSerialize(
  ProjectTypeListCycle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.beneficiaryType);
  writer.writeString(offsets[1], object.code);
  writer.writeObjectList<Cycles>(
    offsets[2],
    allOffsets,
    CyclesSchema.serialize,
    object.cycles,
  );
  writer.writeString(offsets[3], object.group);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.observationStrategy);
  writer.writeString(offsets[6], object.projectTypeId);
  writer.writeObjectList<ProductVariants>(
    offsets[7],
    allOffsets,
    ProductVariantsSchema.serialize,
    object.resources,
  );
}

ProjectTypeListCycle _projectTypeListCycleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProjectTypeListCycle();
  object.beneficiaryType = reader.readString(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.cycles = reader.readObjectList<Cycles>(
    offsets[2],
    CyclesSchema.deserialize,
    allOffsets,
    Cycles(),
  );
  object.group = reader.readString(offsets[3]);
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.observationStrategy = reader.readStringOrNull(offsets[5]);
  object.projectTypeId = reader.readString(offsets[6]);
  object.resources = reader.readObjectList<ProductVariants>(
    offsets[7],
    ProductVariantsSchema.deserialize,
    allOffsets,
    ProductVariants(),
  );
  return object;
}

P _projectTypeListCycleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<Cycles>(
        offset,
        CyclesSchema.deserialize,
        allOffsets,
        Cycles(),
      )) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectList<ProductVariants>(
        offset,
        ProductVariantsSchema.deserialize,
        allOffsets,
        ProductVariants(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _projectTypeListCycleGetId(ProjectTypeListCycle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _projectTypeListCycleGetLinks(
    ProjectTypeListCycle object) {
  return [];
}

void _projectTypeListCycleAttach(
    IsarCollection<dynamic> col, Id id, ProjectTypeListCycle object) {
  object.id = id;
}

extension ProjectTypeListCycleQueryWhereSort
    on QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QWhere> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProjectTypeListCycleQueryWhere
    on QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QWhereClause> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhereClause>
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterWhereClause>
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

extension ProjectTypeListCycleQueryFilter on QueryBuilder<ProjectTypeListCycle,
    ProjectTypeListCycle, QFilterCondition> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beneficiaryType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      beneficiaryTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'beneficiaryType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      beneficiaryTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'beneficiaryType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beneficiaryType',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> beneficiaryTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beneficiaryType',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cycles',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cycles',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cycles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'group',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      groupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      groupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'group',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> groupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameEqualTo(
    String value, {
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
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

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observationStrategy',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observationStrategy',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observationStrategy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      observationStrategyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observationStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      observationStrategyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observationStrategy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observationStrategy',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> observationStrategyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observationStrategy',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      projectTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
          QAfterFilterCondition>
      projectTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> projectTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resources',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resources',
      ));
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProjectTypeListCycleQueryObject on QueryBuilder<ProjectTypeListCycle,
    ProjectTypeListCycle, QFilterCondition> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> cyclesElement(FilterQuery<Cycles> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cycles');
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle,
      QAfterFilterCondition> resourcesElement(FilterQuery<ProductVariants> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'resources');
    });
  }
}

extension ProjectTypeListCycleQueryLinks on QueryBuilder<ProjectTypeListCycle,
    ProjectTypeListCycle, QFilterCondition> {}

extension ProjectTypeListCycleQuerySortBy
    on QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QSortBy> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByBeneficiaryType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryType', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByBeneficiaryTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryType', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByObservationStrategy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observationStrategy', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByObservationStrategyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observationStrategy', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByProjectTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeId', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      sortByProjectTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeId', Sort.desc);
    });
  }
}

extension ProjectTypeListCycleQuerySortThenBy
    on QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QSortThenBy> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByBeneficiaryType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryType', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByBeneficiaryTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beneficiaryType', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByObservationStrategy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observationStrategy', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByObservationStrategyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observationStrategy', Sort.desc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByProjectTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeId', Sort.asc);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QAfterSortBy>
      thenByProjectTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectTypeId', Sort.desc);
    });
  }
}

extension ProjectTypeListCycleQueryWhereDistinct
    on QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct> {
  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByBeneficiaryType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beneficiaryType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByGroup({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'group', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByObservationStrategy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observationStrategy',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectTypeListCycle, ProjectTypeListCycle, QDistinct>
      distinctByProjectTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectTypeId',
          caseSensitive: caseSensitive);
    });
  }
}

extension ProjectTypeListCycleQueryProperty on QueryBuilder<
    ProjectTypeListCycle, ProjectTypeListCycle, QQueryProperty> {
  QueryBuilder<ProjectTypeListCycle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String, QQueryOperations>
      beneficiaryTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beneficiaryType');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ProjectTypeListCycle, List<Cycles>?, QQueryOperations>
      cyclesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cycles');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String, QQueryOperations> groupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'group');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String?, QQueryOperations>
      observationStrategyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observationStrategy');
    });
  }

  QueryBuilder<ProjectTypeListCycle, String, QQueryOperations>
      projectTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectTypeId');
    });
  }

  QueryBuilder<ProjectTypeListCycle, List<ProductVariants>?, QQueryOperations>
      resourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resources');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CyclesSchema = Schema(
  name: r'Cycles',
  id: -8617464730251778761,
  properties: {
    r'deliveries': PropertySchema(
      id: 0,
      name: r'deliveries',
      type: IsarType.objectList,
      target: r'Deliveries',
    ),
    r'endDate': PropertySchema(
      id: 1,
      name: r'endDate',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'mandatoryWaitSinceLastCycleInDays': PropertySchema(
      id: 3,
      name: r'mandatoryWaitSinceLastCycleInDays',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 4,
      name: r'startDate',
      type: IsarType.long,
    )
  },
  estimateSize: _cyclesEstimateSize,
  serialize: _cyclesSerialize,
  deserialize: _cyclesDeserialize,
  deserializeProp: _cyclesDeserializeProp,
);

int _cyclesEstimateSize(
  Cycles object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.deliveries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Deliveries]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DeliveriesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.mandatoryWaitSinceLastCycleInDays;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cyclesSerialize(
  Cycles object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Deliveries>(
    offsets[0],
    allOffsets,
    DeliveriesSchema.serialize,
    object.deliveries,
  );
  writer.writeLong(offsets[1], object.endDate);
  writer.writeLong(offsets[2], object.id);
  writer.writeString(offsets[3], object.mandatoryWaitSinceLastCycleInDays);
  writer.writeLong(offsets[4], object.startDate);
}

Cycles _cyclesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cycles();
  object.deliveries = reader.readObjectList<Deliveries>(
    offsets[0],
    DeliveriesSchema.deserialize,
    allOffsets,
    Deliveries(),
  );
  object.endDate = reader.readLongOrNull(offsets[1]);
  object.id = reader.readLongOrNull(offsets[2]);
  object.mandatoryWaitSinceLastCycleInDays =
      reader.readStringOrNull(offsets[3]);
  object.startDate = reader.readLongOrNull(offsets[4]);
  return object;
}

P _cyclesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Deliveries>(
        offset,
        DeliveriesSchema.deserialize,
        allOffsets,
        Deliveries(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CyclesQueryFilter on QueryBuilder<Cycles, Cycles, QFilterCondition> {
  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveries',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveries',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      deliveriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deliveries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> endDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mandatoryWaitSinceLastCycleInDays',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mandatoryWaitSinceLastCycleInDays',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mandatoryWaitSinceLastCycleInDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mandatoryWaitSinceLastCycleInDays',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: '',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition>
      mandatoryWaitSinceLastCycleInDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mandatoryWaitSinceLastCycleInDays',
        value: '',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> startDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CyclesQueryObject on QueryBuilder<Cycles, Cycles, QFilterCondition> {
  QueryBuilder<Cycles, Cycles, QAfterFilterCondition> deliveriesElement(
      FilterQuery<Deliveries> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'deliveries');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DeliveriesSchema = Schema(
  name: r'Deliveries',
  id: 2357936067587297135,
  properties: {
    r'deliveryStrategy': PropertySchema(
      id: 0,
      name: r'deliveryStrategy',
      type: IsarType.string,
    ),
    r'doseCriteria': PropertySchema(
      id: 1,
      name: r'doseCriteria',
      type: IsarType.objectList,
      target: r'DoseCriteria',
    ),
    r'mandatoryWaitSinceLastDeliveryInDays': PropertySchema(
      id: 2,
      name: r'mandatoryWaitSinceLastDeliveryInDays',
      type: IsarType.string,
    )
  },
  estimateSize: _deliveriesEstimateSize,
  serialize: _deliveriesSerialize,
  deserialize: _deliveriesDeserialize,
  deserializeProp: _deliveriesDeserializeProp,
);

int _deliveriesEstimateSize(
  Deliveries object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.deliveryStrategy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.doseCriteriaModel;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DoseCriteria]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DoseCriteriaSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.mandatoryWaitSinceLastDeliveryInDays;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _deliveriesSerialize(
  Deliveries object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deliveryStrategy);
  writer.writeObjectList<DoseCriteria>(
    offsets[1],
    allOffsets,
    DoseCriteriaSchema.serialize,
    object.doseCriteriaModel,
  );
  writer.writeString(offsets[2], object.mandatoryWaitSinceLastDeliveryInDays);
}

Deliveries _deliveriesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Deliveries();
  object.deliveryStrategy = reader.readStringOrNull(offsets[0]);
  object.doseCriteriaModel = reader.readObjectList<DoseCriteria>(
    offsets[1],
    DoseCriteriaSchema.deserialize,
    allOffsets,
    DoseCriteria(),
  );
  object.mandatoryWaitSinceLastDeliveryInDays =
      reader.readStringOrNull(offsets[2]);
  return object;
}

P _deliveriesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<DoseCriteria>(
        offset,
        DoseCriteriaSchema.deserialize,
        allOffsets,
        DoseCriteria(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DeliveriesQueryFilter
    on QueryBuilder<Deliveries, Deliveries, QFilterCondition> {
  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveryStrategy',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveryStrategy',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryStrategy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryStrategy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryStrategy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryStrategy',
        value: '',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      deliveryStrategyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryStrategy',
        value: '',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'doseCriteria',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'doseCriteria',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'doseCriteria',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: '',
      ));
    });
  }

  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      mandatoryWaitSinceLastDeliveryInDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mandatoryWaitSinceLastDeliveryInDays',
        value: '',
      ));
    });
  }
}

extension DeliveriesQueryObject
    on QueryBuilder<Deliveries, Deliveries, QFilterCondition> {
  QueryBuilder<Deliveries, Deliveries, QAfterFilterCondition>
      doseCriteriaModelElement(FilterQuery<DoseCriteria> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'doseCriteria');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DoseCriteriaSchema = Schema(
  name: r'DoseCriteria',
  id: -4142765722663167685,
  properties: {
    r'ProductVariants': PropertySchema(
      id: 0,
      name: r'ProductVariants',
      type: IsarType.objectList,
      target: r'ProductVariants',
    ),
    r'condition': PropertySchema(
      id: 1,
      name: r'condition',
      type: IsarType.string,
    )
  },
  estimateSize: _doseCriteriaEstimateSize,
  serialize: _doseCriteriaSerialize,
  deserialize: _doseCriteriaDeserialize,
  deserializeProp: _doseCriteriaDeserializeProp,
);

int _doseCriteriaEstimateSize(
  DoseCriteria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.productVariants;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ProductVariants]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ProductVariantsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.condition;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _doseCriteriaSerialize(
  DoseCriteria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ProductVariants>(
    offsets[0],
    allOffsets,
    ProductVariantsSchema.serialize,
    object.productVariants,
  );
  writer.writeString(offsets[1], object.condition);
}

DoseCriteria _doseCriteriaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DoseCriteria();
  object.productVariants = reader.readObjectList<ProductVariants>(
    offsets[0],
    ProductVariantsSchema.deserialize,
    allOffsets,
    ProductVariants(),
  );
  object.condition = reader.readStringOrNull(offsets[1]);
  return object;
}

P _doseCriteriaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ProductVariants>(
        offset,
        ProductVariantsSchema.deserialize,
        allOffsets,
        ProductVariants(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DoseCriteriaQueryFilter
    on QueryBuilder<DoseCriteria, DoseCriteria, QFilterCondition> {
  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ProductVariants',
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ProductVariants',
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ProductVariants',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condition',
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condition',
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      conditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condition',
        value: '',
      ));
    });
  }
}

extension DoseCriteriaQueryObject
    on QueryBuilder<DoseCriteria, DoseCriteria, QFilterCondition> {
  QueryBuilder<DoseCriteria, DoseCriteria, QAfterFilterCondition>
      productVariantsElement(FilterQuery<ProductVariants> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ProductVariants');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProductVariantsSchema = Schema(
  name: r'ProductVariants',
  id: -149150699466438070,
  properties: {
    r'productVariantId': PropertySchema(
      id: 0,
      name: r'productVariantId',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 1,
      name: r'quantity',
      type: IsarType.string,
    )
  },
  estimateSize: _productVariantsEstimateSize,
  serialize: _productVariantsSerialize,
  deserialize: _productVariantsDeserialize,
  deserializeProp: _productVariantsDeserializeProp,
);

int _productVariantsEstimateSize(
  ProductVariants object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.productVariantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.quantity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productVariantsSerialize(
  ProductVariants object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.productVariantId);
  writer.writeString(offsets[1], object.quantity);
}

ProductVariants _productVariantsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductVariants();
  object.productVariantId = reader.readStringOrNull(offsets[0]);
  object.quantity = reader.readStringOrNull(offsets[1]);
  return object;
}

P _productVariantsDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProductVariantsQueryFilter
    on QueryBuilder<ProductVariants, ProductVariants, QFilterCondition> {
  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productVariantId',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productVariantId',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productVariantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productVariantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productVariantId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      productVariantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productVariantId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductVariants, ProductVariants, QAfterFilterCondition>
      quantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quantity',
        value: '',
      ));
    });
  }
}

extension ProductVariantsQueryObject
    on QueryBuilder<ProductVariants, ProductVariants, QFilterCondition> {}
