import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_register.dart';

import '../data/data_repository.dart';
import '../models/data_model.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final LocalRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>?
      attendanceLocalRepository;
  final LocalRepository<IndividualModel, IndividualSearchModel>?
      individualLocalRepository;
  final LocalRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>?
  attendanceLogLocalRepository;
  final String? userId;
  HCMAttendanceBloc({
    this.attendanceLocalRepository,
    this.individualLocalRepository,
    this.attendanceLogLocalRepository,
    this.userId,
  });

  late Function(List<AttendancePackageRegisterModel> registers)
      _registersLoaded;
  // late SearchAttendanceLog _attendeesLoaded;

  @override
  void getAttendanceRegisters(
    Function(List<AttendancePackageRegisterModel> registers)
        attendanceRegisters,
  ) {
    _registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded() async {
    final registers = await attendanceLocalRepository?.search(
      HCMAttendanceSearchModel(staffId: userId),
    );

    if (registers != null) {
      final List<AttendancePackageRegisterModel> attendanceRegisters =
          await Future.wait(registers.map((e) async {
        final individualList = await individualLocalRepository?.search(
          IndividualSearchModel(
            id: e.attendanceRegister.attendees!
                .map((a) => a.individualId!)
                .toList(),
          ),
        );
        final attendeeList = e.attendanceRegister.attendees
            ?.map(
              (a) => a.copyWith(
                name: individualList
                    ?.where((i) => i.id == a.individualId)
                    .first
                    .name
                    ?.givenName,
                individualNumber: individualList
                    ?.where((i) => i.id == a.individualId)
                    .first
                    .individualId,
              ),
            )
            .toList();

        return e.attendanceRegister.copyWith(attendees: attendeeList);
      }));

      _registersLoaded(
        attendanceRegisters,
      );
    } else {
      _registersLoaded(
        [],
      );
    }
  }

  @override
  void searchAttendanceLog(
      SearchAttendanceLog individualAttendanceLogSearch) async {}
  //   // TODO: implement searchAttendanceLog
  //   _attendeesLoaded = individualAttendanceLogSearch;
  //   final registers = await attendanceLocalRepository?.search(
  //     HCMAttendanceSearchModel(staffId: userId, id: individualAttendanceLogSearch.registerId),
  //   );
  //   if (registers != null) {
  //     final List<AttendancePackageRegisterModel> attendanceRegisters =
  //     await Future.wait(registers.map((e) async {
  //       final individualList = await individualLocalRepository?.search(
  //         IndividualSearchModel(
  //           id: e.attendanceRegister.attendees!
  //               .map((a) => a.individualId!)
  //               .toList(),
  //         ),
  //       );
  //       final attendeeList = e.attendanceRegister.attendees
  //           ?.map(
  //             (a) => a.copyWith(
  //           name: individualList
  //               ?.where((i) => i.id == a.individualId)
  //               .first
  //               .name
  //               ?.givenName,
  //           individualNumber: individualList
  //               ?.where((i) => i.id == a.individualId)
  //               .first
  //               .individualId,
  //         ),
  //       )
  //           .toList();
  //
  //       return e.attendanceRegister.copyWith(attendees: attendeeList);
  //     }));
  //
  //     _registersLoaded(
  //       attendanceRegisters,
  //     );
  //   }
  //   onAttendeesLoaded();
  // }
  //
  // void onAttendeesLoaded() async {
  //   final registers = await attendanceLocalRepository?.search(
  //     HCMAttendanceSearchModel(staffId: userId, id: ),
  //   );
  //
  //   if (registers != null) {
  //     final List<AttendancePackageRegisterModel> attendanceRegisters =
  //         await Future.wait(registers.map((e) async {
  //       final individualList = await individualLocalRepository?.search(
  //         IndividualSearchModel(
  //           id: e.attendanceRegister.attendees!
  //               .map((a) => a.individualId!)
  //               .toList(),
  //         ),
  //       );
  //       final attendeeList = e.attendanceRegister.attendees
  //           ?.map(
  //             (a) => a.copyWith(
  //               name: individualList
  //                   ?.where((i) => i.id == a.individualId)
  //                   .first
  //                   .name
  //                   ?.givenName,
  //               individualNumber: individualList
  //                   ?.where((i) => i.id == a.individualId)
  //                   .first
  //                   .individualId,
  //             ),
  //           )
  //           .toList();
  //
  //       return e.attendanceRegister.copyWith(attendees: attendeeList);
  //     }));
  //
  //     _registersLoaded(
  //       attendanceRegisters,
  //     );
  //   } else {
  //     _registersLoaded(
  //       [],
  //     );
  //   }
  // }

  @override
  void markIndividualAttendance(
    MarkIndividualAttendance markIndividualAttendance,
  ) {
    // TODO: implement markIndividualAttendance
  }

  @override
  void submitAttendanceDetails(SubmitAttendanceDetails submittedAttendance) {
    // TODO: implement submitAttendanceDetails
    final hcmAttendanceLogs = submittedAttendance.attendanceLogs.map((e) =>
        HCMAttendanceLogModel(
          registerId: e.registerId,
          individualId: e.individualId,
          type: e.type,
          time: e

        )).toList();
  }
}
