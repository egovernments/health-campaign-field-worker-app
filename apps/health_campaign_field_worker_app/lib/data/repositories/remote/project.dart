import 'dart:async';

import 'package:health_campaigns_flutter/data/data_repository.dart';
import 'package:health_campaigns_flutter/models/data_model.dart';

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
