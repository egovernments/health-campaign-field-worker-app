import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/blocs/boundary/boundary.dart';
import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_data_model/models/entities/project.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/app_initialization/app_initialization.dart';
import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localizations_delegate.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/localization.dart';
import 'package:health_campaign_field_worker_app/blocs/project/project.dart';
import 'package:health_campaign_field_worker_app/blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import 'package:health_campaign_field_worker_app/data/local_store/no_sql/schema/app_configuration.dart';
import 'package:health_campaign_field_worker_app/models/auth/auth_model.dart';
import 'package:health_campaign_field_worker_app/models/role_actions/role_actions_model.dart';
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';
import 'package:health_campaign_field_worker_app/utils/constants.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sync_service/blocs/sync/sync.dart';

import 'project_selection_test.dart';


/// ------------------------
/// Fake Classes for Events and States
class FakeAppInitializationEvent extends Fake implements AppInitializationEvent {}
class FakeAppInitializationState extends Fake implements AppInitializationState {}
class FakeBoundaryEvent extends Fake implements BoundaryEvent {}
class FakeBoundaryState extends Fake implements BoundaryState {}
class FakeBeneficiaryDownSyncEvent extends Fake implements BeneficiaryDownSyncEvent {}
class FakeBeneficiaryDownSyncState extends Fake implements BeneficiaryDownSyncState {}
class FakeProjectEvent extends Fake implements ProjectEvent {}

class FakeProjectState extends Fake implements ProjectState {}
class FakeSyncEvent extends Fake implements SyncEvent {}
class FakeSyncState extends Fake implements SyncState {}
class FakeAuthEvent extends Fake implements AuthEvent {}
class FakeAuthState extends Fake implements AuthState {}

/// ------------------------
/// Dummy classes for required models in AuthState (if used) or others.
class DummyUserRequestModel extends Fake implements UserRequestModel {
  @override
  String get uuid => 'dummy_uuid';
  @override
  String get userName => 'dummyUser';
  @override
  String get name => 'Dummy User';
  @override
  String get mobileNumber => '0000000000';
  @override
  String get gender => 'male';
  @override
  bool get active => true;
  @override
  String get tenantId => 'dummy_tenant';
  @override
  List<UserRoleModel> get roles => []; // Provide dummy roles if needed.
}
class DummyRoleActionsWrapperModel extends Fake implements RoleActionsWrapperModel {
  @override
  Widget call(Widget child) => child;
}
class FakeProjectBloc extends Fake implements ProjectBloc {}
class FakeAuthBloc extends Fake implements AuthBloc {}

/// ------------------------
/// Mock Blocs
class MockAppInitializationBloc extends MockBloc<AppInitializationEvent, AppInitializationState>
    implements AppInitializationBloc {}

class MockBoundaryBloc extends MockBloc<BoundaryEvent, BoundaryState>
    implements BoundaryBloc {}

class MockBeneficiaryDownSyncBloc extends MockBloc<BeneficiaryDownSyncEvent, BeneficiaryDownSyncState>
    implements BeneficiaryDownSyncBloc {}

class MockProjectBloc extends MockBloc<ProjectEvent, ProjectState>
    implements ProjectBloc {}

class MockSyncBloc extends MockBloc<SyncEvent, SyncState>
    implements SyncBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

/// ------------------------
/// Fake SQL Store
/// Rather than creating new instances for each test, we create (and re-use)
/// a singleton instance to avoid potential race conditions that occur if two
/// databases share the same QueryExecutor.
class FakeLocalSqlDataStore extends LocalSqlDataStore {
  FakeLocalSqlDataStore() : super();

  @override
  Future<List<QueryRow>> customQuery(String sql) async => [];
}

/// ------------------------
/// Mock App Configuration for Localization
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
        ..confg = (Config()..localStoreTTL = 3600) // Ensure property is 'config'
    ];
}

/// ------------------------
/// FakeStackRouter for AutoRouter support required by your widgets.
class FakeStackRouter extends Fake implements StackRouter {
  @override
  bool canPop({
    bool ignoreChildRoutes = false,
    bool ignorePagelessRoutes = false,
    bool ignoreParentRoutes = false,
  }) => false;

  @override
  Future<bool> pop<T extends Object?>([T? result]) async => false;

  @override
  Future<T?> push<T extends Object?>(PageRouteInfo<dynamic> route,
      {void Function(NavigationFailure)? onFailure}) async =>
      null;
}

