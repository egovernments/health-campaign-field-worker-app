// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/referral_recon_record.dart';
import 'package:referral_reconciliation/utils/utils.dart';

import '../constants/test_constants.dart';

// Mock class for InventorySingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {}

class MockProjectFacilityModel extends Mock implements ProjectFacilityModel {
  @override
  String get id => ReferralReconTestConstants().projectFacilityId;
}

void main() {
  late String mockProjectId;
  late DateTime mockDateOfRecord;
  late MockProjectFacilityModel mockProjectFacilityModel;
  late String mockHealthFacilityCoordinator;

  // Setting up the test environment
  setUpAll(() {
    // Initializing the entryType and projectId
    mockProjectId = ReferralReconTestConstants().projectId;
    mockDateOfRecord = ReferralReconTestConstants().dateOfReferralRecord;
    mockProjectFacilityModel = MockProjectFacilityModel();
    mockHealthFacilityCoordinator =
        ReferralReconTestConstants().healthFacilityCoordinator;
  });

  // Grouping tests related to RecordStockBloc
  group('RecordHFReferralBloc', () {
    setUp(() {});

    // Test for saveWarehouseDetails event
    blocTest<RecordHFReferralBloc, RecordHFReferralState>(
      'emits updated state with referral details when createReferralEntry event is added',
      build: () => RecordHFReferralBloc(
        RecordHFReferralState.create(
          loading: true,
          projectId: mockProjectId,
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
          facilityId: mockProjectFacilityModel.id,
          healthFacilityCord: mockHealthFacilityCoordinator,
          dateOfEvaluation: mockDateOfRecord,
        ),
      ),
      act: (bloc) => bloc.add(RecordHFReferralEvent.createReferralEntry(
        hfReferralModel: ReferralReconTestConstants().hfReferralModel,
      )),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <RecordHFReferralState>[
        RecordHFReferralState.create(
          loading: true,
          projectId: mockProjectId,
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
          healthFacilityCord: mockHealthFacilityCoordinator,
          facilityId: mockProjectFacilityModel.id,
          dateOfEvaluation: mockDateOfRecord,
        ),
        RecordHFReferralState.persisted(
          projectId: mockProjectId,
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
          healthFacilityCord: mockHealthFacilityCoordinator,
          facilityId: mockProjectFacilityModel.id,
          dateOfEvaluation: mockDateOfRecord,
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
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
        ),
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
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
        ),
      ],
    );

    // Test for View Referral Entry
    blocTest<RecordHFReferralBloc, RecordHFReferralState>(
      'emits view state when RecordHFReferralViewEvent is called and referral details are emitted successfully',
      build: () => RecordHFReferralBloc(
        RecordHFReferralState.view(
          projectId: mockProjectId,
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
        ),
      ),
      act: (bloc) {
        bloc.add(RecordHFReferralEvent.viewReferral(
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
        ));
      },
      // Expecting the bloc to emit a persisted state after the stock entry is created
      expect: () => <RecordHFReferralState>[
        RecordHFReferralState.view(
          projectId: mockProjectId,
          hfReferralModel: ReferralReconTestConstants().hfReferralModel,
        ),
      ],
    );
  });
}
