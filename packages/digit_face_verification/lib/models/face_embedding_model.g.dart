// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_embedding_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFaceEmbeddingCollection on Isar {
  IsarCollection<FaceEmbedding> get faceEmbeddings => this.collection();
}

const FaceEmbeddingSchema = CollectionSchema(
  name: r'FaceEmbedding',
  id: -7362080099285850007,
  properties: {
    r'angleCount': PropertySchema(
      id: 0,
      name: r'angleCount',
      type: IsarType.long,
    ),
    r'angleEmbeddingsFlat': PropertySchema(
      id: 1,
      name: r'angleEmbeddingsFlat',
      type: IsarType.doubleList,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'embedding': PropertySchema(
      id: 3,
      name: r'embedding',
      type: IsarType.doubleList,
    ),
    r'enrolledBy': PropertySchema(
      id: 4,
      name: r'enrolledBy',
      type: IsarType.string,
    ),
    r'individualId': PropertySchema(
      id: 5,
      name: r'individualId',
      type: IsarType.string,
    ),
    r'isSystemUser': PropertySchema(
      id: 6,
      name: r'isSystemUser',
      type: IsarType.bool,
    ),
    r'modelVersion': PropertySchema(
      id: 7,
      name: r'modelVersion',
      type: IsarType.string,
    )
  },
  estimateSize: _faceEmbeddingEstimateSize,
  serialize: _faceEmbeddingSerialize,
  deserialize: _faceEmbeddingDeserialize,
  deserializeProp: _faceEmbeddingDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _faceEmbeddingGetId,
  getLinks: _faceEmbeddingGetLinks,
  attach: _faceEmbeddingAttach,
  version: '3.1.0+1',
);

int _faceEmbeddingEstimateSize(
  FaceEmbedding object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.angleEmbeddingsFlat.length * 8;
  bytesCount += 3 + object.embedding.length * 8;
  bytesCount += 3 + object.enrolledBy.length * 3;
  bytesCount += 3 + object.individualId.length * 3;
  bytesCount += 3 + object.modelVersion.length * 3;
  return bytesCount;
}

void _faceEmbeddingSerialize(
  FaceEmbedding object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.angleCount);
  writer.writeDoubleList(offsets[1], object.angleEmbeddingsFlat);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDoubleList(offsets[3], object.embedding);
  writer.writeString(offsets[4], object.enrolledBy);
  writer.writeString(offsets[5], object.individualId);
  writer.writeBool(offsets[6], object.isSystemUser);
  writer.writeString(offsets[7], object.modelVersion);
}

FaceEmbedding _faceEmbeddingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FaceEmbedding(
    angleCount: reader.readLongOrNull(offsets[0]) ?? 1,
    angleEmbeddingsFlat: reader.readDoubleList(offsets[1]) ?? const [],
    createdAt: reader.readDateTime(offsets[2]),
    embedding: reader.readDoubleList(offsets[3]) ?? [],
    enrolledBy: reader.readStringOrNull(offsets[4]) ?? '',
    individualId: reader.readString(offsets[5]),
    isSystemUser: reader.readBoolOrNull(offsets[6]) ?? true,
    modelVersion:
        reader.readStringOrNull(offsets[7]) ?? 'mobilefacenet_african_v2',
  );
  object.id = id;
  return object;
}

