// import 'package:digit_data_model/data_model.dart';

// // This is a singleton class for inventory operations.
// class LocationTrackerServiceSingleton {
//   static final LocationTrackerServiceSingleton _singleton =
//       LocationTrackerServiceSingleton._internal();

//   // Factory constructor that returns the singleton instance.
//   factory LocationTrackerServiceSingleton() {
//     return _singleton;
//   }

//   // Private constructor for the singleton pattern.
//   LocationTrackerServiceSingleton._internal();

//   // Instance of the InventoryListener.

//   // Various properties related to the inventory.
//   String _projectId = '';
//   UserModel? _loggedInUser;
//   String? _loggedInUserUuid = '';
//   String? _boundaryName = '';
//   String? _tenantId = '';

//   // PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
//   //     .offlineFirst; // Default to offline first persistence configuration

//   // Sets the initial data for the inventory.
//   void setInitialData({
//     String? loggedInUserUuid,
//     required String projectId,
//     UserModel? loggedInUser,
//   }) {
//     _projectId = projectId;
//     _loggedInUserUuid = loggedInUserUuid;

//     _loggedInUser = loggedInUser;
//   }

//   void setPersistenceConfiguration(PersistenceConfiguration configuration) {
//     _persistenceConfiguration = configuration;
//   }

//   void setBoundaryName({required String boundaryName}) {
//     _boundaryName = boundaryName;
//   }

//   void setTenantId({required String tenantId}) {
//     _tenantId = tenantId;
//   }

//   // Getters for the properties.
//   get projectId => _projectId;
//   get loggedInUserUuid => _loggedInUserUuid;
//   get boundaryName => _boundaryName;

//   get tenantId => _tenantId;
//   get persistenceConfiguration => _persistenceConfiguration;
//   UserModel? get loggedInUser => _loggedInUser;
// }

// enum PersistenceConfiguration { offlineFirst, onlineOnly }
