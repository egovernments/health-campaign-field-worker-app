// Importing required libraries
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:isar/isar.dart';
import '../../../models/data_model.dart'; // Importing data models used in the application
import '../../../utils/app_exception.dart'; // Importing a custom exception class
import '../../local_store/no_sql/schema/oplog.dart'
    hide AdditionalId; // Importing OpLog class

// Abstract class for managing operation logs for data models
abstract class OpLogManager<T extends EntityModel> {
  final Isar isar; // Isar database instance

  // Constructor to initialize the Isar instance
  const OpLogManager(this.isar);

  // Method to get pending operation logs for data models to be synchronized up to the server
  Future<List<OpLogEntry<T>>> getPendingUpSync(
    DataModelType type, // Type of the data model
    {
    required String createdBy,
  } // Creator of the data model
      ) async {
    // Fetch create, update, delete, and singleCreate operation logs that are pending for up sync
    final createOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final singleCreateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.singleCreate)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final updateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final deleteOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.delete)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    // Combine and sort the operation logs based on their creation timestamp
    var entries = [
      createOpLogs,
      updateOpLogs,
      deleteOpLogs,
      singleCreateOpLogs,
    ].expand((element) => element);

    entries = entries.sortedBy((element) => element.createdAt);

    // Group the operation logs by clientReferenceId and return a list of OpLogEntry objects
    final groupedEntries = entries.groupListsBy(
      (element) => element.clientReferenceId,
    );

    final entriesForUpSync = groupedEntries.entries
        .map<OpLog?>((entry) {
          if (entry.key == null) return null;
          if (entry.value.isEmpty) return null;

          return entry.value.first;
        })
        .whereNotNull()
        .toList();

    return entriesForUpSync.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  // Method to get pending operation logs for data models to be synchronized down to the client
  Future<List<OpLogEntry<T>>> getPendingDownSync(
    DataModelType type, // Type of the data model
    {
    required String createdBy,
  } // Creator of the data model
      ) async {
    // Fetch synced-up operation logs that are pending for down sync
    var oplogs = await isar.opLogs
        .filter()
        .syncedUpEqualTo(true)
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAll();

    // Sort the operation logs based on their creation timestamp
    oplogs = oplogs.sortedBy((element) => element.createdAt);

    // Return a list of OpLogEntry objects for the pending down sync operation logs
    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  // Method to store an operation log entry in the Isar database
  Future<void> put(OpLogEntry<T> entry) async {
    await isar.writeTxn(() async {
      // Save the given operation log entry into the Isar database
      await isar.opLogs.put(entry
          .copyWith(
            clientReferenceId: getClientReferenceId(entry.entity),
            serverGeneratedId: getServerGeneratedId(entry.entity),
          )
          .oplog);
    });
  }

  // Method to mark operation logs as synced up to the server
  Future<void> markSyncUp({
    OpLogEntry<T>? entry, // The operation log entry to mark as synced up
    int? id, // The ID of the operation log entry to mark as synced up
    String?
        clientReferenceId, // The clientReferenceId of the operation log entry to mark as synced up
  }) async {
    if (entry != null) {
      // Mark the given entry as synced up and update the syncedUpOn timestamp
      await put(entry.copyWith(syncedUp: true, syncedUpOn: DateTime.now()));
    } else if (id != null) {
      // Fetch the entry with the provided ID from the database and mark it as synced up
      OpLog? oplog;

      oplog = await isar.opLogs.get(id);
      if (oplog == null) return;
      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ),
      );
    } else if (clientReferenceId != null) {
      // Fetch the entry with the provided clientReferenceId from the database and mark it as synced up
      final oplog = await isar.opLogs
          .filter()
          .clientReferenceIdEqualTo(clientReferenceId)
          .findFirst();

      if (oplog == null) return;

      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ),
      );
    } else {
      // Throw an exception if none of the required parameters are provided
      throw AppException('Invalid arguments');
    }
  }

  // Method to update server-generated IDs for operation logs
  Future<void> updateServerGeneratedIds({
    required UpdateServerGeneratedIdModel model,
  }) async {
    // Fetch operation logs with the provided clientReferenceId
    final opLogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(model.clientReferenceId)
        .findAll();

    // Update server-generated IDs and additional IDs for each fetched operation log
    for (final oplog in opLogs) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);

      OpLogEntry updatedEntry = entry.copyWith(
        serverGeneratedId: model.serverGeneratedId,
        additionalIds: model.additionalIds,
      );

      // Mark the updated entry as synced down if it was previously synced up
      if (entry.syncedUp) {
        updatedEntry = updatedEntry.copyWith(
          syncedDown: true,
          syncedDownOn: DateTime.now(),
        );
      }

      final updatedOplog = updatedEntry.oplog;

      // Save the updated operation log entry in the database
      await isar.writeTxn(() async {
        await isar.opLogs.put(updatedOplog);
      });
    }
  }

  // Method to get entries for a specific clientReferenceId and operation type
  Future<List<OpLogEntry<T>>> getEntries(
    String clientReferenceId, // The clientReferenceId to fetch entries for
    DataOperation
        operation, // The operation type (create, update, delete, etc.)
  ) async {
    // Fetch operation logs with the provided clientReferenceId and operation type
    final oplog = await isar.opLogs
        .filter()
        .operationEqualTo(operation)
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    // Throw an exception if no operation logs are found for the given clientReferenceId
    if (oplog.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }

    // Return a list of OpLogEntry objects for the fetched operation logs
    return oplog.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  // Abstract methods that must be implemented by the concrete subclasses
  String? getServerGeneratedId(
    T entity,
  ); // Get the server-generated ID for a data model entity
  String getClientReferenceId(
    T entity,
  ); // Get the clientReferenceId for a data model entity
  T applyServerGeneratedIdToEntity(
    // Apply the server-generated ID to a data model entity
    T entity, // The data model entity
    String serverGeneratedId, // The server-generated ID
  );
}