P _faceEmbeddingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? const []) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? 'mobilefacenet_african_v2')
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _faceEmbeddingGetId(FaceEmbedding object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _faceEmbeddingGetLinks(FaceEmbedding object) {
  return [];
}

void _faceEmbeddingAttach(
    IsarCollection<dynamic> col, Id id, FaceEmbedding object) {
  object.id = id;
}

extension FaceEmbeddingByIndex on IsarCollection<FaceEmbedding> {
  Future<FaceEmbedding?> getByIndividualId(String individualId) {
    return getByIndex(r'individualId', [individualId]);
  }

  FaceEmbedding? getByIndividualIdSync(String individualId) {
    return getByIndexSync(r'individualId', [individualId]);
  }

  Future<bool> deleteByIndividualId(String individualId) {
    return deleteByIndex(r'individualId', [individualId]);
  }

  bool deleteByIndividualIdSync(String individualId) {
    return deleteByIndexSync(r'individualId', [individualId]);
  }

  Future<List<FaceEmbedding?>> getAllByIndividualId(
      List<String> individualIdValues) {
    final values = individualIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'individualId', values);
  }

  List<FaceEmbedding?> getAllByIndividualIdSync(
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

  Future<Id> putByIndividualId(FaceEmbedding object) {
    return putByIndex(r'individualId', object);
  }

  Id putByIndividualIdSync(FaceEmbedding object, {bool saveLinks = true}) {
    return putByIndexSync(r'individualId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIndividualId(List<FaceEmbedding> objects) {
    return putAllByIndex(r'individualId', objects);
  }

  List<Id> putAllByIndividualIdSync(List<FaceEmbedding> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'individualId', objects, saveLinks: saveLinks);
  }
}

extension FaceEmbeddingQueryWhereSort
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QWhere> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceEmbeddingQueryWhere
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QWhereClause> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause> idBetween(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause>
      individualIdEqualTo(String individualId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'individualId',
        value: [individualId],
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterWhereClause>
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
}

extension FaceEmbeddingQueryFilter
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QFilterCondition> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'angleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'angleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'angleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'angleCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'angleEmbeddingsFlat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'angleEmbeddingsFlat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'angleEmbeddingsFlat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'angleEmbeddingsFlat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      angleEmbeddingsFlatLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'angleEmbeddingsFlat',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'embedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'embedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'embedding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'embedding',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      embeddingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrolledBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enrolledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enrolledBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledBy',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      enrolledByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enrolledBy',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdEqualTo(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdGreaterThan(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdLessThan(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdBetween(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdStartsWith(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdEndsWith(
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

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'individualId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'individualId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individualId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      individualIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'individualId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      isSystemUserEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSystemUser',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterFilterCondition>
      modelVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelVersion',
        value: '',
      ));
    });
  }
}

extension FaceEmbeddingQueryObject
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QFilterCondition> {}

extension FaceEmbeddingQueryLinks
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QFilterCondition> {}

extension FaceEmbeddingQuerySortBy
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QSortBy> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> sortByAngleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'angleCount', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByAngleCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'angleCount', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> sortByEnrolledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledBy', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByEnrolledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledBy', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByIndividualId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByIndividualIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByIsSystemUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      sortByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }
}

extension FaceEmbeddingQuerySortThenBy
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QSortThenBy> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> thenByAngleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'angleCount', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByAngleCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'angleCount', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> thenByEnrolledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledBy', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByEnrolledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledBy', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByIndividualId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByIndividualIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualId', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByIsSystemUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemUser', Sort.desc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QAfterSortBy>
      thenByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }
}

extension FaceEmbeddingQueryWhereDistinct
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> {
  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByAngleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'angleCount');
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct>
      distinctByAngleEmbeddingsFlat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'angleEmbeddingsFlat');
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByEmbedding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'embedding');
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByEnrolledBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrolledBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByIndividualId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'individualId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct>
      distinctByIsSystemUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSystemUser');
    });
  }

  QueryBuilder<FaceEmbedding, FaceEmbedding, QDistinct> distinctByModelVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelVersion', caseSensitive: caseSensitive);
    });
  }
}

extension FaceEmbeddingQueryProperty
    on QueryBuilder<FaceEmbedding, FaceEmbedding, QQueryProperty> {
  QueryBuilder<FaceEmbedding, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceEmbedding, int, QQueryOperations> angleCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'angleCount');
    });
  }

  QueryBuilder<FaceEmbedding, List<double>, QQueryOperations>
      angleEmbeddingsFlatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'angleEmbeddingsFlat');
    });
  }

  QueryBuilder<FaceEmbedding, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FaceEmbedding, List<double>, QQueryOperations>
      embeddingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'embedding');
    });
  }

  QueryBuilder<FaceEmbedding, String, QQueryOperations> enrolledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrolledBy');
    });
  }

  QueryBuilder<FaceEmbedding, String, QQueryOperations> individualIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'individualId');
    });
  }

  QueryBuilder<FaceEmbedding, bool, QQueryOperations> isSystemUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSystemUser');
    });
  }

  QueryBuilder<FaceEmbedding, String, QQueryOperations> modelVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelVersion');
    });
  }
}
