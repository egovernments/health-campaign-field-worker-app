import 'package:digit_data_model/data/local_store/sql_store/tables/address.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/project.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
import 'package:health_campaign_field_worker_app/blocs/project/project.dart';
import 'package:health_campaign_field_worker_app/pages/project_selection.dart';
import 'package:health_campaign_field_worker_app/router/app_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

// Import your project files.

// Fake classes for events and states
class FakeProjectEvent extends Fake implements ProjectEvent {}

class FakeProjectState extends Fake implements ProjectState {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

class FakeLocationEvent extends Fake implements LocationEvent {}

class FakeLocationState extends Fake implements LocationState {}

// Create mocks with MockBloc from bloc_test
class MockProjectBloc extends MockBloc<ProjectEvent, ProjectState>
    implements ProjectBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockLocationBloc extends MockBloc<LocationEvent, LocationState>
    implements LocationBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockProjectBloc mockProjectBloc;
  late MockAuthBloc mockAuthBloc;
  late MockLocationBloc mockLocationBloc;

  setUpAll(() {
    registerFallbackValue(FakeProjectEvent());
    registerFallbackValue(FakeProjectState());
    registerFallbackValue(FakeAuthEvent());
    registerFallbackValue(FakeAuthState());
    registerFallbackValue(FakeLocationEvent());
    registerFallbackValue(FakeLocationState());
  });

  setUp(() {
    mockProjectBloc = MockProjectBloc();
    mockAuthBloc = MockAuthBloc();
    mockLocationBloc = MockLocationBloc();

    when(() => mockProjectBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockAuthBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockLocationBloc.stream).thenAnswer((_) => const Stream.empty());

    // Set an initial loading state
    when(() => mockProjectBloc.state).thenReturn(
      const ProjectState(
        projects: [],
        loading: true,
      ),
    );
    when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
    when(() => mockLocationBloc.state).thenReturn(const LocationState());
  });

  group('Project Selection Flow', () {
    testWidgets('Displays loading indicator during loading state',
        (WidgetTester tester) async {
      when(() => mockProjectBloc.state).thenReturn(
        const ProjectState(
          projects: [],
          loading: true,
        ),
      );

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
            BlocProvider<AuthBloc>.value(value: mockAuthBloc),
            BlocProvider<LocationBloc>.value(value: mockLocationBloc),
          ],
          child: const MaterialApp(
            home: ProjectSelectionPage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    // testWidgets('Displays list of projects when projects are loaded',
    //     (WidgetTester tester) async {
    //   final projects = [
    //     ProjectModel(
    //         name: 'Project One',
    //         address: AddressModel(boundary: 'boundary1'),
    //         id: '1'),
    //     ProjectModel(
    //         name: 'Project Two',
    //         address: AddressModel(boundary: 'boundary2'),
    //         id: '2'),
    //   ];
    //
    //   when(() => mockProjectBloc.state).thenReturn(ProjectState(
    //     projects: projects,
    //     selectedProject: null,
    //     syncError: null,
    //     loading: false,
    //   ));
    //
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
    //         BlocProvider<AuthBloc>.value(value: mockAuthBloc),
    //         BlocProvider<LocationBloc>.value(value: mockLocationBloc),
    //       ],
    //       child: const MaterialApp(
    //         home: ProjectSelectionPage(),
    //       ),
    //     ),
    //   );
    //
    //   expect(find.byType(MenuCard), findsNWidgets(projects.length));
    // });
    //
    // testWidgets(
    //     'Handles project selection and navigates when project has boundary',
    //     (WidgetTester tester) async {
    //   final project = ProjectModel(
    //       name: 'Project One',
    //       address: AddressModel(boundary: 'boundary1'),
    //       id: '1');
    //
    //   when(() => mockProjectBloc.state).thenReturn(ProjectState(
    //     projects: [project],
    //     selectedProject: project,
    //     syncError: null,
    //     loading: false,
    //   ));
    //
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
    //         BlocProvider<AuthBloc>.value(value: mockAuthBloc),
    //         BlocProvider<LocationBloc>.value(value: mockLocationBloc),
    //       ],
    //       child: const MaterialApp(
    //         home: ProjectSelectionPage(),
    //       ),
    //     ),
    //   );
    //
    //   // Simulate tapping on the project.
    //   await tester.tap(find.byType(MenuCard).first);
    //   await tester.pumpAndSettle();
    //
    //   // Verify navigation. (Adjust based on your navigation logic.)
    //   expect(find.byType(HomeRoute), findsOneWidget);
    // });
    //
    // testWidgets('Handles sync error with retry dialog',
    //     (WidgetTester tester) async {
    //   final project = ProjectModel(
    //       name: 'Project One',
    //       address: AddressModel(boundary: 'boundary1'),
    //       id: '1');
    //
    //   when(() => mockProjectBloc.state).thenReturn(ProjectState(
    //     projects: [project],
    //     syncError: ProjectSyncErrorType.project,
    //     selectedProject: project,
    //     loading: false,
    //   ));
    //
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
    //         BlocProvider<AuthBloc>.value(value: mockAuthBloc),
    //         BlocProvider<LocationBloc>.value(value: mockLocationBloc),
    //       ],
    //       child: const MaterialApp(
    //         home: ProjectSelectionPage(),
    //       ),
    //     ),
    //   );
    //
    //   await tester.pumpAndSettle();
    //
    //   expect(find.text('Sync Failed'), findsOneWidget);
    //
    //   await tester.tap(find.text('Retry'));
    //   await tester.pumpAndSettle();
    //
    //   verify(() => mockProjectBloc.add(any())).called(greaterThan(0));
    // });
    //
    // testWidgets('Displays no projects assigned message and triggers logout',
    //     (WidgetTester tester) async {
    //   when(() => mockProjectBloc.state).thenReturn(const ProjectState(
    //     projects: [],
    //     syncError: null,
    //     selectedProject: null,
    //     loading: false,
    //   ));
    //
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
    //         BlocProvider<AuthBloc>.value(value: mockAuthBloc),
    //         BlocProvider<LocationBloc>.value(value: mockLocationBloc),
    //       ],
    //       child: const MaterialApp(
    //         home: ProjectSelectionPage(),
    //       ),
    //     ),
    //   );
    //
    //   expect(find.text('No projects assigned'), findsOneWidget);
    //
    //   await tester.tap(find.byType(DigitButton));
    //   await tester.pumpAndSettle();
    //
    //   verify(() => mockAuthBloc.add(const AuthLogoutEvent())).called(1);
    // });
  });
}