// Concrete subclass for managing operation logs for the IndividualModel data model
class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);

  // Implementing the abstract method to apply the server-generated ID to an IndividualModel entity
  @override
  IndividualModel applyServerGeneratedIdToEntity(
    IndividualModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  // Implementing the abstract method to get the clientReferenceId from an IndividualModel entity
  @override
  String getClientReferenceId(IndividualModel entity) =>
      entity.clientReferenceId;

  // Implementing the abstract method to get the server-generated ID from an IndividualModel entity
  @override
  String? getServerGeneratedId(IndividualModel entity) => entity.id;
}

// Concrete subclass for managing operation logs for the HouseholdModel data model
class HouseholdOpLogManager extends OpLogManager<HouseholdModel> {
  HouseholdOpLogManager(super.isar);

  // Implementing the abstract method to apply the server-generated ID to a HouseholdModel entity
  @override
  HouseholdModel applyServerGeneratedIdToEntity(
    HouseholdModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  // Implementing the abstract method to get the clientReferenceId from a HouseholdModel entity
  @override
  String getClientReferenceId(HouseholdModel entity) =>
      entity.clientReferenceId;

  // Implementing the abstract method to get the server-generated ID from a HouseholdModel entity
  @override
  String? getServerGeneratedId(HouseholdModel entity) => entity.id;
}

// Concrete subclass for managing operation logs for the FacilityModel data model
class FacilityOpLogManager extends OpLogManager<FacilityModel> {
  FacilityOpLogManager(super.isar);

  // Implementing the abstract method to apply the server-generated ID to a FacilityModel entity
  @override
  FacilityModel applyServerGeneratedIdToEntity(
    FacilityModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  // Implementing the abstract method to get the clientReferenceId from a FacilityModel entity
  @override
  String getClientReferenceId(FacilityModel entity) => entity.id;

  // Implementing the abstract method to get the server-generated ID from a FacilityModel entity
  @override
  String? getServerGeneratedId(FacilityModel entity) => entity.id;
}

// Concrete subclass for managing operation logs for the HouseholdMemberModel data model
class HouseholdMemberOpLogManager extends OpLogManager<HouseholdMemberModel> {
  HouseholdMemberOpLogManager(super.isar);

  // Implementing the abstract method to apply the server-generated ID to a HouseholdMemberModel entity
  @override
  HouseholdMemberModel applyServerGeneratedIdToEntity(
    HouseholdMemberModel entity,
    String serverGeneratedId,
  ) =>
      entity.copyWith(id: serverGeneratedId);

  // Implementing the abstract method to get the clientReferenceId from a HouseholdMemberModel entity
  @override
  String getClientReferenceId(HouseholdMemberModel entity) =>
      entity.clientReferenceId;

  // Implementing the abstract method to get the server-generated ID from a HouseholdMemberModel entity
  @override
  String? getServerGeneratedId(HouseholdMemberModel entity) => entity.id;
}

// ... Additional concrete subclasses for other data models ...

// Model class for updating server-generated IDs
class UpdateServerGeneratedIdModel {
  final String clientReferenceId; // Client reference ID for the operation log
  final String serverGeneratedId; // Updated server-generated ID
  final DataOperation
      dataOperation; // Operation type (create, update, delete, etc.)
  final List<AdditionalId>?
      additionalIds; // Additional IDs associated with the operation log
  final OpLogEntry? entry; // The operation log entry

  // Constructor to initialize the UpdateServerGeneratedIdModel
  const UpdateServerGeneratedIdModel({
    required this.clientReferenceId,
    required this.serverGeneratedId,
    required this.dataOperation,
    this.additionalIds,
    this.entry,
  });
}
