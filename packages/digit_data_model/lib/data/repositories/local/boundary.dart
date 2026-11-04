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

        return _singleChain(rows, anchorCode: query.codes);
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
  ///
  /// With [anchorCode] (the project's boundary), the chain runs through that
  /// boundary: its ancestors and itself come from its materializedPath, and
  /// only the levels below it are picked freely. Without this the chain
  /// started from whichever root row came first, which could belong to
  /// another project or a previous user's boundaries left in the table.
  List<BoundaryModel> _singleChain(
    List<BoundaryModel> sorted, {
    String? anchorCode,
  }) {
    final byLevel = <int, List<BoundaryModel>>{};
    for (final row in sorted) {
      byLevel.putIfAbsent(row.boundaryNum!, () => []).add(row);
    }

    final anchor = anchorCode == null || anchorCode.isEmpty
        ? null
        : sorted.where((b) => b.code == anchorCode).firstOrNull;
    final anchorPath = anchor?.materializedPath?.split('.') ?? const [];

    final chain = <BoundaryModel>[];
    for (final entry in byLevel.entries) {
      final rows = entry.value;
      final parentPath = chain.lastOrNull?.materializedPath;
      final underParent = parentPath == null
          ? rows
          : rows
              .where((b) =>
                  b.materializedPath?.startsWith('$parentPath.') ?? false)
              .toList();
      if (anchor != null && entry.key <= anchor.boundaryNum!) {
        // At or above the anchor: only the anchor's own ancestor qualifies.
        final onPath =
            underParent.where((b) => anchorPath.contains(b.code)).firstOrNull;
        if (onPath != null) {
          chain.add(onPath);
          continue;
        }
      }
      chain.add(underParent.firstOrNull ?? rows.first);
    }

    return chain;
  }

  @override
  FutureOr<void> delete(BoundaryModel entity, {bool createOpLog = true}) async {
    super.delete(entity, createOpLog: createOpLog);
    // Awaited so a caller that clears the table and then writes fresh rows
    // can't have the delete land after the write.
    return retryLocalCallOperation(() async {
      await sql
          .delete(
            sql.boundary,
          )
          .go();
    });
  }

  @override
  DataModelType get type => DataModelType.boundary;
}
