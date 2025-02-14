import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:drift/drift.dart';

// This will create , update and search data from local Repository
class UserActionLocalRepository
    extends LocalRepository<UserActionModel, UserActionSearchModel> {
  UserActionLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    UserActionModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.batch((batch) {
        batch.insert(
          sql.userAction,
          entity.companion,
          mode: InsertMode.insertOrReplace,
        );
      });

      return super.create(
        entity,
        createOpLog: createOpLog,
        dataOperation: dataOperation,
      );
    });
  }

  FutureOr<int> fetchCount(
    String? userId, {
    UserActionSearchModel? query,
  }) async {
    return retryLocalCallOperation<int>(() async {
      final selectQuery = sql.selectOnly(sql.userAction)
        ..addColumns(
            [sql.userAction.clientReferenceId.count()]); // Count all records

      // Build conditions dynamically
      final conditions = <Expression<bool>>[];

      if (userId != null) {
        conditions.add(sql.userAction.clientCreatedBy.equalsNullable(userId));
      }

      if (query?.auditDetails?.createdTime != null) {
        DateTime createdDate;

        // Convert epoch (milliseconds) to DateTime
        createdDate = DateTime.fromMillisecondsSinceEpoch(
            query?.auditDetails!.createdTime as int);

        // Get start & end of the day in epoch (milliseconds)
        int startOfDayEpoch =
            DateTime(createdDate.year, createdDate.month, createdDate.day)
                .millisecondsSinceEpoch;
        int endOfDayEpoch = DateTime(createdDate.year, createdDate.month,
                createdDate.day, 23, 59, 59)
            .millisecondsSinceEpoch;

        // Add condition to filter records between start and end of the day
        conditions.add(sql.userAction.clientCreatedTime
            .isBetweenValues(startOfDayEpoch, endOfDayEpoch));
      }

      // Apply conditions using buildAnd()
      if (conditions.isNotEmpty) {
        selectQuery.where(buildAnd(conditions));
      }

      final result = await selectQuery.getSingleOrNull(); // Fetch the count

      return (result?.read(sql.userAction.clientReferenceId.count()) ??
          0); // Return count or 0
    });
  }

  @override
  DataModelType get type => DataModelType.userAction;

  @override
  FutureOr<List<UserActionModel>> search(UserActionSearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
