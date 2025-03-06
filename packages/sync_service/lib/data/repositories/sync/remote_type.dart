// Importing necessary packages
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';

/// The `RepositoryType` class provides methods to get the remote and local repositories for a given data model type.
class RepositoryType {
  /// Returns the remote repository for the given data model type.
  ///
  /// This method accepts a `DataModelType` and a list of `RemoteRepository` objects as parameters.
  /// It returns the first `RemoteRepository` object in the list that matches the given data model type.
  /// If no matching repository is found, it throws an exception.
  static RemoteRepository getRemoteForType(
    DataModelType type,
    List<RemoteRepository> remoteRepositories,
  ) {
    final repository = remoteRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );
    if (repository == null) {
      throw Exception(
        'Remote repository is not passed to sync service',
      );
    }

    return repository;
  }

  /// Returns the local repository for the given data model type.
  ///
  /// This method accepts a `DataModelType` and a list of `LocalRepository` objects as parameters.
  /// It returns the first `LocalRepository` object in the list that matches the given data model type.
  /// If no matching repository is found, it throws an exception.
  static LocalRepository getLocalForType(
    DataModelType type,
    List<LocalRepository> localRepositories,
  ) {
    final repository = localRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Local repository is not passed to sync service',
      );
    }

    return repository;
  }
}
