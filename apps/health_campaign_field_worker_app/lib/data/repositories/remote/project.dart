import 'dart:async';

import '../../data_repository.dart';
import '../../../models/data_model.dart';

class ProjectRepository
    extends RemoteRepository<ProjectModel, ProjectRequestModel> {
  ProjectRepository(super.dio);

  @override
  FutureOr<String> create(ProjectModel entity) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProjectModel>> search(ProjectRequestModel query) async {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  FutureOr<String> update(ProjectModel entity) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
