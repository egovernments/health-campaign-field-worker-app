import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/boundary_base.dart';

class BoundaryLocalRepository extends BoundaryLocalBaseRepository {
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
    final selectQuery = sql.select(sql.boundary).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.code != null)
              sql.boundary.materializedPath.like('%${query.code}%'),
            if (query.boundaryType != null && query.boundaryType!.isNotEmpty)
              sql.boundary.label.equals(query.boundaryType!),
            sql.boundary.materializedPath.isNotNull(),
            sql.boundary.materializedPath.isNotIn(['']),
            sql.boundary.code.isNotNull(),
            sql.boundary.code.isNotIn(['']),
          ])))
        .get();

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
}