/// ------------------------
/// Main Integration Test for BoundarySelectionPage
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockAppInitializationBloc mockAppInitBloc;
  late MockBoundaryBloc mockBoundaryBloc;
  late MockBeneficiaryDownSyncBloc mockDownSyncBloc;
  late MockProjectBloc mockProjectBloc;
  late MockSyncBloc mockSyncBloc;
  late MockAuthBloc mockAuthBloc;
  late LocalSqlDataStore fakeSqlStore;
  late MockAppConfiguration mockConfig;
  late FakeStackRouter fakeStackRouter;

  // Create a dummy project to be used in ProjectBloc state.
  final dummyProject = ProjectModel(id: '1', name: 'Dummy Project');

  setUpAll(() {
    // Register fallback values for fake events, states, and custom types.
    registerFallbackValue(FakeAppInitializationEvent());
    registerFallbackValue(FakeAppInitializationState());
    registerFallbackValue(FakeBoundaryEvent());
    registerFallbackValue(FakeBoundaryState());
    registerFallbackValue(FakeBeneficiaryDownSyncEvent());
    registerFallbackValue(FakeBeneficiaryDownSyncState());
    registerFallbackValue(FakeProjectEvent());
    registerFallbackValue(FakeProjectState());
    registerFallbackValue(FakeSyncEvent());
    registerFallbackValue(FakeSyncState());
    registerFallbackValue(FakeAuthEvent());
    registerFallbackValue(FakeAuthState());
    registerFallbackValue(Config());
    registerFallbackValue(BackendInterface());
    registerFallbackValue(Interfaces());
    registerFallbackValue(Languages());
    registerFallbackValue(DummyUserRequestModel());
    registerFallbackValue(DummyRoleActionsWrapperModel());

    registerFallbackValue(FakeProjectBloc());
    registerFallbackValue(FakeAuthBloc());

    // Create the singleton FakeLocalSqlDataStore.
    fakeSqlStore = FakeLocalSqlDataStore();
    fakeStackRouter = FakeStackRouter();
  });

  setUp(() {
    mockAppInitBloc = MockAppInitializationBloc();
    mockBoundaryBloc = MockBoundaryBloc();
    mockDownSyncBloc = MockBeneficiaryDownSyncBloc();
    mockConfig = MockAppConfiguration();
    fakeStackRouter = FakeStackRouter();
    mockProjectBloc = MockProjectBloc();
    mockSyncBloc = MockSyncBloc();
    mockAuthBloc = MockAuthBloc();

    when(() => mockAppInitBloc.state).thenReturn(
      AppInitializationState.initialized(
        appConfiguration: mockConfig,
        serviceRegistryList: [],
        dashboardConfigSchema: null,
      ),
    );
    // Stub BoundaryBloc to be in a loading state initially.
    // To simulate a proper state transition, we use whenListen.
    when(() => mockBoundaryBloc.state).thenReturn(
      const BoundaryState(loading: true, boundaryList: [], selectedBoundaryMap: {}),
    );
    whenListen(
      mockBoundaryBloc,
      Stream<BoundaryState>.fromIterable([
        const BoundaryState(loading: true, boundaryList: [], selectedBoundaryMap: {}),
        const BoundaryState(
          loading: false,
          boundaryList: [/* dummy boundary model here, if any */],
          selectedBoundaryMap: {'dummy':/* dummy boundary model instance */ null},
        ),
      ]),
      initialState: const BoundaryState(loading: true, boundaryList: [], selectedBoundaryMap: {}),
    );
    // Minimal states for LocalizationBloc and BeneficiaryDownSyncBloc.
    // when(() => mockLocalizationBloc.state).thenReturn(const LocalizationState());
    when(() => mockDownSyncBloc.state)
        .thenReturn(const BeneficiaryDownSyncState.resetState());

    // Stub ProjectBloc with a state that has a non-null selectedProject.
    when(() => mockProjectBloc.state).thenReturn(
      // Provide a dummy state. Adjust constructor as per your actual state model.
      ProjectState(projects: [dummyProject], loading: false, selectedProject: dummyProject),
    );
    // Use the SyncState union from your freezed class, e.g. completedSync.
    when(() => mockSyncBloc.state).thenReturn(const SyncState.completedSync());

    // Stub AuthBloc to return an authenticated state.
    when(() => mockAuthBloc.state).thenReturn(
      AuthState.authenticated(
        accessToken: 'dummyAccessToken',
        refreshToken: 'dummyRefreshToken',
        userModel: DummyUserRequestModel(),
        actionsWrapper: DummyRoleActionsWrapperModel(),
        individualId: 'dummyIndividualId',
      ),
    );

  });

  group('Boundary Selection Page Integration Tests', () {
    testWidgets('Displays CircularProgressIndicator when boundary state is loading',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            // Wrap the widget tree with a StackRouterScope so that AutoRouter lookups are satisfied.
            StackRouterScope(
              controller: fakeStackRouter,
              stateHash: 1,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AppInitializationBloc>.value(value: mockAppInitBloc),
                  BlocProvider<BoundaryBloc>.value(value: mockBoundaryBloc),
                  // BlocProvider<LocalizationBloc>.value(value: mockLocalizationBloc),
                  BlocProvider<BeneficiaryDownSyncBloc>.value(value: mockDownSyncBloc),
                  BlocProvider<ProjectBloc>.value(value: mockProjectBloc),
                  BlocProvider<SyncBloc>.value(value: mockSyncBloc),
                  BlocProvider<AuthBloc>.value(value: mockAuthBloc),
                ],
                child: MaterialApp(
                  localizationsDelegates: [
                    AppLocalizationsDelegate(mockConfig, fakeSqlStore),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en', 'US')],
                  home: const BoundarySelectionPage(),
                ),
              ),
            ),
          );

          // Wait for asynchronous operations to settle.
          await tester.pump(const Duration(milliseconds: 20));

          // When the BoundaryBloc state is loading, the page displays a CircularProgressIndicator.
          expect(find.byKey(const Key('boundary_loading_state_indicator')),
              findsOneWidget);

          // Wait for state transition; pumpAndSettle waits for animations and streams.
          await tester.pumpAndSettle(const Duration(seconds: 3));

          // After transition, no CircularProgressIndicator should exist.
          expect(find.byKey(const Key('boundary_loading_state_indicator')), findsNothing);

          // Additionally, verify a part of the loaded UI exists.
          // For instance, check for the presence of a Form widget.
          expect(find.byKey(const Key('boundary_form')), findsWidgets);
        });

    // Additional tests could be added here to verify other behaviors
    // such as: verifying the display of boundary dropdowns, testing form validation,
    // handling of sync events, etc.
  });
}
