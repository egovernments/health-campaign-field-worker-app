// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_enrollment_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFaceEnrollmentProfileCollection on Isar {
  IsarCollection<FaceEnrollmentProfile> get faceEnrollmentProfiles =>
      this.collection();
}

const FaceEnrollmentProfileSchema = CollectionSchema(
  name: r'FaceEnrollmentProfile',
  id: -2933689402050210191,
  properties: {
    r'enrolledAt': PropertySchema(
      id: 0,
      name: r'enrolledAt',
      type: IsarType.dateTime,
    ),
    r'enrolledByUserId': PropertySchema(
      id: 1,
      name: r'enrolledByUserId',
      type: IsarType.string,
    ),
    r'failedAttempts': PropertySchema(
      id: 2,
      name: r'failedAttempts',
      type: IsarType.long,
    ),
    r'individualId': PropertySchema(
      id: 3,
      name: r'individualId',
      type: IsarType.string,
    ),
    r'isSystemUser': PropertySchema(
      id: 4,
      name: r'isSystemUser',
      type: IsarType.bool,
    ),
    r'lastVerifiedAt': PropertySchema(
      id: 5,
      name: r'lastVerifiedAt',
      type: IsarType.dateTime,
    ),
    r'pinHash': PropertySchema(
      id: 6,
      name: r'pinHash',
      type: IsarType.string,
    ),
    r'pinSalt': PropertySchema(
      id: 7,
      name: r'pinSalt',
      type: IsarType.string,
    ),
    r'supervisorApprovalStatus': PropertySchema(
      id: 8,
      name: r'supervisorApprovalStatus',
      type: IsarType.string,
    ),
    r'twinFlagged': PropertySchema(
      id: 9,
      name: r'twinFlagged',
      type: IsarType.bool,
    )
  },
  estimateSize: _faceEnrollmentProfileEstimateSize,
  serialize: _faceEnrollmentProfileSerialize,
  deserialize: _faceEnrollmentProfileDeserialize,
  deserializeProp: _faceEnrollmentProfileDeserializeProp,
  idName: r'id',
  indexes: {
    r'individualId': IndexSchema(
      id: 2874159804044077251,
      name: r'individualId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'individualId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'supervisorApprovalStatus': IndexSchema(
      id: 4321059504200687500,
      name: r'supervisorApprovalStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'supervisorApprovalStatus',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _faceEnrollmentProfileGetId,
  getLinks: _faceEnrollmentProfileGetLinks,
  attach: _faceEnrollmentProfileAttach,
  version: '3.1.0+1',
);

int _faceEnrollmentProfileEstimateSize(
  FaceEnrollmentProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.enrolledByUserId.length * 3;
  bytesCount += 3 + object.individualId.length * 3;
  bytesCount += 3 + object.pinHash.length * 3;
  bytesCount += 3 + object.pinSalt.length * 3;
  bytesCount += 3 + object.supervisorApprovalStatus.length * 3;
  return bytesCount;
}

void _faceEnrollmentProfileSerialize(
  FaceEnrollmentProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.enrolledAt);
  writer.writeString(offsets[1], object.enrolledByUserId);
  writer.writeLong(offsets[2], object.failedAttempts);
  writer.writeString(offsets[3], object.individualId);
  writer.writeBool(offsets[4], object.isSystemUser);
  writer.writeDateTime(offsets[5], object.lastVerifiedAt);
  writer.writeString(offsets[6], object.pinHash);
  writer.writeString(offsets[7], object.pinSalt);
  writer.writeString(offsets[8], object.supervisorApprovalStatus);
  writer.writeBool(offsets[9], object.twinFlagged);
}

FaceEnrollmentProfile _faceEnrollmentProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FaceEnrollmentProfile(
    enrolledAt: reader.readDateTime(offsets[0]),
    enrolledByUserId: reader.readString(offsets[1]),
    failedAttempts: reader.readLongOrNull(offsets[2]) ?? 0,
    individualId: reader.readString(offsets[3]),
    isSystemUser: reader.readBool(offsets[4]),
    lastVerifiedAt: reader.readDateTimeOrNull(offsets[5]),
    pinHash: reader.readString(offsets[6]),
    pinSalt: reader.readString(offsets[7]),
    supervisorApprovalStatus: reader.readStringOrNull(offsets[8]) ?? 'pending',
    twinFlagged: reader.readBoolOrNull(offsets[9]) ?? false,
  );
  object.id = id;
  return object;
}

P _faceEnrollmentProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset) ?? 'pending') as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _faceEnrollmentProfileGetId(FaceEnrollmentProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _faceEnrollmentProfileGetLinks(
    FaceEnrollmentProfile object) {
  return [];
}

void _faceEnrollmentProfileAttach(
    IsarCollection<dynamic> col, Id id, FaceEnrollmentProfile object) {
  object.id = id;
}

extension FaceEnrollmentProfileByIndex
    on IsarCollection<FaceEnrollmentProfile> {
  Future<FaceEnrollmentProfile?> getByIndividualId(String individualId) {
    return getByIndex(r'individualId', [individualId]);
  }

  FaceEnrollmentProfile? getByIndividualIdSync(String individualId) {
    return getByIndexSync(r'individualId', [individualId]);
  }

  Future<bool> deleteByIndividualId(String individualId) {
    return deleteByIndex(r'individualId', [individualId]);
  }

  bool deleteByIndividualIdSync(String individualId) {
    return deleteByIndexSync(r'individualId', [individualId]);
  }

  Future<List<FaceEnrollmentProfile?>> getAllByIndividualId(
      List<String> individualIdValues) {
    final values = individualIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'individualId', values);
  }

  List<FaceEnrollmentProfile?> getAllByIndividualIdSync(
      List<String> individualIdValues) {
    final values = individualIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'individualId', values);
  }

  Future<int> deleteAllByIndividualId(List<String> individualIdValues) {
    final values = individualIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'individualId', values);
  }

  int deleteAllByIndividualIdSync(List<String> individualIdValues) {
    final values = individualIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'individualId', values);
  }

  Future<Id> putByIndividualId(FaceEnrollmentProfile object) {
    return putByIndex(r'individualId', object);
  }

  Id putByIndividualIdSync(FaceEnrollmentProfile object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'individualId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIndividualId(List<FaceEnrollmentProfile> objects) {
    return putAllByIndex(r'individualId', objects);
  }

  List<Id> putAllByIndividualIdSync(List<FaceEnrollmentProfile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'individualId', objects, saveLinks: saveLinks);
  }
}

