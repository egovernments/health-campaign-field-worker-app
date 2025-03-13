import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:digit_data_model/data_model.dart';

// Create mock classes
class MockLocationBloc extends Mock implements LocationBloc {
  @override
  // Stream<LocationState> get stream => super.noSuchMethod(
  //   Invocation.getter(#stream),
  //   // returnValue: Stream<LocationState>.fromIterable([
  //     const LocationState(
  //       latitude: 12.9716,
  //       longitude: 77.5946,
  //       // isLocationFetched: true,
  //     ),
  //   ]),
  // ) as Stream<LocationState>;

  @override
  LocationState get state => const LocationState(
    latitude: 12.9716,
    longitude: 77.5946,
    // isLocationFetched: true,
  );
}
class MockDeliverInterventionBloc extends Mock implements DeliverInterventionBloc {}
class MockHouseholdOverviewBloc extends Mock implements HouseholdOverviewBloc {}
class MockProductVariantBloc extends Mock implements ProductVariantBloc {}
class MockUserModel extends Mock implements UserModel {}

// For events and states
class FakeLocationEvent extends Fake implements LocationEvent {}
class FakeDeliverInterventionEvent extends Fake implements DeliverInterventionEvent {}

// Test data
const testTenantId = "default";
const testUserId = "user-123";
const testProjectId = "project-123";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Initialize mock bloc instances
  late MockLocationBloc mockLocationBloc;
  late MockDeliverInterventionBloc mockDeliverInterventionBloc;
  late MockHouseholdOverviewBloc mockHouseholdOverviewBloc;
  late MockProductVariantBloc mockProductVariantBloc;
  late MockUserModel mockUserModel;

  setUpAll(() {
    // Register fallbacks for event classes
    registerFallbackValue(FakeLocationEvent());
    registerFallbackValue(FakeDeliverInterventionEvent());
  });

  setUp(() {
    // Create fresh mocks for each test
    mockLocationBloc = MockLocationBloc();
    mockDeliverInterventionBloc = MockDeliverInterventionBloc();
    mockHouseholdOverviewBloc = MockHouseholdOverviewBloc();
    mockProductVariantBloc = MockProductVariantBloc();
    mockUserModel = MockUserModel();

    // Mock LocationBloc state
    when(() => mockLocationBloc.state).thenReturn(
      const LocationState(
        latitude: 12.9716,
        longitude: 77.5946,
        // isLocationFetched: true,
      ),
    );
    when(() => mockLocationBloc.add(any())).thenAnswer((_) async {});

    // Mock UserModel
    when(() => mockUserModel.uuid).thenReturn(testUserId);
    when(() => mockUserModel.mobileNumber).thenReturn("9876543210");
    when(() => mockUserModel.name).thenReturn("Test");

    // Mock HouseholdOverviewBloc state
    when(() => mockHouseholdOverviewBloc.state).thenReturn(
      HouseholdOverviewState(
        loading: false,
        householdMemberWrapper: HouseholdMemberWrapper(
          household: HouseholdModel(
            clientReferenceId: 'household-123',
            tenantId: testTenantId,
            // name: 'Test Household',
          ),
          members: [
            IndividualModel(
              clientReferenceId: 'member-123',
              tenantId: testTenantId,
              name: NameModel(givenName: 'Test', familyName: 'Member'),
            ),
          ],
          projectBeneficiaries: [
            ProjectBeneficiaryModel(
              clientReferenceId: 'pb-123',
              tenantId: testTenantId,
              projectId: testProjectId,
              beneficiaryClientReferenceId: 'household-123', dateOfRegistration: 112132233,
            ),
          ],
        ),
        selectedIndividual: IndividualModel(
          clientReferenceId: 'member-123',
          name: NameModel(givenName: 'Test', familyName: 'Member'),
        ),
      ),
    );

    // Mock DeliverInterventionBloc state
    when(() => mockDeliverInterventionBloc.state).thenReturn(
      const DeliverInterventionState(
        cycle: 1,
        dose: 1,
        tasks: [],
        loading: false,
      ),
    );
    when(() => mockDeliverInterventionBloc.add(any())).thenAnswer((_) async {});

    // Mock ProductVariantBloc state
    final testProducts = [
      ProductVariantModel(
        id: 'product-var-1',
        productId: 'product-1',
        // name: 'Test Product 1',
        // additionalFields: ProductVariantAdditionalFields(
        //   type: 'Consumable',
        //   quantity: 100,
        // ),
      ),
      ProductVariantModel(
        id: 'product-var-2',
        productId: 'product-2',
        // name: 'Test Product 2',
        // additionalFields: ProductVariantAdditionalFields(
        //   type: 'Consumable',
        //   quantity: 50,
        // ),
      ),
    ];

    when(() => mockProductVariantBloc.state).thenReturn(
      ProductVariantState.fetched(productVariants: testProducts),
    );

    // Setup RegistrationDeliverySingleton with test data
    final singleton = RegistrationDeliverySingleton();

    // Set tenant ID
    singleton.setTenantId(testTenantId);

    // Set boundary
    singleton.setBoundary(
      boundary: BoundaryModel(
        code: 'boundary-123',
        name: 'Test Boundary',
      ),
    );

    // Set household type
    singleton.setHouseholdType(HouseholdType.community);

    // Set persistence configuration
    singleton.setPersistenceConfiguration(
      persistenceConfiguration: PersistenceConfiguration.offlineFirst,
    );

    // Set initial data
    singleton.setInitialData(
      loggedInUserUuid: testUserId,
      maxRadius: 5.0,
      projectId: testProjectId,
      selectedBeneficiaryType: BeneficiaryType.household,
      projectType: ProjectTypeModel(
        id: 'project-type-1',
        name: 'Test Project Type',
        code: 'TPT',
        resources: [
          ProjectProductVariantModel(
            productVariantId: 'product-var-1',
          ),
          ProjectProductVariantModel(
            productVariantId: 'product-var-2',
          ),
        ],
      ),
      selectedProject: ProjectModel(
        id: testProjectId,
        name: 'Test Project',
        additionalDetails: ProjectAdditionalDetails(
          projectType: ProjectTypeModel(
            cycles: [
              ProjectCycle(
                deliveries: [
                  ProjectCycleDelivery(
                    doseCriteria: [
                      DeliveryDoseCriteria(
                          productVariants: [
                            DeliveryProductVariant(productVariantId: 'product-var-1'),
                            DeliveryProductVariant(productVariantId: 'product-var-2'),
                          ]
                      )
                    ], id: 1, deliveryStrategy: 'abcde',
                  ),
                ], id: 1, startDate: 1312443334, endDate: 12322322321,
              ),
            ],
            resources: [
              ProjectProductVariantModel(
                productVariantId: 'product-var-1',
              ),
              ProjectProductVariantModel(
                productVariantId: 'product-var-2',
              ),
            ],
          ),
        ),
      ),
      genderOptions: ['MALE', 'FEMALE', 'OTHER'],
      idTypeOptions: ['AADHAAR', 'PAN', 'VOTER_ID'],
      householdDeletionReasonOptions: ['RELOCATED', 'DUPLICATE', 'OTHER'],
      householdMemberDeletionReasonOptions: ['DECEASED', 'RELOCATED', 'OTHER'],
      deliveryCommentOptions: ['DELIVERED_SUCCESSFULLY', 'BENEFICIARY_NOT_AVAILABLE'],
      symptomsTypes: ['FEVER', 'COUGH', 'HEADACHE'],
      searchHouseHoldFilter: ['NAME', 'PHONE'],
      searchCLFFilters: ['NAME', 'ID'],
      referralReasons: ['SEVERE_SYMPTOMS', 'FOLLOW_UP_REQUIRED'],
      houseStructureTypes: ['PERMANENT', 'TEMPORARY'],
      refusalReasons: ['DISTRUST', 'UNAVAILABLE', 'OTHER'],
      loggedInUser: mockUserModel,
    );
  });

  group('DeliverInterventionPage Tests', () {
    testWidgets('Complete delivery workflow test', (WidgetTester tester) async {
      // Build app with all mocked blocs
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<LocationBloc>.value(value: mockLocationBloc),
              BlocProvider<DeliverInterventionBloc>.value(value: mockDeliverInterventionBloc),
              BlocProvider<HouseholdOverviewBloc>.value(value: mockHouseholdOverviewBloc),
              BlocProvider<ProductVariantBloc>.value(value: mockProductVariantBloc),
            ],
            child: const DeliverInterventionPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify page is rendered correctly
      expect(find.text('Deliver Intervention'), findsOneWidget);

      // // Find resource beneficiary cards (with keys if possible)
      // final resourceCards = find.byType(ResourceBeneficiaryCard);
      // expect(resourceCards, findsWidgets);
      //
      // // For each resource card, select a product and enter quantity
      // for (int i = 0; i < resourceCards.evaluate().length; i++) {
      //   // Find and tap product dropdown
      //   final resourceDropdown = find.descendant(
      //     of: resourceCards.at(i),
      //     matching: find.byType(DigitDropdown),
      //   ).first;
      //
      //   await tester.tap(resourceDropdown);
      //   await tester.pumpAndSettle();
      //
      //   // Select first product option (improved finding with text if possible)
      //   final dropdownItem = find.byType(DropdownItem).first;
      //   await tester.tap(dropdownItem);
      //   await tester.pumpAndSettle();
      //
      //   // Enter quantity
      //   final quantityInput = find.descendant(
      //     of: resourceCards.at(i),
      //     matching: find.byType(DigitTextFormInput),
      //   ).first;
      //
      //   await tester.enterText(quantityInput, '1');
      //   await tester.pumpAndSettle();
      // }
      //
      // // Select delivery comment
      // final commentDropdown = find.descendant(
      //   of: find.text('Delivery Comment').last,
      //   matching: find.byType(DigitDropdown),
      // ).first;
      //
      // await tester.tap(commentDropdown);
      // await tester.pumpAndSettle();
      //
      // // Select first comment option
      // final commentOption = find.byType(DropdownItem).first;
      // await tester.tap(commentOption);
      // await tester.pumpAndSettle();
      //
      // // Submit the form
      // final submitButton = find.text('Submit');
      // await tester.tap(submitButton);
      // await tester.pumpAndSettle();

      // Verify location and form submission events were triggered
      verify(() => mockLocationBloc.add(any())).called(greaterThan(0));
      verify(() => mockDeliverInterventionBloc.add(any())).called(1);
    });

    testWidgets('Form validation test', (WidgetTester tester) async {
      // Build app with mocked blocs
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<LocationBloc>.value(value: mockLocationBloc),
              BlocProvider<DeliverInterventionBloc>.value(value: mockDeliverInterventionBloc),
              BlocProvider<HouseholdOverviewBloc>.value(value: mockHouseholdOverviewBloc),
              BlocProvider<ProductVariantBloc>.value(value: mockProductVariantBloc),
            ],
            child: const DeliverInterventionPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Try submitting with empty form
      final submitButton = find.text('Submit');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      // Expect validation error
      expect(find.text('Resource delivered is required'), findsOneWidget);

      // Verify events were not sent to blocs due to validation failure
      verifyNever(() => mockDeliverInterventionBloc.add(any()));
    });
  });
}
