import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_data_model/models/entities/project.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localizations_delegate.dart';
import 'package:health_campaign_field_worker_app/blocs/project/project.dart';
import 'package:health_campaign_field_worker_app/data/local_store/no_sql/schema/app_configuration.dart';
import 'package:health_campaign_field_worker_app/models/auth/auth_model.dart';
import 'package:health_campaign_field_worker_app/models/role_actions/role_actions_model.dart';
import 'package:health_campaign_field_worker_app/pages/project_selection.dart';
import 'package:health_campaign_field_worker_app/utils/constants.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

// ------------------------
// Fake classes for events and states
// ------------------------
class FakeProjectEvent extends Fake implements ProjectEvent {}

class FakeProjectState extends Fake implements ProjectState {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

class FakeLocationEvent extends Fake implements LocationEvent {}

class FakeLocationState extends Fake implements LocationState {}

// ------------------------
// Create mocks using MockBloc
// ------------------------
class MockProjectBloc extends MockBloc<ProjectEvent, ProjectState>
    implements ProjectBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockLocationBloc extends MockBloc<LocationEvent, LocationState>
    implements LocationBloc {}

// ------------------------
// Instead of using a mock for LocalSqlDataStore,
// we create a Fake that extends your concrete LocalSqlDataStore.
// This ensures the argument type matches exactly.
class FakeLocalSqlDataStore extends LocalSqlDataStore {
  FakeLocalSqlDataStore() : super();

  @override
  Future<List<QueryRow>> customQuery(String sql) async => [];
}

// ------------------------
// Create a mock configuration for localization.
// Note: Ensure property names (like 'config') match the production code.
class MockAppConfiguration extends Mock implements AppConfiguration {
  @override
  List<Languages>? get languages => [
        Languages()
          ..label = 'English'
          ..value = 'en_US'
      ];

  @override
  BackendInterface? get backendInterface => BackendInterface()
    ..interfaces = [
      Interfaces()
        ..type = Modules.localizationModule
        ..name = 'localization_service'
        ..confg =
            (Config()..localStoreTTL = 3600) // Fixed typo: 'confg' -> 'config'
    ];
}

// ------------------------
// For AutoRouter to work in tests, we create a fake StackRouter.
// class FakeStackRouter extends Fake implements StackRouter {}

// ------------------------
// Create a FakeStackRouter to satisfy AutoRouter lookups.
// Note: We correctly override canPop using named parameters.
class FakeStackRouter extends Fake implements StackRouter {
  @override
  bool canPop({
    bool ignoreChildRoutes = false,
    bool ignorePagelessRoutes = false,
    bool ignoreParentRoutes = false,
  }) =>
      false;

  // Correct override: pop returns a Future<bool>
  @override
  Future<bool> pop<T extends Object?>([T? result]) async {
    return false;
  }

  // Correct override: push returns Future<T?> with proper signature.
  @override
  Future<T?> push<T extends Object?>(PageRouteInfo<dynamic> route,
      {void Function(NavigationFailure)? onFailure}) async {
    return null;
  }
}

/// ------------------------
/// Dummy classes for required models in AuthState.
class DummyUserRequestModel extends Fake implements UserRequestModel {}

class DummyRoleActionsWrapperModel extends Fake
    implements RoleActionsWrapperModel {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockProjectBloc mockProjectBloc;
  late MockAuthBloc mockAuthBloc;
  late MockLocationBloc mockLocationBloc;
  late FakeLocalSqlDataStore fakeSqlStore;
  late MockAppConfiguration mockConfig;
  late FakeStackRouter fakeStackRouter;

  setUpAll(() {
    registerFallbackValue(FakeProjectEvent());
    registerFallbackValue(FakeProjectState());
    registerFallbackValue(FakeAuthEvent());
    registerFallbackValue(FakeAuthState());
    registerFallbackValue(FakeLocationEvent());
    registerFallbackValue(FakeLocationState());
    // Register fallbacks for custom types used in the SQL store.
    registerFallbackValue(Config());
    registerFallbackValue(BackendInterface());
    registerFallbackValue(Interfaces());
    registerFallbackValue(Languages());
    registerFallbackValue(DummyUserRequestModel());
    registerFallbackValue(DummyRoleActionsWrapperModel());
    // Create the singleton FakeLocalSqlDataStore.
    fakeSqlStore = FakeLocalSqlDataStore();
  });

  setUp(() {
    mockProjectBloc = MockProjectBloc();
    mockAuthBloc = MockAuthBloc();
    mockLocationBloc = MockLocationBloc();
    fakeSqlStore = FakeLocalSqlDataStore();
    mockConfig = MockAppConfiguration();
    fakeStackRouter = FakeStackRouter();
  });

  group('Project Selection Flow Integration Test', () {
    testWidgets('Displays no projects message when project list is empty',
        (WidgetTester tester) async {
      // Set state: not loading, project list empty, and Auth state authenticated.
      when(() => mockProjectBloc.state)
          .thenReturn(const ProjectState(projects: [], loading: false));
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.authenticated(
          accessToken: 'dummyAccessToken',
          refreshToken: 'dummyRefreshToken',
          userModel: DummyUserRequestModel(),
          actionsWrapper: DummyRoleActionsWrapperModel(),
        ),
      );
      when(() => mockLocationBloc.state).thenReturn(const LocationState());

      await tester.pumpWidget(
        StackRouterScope(
          controller: fakeStackRouter,
          stateHash: 1,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
              BlocProvider<AuthBloc>.value(value: mockAuthBloc),
              BlocProvider<LocationBloc>.value(value: mockLocationBloc),
            ],
            child: MaterialApp(
              localizationsDelegates: [
                AppLocalizationsDelegate(mockConfig, fakeSqlStore),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en', 'US')],
              home: const ProjectSelectionPage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(const Key('no_projects_assigned')),
          findsOneWidget);
    });

    testWidgets('Displays project list when projects are available and handles tap',
            (WidgetTester tester) async {
          // Create a dummy project.
          final dummyProject = ProjectModel(name: 'Test Project', id: '1');
          // Set state: not loading with one project available.
          when(() => mockProjectBloc.state)
              .thenReturn(ProjectState(projects: [dummyProject], loading: false));
          when(() => mockAuthBloc.state).thenReturn(
            AuthState.authenticated(
              accessToken: 'dummyAccessToken',
              refreshToken: 'dummyRefreshToken',
              userModel: DummyUserRequestModel(),
              actionsWrapper: DummyRoleActionsWrapperModel(),
            ),
          );
          when(() => mockLocationBloc.state).thenReturn(const LocationState());

          await tester.pumpWidget(
            StackRouterScope(
              controller: fakeStackRouter,
              stateHash: 1,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
                  BlocProvider<AuthBloc>.value(value: mockAuthBloc),
                  BlocProvider<LocationBloc>.value(value: mockLocationBloc),
                ],
                child: MaterialApp(
                  localizationsDelegates: [
                    AppLocalizationsDelegate(mockConfig, fakeSqlStore),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en', 'US')],
                  home: const ProjectSelectionPage(),
                ),
              ),
            ),
          );
          await tester.pumpAndSettle(const Duration(seconds: 2));

          // Verify that the dummy project name is rendered.
          expect(find.text('Test Project'), findsOneWidget);

          // Tap the project card that displays the project name.
          await tester.tap(find.text('Test Project'));
          await tester.pumpAndSettle();
          // Verify that tapping triggers the project selection event.
          verify(() => mockProjectBloc.add(ProjectSelectProjectEvent(dummyProject)))
              .called(1);
        });
  });
}
