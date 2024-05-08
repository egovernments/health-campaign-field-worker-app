// // Importing necessary packages and modules
// import 'package:digit_data_model/blocs/facility/facility.dart';
// import 'package:digit_data_model/models/entities/facility.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:inventory_management/blocs/facility.dart';
// import 'package:inventory_management/blocs/inventory_listener.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:mocktail/mocktail.dart';
//
// // Mock class for InventorySingleton
// class MockInventorySingleton extends Mock implements InventorySingleton {}
//
// void main() {
//   group('FacilityBloc', () {
//     // Declare variables for MockInventorySingleton and FacilityBloc
//     late MockInventorySingleton mockInventorySingleton;
//     late FacilityBloc facilityBloc;
//     late String mockProjectId;
//
//     setUp(() {
//       // Initialize MockInventorySingleton and FacilityBloc before each test
//       mockInventorySingleton = MockInventorySingleton();
//       facilityBloc = InventoryFacilityBloc(
//           inventorySingleton: mockInventorySingleton,
//           const InventoryFacilityState.empty());
//
//       // Initialize mockProjectId
//       mockProjectId = 'mock-e29cc774';
//     });
//
//     // Test for when getFacilitiesForProjectId returns a non-null list of facilities
//     blocTest<InventoryFacilityBloc, InventoryFacilityState>(
//       // Description of the test
//       'emits [FacilityLoadingState, FacilityFetchedState] when getFacilitiesForProjectId returns non-null list',
//       build: () {
//         // Mock the method getFacilitiesForProjectId to return a non-null list
//         when(() => mockInventorySingleton.getFacilitiesForProjectId())
//             .thenAnswer((_) async => [FacilityModel(id: '1')]);
//         return facilityBloc;
//       },
//       act: (bloc) =>
//           bloc.add(InventoryFacilityEvent.loadForProjectId(projectId: mockProjectId)),
//       expect: () => <InventoryFacilityState>[
//         // Expected states after the action
//         const FacilityLoadingState(),
//         FacilityFetchedState(facilities: [FacilityModel(id: '1')]),
//       ],
//     );
//
//     // Test for when getFacilitiesForProjectId returns null
//     blocTest<InventoryFacilityBloc, InventoryFacilityState>(
//       // Description of the test
//       'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns null',
//       build: () {
//         // Mock the method getFacilitiesForProjectId to return null
//         when(() => mockInventorySingleton.getFacilitiesForProjectId())
//             .thenAnswer((_) async => null);
//         return facilityBloc;
//       },
//       act: (bloc) =>
//           bloc.add(InventoryFacilityEvent.loadForProjectId(projectId: mockProjectId)),
//       expect: () => <InventoryFacilityState>[
//         // Expected states after the action
//         const FacilityLoadingState(),
//         const FacilityEmptyState(),
//       ],
//     );
//
//     // Test for when getFacilitiesForProjectId returns an empty list
//     blocTest<InventoryFacilityBloc, InventoryFacilityState>(
//       // Description of the test
//       'emits [FacilityLoadingState, FacilityEmptyState] when getFacilitiesForProjectId returns an empty list',
//       build: () {
//         // Mock the method getFacilitiesForProjectId to return an empty list
//         when(() => mockInventorySingleton.getFacilitiesForProjectId())
//             .thenAnswer((_) async => []);
//         return facilityBloc;
//       },
//       act: (bloc) =>
//           bloc.add(InventoryFacilityEvent.loadForProjectId(projectId: mockProjectId)),
//       expect: () => <InventoryFacilityState>[
//         // Expected states after the action
//         const FacilityLoadingState(),
//         const FacilityFetchedState(facilities: []),
//       ],
//     );
//
//     // Test for when getFacilitiesForProjectId throws an exception
//     blocTest<InventoryFacilityBloc, InventoryFacilityState>(
//       'emits [FacilityLoadingState, FacilityErrorState] when getFacilitiesForProjectId throws an exception',
//       build: () {
//         when(() => mockInventorySingleton.getFacilitiesForProjectId())
//             .thenThrow(Exception('Failed to fetch facilities'));
//         return facilityBloc;
//       },
//       act: (bloc) =>
//           bloc.add(InventoryFacilityEvent.loadForProjectId(projectId: mockProjectId)),
//       expect: () => <InventoryFacilityState>[
//         const FacilityLoadingState(),
//         const FacilityErrorState(),
//       ],
//     );
//   });
// }
