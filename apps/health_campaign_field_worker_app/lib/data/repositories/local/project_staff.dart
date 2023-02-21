import 'dart:async';

import '../../../models/data_model.dart';
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
        id: data.id,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }

  @override
  // TODO: implement type
  DataModelType get type => DataModelType.projectStaff;
}
