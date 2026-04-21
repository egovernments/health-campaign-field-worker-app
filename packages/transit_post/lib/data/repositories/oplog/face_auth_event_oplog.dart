import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:isar/isar.dart';

class FaceAuthEventOpLogManager extends OpLogManager<FaceAuthEventModel> {
  FaceAuthEventOpLogManager(super.isar);

  @override
  FaceAuthEventModel applyServerGeneratedIdToEntity(
    FaceAuthEventModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(FaceAuthEventModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(FaceAuthEventModel entity) {
    return entity.id;
  }

  @override
  int? getRowVersion(FaceAuthEventModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(FaceAuthEventModel entity) =>
      entity.nonRecoverableError;

  @override
  Future<List<OpLogEntry<FaceAuthEventModel>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final createEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final updateEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final allEntries = [...createEntries, ...updateEntries];

    final entriesList = allEntries.map((e) {
      return OpLogEntry.fromOpLog<FaceAuthEventModel>(e);
    }).toList();

    return entriesList;
  }
}
