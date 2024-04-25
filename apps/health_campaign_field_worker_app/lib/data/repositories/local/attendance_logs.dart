// import 'dart:async';
// import 'dart:convert';
//
// import 'package:attendance_management/models/attendance_log.dart';
// import 'package:collection/collection.dart';
// import 'package:digit_data_model/data_model.dart';
// import 'package:digit_data_model/models/oplog/oplog_entry.dart';
// import 'package:drift/drift.dart';
//
// import '../../../models/entities/hcm_attendance_log_model.dart';
// import '../../../utils/utils.dart';
// import '../../local_store/sql_store/sql_store.dart';
//
// class AttendanceLogsLocalRepository extends LocalRepository<
//     HCMAttendanceLogModel, HCMAttendanceLogSearchModel> {
//   final LocalSqlDataStore hcmSqlDataStore;
//
//   AttendanceLogsLocalRepository(
//       super.sql, super.opLogManager, this.hcmSqlDataStore);
//
//   @override
//   FutureOr<List<HCMAttendanceLogModel>> search(
//     HCMAttendanceLogSearchModel query, [
//     String? userId,
//   ]) async {
//     final selectQuery = sql.select(hcmSqlDataStore.attendance).join([]);
//
//     final results = await (selectQuery
//           ..where(buildAnd([
//             if (query.individualId != null)
//               hcmSqlDataStore.attendance.individualId.equals(
//                 query.individualId!,
//               ),
//             if (query.registerId != null)
//               hcmSqlDataStore.attendance.registerId.equals(
//                 query.registerId!,
//               ),
//             if (query.uploadToServer != null)
//               hcmSqlDataStore.attendance.uploadToServer.equals(
//                 query.uploadToServer!,
//               ),
//           ])))
//         .get();
//
//     return results
//         .map((e) {
//           final attendeeLog = e.readTableOrNull(hcmSqlDataStore.attendance);
//           if (attendeeLog == null) return null;
//
//           return HCMAttendanceLogModel(
//             attendance: AttendanceLogModel(
//               id: attendeeLog.id,
//               registerId: attendeeLog.registerId,
//               individualId: attendeeLog.individualId,
//               status: attendeeLog.status,
//               clientReferenceId: attendeeLog.clientReferenceId,
//               time: attendeeLog.time,
//               type: attendeeLog.type,
//               uploadToServer: attendeeLog.uploadToServer,
//               additionalDetails:
//                   jsonDecode(attendeeLog.additionalFields.toString()),
//             ),
//             auditDetails: AuditDetails(
//               createdTime: attendeeLog.auditCreatedTime!,
//               createdBy: attendeeLog.auditCreatedBy!,
//               lastModifiedBy: attendeeLog.auditModifiedBy,
//               lastModifiedTime: attendeeLog.auditModifiedTime,
//             ),
//             clientAuditDetails: ClientAuditDetails(
//               createdTime: attendeeLog.clientCreatedTime!,
//               createdBy: attendeeLog.clientCreatedBy!,
//               lastModifiedBy: attendeeLog.clientModifiedBy,
//               lastModifiedTime: attendeeLog.clientModifiedTime,
//             ),
//           );
//         })
//         .whereNotNull()
//         .where((element) => element.isDeleted != true)
//         .toList();
//   }
//
//   @override
//   FutureOr<void> create(
//     HCMAttendanceLogModel entity, {
//     bool createOpLog = false,
//     DataOperation dataOperation = DataOperation.create,
//   }) async {
//     final logCompanion = entity.companion;
//
//     await sql.batch((batch) async {
//       batch.insert(
//         hcmSqlDataStore.attendance,
//         logCompanion,
//         mode: InsertMode.insertOrReplace,
//       );
//     });
//
//     await super.create(entity, createOpLog: createOpLog);
//   }
//
//   @override
//   FutureOr<void> bulkCreate(
//     List<HCMAttendanceLogModel> entities,
//   ) async {
//     final logsCompanions = entities
//         .map((e) => e.companion.copyWith(
//               uploadToServer: const Value(true),
//             ))
//         .toList();
//
//     await sql.batch((batch) async {
//       batch.insertAll(
//         hcmSqlDataStore.attendance,
//         logsCompanions,
//         mode: InsertMode.insertOrReplace,
//       );
//     });
//   }
//
//   @override
//   DataModelType get type => DataModelType.attendance;
// }
