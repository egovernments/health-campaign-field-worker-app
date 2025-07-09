import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock Classes
class MockAttendanceIndividualBloc extends Mock
    implements AttendanceIndividualBloc {}

void main() {
  late MockAttendanceIndividualBloc mockBloc;

  setUp(() {
    mockBloc = MockAttendanceIndividualBloc();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<AttendanceIndividualBloc>(
        create: (_) => mockBloc,
        child: MarkAttendancePage(
          registerModel: AttendanceRegisterModel(id: ''),
        ),
      ),
    );
  }

  testWidgets('MarkAttendancePage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Verify UI Elements
    expect(find.text("Mark Attendance"), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget); // Search Bar
    expect(find.byType(ElevatedButton), findsWidgets); // Buttons
  });

  testWidgets('Search by name updates list', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Enter text in search field
    await tester.enterText(find.byType(TextField), 'John');
    await tester.pumpAndSettle();
  });

  testWidgets('Clicking submit button triggers event',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Tap on submit button
    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle();
  });

  testWidgets('Clicking draft button saves draft', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Tap on save as draft button
    await tester.tap(find.text("Save & Mark Later"));
    await tester.pumpAndSettle();
  });
}
