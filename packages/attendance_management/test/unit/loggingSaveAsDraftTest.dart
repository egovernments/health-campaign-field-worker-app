// import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
// import 'package:attendance_management/models/attendance_log.dart';
// import 'package:attendance_management/models/attendee.dart';
// import 'package:attendance_management/models/enum_values.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('AttendanceIndividualBloc', () {
//     test('Save attendance as draft with absent attendees', () {
//       final bloc = AttendanceIndividualBloc();
//       final currentState = AttendanceIndividualState.loaded(
//         attendanceCollectionModel: [
//           AttendeeModel(
//             individualId: '1',
//             registerId: '101',
//             status: 0, // Marked as untapped, basically becomes absent
//           ),
//         ],
//       );

//       final event = AttendanceIndividualEvent.saveAsDraft(
//         entryTime: 1627407600,
//         exitTime: 1627411200,
//         selectedDate: DateTime.now(),
//         isSingleSession: true,
//         createOplog: false,
//         latitude: 123.456,
//         longitude: 789.012,
//       );

//       final attendanceLogsList = [];

//       //lets manually write AttendeeLogs that we want to expect

//       attendanceLogsList.add([
//         AttendanceLogModel(
//           individualId: '1',
//           registerId: '101',
//           status: EnumValues.inactive.toString(),
//           time: 1627407600,
//         ),
//         AttendanceLogModel(
//             individualId: '1',
//             registerId: '101',
//             status: EnumValues.inactive.toString(),
//             time: 1627411200),
//       ]);

//       bloc.emit(currentState);
//       bloc.add(event);

//       //comparing the output we got with actual

//       expect(actual, matcher)
//     });
//   });
// }
