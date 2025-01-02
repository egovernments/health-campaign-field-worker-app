import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';

import '../../../models/pgr_complaints.dart';

class PgrServiceOpLogManager extends OpLogManager<PgrServiceModel> {
  PgrServiceOpLogManager(super.isar);

  @override
  PgrServiceModel applyServerGeneratedIdToEntity(
    PgrServiceModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        serviceRequestId: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(PgrServiceModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(PgrServiceModel entity) {
    return entity.serviceRequestId;
  }

  @override
  int? getRowVersion(PgrServiceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(PgrServiceModel entity) =>
      entity.nonRecoverableError;

  @override
  Future<List<OpLogEntry<PgrServiceModel>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final pendingEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final entriesList = pendingEntries.map((e) {
      return OpLogEntry.fromOpLog<PgrServiceModel>(e);
    }).toList();

    return entriesList;
  }

//Note: PendingDownSync is not required for PGR Create Oplogs. This creates Mapper Exception issue for checking pending downsync entries of complaints type
// @override
// Future<List<OpLogEntry<PgrServiceModel>>> getPendingDownSync(
//     DataModelType type, {
//       required String createdBy,
//     }) async {
//   final pendingEntries = await isar.opLogs
//       .filter()
//       .entityTypeEqualTo(type)
//       .serverGeneratedIdIsNotNull()
//       .syncedUpEqualTo(true)
//       .syncedDownEqualTo(false)
//       .createdByEqualTo(createdBy)
//       .sortByCreatedAt()
//       .findAll();
//
//   final entriesList = pendingEntries
//       .map((e) {
//     final entity = e.getEntity<PgrServiceModel>();
//     if ([
//       PgrServiceApplicationStatus.created,
//       PgrServiceApplicationStatus.pendingAssignment,
//     ].contains(entity.applicationStatus)) {
//       return OpLogEntry.fromOpLog<PgrServiceModel>(e);
//     }
//
//     return null;
//   })
//       .whereNotNull()
//       .toList();
//
//   return entriesList;
// }
}
