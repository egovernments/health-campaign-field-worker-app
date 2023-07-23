// Importing necessary packages and files
import 'dart:async'; // For working with asynchronous operations

import '../models/data_model.dart'; // Importing the data model file
import 'data_repository.dart'; // Importing the data repository file

// The DataManager class for managing data operations
class DataManager<D extends EntityModel, R extends EntitySearchModel> {
  final RemoteRepository<D, R>
      remoteRepository; // Remote data repository for online mode
  final LocalRepository<D, R>
      localRepository; // Local data repository for offline mode
  final PersistenceConfiguration
      configuration; // Configuration for choosing between local and remote repositories

  // Constructor for DataManager
  const DataManager({
    required this.localRepository,
    required this.remoteRepository,
    required this.configuration,
  });

  // A private method to get the appropriate data repository based on the configuration
  DataRepository<D, R> _getRepository(PersistenceConfiguration configuration) {
    switch (configuration) {
      case PersistenceConfiguration.offline:
        return localRepository; // Return the local data repository for offline configuration
      case PersistenceConfiguration.online:
        return remoteRepository; // Return the remote data repository for online configuration
    }
  }

  // A method to search for data based on the provided query
  // It returns a List of entities that match the query.
  FutureOr<List<D>> search(R query) =>
      _getRepository(configuration).search(query);

  // A method to create a new entity
  // It takes an entity as input and creates it using the appropriate data repository.
  // The returned value is dynamic since it can vary based on the implementation in the repository.
  FutureOr<dynamic> create(D entity) =>
      _getRepository(configuration).create(entity);

  // A method to update an existing entity
  // It takes an entity as input and updates it using the appropriate data repository.
  // The returned value is dynamic since it can vary based on the implementation in the repository.
  FutureOr<dynamic> update(D entity) =>
      _getRepository(configuration).update(entity);
}

// An enumeration to represent the two possible persistence configurations
enum PersistenceConfiguration { offline, online }
