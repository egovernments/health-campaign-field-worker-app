import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_data_model/models/entities/boundary.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localizations_delegate.dart';
import 'package:health_campaign_field_worker_app/data/local_store/no_sql/schema/app_configuration.dart';
import 'package:health_campaign_field_worker_app/data/repositories/local/localization.dart';
import 'package:health_campaign_field_worker_app/models/auth/auth_model.dart';
import 'package:health_campaign_field_worker_app/models/role_actions/role_actions_model.dart';
import 'package:health_campaign_field_worker_app/utils/constants.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

// Adjust these imports to match your project structure.
import 'package:health_campaign_field_worker_app/blocs/app_initialization/app_initialization.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/pages/beneficiary_registration/household_location.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/blocs/app_localization.dart'
    as registration_delivery_localization;
import 'package:registration_delivery/utils/utils.dart';
import 'package:showcaseview/showcaseview.dart';

/// ------------------------
/// FAKE CLASSES FOR EVENTS & STATES
class FakeAppInitializationEvent extends Fake
    implements AppInitializationEvent {}

class FakeAppInitializationState extends Fake
    implements AppInitializationState {}

class FakeBeneficiaryRegistrationEvent extends Fake
    implements BeneficiaryRegistrationEvent {}

class FakeBeneficiaryRegistrationState extends Fake
    implements BeneficiaryRegistrationState {}

class FakeLocationEvent extends Fake implements LocationEvent {}

class FakeLocationState extends Fake implements LocationState {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

/// ------------------------
/// DUMMY CLASSES FOR REQUIRED MODELS
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

class DummyRoleActionsWrapperModel extends Fake
    implements RoleActionsWrapperModel {
  @override
  Widget call(Widget child) => child;
}

/// ------------------------
/// MOCK BLOCS

class MockAppInitializationBloc
    extends MockBloc<AppInitializationEvent, AppInitializationState>
    implements AppInitializationBloc {}

class MockBeneficiaryRegistrationBloc
    extends MockBloc<BeneficiaryRegistrationEvent, BeneficiaryRegistrationState>
    implements BeneficiaryRegistrationBloc {}

class MockLocationBloc extends MockBloc<LocationEvent, LocationState>
    implements LocationBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

/// ------------------------
/// FALLBACK FAKES FOR BLOCS
class FakeBeneficiaryRegistrationBloc extends Fake
    implements BeneficiaryRegistrationBloc {}

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
        ..confg =
            (Config()..localStoreTTL = 3600) // Ensure property is 'config'
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
  }) =>
      false;

  @override
  Future<bool> pop<T extends Object?>([T? result]) async => false;

  @override
  Future<T?> push<T extends Object?>(PageRouteInfo<dynamic> route,
          {void Function(NavigationFailure)? onFailure}) async =>
      null;
}

