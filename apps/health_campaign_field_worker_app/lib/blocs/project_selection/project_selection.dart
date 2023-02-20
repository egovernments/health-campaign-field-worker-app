// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/repositories/local/project_staff.dart';
import '../../data/repositories/oplog/oplog.dart';
import '../../data/repositories/remote/project_staff.dart';
import '../../models/data_model.dart';
import '../auth/auth.dart';

part 'project_selection.freezed.dart';

typedef ProjectSelectionEmitter = Emitter<ProjectSelectionState>;

class ProjectSelectionBloc
    extends Bloc<ProjectSelectionEvent, ProjectSelectionState> {
  ProjectStaffRemoteRepository projectStaffRemoteRepository;
  final Isar isar;
  final LocalSqlDataStore sql;
  ProjectSelectionBloc(
    super.initialState, {
    required this.projectStaffRemoteRepository,
    required this.sql,
    required this.isar,
  }) {
    on(_handleProjectInit);
  }

  FutureOr<void> _handleProjectInit(
    ProjectSelectionProjectInitEvent event,
    ProjectSelectionEmitter emit,
  ) async {
    print("------------API called--------");
    final uuid = await storage.read(
      key: AuthBloc.uuid,
    );
    print(await projectStaffRemoteRepository
        .search(ProjectStaffSearchModel(userId: uuid)));
    await ProjectStaffLocalRepository(sql, ProjectStaffOpLogManager(isar))
        .create(
      ProjectStaffModel(
        clientReferenceId: '',
        rowVersion: 1,
        tenantId: '',
      ),
      createOpLog: false,
    );
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
