import 'dart:async';
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
  FutureOr<List<BoundaryModel>> search(BoundarySearchModel query) async {
    final selectQuery = sql.select(sql.boundary).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.boundaryCode != null)
              sql.boundary.code.equals(
                query.boundaryCode,
              ),
          ])))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.project);

      return BoundaryModel(
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
        name: data.name,
      );
    }).toList();
  }

  @override
  DataModelType get type => DataModelType.boundary;
}
