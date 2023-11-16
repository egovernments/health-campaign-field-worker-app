import 'package:collection/collection.dart';

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class RepositoryType {
  static RemoteRepository getRemoteForType(
    DataModelType type,
    List<RemoteRepository> remoteRepositories,
  ) {
    final repository = remoteRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Remote repository is not configured in the network manager',
      );
    }

    return repository;
  }

  static LocalRepository getLocalForType(
    DataModelType type,
    List<LocalRepository> localRepositories,
  ) {
    final repository = localRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Local repository is not configured in the network manager',
      );
    }

    return repository;
  }
}
