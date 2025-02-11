import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class ProjectResourceLocalRepository
    extends LocalRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  ProjectResourceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<ProjectResourceModel>> search(
    ProjectResourceSearchModel query,
  ) async {
    return retryLocalCallOperation<List<ProjectResourceModel>>(() async {
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
                sql.projectResource.projectId.isIn(query.projectId!),
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
                name: projectProductVariant.name,
              ),
            );
          })
          .whereNotNull()
          .toList();
    });
  }

  @override
  FutureOr<void> create(
    ProjectResourceModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
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
    });
  }

  @override
  DataModelType get type => DataModelType.projectResource;
}
