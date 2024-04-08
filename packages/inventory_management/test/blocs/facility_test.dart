// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/facility.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for InventorySingleton
class MockInventorySingleton extends Mock implements InventorySingleton {}

void main() {
  group('FacilityBloc', () {
    // Declare variables for MockInventorySingleton and FacilityBloc
    late MockInventorySingleton mockInventorySingleton;
    late FacilityBloc facilityBloc;

    setUp(() {
      // Initialize MockInventorySingleton and FacilityBloc before each test
      mockInventorySingleton = MockInventorySingleton();
      facilityBloc = FacilityBloc(
          inventorySingleton: mockInventorySingleton,
          const FacilityState.empty());
    });

    // Test for when getFacilitiesForProjectId returns a non-null list of facilities
    blocTest<FacilityBloc, FacilityState>(
      // Description of the test
      'emits [FacilityLoadingState, FacilityFetchedState] when getFacilitiesForProjectId returns non-null list',
      build: () {
        // Mock the method getFacilitiesForProjectId to return a non-null list
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => [InventoryFacilityModel(id: '1')]);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        // Expected states after the action
        const FacilityLoadingState(),
        FacilityFetchedState(facilities: [InventoryFacilityModel(id: '1')]),
      ],
    );

    // Test for when getFacilitiesForProjectId returns null
    blocTest<FacilityBloc, FacilityState>(
      // Description of the test
      'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns null',
      build: () {
        // Mock the method getFacilitiesForProjectId to return null
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => null);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        // Expected states after the action
        const FacilityLoadingState(),
        const FacilityEmptyState(),
      ],
    );

    // Test for when getFacilitiesForProjectId returns an empty list
    blocTest<FacilityBloc, FacilityState>(
      // Description of the test
      'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns an empty list',
      build: () {
        // Mock the method getFacilitiesForProjectId to return an empty list
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => []);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        // Expected states after the action
        const FacilityLoadingState(),
        const FacilityFetchedState(facilities: []),
      ],
    );

    // Test for when getFacilitiesForProjectId throws an exception
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityErrorState] when getFacilitiesForProjectId throws an exception',
      build: () {
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenThrow(Exception('Failed to fetch facilities'));
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        const FacilityLoadingState(),
        const FacilityErrorState(),
      ],
    );
  });
}
