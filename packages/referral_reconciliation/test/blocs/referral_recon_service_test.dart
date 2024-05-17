// // Importing necessary packages and modules
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:referral_reconciliation/blocs/referral_recon_service.dart';
// import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
// import 'package:referral_reconciliation/models/entities/referral_recon_service.dart';
//
// import '../constants/test_constants.dart';
//
// // Mock class for ReferralReconSingleton
// class MockReferralReconSingleton extends Mock
//     implements ReferralReconSingleton {}
//
// void main() {
//   group('ReferralReconServiceBloc', () {
//     // Declare variables for MockInventorySingleton and FacilityBloc
//     late MockReferralReconSingleton mockReferralReconSingleton;
//     late ReferralReconServiceBloc serviceBloc;
//     late String mockProjectId;
//     late ReferralReconServiceSearchModel mockServiceSearchModel;
//     late ReferralReconServiceModel mockServiceModel;
//
//     setUp(() {
//       // Initialize MockReferralReconSingleton and ReferralReconServiceBloc before each test
//       mockReferralReconSingleton = MockReferralReconSingleton();
//       serviceBloc = ReferralReconServiceBloc(
//         const ReferralReconServiceState.empty(),
//         referralReconSingleton: mockReferralReconSingleton,
//       );
//       mockServiceSearchModel =
//           ReferralReconTestConstants().reconServiceSearchModel;
//       mockServiceModel = ReferralReconTestConstants().reconServiceModel;
//       // Initialize mockProjectId
//       mockProjectId = ReferralReconTestConstants().projectId;
//     });
//
//     // Test for when getSavedChecklist returns null
//     blocTest<ReferralReconServiceBloc, ReferralReconServiceState>(
//       // Description of the test
//       'emits [ReferralReconServiceSearchState] when getSavedChecklist returns null',
//       build: () {
//         // Mock the method getSavedChecklist to return null
//         when(() => mockReferralReconSingleton.getSavedChecklist(
//             mockServiceSearchModel)).thenAnswer((_) async => null);
//         return serviceBloc;
//       },
//       act: (bloc) => bloc.add(ReferralReconServiceEvent.search(
//           serviceSearchModel: mockServiceSearchModel)),
//       expect: () => <ReferralReconServiceState>[
//         // Expected states after the action
//         const ReferralReconServiceSearchState(serviceList: []),
//       ],
//     );
//     // Test for when getSavedChecklist returns a non-null list of service Requests
//
//     blocTest<ReferralReconServiceBloc, ReferralReconServiceState>(
//       // Description of the test
//       'emits [ReferralReconServiceSearchState] when getSavedChecklist returns non-null List',
//       build: () {
//         // Mock the method getSavedChecklist to return a single List
//         when(() => mockReferralReconSingleton
//                 .getSavedChecklist(mockServiceSearchModel))
//             .thenAnswer(
//                 (_) async => ReferralReconTestConstants().reconServiceModel);
//         return serviceBloc;
//       },
//       act: (bloc) => bloc.add(ReferralReconServiceEvent.search(
//           serviceSearchModel: mockServiceSearchModel)),
//       expect: () => <ReferralReconServiceState>[
//         // Expected states after the action
//         ReferralReconServiceSearchState(
//           serviceList: [
//             ReferralReconTestConstants().reconServiceModel,
//           ],
//         ),
//       ],
//     );
//   });
// }
