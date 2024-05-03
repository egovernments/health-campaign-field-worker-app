import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class BoundaryLocalRepository
    extends LocalRepository<BoundaryModel, BoundarySearchModel> {
  BoundaryLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    BoundaryModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final boundaryCompanion = entity.companion;

    await sql.batch((batch) async {
      batch.insert(
        sql.boundary,
        boundaryCompanion,
        mode: InsertMode.insertOrReplace,
      );
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> bulkCreate(
    List<BoundaryModel> entities,
  ) async {
    final boundaryCompanions = entities.map((e) => e.companion).toList();

    await sql.batch((batch) async {
      batch.insertAll(
        sql.boundary,
        boundaryCompanions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  FutureOr<List<BoundaryModel>> search(BoundarySearchModel query) async {
    final selectQuery = sql
        .select(
      sql.boundary,
      distinct: true,
    )
        .join([]);

    final sQuery = sql.selectOnly(sql.boundary)
      ..addColumns([sql.boundary.boundaryNum, sql.boundary.boundaryNum.max()]);

    final result = await sQuery.getSingle();
    final r = result.read(sql.boundary.boundaryNum);

    if (query.isSingle == true) {
      (selectQuery
            ..where(buildAnd([
              sql.boundary.boundaryNum.isSmallerOrEqualValue(r!),
            ])))
          .limit(r);
    } else {
      (selectQuery
        ..where(buildAnd([
          if (query.code != null)
            sql.boundary.materializedPath.like('%${query.code}%'),
          sql.boundary.materializedPath.isNotNull(),
          if (query.boundaryNum != null)
            sql.boundary.boundaryNum.equals(query.boundaryNum!),
          if (query.boundaryType != null && query.boundaryType!.isNotEmpty)
            sql.boundary.label.equals(query.boundaryType!),
          sql.boundary.materializedPath.isNotIn(['']),
          sql.boundary.code.isNotNull(),
          sql.boundary.code.isNotIn(['']),
        ])));
    }
    final results = await selectQuery.get();

    final queriedBoundaries = results.map((e) {
      final data = e.readTable(sql.boundary);

      return BoundaryModel(
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
        name: data.name,
        code: data.code,
        label: data.label,
        boundaryNum: data.boundaryNum,
        materializedPath: data.materializedPath,
        latitude: data.latitude,
        longitude: data.longitude,
      );
    }).toList();

    return queriedBoundaries;
  }

  @override
  FutureOr<void> delete(BoundaryModel entity, {bool createOpLog = true}) async {
    sql
        .delete(
          sql.boundary,
        )
        .go();
  }

  @override
  DataModelType get type => DataModelType.boundary;
}
