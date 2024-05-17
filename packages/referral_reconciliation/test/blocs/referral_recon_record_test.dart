// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/referral_recon_record.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:referral_reconciliation/models/entities/referral_project_facility.dart';

import '../constants/test_constants.dart';

// Mock class for InventorySingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {
  // Mock method for saving referral details
  @override
  Future<bool?> saveReferralReconDetails(ReferralReconciliation details) async {
    return true;
  }
}

class MockProjectFacilityModel extends Mock
    implements ReferralProjectFacilityModel {
  @override
  String get id => ReferralReconTestConstants().projectFacilityId;
}

// Fake class for SaveReferralDetails for testing
class SaveReferralReconDetailsFake extends Fake
    implements ReferralReconciliation {
  @override
  HFReferralModel get hfReferralModel =>
      ReferralReconTestConstants().hfReferralModel;

  @override
  Map<String, Object> get additionalData =>
      ReferralReconTestConstants().additionalDataForReferralRecord;
}

void main() {
  late String mockProjectId;
  late DateTime mockDateOfRecord;
  late MockProjectFacilityModel mockProjectFacilityModel;
  late String mockHealthFacilityCoordinator;

  // Setting up the test environment
  setUpAll(() {
    registerFallbackValue(SaveReferralReconDetailsFake());

    // Initializing the entryType and projectId
    mockProjectId = ReferralReconTestConstants().projectId;
    mockDateOfRecord = ReferralReconTestConstants().dateOfReferralRecord;
    mockProjectFacilityModel = MockProjectFacilityModel();
    mockHealthFacilityCoordinator =
        ReferralReconTestConstants().healthFacilityCoordinator;
  });

  // Grouping tests related to RecordStockBloc
  group('RecordHFReferralBloc', () {
    // Declaring variables for mock and bloc
    late MockReferralReconSingleton mockReferralReconSingleton;
    late RecordHFReferralBloc recordHFReferralBloc;

    // Setting up the mock and the bloc for each test
    setUp(() {
      mockReferralReconSingleton = MockReferralReconSingleton();
      recordHFReferralBloc = RecordHFReferralBloc(
        RecordHFReferralState.create(
          projectId: mockProjectId,
          facilityId: mockProjectFacilityModel.id,
          healthFacilityCord: mockHealthFacilityCoordinator,
          dateOfEvaluation: mockDateOfRecord,
        ),
        referralReconSingleton: mockReferralReconSingleton,
      );
    });

    // Test for saveWarehouseDetails event
    blocTest<RecordHFReferralBloc, RecordHFReferralState>(
      'emits updated state with referral details when createReferralEntry event is added',
      build: () => RecordHFReferralBloc(
        RecordHFReferralState.create(
          loading: true,
          projectId: mockProjectId,
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          facilityId: mockProjectFacilityModel.id,
          healthFacilityCord: mockHealthFacilityCoordinator,
          dateOfEvaluation: mockDateOfRecord,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ),
        referralReconSingleton: mockReferralReconSingleton,
      ),
      act: (bloc) => bloc.add(RecordHFReferralEvent.createReferralEntry(
        hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
        additionalData: SaveReferralReconDetailsFake().additionalData,
      )),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <RecordHFReferralState>[
        RecordHFReferralState.create(
          loading: true,
          projectId: mockProjectId,
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          healthFacilityCord: mockHealthFacilityCoordinator,
          facilityId: mockProjectFacilityModel.id,
          dateOfEvaluation: mockDateOfRecord,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ),
        RecordHFReferralState.persisted(
          projectId: mockProjectId,
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          healthFacilityCord: mockHealthFacilityCoordinator,
          facilityId: mockProjectFacilityModel.id,
          dateOfEvaluation: mockDateOfRecord,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ),
      ],
    );

    // Test for Save Facility Details event
    blocTest<RecordHFReferralBloc, RecordHFReferralState>(
      'emits persisted state when RecordHFReferralSaveFacilityDetailsEvent is called and facility details are saved successfully',
      build: () => RecordHFReferralBloc(
        RecordHFReferralState.create(
            projectId: mockProjectId,
            dateOfEvaluation: mockDateOfRecord,
            facilityId: mockProjectFacilityModel.id,
            hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
            additionalData: SaveReferralReconDetailsFake().additionalData),
        referralReconSingleton: mockReferralReconSingleton,
      ),
      act: (bloc) {
        bloc.add(RecordHFReferralEvent.saveFacilityDetails(
            dateOfEvaluation: mockDateOfRecord,
            facilityId: mockProjectFacilityModel.id));
      },
      // Expecting the bloc to emit a persisted state after the stock entry is created
      expect: () => <RecordHFReferralState>[
        RecordHFReferralState.create(
          projectId: mockProjectId,
          dateOfEvaluation: mockDateOfRecord,
          facilityId: mockProjectFacilityModel.id,
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ),
      ],
    );

    // Test for View Referral Entry
    blocTest<RecordHFReferralBloc, RecordHFReferralState>(
      'emits view state when RecordHFReferralViewEvent is called and referral details are emitted successfully',
      build: () => RecordHFReferralBloc(
        RecordHFReferralState.view(
            projectId: mockProjectId,
            hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
            additionalData: SaveReferralReconDetailsFake().additionalData),
        referralReconSingleton: mockReferralReconSingleton,
      ),
      act: (bloc) {
        bloc.add(RecordHFReferralEvent.viewReferral(
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ));
      },
      // Expecting the bloc to emit a persisted state after the stock entry is created
      expect: () => <RecordHFReferralState>[
        RecordHFReferralState.view(
          projectId: mockProjectId,
          hfReferralModel: SaveReferralReconDetailsFake().hfReferralModel,
          additionalData: SaveReferralReconDetailsFake().additionalData,
        ),
      ],
    );
  });
}
