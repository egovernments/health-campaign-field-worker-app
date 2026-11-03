import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class BoundaryLocalRepository
    extends LocalRepository<BoundaryModel, BoundarySearchModel> {
  BoundaryLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    BoundaryModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final boundaryCompanion = entity.companion;

      await sql.batch((batch) async {
        batch.insert(
          sql.boundary,
          boundaryCompanion,
          mode: InsertMode.insertOrReplace,
        );
      });

      await super.create(entity);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<BoundaryModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final boundaryCompanions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.boundary,
          boundaryCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<List<BoundaryModel>> search(BoundarySearchModel query) async {
    return retryLocalCallOperation<List<BoundaryModel>>(() async {
      final selectQuery = sql
          .select(
        sql.boundary,
        distinct: true,
      )
          .join([]);

      if (query.isSingle == true) {
        // One row per level, root to leaf. The level order on the boundary
        // page comes from this list, so it must be ordered by boundaryNum:
        // without an ORDER BY, SQLite may return rows in any order, and it
        // stops matching insertion order once a re-login has rewritten the
        // table (e.g. Village showing up above Locality).
        (selectQuery
          ..where(buildAnd([
            sql.boundary.boundaryNum.isNotNull(),
            sql.boundary.code.isNotNull(),
            sql.boundary.code.isNotIn(['']),
          ]))
          ..orderBy([OrderingTerm.asc(sql.boundary.boundaryNum)]));

        final rows = (await selectQuery.get())
            .map((e) => _toModel(e.readTable(sql.boundary)))
            .toList();

        return _singleChain(rows);
      } else {
        (selectQuery
          ..where(buildAnd([
            if (query.codes != null)
              sql.boundary.materializedPath.like('%${query.codes}%'),
            sql.boundary.materializedPath.isNotNull(),
            if (query.boundaryType != null && query.boundaryType!.isNotEmpty)
              sql.boundary.label.equals(query.boundaryType!),
            if (query.boundaryNum != null)
              sql.boundary.boundaryNum.equals(query.boundaryNum! + 1),
            sql.boundary.materializedPath.isNotIn(['']),
            sql.boundary.code.isNotNull(),
            sql.boundary.code.isNotIn(['']),
          ])));
      }
      final results = await selectQuery.get();

      return results.map((e) => _toModel(e.readTable(sql.boundary))).toList();
    });
  }

  BoundaryModel _toModel(BoundaryData data) => BoundaryModel(
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

  /// From rows sorted by boundaryNum, picks one row per level, preferring a
  /// row that sits under the row picked for the level above, so the result
  /// is a root-to-leaf chain whatever order the rows were stored in.
  List<BoundaryModel> _singleChain(List<BoundaryModel> sorted) {
    final byLevel = <int, List<BoundaryModel>>{};
    for (final row in sorted) {
      byLevel.putIfAbsent(row.boundaryNum!, () => []).add(row);
    }

    final chain = <BoundaryModel>[];
    for (final rows in byLevel.values) {
      final parentPath = chain.lastOrNull?.materializedPath;
      chain.add(parentPath == null
          ? rows.first
          : rows.firstWhere(
              (b) => b.materializedPath?.startsWith('$parentPath.') ?? false,
              orElse: () => rows.first,
            ));
    }

    return chain;
  }

  @override
  FutureOr<void> delete(BoundaryModel entity, {bool createOpLog = true}) async {
    super.delete(entity, createOpLog: createOpLog);
    return retryLocalCallOperation(() async {
      sql
          .delete(
            sql.boundary,
          )
          .go();
    });
  }

  @override
  DataModelType get type => DataModelType.boundary;
}
