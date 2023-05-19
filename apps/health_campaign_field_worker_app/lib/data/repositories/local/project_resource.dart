import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/project_resource_base.dart';

class ProjectResourceLocalRepository
    extends ProjectResourceLocalBaseRepository {
  ProjectResourceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<ProjectResourceModel>> search(
    ProjectResourceSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.projectResource).join([
      leftOuterJoin(
        sql.projectProductVariant,
        sql.projectProductVariant.productVariantId.equalsExp(
          sql.projectResource.resource,
        ),
      ),
    ]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.projectId != null)
              sql.projectResource.projectId.equals(query.projectId),
          ])))
        .get();

    return results
        .map((e) {
          final projectResource = e.readTable(sql.projectResource);
          final projectProductVariant =
              e.readTableOrNull(sql.projectProductVariant);

          if (projectProductVariant == null) return null;

          return ProjectResourceModel(
            projectId: projectResource.projectId,
            rowVersion: projectResource.rowVersion,
            tenantId: projectResource.tenantId,
            id: projectResource.id,
            isDeleted: projectResource.isDeleted,
            resource: ProjectProductVariantModel(
              productVariantId: projectProductVariant.productVariantId,
              tenantId: projectProductVariant.tenantId,
              type: projectProductVariant.type,
              isBaseUnitVariant: projectProductVariant.isBaseUnitVariant,
            ),
          );
        })
        .whereNotNull()
        .toList();
  }

  @override
  FutureOr<void> create(
    ProjectResourceModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final projectProductVariantCompanion =
        entity.resource.copyWith(auditDetails: entity.auditDetails).companion;

    await sql.batch((batch) async {
      batch.insert(
        sql.projectResource,
        entity.companion,
        mode: InsertMode.insertOrReplace,
      );

      batch.insert(
        sql.projectProductVariant,
        projectProductVariantCompanion,
        mode: InsertMode.insertOrReplace,
      );
    });

    await super.create(
      entity,
      createOpLog: createOpLog,
    );
  }
}
