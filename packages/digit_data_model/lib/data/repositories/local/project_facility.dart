import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class ProjectFacilityLocalRepository
    extends LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  ProjectFacilityLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<ProjectFacilityModel>> search(
    ProjectFacilitySearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<ProjectFacilityModel>>(() async {
      final selectQuery = sql.select(sql.projectFacility).join([]);

      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.id != null)
                    sql.projectFacility.id.isIn(query.id!),
                  if (query.clientReferenceId != null)
                    sql.projectFacility.clientReferenceId
                        .isIn(query.clientReferenceId!),
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
          clientReferenceId: projectFacility.clientReferenceId,
          isDeleted: projectFacility.isDeleted,
          additionalFields: projectFacility.additionalFields != null
              ? ProjectFacilityAdditionalFieldsMapper.fromJson(
                  projectFacility.additionalFields!)
              : null,
        );
      }).toList();
    });
  }

  /// Links created on the phone (outside-household sites) must reach the
  /// server, so an oplog entry is written by default. Downloads go through
  /// [bulkCreate], which never writes one.
  @override
  FutureOr<void> create(
    ProjectFacilityModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
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
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<ProjectFacilityModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final projectFacilityCompanions =
          entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.projectFacility,
          projectFacilityCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  /// Replaces the placeholder [id] (the app-local clientReferenceId) of a
  /// link created on the phone with the id the server assigned to it.
  Future<void> applyServerGeneratedId({
    required String clientReferenceId,
    required String serverGeneratedId,
    int? rowVersion,
  }) async {
    return retryLocalCallOperation(() async {
      await (sql.update(sql.projectFacility)
            ..where((t) => t.clientReferenceId.equals(clientReferenceId)))
          .write(ProjectFacilityCompanion(
        id: Value(serverGeneratedId),
        rowVersion: Value(rowVersion),
      ));
    });
  }

  @override
  DataModelType get type => DataModelType.projectFacility;
}