extension FaceEnrollmentProfileQueryWhereSort
    on QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QWhere> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceEnrollmentProfileQueryWhere on QueryBuilder<FaceEnrollmentProfile,
    FaceEnrollmentProfile, QWhereClause> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
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

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
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

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      individualIdEqualTo(String individualId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'individualId',
        value: [individualId],
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      individualIdNotEqualTo(String individualId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individualId',
              lower: [],
              upper: [individualId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individualId',
              lower: [individualId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individualId',
              lower: [individualId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individualId',
              lower: [],
              upper: [individualId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      supervisorApprovalStatusEqualTo(String supervisorApprovalStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supervisorApprovalStatus',
        value: [supervisorApprovalStatus],
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterWhereClause>
      supervisorApprovalStatusNotEqualTo(String supervisorApprovalStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supervisorApprovalStatus',
              lower: [],
              upper: [supervisorApprovalStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supervisorApprovalStatus',
              lower: [supervisorApprovalStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supervisorApprovalStatus',
              lower: [supervisorApprovalStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supervisorApprovalStatus',
              lower: [],
              upper: [supervisorApprovalStatus],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FaceEnrollmentProfileQueryFilter on QueryBuilder<
    FaceEnrollmentProfile, FaceEnrollmentProfile, QFilterCondition> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrolledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrolledByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      enrolledByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enrolledByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      enrolledByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enrolledByUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> enrolledByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enrolledByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> failedAttemptsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedAttempts',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> failedAttemptsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failedAttempts',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> failedAttemptsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failedAttempts',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> failedAttemptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failedAttempts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
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

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
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

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
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

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'individualId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      individualIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      individualIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'individualId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individualId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> individualIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'individualId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> isSystemUserEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSystemUser',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastVerifiedAt',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastVerifiedAt',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastVerifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastVerifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastVerifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> lastVerifiedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastVerifiedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pinHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      pinHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pinHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      pinHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pinHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pinHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pinSalt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      pinSaltContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pinSalt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      pinSaltMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pinSalt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinSalt',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> pinSaltIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pinSalt',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supervisorApprovalStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      supervisorApprovalStatusContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supervisorApprovalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
          QAfterFilterCondition>
      supervisorApprovalStatusMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supervisorApprovalStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorApprovalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> supervisorApprovalStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supervisorApprovalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile,
      QAfterFilterCondition> twinFlaggedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twinFlagged',
        value: value,
      ));
    });
  }
}

extension FaceEnrollmentProfileQueryObject on QueryBuilder<
    FaceEnrollmentProfile, FaceEnrollmentProfile, QFilterCondition> {}

extension FaceEnrollmentProfileQueryLinks on QueryBuilder<FaceEnrollmentProfile,
    FaceEnrollmentProfile, QFilterCondition> {}

extension FaceEnrollmentProfileQuerySortBy
    on QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QSortBy> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByEnrolledByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledByUserId', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByEnrolledByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledByUserId', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByFailedAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedAttempts', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByFailedAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedAttempts', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByIndividualId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByIndividualIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByIsSystemUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByLastVerifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVerifiedAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByLastVerifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVerifiedAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByPinHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinHash', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByPinHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinHash', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByPinSalt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinSalt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByPinSaltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinSalt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortBySupervisorApprovalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorApprovalStatus', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortBySupervisorApprovalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorApprovalStatus', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByTwinFlagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twinFlagged', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      sortByTwinFlaggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twinFlagged', Sort.desc);
    });
  }
}

