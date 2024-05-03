// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/project_facility.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:referral_reconciliation/models/entities/referral_project_facility.dart';

// Mock class for ReferralReconSingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {}

void main() {
  group('ReferralReconProjectFacilityBloc', () {
    // Declare variables for MockInventorySingleton and FacilityBloc
    late MockReferralReconSingleton mockReferralReconSingleton;
    late ReferralReconProjectFacilityBloc facilityBloc;
    late String mockProjectId;

    setUp(() {
      // Initialize MockReferralReconSingleton and ReferralReconProjectFacilityBloc before each test
      mockReferralReconSingleton = MockReferralReconSingleton();
      facilityBloc = ReferralReconProjectFacilityBloc(
        const ReferralReconProjectFacilityState.empty(),
        referralReconSingleton: mockReferralReconSingleton,
      );

      // Initialize mockProjectId
      mockProjectId = 'mock-e29cc774';
    });

    // Test for when getProjectFacilitiesForProjectId returns null
    blocTest<ReferralReconProjectFacilityBloc,
        ReferralReconProjectFacilityState>(
      // Description of the test
      'emits [ProjectFacilityLoadingState, ProjectFacilityEmptyState] when getProjectFacilitiesForProjectId returns null',
      build: () {
        // Mock the method getProjectFacilitiesForProjectId to return null
        when(() =>
                mockReferralReconSingleton.getProjectFacilitiesForProjectId())
            .thenAnswer((facilities) async => null);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(
          ReferralReconProjectFacilityEvent.loadForProjectId(
              projectId: mockProjectId)),
      expect: () => <ReferralReconProjectFacilityState>[
        // Expected states after the action
        const ProjectFacilityLoadingState(),
        const ProjectFacilityEmptyState(),
      ],
    );
    // Test for when getProjectFacilitiesForProjectId returns a non-null list of facilities
    blocTest<ReferralReconProjectFacilityBloc,
        ReferralReconProjectFacilityState>(
      // Description of the test
      'emits [ProjectFacilityLoadingState, ProjectFacilityFetchedState] when getProjectFacilitiesForProjectId returns non-null list',
      build: () {
        final List<ReferralProjectFacilityModel> expectedFacilities = [
          ReferralProjectFacilityModel(id: 'PJ_1')
        ]; // Mock the method getProjectFacilitiesForProjectId to return a non-null list
        when(() =>
                mockReferralReconSingleton.getProjectFacilitiesForProjectId())
            .thenAnswer((_) async => expectedFacilities);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(
          ReferralReconProjectFacilityEvent.loadForProjectId(
              projectId: mockProjectId)),
      expect: () {
        final List<ReferralProjectFacilityModel> expectedFacilities = [
          ReferralProjectFacilityModel(id: 'PJ_1')
        ]; // Mock the method getProjectFacilitiesForProjectId to return a non-null list

        return <ReferralReconProjectFacilityState>[
          // Expected states after the action
          const ProjectFacilityLoadingState(),
          ProjectFacilityFetchedState(projectFacilities: expectedFacilities),
        ];
      },
    );

    // Test for when getProjectFacilitiesForProjectId returns an empty list
    blocTest<ReferralReconProjectFacilityBloc,
        ReferralReconProjectFacilityState>(
      // Description of the test
      'emits [ProjectFacilityLoadingState, ProjectFacilityEmptyState] when getProjectFacilitiesForProjectId returns an empty list',
      build: () {
        // Mock the method getProjectFacilitiesForProjectId to return an empty list
        when(() =>
                mockReferralReconSingleton.getProjectFacilitiesForProjectId())
            .thenAnswer((facilities) async => []);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(
          ReferralReconProjectFacilityEvent.loadForProjectId(
              projectId: mockProjectId)),
      expect: () => <ReferralReconProjectFacilityState>[
        // Expected states after the action
        const ProjectFacilityLoadingState(),
        const ProjectFacilityFetchedState(projectFacilities: []),
      ],
    );
  });
}
