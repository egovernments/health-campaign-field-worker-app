import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/project_facility_base.dart';

class ProjectFacilityLocalRepository
    extends ProjectFacilityLocalBaseRepository {
  ProjectFacilityLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<ProjectFacilityModel>> search(
    ProjectFacilitySearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.projectFacility).join([]);

    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.projectId != null)
                  sql.projectFacility.projectId.isIn(query.projectId!),
                if (query.facilityId != null)
                  sql.projectFacility.facilityId.isIn(query.facilityId!),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final projectFacility = e.readTable(sql.projectFacility);

      return ProjectFacilityModel(
        facilityId: projectFacility.facilityId,
        projectId: projectFacility.projectId,
        tenantId: projectFacility.tenantId,
        rowVersion: projectFacility.rowVersion,
        id: projectFacility.id,
        isDeleted: projectFacility.isDeleted,
      );
    }).toList();
  }

  @override
  FutureOr<void> create(
    ProjectFacilityModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    await sql.batch((batch) async {
      batch.insert(
        sql.projectFacility,
        entity.companion,
        mode: InsertMode.insertOrReplace,
      );
    });

    await super.create(
      entity,
      createOpLog: createOpLog,
    );
  }
}