/// ------------------------
/// MAIN INTEGRATION TEST
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Declare mock variables.
  late MockAppInitializationBloc mockAppInitBloc;
  late MockBeneficiaryRegistrationBloc mockBeneficiaryRegistrationBloc;
  late MockLocationBloc mockLocationBloc;
  late MockAuthBloc mockAuthBloc;

  // Create singleton instances.
  late LocalSqlDataStore fakeSqlStore;
  late MockAppConfiguration mockConfig;
  late FakeStackRouter fakeStackRouter;

  setUpAll(() {
    registerFallbackValue(FakeAppInitializationEvent());
    registerFallbackValue(FakeAppInitializationState());
    registerFallbackValue(FakeBeneficiaryRegistrationEvent());
    registerFallbackValue(FakeBeneficiaryRegistrationState());
    registerFallbackValue(FakeLocationEvent());
    registerFallbackValue(FakeLocationState());
    registerFallbackValue(FakeAuthEvent());
    registerFallbackValue(FakeAuthState());
    registerFallbackValue(DummyUserRequestModel());
    registerFallbackValue(DummyRoleActionsWrapperModel());
    registerFallbackValue(Config());
    registerFallbackValue(BackendInterface());
    registerFallbackValue(Interfaces());
    registerFallbackValue(Languages());

    fakeSqlStore = FakeLocalSqlDataStore();
    fakeStackRouter = FakeStackRouter();
    mockConfig = MockAppConfiguration();
  });

  setUp(() {
    mockAppInitBloc = MockAppInitializationBloc();
    mockBeneficiaryRegistrationBloc = MockBeneficiaryRegistrationBloc();
    mockLocationBloc = MockLocationBloc();
    mockConfig = MockAppConfiguration();
    fakeStackRouter = FakeStackRouter();
    mockAuthBloc = MockAuthBloc();

    // Initialize singleton with test data
    RegistrationDeliverySingleton().setBoundary(
        boundary: BoundaryModel(
      code: 'TEST_BOUNDARY',
      name: 'Test Boundary',
      // Add other required properties
    ));
    RegistrationDeliverySingleton().setHouseholdType(HouseholdType.community);

    // Set up AuthBloc with authenticated state
    when(() => mockAuthBloc.state).thenReturn(
      AuthState.authenticated(
        accessToken: 'dummyAccessToken',
        refreshToken: 'dummyRefreshToken',
        userModel: DummyUserRequestModel(),
        actionsWrapper: DummyRoleActionsWrapperModel(),
        individualId: 'dummyIndividualId',
      ),
    );

    // Stub AppInitializationBloc.
    when(() => mockAppInitBloc.state).thenReturn(
      AppInitializationState.initialized(
        appConfiguration: mockConfig,
        serviceRegistryList: [],
        dashboardConfigSchema: null,
      ),
    );

    // Stub BeneficiaryRegistrationBloc.
    when(() => mockBeneficiaryRegistrationBloc.state).thenReturn(
      const BeneficiaryRegistrationState.create(
        householdModel: null,
        individualModel: null,
        projectBeneficiaryModel: null,
        registrationDate: null,
        searchQuery: null,
        loading: false,
        isHeadOfHousehold: false,
      ),
    );

    // Stub LocationBloc.
    whenListen(
      mockLocationBloc,
      Stream<LocationState>.fromIterable([
        const LocationState(
            loading: true, latitude: null, longitude: null, accuracy: null),
        const LocationState(
          loading: false,
          latitude: 12.1234,
          longitude: 77.1234,
          accuracy: 10.0,
        ),
      ]),
      initialState: const LocationState(
          loading: true, latitude: null, longitude: null, accuracy: null),
    );

    // when(() => fakeSqlStore.customQuery(any())).thenAnswer((_) async => []);
  });

  group('Household Location Page Integration Tests', () {
    testWidgets('Displays form and submits address',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ShowCaseWidget(
          builder: (showCaseContext) => MaterialApp(
            localizationsDelegates: [
              AppLocalizationsDelegate(mockConfig, fakeSqlStore),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              registration_delivery_localization
                  .RegistrationDeliveryLocalization.getDelegate(
                LocalizationLocalRepository()
                    .returnLocalizationFromSQL(fakeSqlStore) as Future,
                mockConfig.languages!,
              ),
            ],
            supportedLocales: const [Locale('en', 'US')],
            home: StackRouterScope(
              controller: fakeStackRouter,
              stateHash: 1,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AppInitializationBloc>.value(
                      value: mockAppInitBloc),
                  BlocProvider<BeneficiaryRegistrationBloc>.value(
                      value: mockBeneficiaryRegistrationBloc),
                  BlocProvider<LocationBloc>.value(value: mockLocationBloc),
                  BlocProvider<AuthBloc>.value(value: mockAuthBloc),
                ],
                child: Builder(
                  builder: (innerContext) {
                    // Optionally, start the showcase after the tree builds.
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // If you have specific showcase keys, pass them as a list.
                      ShowCaseWidget.of(innerContext)!.startShowCase([]);
                    });
                    return const HouseholdLocationPage(
                      key: Key('household_location_page'),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );

      // ShowCaseWidget(
      //     builder: (context) => StackRouterScope(
      //       controller: fakeStackRouter,
      //       stateHash: 1,
      //       child: MultiBlocProvider(
      //         providers: [
      //           BlocProvider<AppInitializationBloc>.value(value: mockAppInitBloc),
      //           BlocProvider<BeneficiaryRegistrationBloc>.value(value: mockBeneficiaryRegistrationBloc),
      //           BlocProvider<LocationBloc>.value(value: mockLocationBloc),
      //           BlocProvider<AuthBloc>.value(value: mockAuthBloc),
      //         ],
      //         child: MaterialApp(
      //           localizationsDelegates: [
      //             AppLocalizationsDelegate(mockConfig, fakeSqlStore),
      //             GlobalMaterialLocalizations.delegate,
      //             GlobalWidgetsLocalizations.delegate,
      //             GlobalCupertinoLocalizations.delegate,
      //             registration_delivery_localization.RegistrationDeliveryLocalization
      //                 .getDelegate(
      //               LocalizationLocalRepository().returnLocalizationFromSQL(fakeSqlStore) as Future,
      //               mockConfig.languages!,
      //             ),
      //           ],
      //           supportedLocales: const [Locale('en', 'US')],
      //           home: Builder(
      //             builder: (materialContext) => const HouseholdLocationPage(),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // );

      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify that the form is displayed.
      expect(find.byType(ReactiveFormBuilder), findsOneWidget);

      // Tap the submit button.
      final submitButtonFinder =
          find.byKey(const Key('household_location_button'));
      expect(submitButtonFinder, findsOneWidget);
      await tester.tap(submitButtonFinder);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify that a BeneficiaryRegistrationSaveAddressEvent is dispatched.
      verify(() => mockBeneficiaryRegistrationBloc.add(
          any(that: isA<BeneficiaryRegistrationSaveAddressEvent>()))).called(1);

      // Optionally, verify navigation to the next page.
      expect(find.byType(HouseDetailsRoute), findsOneWidget);
    });
  });
}
