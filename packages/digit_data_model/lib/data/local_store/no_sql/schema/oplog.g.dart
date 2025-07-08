// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oplog.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOpLogCollection on Isar {
  IsarCollection<OpLog> get opLogs => this.collection();
}

const OpLogSchema = CollectionSchema(
  name: r'OpLog',
  id: -5198501623161393742,
  properties: {
    r'additionalIds': PropertySchema(
      id: 0,
      name: r'additionalIds',
      type: IsarType.objectList,
      target: r'AdditionalId',
    ),
    r'clientReferenceId': PropertySchema(
      id: 1,
      name: r'clientReferenceId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'createdBy': PropertySchema(
      id: 3,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'entityString': PropertySchema(
      id: 4,
      name: r'entityString',
      type: IsarType.string,
    ),
    r'entityType': PropertySchema(
      id: 5,
      name: r'entityType',
      type: IsarType.string,
      enumMap: _OpLogentityTypeEnumValueMap,
    ),
    r'nonRecoverableError': PropertySchema(
      id: 6,
      name: r'nonRecoverableError',
      type: IsarType.bool,
    ),
    r'operation': PropertySchema(
      id: 7,
      name: r'operation',
      type: IsarType.string,
      enumMap: _OpLogoperationEnumValueMap,
    ),
    r'rowVersion': PropertySchema(
      id: 8,
      name: r'rowVersion',
      type: IsarType.long,
    ),
    r'serverGeneratedId': PropertySchema(
      id: 9,
      name: r'serverGeneratedId',
      type: IsarType.string,
    ),
    r'syncDownRetryCount': PropertySchema(
      id: 10,
      name: r'syncDownRetryCount',
      type: IsarType.long,
    ),
    r'syncedDown': PropertySchema(
      id: 11,
      name: r'syncedDown',
      type: IsarType.bool,
    ),
    r'syncedDownOn': PropertySchema(
      id: 12,
      name: r'syncedDownOn',
      type: IsarType.dateTime,
    ),
    r'syncedUp': PropertySchema(
      id: 13,
      name: r'syncedUp',
      type: IsarType.bool,
    ),
    r'syncedUpOn': PropertySchema(
      id: 14,
      name: r'syncedUpOn',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _opLogEstimateSize,
  serialize: _opLogSerialize,
  deserialize: _opLogDeserialize,
  deserializeProp: _opLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'AdditionalId': AdditionalIdSchema},
  getId: _opLogGetId,
  getLinks: _opLogGetLinks,
  attach: _opLogAttach,
  version: '3.1.0+1',
);

int _opLogEstimateSize(
  OpLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.additionalIds.length * 3;
  {
    final offsets = allOffsets[AdditionalId]!;
    for (var i = 0; i < object.additionalIds.length; i++) {
      final value = object.additionalIds[i];
      bytesCount += AdditionalIdSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.clientReferenceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.createdBy.length * 3;
  bytesCount += 3 + object.entityString.length * 3;
  bytesCount += 3 + object.entityType.name.length * 3;
  bytesCount += 3 + object.operation.name.length * 3;
  {
    final value = object.serverGeneratedId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _opLogSerialize(
  OpLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AdditionalId>(
    offsets[0],
    allOffsets,
    AdditionalIdSchema.serialize,
    object.additionalIds,
  );
  writer.writeString(offsets[1], object.clientReferenceId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.createdBy);
  writer.writeString(offsets[4], object.entityString);
  writer.writeString(offsets[5], object.entityType.name);
  writer.writeBool(offsets[6], object.nonRecoverableError);
  writer.writeString(offsets[7], object.operation.name);
  writer.writeLong(offsets[8], object.rowVersion);
  writer.writeString(offsets[9], object.serverGeneratedId);
  writer.writeLong(offsets[10], object.syncDownRetryCount);
  writer.writeBool(offsets[11], object.syncedDown);
  writer.writeDateTime(offsets[12], object.syncedDownOn);
  writer.writeBool(offsets[13], object.syncedUp);
  writer.writeDateTime(offsets[14], object.syncedUpOn);
}

OpLog _opLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OpLog();
  object.additionalIds = reader.readObjectList<AdditionalId>(
        offsets[0],
        AdditionalIdSchema.deserialize,
        allOffsets,
        AdditionalId(),
      ) ??
      [];
  object.clientReferenceId = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.createdBy = reader.readString(offsets[3]);
  object.entityString = reader.readString(offsets[4]);
  object.entityType =
      _OpLogentityTypeValueEnumMap[reader.readStringOrNull(offsets[5])] ??
          DataModelType.user;
  object.id = id;
  object.nonRecoverableError = reader.readBool(offsets[6]);
  object.operation =
      _OpLogoperationValueEnumMap[reader.readStringOrNull(offsets[7])] ??
          DataOperation.create;
  object.rowVersion = reader.readLong(offsets[8]);
  object.serverGeneratedId = reader.readStringOrNull(offsets[9]);
  object.syncDownRetryCount = reader.readLong(offsets[10]);
  object.syncedDown = reader.readBool(offsets[11]);
  object.syncedDownOn = reader.readDateTimeOrNull(offsets[12]);
  object.syncedUp = reader.readBool(offsets[13]);
  object.syncedUpOn = reader.readDateTimeOrNull(offsets[14]);
  return object;
}

P _opLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AdditionalId>(
            offset,
            AdditionalIdSchema.deserialize,
            allOffsets,
            AdditionalId(),
          ) ??
          []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_OpLogentityTypeValueEnumMap[reader.readStringOrNull(offset)] ??
          DataModelType.user) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (_OpLogoperationValueEnumMap[reader.readStringOrNull(offset)] ??
          DataOperation.create) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OpLogentityTypeEnumValueMap = {
  r'user': r'user',
  r'facility': r'facility',
  r'address': r'address',
  r'household': r'household',
  r'individual': r'individual',
  r'projectBeneficiary': r'projectBeneficiary',
  r'householdMember': r'householdMember',
  r'product': r'product',
  r'productVariant': r'productVariant',
  r'project': r'project',
  r'projectFacility': r'projectFacility',
  r'projectProductVariant': r'projectProductVariant',
  r'projectStaff': r'projectStaff',
  r'projectResource': r'projectResource',
  r'projectType': r'projectType',
  r'stock': r'stock',
  r'stockReconciliation': r'stockReconciliation',
  r'task': r'task',
  r'sideEffect': r'sideEffect',
  r'referral': r'referral',
  r'serviceDefinition': r'serviceDefinition',
  r'service': r'service',
  r'complaints': r'complaints',
  r'attributes': r'attributes',
  r'boundary': r'boundary',
  r'serviceAttributes': r'serviceAttributes',
  r'locality': r'locality',
  r'downsync': r'downsync',
  r'downsyncCriteria': r'downsyncCriteria',
  r'hFReferral': r'hFReferral',
  r'attendanceRegister': r'attendanceRegister',
  r'attendance': r'attendance',
  r'userLocation': r'userLocation',
  r'userAction': r'userAction',
  r'uniqueId': r'uniqueId',
};
const _OpLogentityTypeValueEnumMap = {
  r'user': DataModelType.user,
  r'facility': DataModelType.facility,
  r'address': DataModelType.address,
  r'household': DataModelType.household,
  r'individual': DataModelType.individual,
  r'projectBeneficiary': DataModelType.projectBeneficiary,
  r'householdMember': DataModelType.householdMember,
  r'product': DataModelType.product,
  r'productVariant': DataModelType.productVariant,
  r'project': DataModelType.project,
  r'projectFacility': DataModelType.projectFacility,
  r'projectProductVariant': DataModelType.projectProductVariant,
  r'projectStaff': DataModelType.projectStaff,
  r'projectResource': DataModelType.projectResource,
  r'projectType': DataModelType.projectType,
  r'stock': DataModelType.stock,
  r'stockReconciliation': DataModelType.stockReconciliation,
  r'task': DataModelType.task,
  r'sideEffect': DataModelType.sideEffect,
  r'referral': DataModelType.referral,
  r'serviceDefinition': DataModelType.serviceDefinition,
  r'service': DataModelType.service,
  r'complaints': DataModelType.complaints,
  r'attributes': DataModelType.attributes,
  r'boundary': DataModelType.boundary,
  r'serviceAttributes': DataModelType.serviceAttributes,
  r'locality': DataModelType.locality,
  r'downsync': DataModelType.downsync,
  r'downsyncCriteria': DataModelType.downsyncCriteria,
  r'hFReferral': DataModelType.hFReferral,
  r'attendanceRegister': DataModelType.attendanceRegister,
  r'attendance': DataModelType.attendance,
  r'userLocation': DataModelType.userLocation,
  r'userAction': DataModelType.userAction,
  r'uniqueId': DataModelType.uniqueId,
};
const _OpLogoperationEnumValueMap = {
  r'create': r'create',
  r'search': r'search',
  r'update': r'update',
  r'delete': r'delete',
  r'singleCreate': r'singleCreate',
  r'singleUpdate': r'singleUpdate',
};
const _OpLogoperationValueEnumMap = {
  r'create': DataOperation.create,
  r'search': DataOperation.search,
  r'update': DataOperation.update,
  r'delete': DataOperation.delete,
  r'singleCreate': DataOperation.singleCreate,
  r'singleUpdate': DataOperation.singleUpdate,
};

Id _opLogGetId(OpLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _opLogGetLinks(OpLog object) {
  return [];
}

void _opLogAttach(IsarCollection<dynamic> col, Id id, OpLog object) {
  object.id = id;
}

extension OpLogQueryWhereSort on QueryBuilder<OpLog, OpLog, QWhere> {
  QueryBuilder<OpLog, OpLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OpLogQueryWhere on QueryBuilder<OpLog, OpLog, QWhereClause> {
  QueryBuilder<OpLog, OpLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OpLog, OpLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterWhereClause> idBetween(
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

extension OpLogQueryFilter on QueryBuilder<OpLog, OpLog, QFilterCondition> {
  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      additionalIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientReferenceId',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      clientReferenceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientReferenceId',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      clientReferenceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientReferenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientReferenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> clientReferenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      clientReferenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityString',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityString',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeEqualTo(
    DataModelType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeGreaterThan(
    DataModelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeLessThan(
    DataModelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeBetween(
    DataModelType lower,
    DataModelType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> nonRecoverableErrorEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nonRecoverableError',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationEqualTo(
    DataOperation value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationGreaterThan(
    DataOperation value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationLessThan(
    DataOperation value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationBetween(
    DataOperation lower,
    DataOperation upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> rowVersionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> rowVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> rowVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> rowVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rowVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverGeneratedId',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      serverGeneratedIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverGeneratedId',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      serverGeneratedIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverGeneratedId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverGeneratedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverGeneratedId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> serverGeneratedIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverGeneratedId',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      serverGeneratedIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverGeneratedId',
        value: '',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncDownRetryCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncDownRetryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition>
      syncDownRetryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncDownRetryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncDownRetryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncDownRetryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncDownRetryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncDownRetryCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedDown',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedDownOn',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedDownOn',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedDownOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedDownOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedDownOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedDownOnBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedDownOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedUp',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedUpOn',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedUpOn',
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedUpOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedUpOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedUpOn',
        value: value,
      ));
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> syncedUpOnBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedUpOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OpLogQueryObject on QueryBuilder<OpLog, OpLog, QFilterCondition> {
  QueryBuilder<OpLog, OpLog, QAfterFilterCondition> additionalIdsElement(
      FilterQuery<AdditionalId> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'additionalIds');
    });
  }
}

extension OpLogQueryLinks on QueryBuilder<OpLog, OpLog, QFilterCondition> {}

extension OpLogQuerySortBy on QueryBuilder<OpLog, OpLog, QSortBy> {
  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByClientReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByClientReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByEntityString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityString', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByEntityStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityString', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByNonRecoverableError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonRecoverableError', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByNonRecoverableErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonRecoverableError', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByRowVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByServerGeneratedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGeneratedId', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortByServerGeneratedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGeneratedId', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncDownRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncDownRetryCount', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncDownRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncDownRetryCount', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedDown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDown', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedDownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDown', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedDownOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDownOn', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedDownOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDownOn', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUp', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedUpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUp', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedUpOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUpOn', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> sortBySyncedUpOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUpOn', Sort.desc);
    });
  }
}

extension OpLogQuerySortThenBy on QueryBuilder<OpLog, OpLog, QSortThenBy> {
  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByClientReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByClientReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByEntityString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityString', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByEntityStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityString', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByNonRecoverableError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonRecoverableError', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByNonRecoverableErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonRecoverableError', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByRowVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByServerGeneratedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGeneratedId', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenByServerGeneratedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGeneratedId', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncDownRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncDownRetryCount', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncDownRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncDownRetryCount', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedDown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDown', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedDownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDown', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedDownOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDownOn', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedDownOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedDownOn', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUp', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedUpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUp', Sort.desc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedUpOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUpOn', Sort.asc);
    });
  }

  QueryBuilder<OpLog, OpLog, QAfterSortBy> thenBySyncedUpOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedUpOn', Sort.desc);
    });
  }
}

extension OpLogQueryWhereDistinct on QueryBuilder<OpLog, OpLog, QDistinct> {
  QueryBuilder<OpLog, OpLog, QDistinct> distinctByClientReferenceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientReferenceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByEntityString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByEntityType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByNonRecoverableError() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nonRecoverableError');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByOperation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rowVersion');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctByServerGeneratedId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverGeneratedId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctBySyncDownRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncDownRetryCount');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctBySyncedDown() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedDown');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctBySyncedDownOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedDownOn');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctBySyncedUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedUp');
    });
  }

  QueryBuilder<OpLog, OpLog, QDistinct> distinctBySyncedUpOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedUpOn');
    });
  }
}