extension FaceEnrollmentProfileQuerySortThenBy
    on QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QSortThenBy> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByEnrolledByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledByUserId', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByEnrolledByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledByUserId', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByFailedAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedAttempts', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByFailedAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedAttempts', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByIndividualId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByIndividualIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByIsSystemUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByLastVerifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVerifiedAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByLastVerifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVerifiedAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByPinHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinHash', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByPinHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinHash', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByPinSalt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinSalt', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByPinSaltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinSalt', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenBySupervisorApprovalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorApprovalStatus', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenBySupervisorApprovalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorApprovalStatus', Sort.desc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByTwinFlagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twinFlagged', Sort.asc);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QAfterSortBy>
      thenByTwinFlaggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twinFlagged', Sort.desc);
    });
  }
}

extension FaceEnrollmentProfileQueryWhereDistinct
    on QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct> {
  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrolledAt');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByEnrolledByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrolledByUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByFailedAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failedAttempts');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByIndividualId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'individualId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSystemUser');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByLastVerifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVerifiedAt');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByPinHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByPinSalt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinSalt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctBySupervisorApprovalStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supervisorApprovalStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEnrollmentProfile, FaceEnrollmentProfile, QDistinct>
      distinctByTwinFlagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twinFlagged');
    });
  }
}

extension FaceEnrollmentProfileQueryProperty on QueryBuilder<
    FaceEnrollmentProfile, FaceEnrollmentProfile, QQueryProperty> {
  QueryBuilder<FaceEnrollmentProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, DateTime, QQueryOperations>
      enrolledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrolledAt');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, String, QQueryOperations>
      enrolledByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrolledByUserId');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, int, QQueryOperations>
      failedAttemptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failedAttempts');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, String, QQueryOperations>
      individualIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'individualId');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, bool, QQueryOperations>
      isSystemUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSystemUser');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, DateTime?, QQueryOperations>
      lastVerifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVerifiedAt');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, String, QQueryOperations>
      pinHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinHash');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, String, QQueryOperations>
      pinSaltProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinSalt');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, String, QQueryOperations>
      supervisorApprovalStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supervisorApprovalStatus');
    });
  }

  QueryBuilder<FaceEnrollmentProfile, bool, QQueryOperations>
      twinFlaggedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twinFlagged');
    });
  }
}
