import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/facility.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInventorySingleton extends Mock implements InventorySingleton {}

void main() {
  group('FacilityBloc', () {
    late MockInventorySingleton mockInventorySingleton;
    late FacilityBloc facilityBloc;

    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      facilityBloc = FacilityBloc(
          inventorySingleton: mockInventorySingleton,
          const FacilityState.empty());
    });

    // Test for when getFacilitiesForProjectId returns a non-null list of facilities
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityFetchedState] when getFacilitiesForProjectId returns non-null list',
      build: () {
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => [InventoryFacilityModel(id: '1')]);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        const FacilityLoadingState(),
        FacilityFetchedState(facilities: [InventoryFacilityModel(id: '1')]),
      ],
    );

// Test for when getFacilitiesForProjectId returns null
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns null',
      build: () {
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => null);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        const FacilityLoadingState(),
        const FacilityEmptyState(),
      ],
    );

// Test for when getFacilitiesForProjectId returns an empty list
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns an empty list',
      build: () {
        when(() => mockInventorySingleton.getFacilitiesForProjectId())
            .thenAnswer((_) async => []);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: 'e29cc774-ab5f-426f-b729-24ecad99c5ba')),
      expect: () => <FacilityState>[
        const FacilityLoadingState(),
        const FacilityFetchedState(facilities: []),
      ],
    );
  });
}
