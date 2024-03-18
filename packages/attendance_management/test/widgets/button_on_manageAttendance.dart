// import 'package:attendance_management/attendance_management.dart';
// import 'package:attendance_management/blocs/attendance_bloc.dart';
// import 'package:attendance_management/blocs/attendance_listeners.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:attendance_management/pages/manage_attendance.dart';

// // Create a mock for the AttendanceBloc
// class MockAttendanceBloc extends MockBloc<AttendanceEvents, AttendanceStates>
//     implements AttendanceBloc {}

// class MockAttendanceListeners extends Mock implements AttendanceListeners {}

// void main() {
//   group('ManageAttendancePage', () {
//     late MockAttendanceBloc mockAttendanceBloc;

//     setUp(() {
//       mockAttendanceBloc = MockAttendanceBloc();
//     });

//     final register = [AttendanceRegisterModel(id: '1')];

//     testWidgets('Pressing Open Register navigates to MarkAttendancePage',
//         (WidgetTester tester) async {
//       // Build the ManageAttendancePage widget with the mock bloc
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//               body: RegisterCard(
//                   data: {},
//                   attendanceBloc: mockAttendanceBloc,
//                   tenantId: '',
//                   registerId: '',
//                   registers: [])),
//         ),
//       );

//       //changing state
//       mockAttendanceBloc.add(AttendanceEvents.initial());

//       await tester.pump(const Duration(milliseconds: 1000));

//       // Verify that the ElevatedButton is initially present
//       expect(find.byType(DigitElevatedButton), findsOneWidget);
//       // expect(find.by, findsOneWidget);

//       await tester.pumpAndSettle();

//       // Mock the navigation to MarkAttendancePage when Open Register is pressed
//       // when(mockAttendanceBloc.add(any)).thenAnswer((_) => Future.value(null));

//       // // Tap the ElevatedButton to trigger navigation
//       // await tester.tap(find.byType(ElevatedButton));

//       // // Wait for the Navigator to complete the push operation
//       // await tester.pumpAndSettle();

//       // // Verify that the navigation occurred by checking the pushed route
//       // expect(find.byType(MarkAttendancePage), findsOneWidget);
//     });
//   });
// }
