// import 'dart:async';
// import 'dart:convert';
//
// import 'package:attendance_management/attendance_management.dart';
// import 'package:attendance_management/models/attendance_audit.dart';
// import 'package:collection/collection.dart';
// import 'package:digit_data_model/data_model.dart';
// import 'package:digit_data_model/models/oplog/oplog_entry.dart';
// import 'package:drift/drift.dart';
//
// import '../../../models/data_model.dart';
// import '../../../models/entities/hcm_attendance_model.dart';
// import '../../../utils/utils.dart';
// import '../../data_repository.dart';
// import '../../local_store/sql_store/sql_store.dart';
//
// class AttendanceLocalRepository extends LocalRepository<
//     HCMAttendanceRegisterModel, HCMAttendanceSearchModel> {
//   final LocalSqlDataStore hcmSqlDataStore;
//
//   AttendanceLocalRepository(super.sql, super.opLogManager, this.hcmSqlDataStore);
//
//   @override
//   FutureOr<List<HCMAttendanceRegisterModel>> search(
//     HCMAttendanceSearchModel query, [
//     String? userId,
//   ]) async {
//     final selectQuery = sql.select(hcmSqlDataStore.attendanceRegister).join([
//       leftOuterJoin(
//         hcmSqlDataStore.staff,
//         hcmSqlDataStore.staff.registerId.equalsExp(
//           hcmSqlDataStore.attendanceRegister.id,
//         ),
//       ),
//       leftOuterJoin(
//         hcmSqlDataStore.attendee,
//         hcmSqlDataStore.attendee.registerId.equalsExp(
//           hcmSqlDataStore.attendanceRegister.id,
//         ),
//       ),
//     ]);
//
//     final results = await (selectQuery
//           ..where(buildAnd([
//             if (query.id != null)
//               hcmSqlDataStore.attendanceRegister.id.equals(
//                 query.id!,
//               ),
//             if (query.staffId != null)
//               hcmSqlDataStore.attendanceRegister.id.equalsExp(
//                 hcmSqlDataStore.staff.registerId,
//               ),
//             if (query.referenceId != null)
//               hcmSqlDataStore.attendanceRegister.referenceId.equals(
//                 query.referenceId!,
//               ),
//           ])))
//         .get();
//
//     final registerMap = <String, HCMAttendanceRegisterModel>{};
//
//     for (final e in results) {
//       final register = e.readTableOrNull(hcmSqlDataStore.attendanceRegister);
//       final staffs = e.readTableOrNull(hcmSqlDataStore.staff);
//       final attendees = e.readTableOrNull(hcmSqlDataStore.attendee);
//       if (register == null) continue;
//
//       if (registerMap.containsKey(register.id)) {
//         registerMap[register.id]!.attendanceRegister.attendees?.add(
//               AttendeeModel(
//                 id: attendees?.id.toString(),
//                 registerId: attendees?.registerId,
//                 tenantId: attendees?.tenantId,
//                 individualId: attendees?.individualId,
//                 enrollmentDate: attendees?.enrollmentDate,
//                 denrollmentDate: attendees?.denrollmentDate,
//               ),
//             );
//
//         registerMap[register.id]!.attendanceRegister.staff?.add(
//               StaffModel(
//                 id: staffs?.id,
//                 registerId: staffs?.registerId,
//                 tenantId: register.tenantId,
//                 userId: staffs?.userId,
//                 enrollmentDate: staffs?.enrollmentDate,
//                 denrollmentDate: staffs?.denrollmentDate,
//               ),
//             );
//       } else {
//         registerMap[register.id.toString()] = HCMAttendanceRegisterModel(
//           attendanceRegister: AttendanceRegisterModel(
//             id: register.id.toString(),
//             attendees: attendees == null
//                 ? null
//                 : [
//                     AttendeeModel(
//                       id: attendees.id.toString(),
//                       registerId: attendees.registerId,
//                       tenantId: attendees.tenantId,
//                       individualId: attendees.individualId,
//                       enrollmentDate: attendees.enrollmentDate,
//                       denrollmentDate: attendees.denrollmentDate,
//                     ),
//                   ],
//             staff: staffs == null
//                 ? null
//                 : [
//                     StaffModel(
//                       id: staffs.id,
//                       registerId: staffs.registerId,
//                       tenantId: register.tenantId,
//                       userId: staffs.userId,
//                       enrollmentDate: staffs.enrollmentDate,
//                       denrollmentDate: staffs.denrollmentDate,
//                     ),
//                   ],
//             name: register.name,
//             registerNumber: register.registerNumber,
//             tenantId: register.tenantId,
//             referenceId: register.referenceId,
//             serviceCode: register.serviceCode,
//             status: register.status,
//             startDate: register.startDate,
//             endDate: register.endDate,
//             additionalDetails: jsonDecode(register.additionalFields.toString()),
//             auditDetails: AttendanceAuditDetails(
//               createdBy: register.auditCreatedBy ?? '',
//               createdTime: register.auditCreatedTime ?? 0,
//             ),
//           ),
//         );
//       }
//     }
//     final uniqueTasks = registerMap.values.toList();
//
//     return uniqueTasks.where((element) => element.isDeleted != true).toList();
//   }
//
//   @override
//   FutureOr<void> create(
//     HCMAttendanceRegisterModel entity, {
//     bool createOpLog = true,
//     DataOperation dataOperation = DataOperation.create,
//   }) async {
//     final referralCompanion = entity.companion;
//     await sql.batch((batch) async {
//       batch.insert(hcmSqlDataStore.attendanceRegister, referralCompanion);
//       await super.create(entity, createOpLog: createOpLog);
//     });
//   }
//
//   @override
//   FutureOr<void> bulkCreate(
//     List<HCMAttendanceRegisterModel> entities,
//   ) async {
//     final registerCompanions = entities.map((e) => e.companion).toList();
//
//     final staffList = entities
//         .map((e) => e.attendanceRegister.staff?.map((a) {
//               return StaffCompanion(
//                 id: Value(a.id),
//                 tenantId: Value(a.tenantId.toString()),
//                 userId: Value(a.userId.toString()),
//                 registerId: Value(a.registerId.toString()),
//                 enrollmentDate: Value(a.enrollmentDate),
//                 denrollmentDate: Value(a.denrollmentDate),
//               );
//             }).toList())
//         .toList();
//
//     final staffCompanions = staffList.expand((e) => [e?[0]]).toList();
//
//     final attendeeList = entities
//         .map((e) => e.attendanceRegister.attendees?.map((a) {
//               return AttendeeCompanion(
//                 id: Value(a.id),
//                 individualId: Value(a.individualId.toString()),
//                 tenantId: Value(a.tenantId.toString()),
//                 registerId: Value(a.registerId.toString()),
//                 enrollmentDate: Value(a.enrollmentDate),
//                 denrollmentDate: Value(a.denrollmentDate),
//               );
//             }).toList())
//         .toList();
//
//     final attendeeCompanions = attendeeList
//         .expand((e) => e ?? [])
//         .cast<Insertable<AttendeeData>>()
//         .toList();
//
//     await sql.batch((batch) async {
//       batch.insertAll(
//         hcmSqlDataStore.attendanceRegister,
//         registerCompanions,
//         mode: InsertMode.insertOrReplace,
//       );
//
//       if (staffCompanions.isNotEmpty) {
//         batch.insertAll(
//           hcmSqlDataStore.staff,
//           staffCompanions.whereNotNull().toList(),
//           mode: InsertMode.insertOrReplace,
//         );
//       }
//
//       if (attendeeCompanions.isNotEmpty) {
//         batch.insertAll(
//           hcmSqlDataStore.attendee,
//           attendeeCompanions,
//           mode: InsertMode.insertOrReplace,
//         );
//       }
//     });
//   }
//
//   @override
//   DataModelType get type => DataModelType.attendanceRegister;
// }
