import 'dart:async';

import '../../../models/data_model.dart';
import '../../../models/entities/project_staff.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class ProjectStaffLocalRepository
    extends LocalRepository<ProjectStaffModel, ProjectStaffSearchModel> {
  ProjectStaffLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ProjectStaffModel entity, {
    bool createOpLog = true,
  }) async {
    final projectstaffCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.projectStaff, projectstaffCompanion);
    });

    await super.create(entity);
  }

  @override
  FutureOr<List<ProjectStaffModel>> search(
    ProjectStaffSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.projectStaff).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.id != null)
              sql.projectStaff.id.equals(
                query.id,
              ),
          ])))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.projectStaff);

      return ProjectStaffModel(
        clientReferenceId: data.clientReferenceId,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }

  @override
  // TODO: implement type
  DataModelType get type => DataModelType.projectStaff;
}
