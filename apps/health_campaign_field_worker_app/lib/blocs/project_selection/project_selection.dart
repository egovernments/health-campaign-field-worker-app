// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/repositories/local/project_staff.dart';
import '../../data/repositories/oplog/oplog.dart';
import '../../data/repositories/remote/project.dart';
import '../../data/repositories/remote/project_staff.dart';
import '../../models/data_model.dart';

part 'project_selection.freezed.dart';

typedef ProjectSelectionEmitter = Emitter<ProjectSelectionState>;

class ProjectSelectionBloc
    extends Bloc<ProjectSelectionEvent, ProjectSelectionState> {
  final ProjectStaffRemoteRepository projectStaffRemoteRepository;
  final ProjectRemoteRepository projectRemoteRepository;
  final LocalSecureStore localSecureStore;
  final Isar isar;
  final LocalSqlDataStore sql;

  ProjectSelectionBloc(
    super.initialState, {
    required this.projectStaffRemoteRepository,
    required this.projectRemoteRepository,
    required this.sql,
    required this.isar,
    LocalSecureStore? localSecureStore,
  }) : localSecureStore = localSecureStore ?? LocalSecureStore.instance {
    on(_handleProjectInit);
  }

  FutureOr<void> _handleProjectInit(
    ProjectSelectionProjectInitEvent event,
    ProjectSelectionEmitter emit,
  ) async {
    final user = await localSecureStore.userRequestModel;
    final uuid = user?.uuid;

    final projectStaff = await projectStaffRemoteRepository
        .search(ProjectStaffSearchModel(userId: uuid));

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

    // for (var element in projects) {
    //   print(element);
    //   await ProjectLocalRepository(sql, ProjectOpLogManager(isar))
    //       .create(ProjectModel(
    //     clientReferenceId: element.clientReferenceId,
    //     rowVersion: 1,
    //     tenantId: element.tenantId,
    //     projectTypeId: element.projectTypeId,
    //     id: element.id,
    //     subProjectTypeId: element.subProjectTypeId,
    //   ));
    // }

    // handle logic for projectInit here
  }
}

@freezed
class ProjectSelectionEvent with _$ProjectSelectionEvent {
  const factory ProjectSelectionEvent.projectInit() =
      ProjectSelectionProjectInitEvent;
}

@freezed
class ProjectSelectionState with _$ProjectSelectionState {
  const ProjectSelectionState._();

  const factory ProjectSelectionState() = _ProjectSelectionProjectsState;
}
