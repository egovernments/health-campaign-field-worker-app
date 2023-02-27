// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/repositories/local/project.dart';
import '../../data/repositories/local/project_staff.dart';
import '../../data/repositories/oplog/oplog.dart';
import '../../data/repositories/remote/project.dart';
import '../../data/repositories/remote/project_staff.dart';
import '../../models/data_model.dart';
import '../auth/auth.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectStaffRemoteRepository projectStaffRemoteRepository;
  ProjectRemoteRepository projectRemoteRepository;
  final Isar isar;
  final LocalSqlDataStore sql;
  ProjectBloc({
    required this.projectStaffRemoteRepository,
    required this.projectRemoteRepository,
    required this.sql,
    required this.isar,
  }) : super(const ProjectsEmptyState()) {
    on(_handleProjectInit);
  }

  FutureOr<void> _handleProjectInit(
    ProjectInitEvent event,
    ProjectEmitter emit,
  ) async {
    emit(const ProjectLoadingState());
    final uuid = await storage.read(
      key: AuthBloc.uuid,
    );

    final projectStaff = await projectStaffRemoteRepository
        .search(ProjectStaffSearchModel(staffId: uuid));
    if (projectStaff.isNotEmpty) {
      await ProjectStaffLocalRepository(sql, ProjectStaffOpLogManager(isar))
          .create(
        ProjectStaffModel(
          rowVersion: 1,
          tenantId: projectStaff.first.tenantId,
          id: projectStaff.first.id,
          projectId: projectStaff.first.projectId,
          startDate: projectStaff.first.startDate,
          endDate: projectStaff.first.endDate,
          channel: projectStaff.first.channel,
        ),
        createOpLog: false,
      );
      final projects = await projectRemoteRepository.search(ProjectSearchModel(
        id: projectStaff.first.projectId,
        tenantId: projectStaff.first.tenantId,
      ));

      for (var element in projects) {
        await ProjectLocalRepository(sql, ProjectOpLogManager(isar))
            .create(ProjectModel(
          id: element.id,
          projectTypeId: element.projectTypeId,
          subProjectTypeId: element.subProjectTypeId,
          isTaskEnabled: element.isTaskEnabled,
          parent: element.parent,
          department: element.department,
          description: element.description,
          referenceId: element.referenceId,
          projectHierarchy: element.projectHierarchy,
          tenantId: element.tenantId,
          isDeleted: element.isDeleted,
          rowVersion: element.rowVersion,
          address: element.address,
          targets: element.targets,
          documents: element.documents,
          startDate: element.startDate,
          endDate: element.endDate,
          name: element.name,
        ));
      }
      emit(ProjectSelectionFetchedState(projects: projects));
    }

    // handle logic for projectInit here
  }
}

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.projectInit() = ProjectInitEvent;
}

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.loading() = ProjectLoadingState;
  const factory ProjectState.empty() = ProjectsEmptyState;
  const factory ProjectState.fetched({
    required List<ProjectModel> projects,
  }) = ProjectSelectionFetchedState;
}
