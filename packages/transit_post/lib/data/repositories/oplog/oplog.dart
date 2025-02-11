import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:isar/isar.dart';

class UserActionOpLogManager extends OpLogManager<UserActionModel> {
  UserActionOpLogManager(super.isar);

  @override
  UserActionModel applyServerGeneratedIdToEntity(
    UserActionModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(UserActionModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(UserActionModel entity) {
    return "";
  }

  @override
  int? getRowVersion(UserActionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(UserActionModel entity) =>
      entity.nonRecoverableError;

  // @override
  // Future<List<OpLogEntry<UserActionModel>>> getPendingUpSync(
  //   DataModelType type, {
  //   required String createdBy,
  // }) async {
  //   final pendingEntries = await isar.opLogs
  //       .filter()
  //       .entityTypeEqualTo(type)
  //       .operationEqualTo(DataOperation.create)
  //       .syncedUpEqualTo(false)
  //       .syncedDownEqualTo(false)
  //       .sortByCreatedAt()
  //       .findAll();
  //
  //   final entriesList = pendingEntries.map((e) {
  //     return OpLogEntry.fromOpLog<UserActionModel>(e);
  //   }).toList();
  //
  //   return entriesList;
  // }
}
