import 'dart:async';

import '../../../models/data_model.dart';
import '../../../models/entities/project.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class ProjectLocalRepository
    extends LocalRepository<ProjectModel, ProjectSearchModel> {
  ProjectLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ProjectModel entity, {
    bool createOpLog = true,
  }) async {
    final projectCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.project, projectCompanion);
    });

    await super.create(entity);
  }

  @override
  // TODO: implement type
  DataModelType get type => DataModelType.project;

  @override
  FutureOr<List<ProjectModel>> search(ProjectSearchModel query) async {
    final selectQuery = sql.select(sql.project).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.id != null)
              sql.project.id.equals(
                query.id,
              ),
          ])))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.project);

      return ProjectModel(
        id: data.id,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
        clientReferenceId: data.id.toString(),
      );
    }).toList();
  }
}