extension OpLogQueryProperty on QueryBuilder<OpLog, OpLog, QQueryProperty> {
  QueryBuilder<OpLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OpLog, List<AdditionalId>, QQueryOperations>
      additionalIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'additionalIds');
    });
  }

  QueryBuilder<OpLog, String?, QQueryOperations> clientReferenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientReferenceId');
    });
  }

  QueryBuilder<OpLog, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OpLog, String, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<OpLog, String, QQueryOperations> entityStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityString');
    });
  }

  QueryBuilder<OpLog, DataModelType, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<OpLog, bool, QQueryOperations> nonRecoverableErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nonRecoverableError');
    });
  }

  QueryBuilder<OpLog, DataOperation, QQueryOperations> operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<OpLog, int, QQueryOperations> rowVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rowVersion');
    });
  }

  QueryBuilder<OpLog, String?, QQueryOperations> serverGeneratedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverGeneratedId');
    });
  }

  QueryBuilder<OpLog, int, QQueryOperations> syncDownRetryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncDownRetryCount');
    });
  }

  QueryBuilder<OpLog, bool, QQueryOperations> syncedDownProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedDown');
    });
  }

  QueryBuilder<OpLog, DateTime?, QQueryOperations> syncedDownOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedDownOn');
    });
  }

  QueryBuilder<OpLog, bool, QQueryOperations> syncedUpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedUp');
    });
  }

  QueryBuilder<OpLog, DateTime?, QQueryOperations> syncedUpOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedUpOn');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AdditionalIdSchema = Schema(
  name: r'AdditionalId',
  id: -6561451940232328825,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'idType': PropertySchema(
      id: 1,
      name: r'idType',
      type: IsarType.string,
    )
  },
  estimateSize: _additionalIdEstimateSize,
  serialize: _additionalIdSerialize,
  deserialize: _additionalIdDeserialize,
  deserializeProp: _additionalIdDeserializeProp,
);

int _additionalIdEstimateSize(
  AdditionalId object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.idType.length * 3;
  return bytesCount;
}

void _additionalIdSerialize(
  AdditionalId object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.idType);
}

AdditionalId _additionalIdDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdditionalId();
  object.id = reader.readString(offsets[0]);
  object.idType = reader.readString(offsets[1]);
  return object;
}

P _additionalIdDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AdditionalIdQueryFilter
    on QueryBuilder<AdditionalId, AdditionalId, QFilterCondition> {
  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition> idTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idType',
        value: '',
      ));
    });
  }

  QueryBuilder<AdditionalId, AdditionalId, QAfterFilterCondition>
      idTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idType',
        value: '',
      ));
    });
  }
}

extension AdditionalIdQueryObject
    on QueryBuilder<AdditionalId, AdditionalId, QFilterCondition> {}
