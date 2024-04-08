// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
// import 'package:referral_reconciliation/models/entities/referral_project_facility.dart';
// import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart';
// import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart';
//
// import '../../data/data_repository.dart';
// import '../../models/data_model.dart';
// import '../../utils/extensions/extensions.dart';
// import '../project_facility/project_facility.dart';
// import '../sync/sync.dart';
//
// // Bloc for handling inventory related operations
// class HcmReferralReconBloc extends ReferralReconListener {
//   BuildContext context;
//   final String userName;
//   final String userId;
//   final String tenantId;
//   final ProjectModel selectedProject;
//   final LocalRepository<HcmHFReferralModel, HcmHFReferralSearchModel>
//       hfReferralLocalRepository;
//   final LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
//       serviceDefinitionLocalRepository;
//   // Constructor for the HcmInventoryBloc
//   HcmReferralReconBloc({
//     required this.context,
//     required this.userName,
//     required this.userId,
//     required this.tenantId,
//     required this.selectedProject,
//     required this.hfReferralLocalRepository,
//     required this.serviceDefinitionLocalRepository,
//   });
//
//   // Method to call the sync method
//   @override
//   void callSyncMethod() {
//     context!.read<SyncBloc>().add(SyncRefreshEvent(userId));
//   }
//
//   // Method to get additional data
//   getAdditionalData(Map<String, Object> additionalData) {
//     List<AdditionalField> additionalFields = [];
//
//     additionalData.forEach((key, value) {
//       additionalFields.add(AdditionalField(key, value));
//     });
//
//     return additionalFields;
//   }
//
//   @override
//   Future<List<ReferralProjectFacilityModel>>
//       fetchProjectFacilitiesForProjectId() async {
//     final facilitiesBloc = context!.read<ProjectFacilityBloc>();
//     facilitiesBloc.add(ProjectFacilityLoadEvent(
//       query: ProjectFacilitySearchModel(
//         projectId: [selectedProject.id],
//       ),
//     ));
//
//     final facilitiesState = await facilitiesBloc.stream.firstWhere(
//       (state) => state.maybeWhen(
//         fetched: (
//           facilities,
//         ) =>
//             true,
//         orElse: () => false,
//       ),
//     );
//
//     List<ReferralProjectFacilityModel> hcmReferralProjectFacilityModel = [];
//     facilitiesState.maybeWhen(
//       fetched: (
//         facilities,
//       ) {
//         for (var element in facilities) {
//           hcmReferralProjectFacilityModel.add(
//             ReferralProjectFacilityModel(
//               id: element.id,
//               facilityId: element.facilityId,
//               nonRecoverableError: element.nonRecoverableError,
//               rowVersion: element.rowVersion,
//               tenantId: element.tenantId,
//             ),
//           );
//         }
//       },
//       orElse: () {},
//     );
//
//     return hcmReferralProjectFacilityModel;
//   }
//
//   @override
//   Future<List<ReferralReconServiceDefinitionModel>> fetchServiceDefinitions(
//       String code) async {
//     final selectedServiceDefinition = await serviceDefinitionLocalRepository
//         .search(ServiceDefinitionSearchModel(tenantId: tenantId, code: [
//       '${selectedProject.name}.$code.${RolesType.healthFacilityWorker.toValue()}'
//     ]));
//     return selectedServiceDefinition
//         .map((e) => ReferralReconServiceDefinitionModel(
//             id: e.id,
//             tenantId: e.tenantId,
//             code: e.code,
//             attributes: e.attributes
//                 ?.map((a) => ReferralReconAttributesModel(
//                       id: a.id,
//                       code: a.code,
//                       tenantId: a.tenantId,
//                       isActive: a.isActive,
//                       dataType: a.dataType,
//                       referenceId: a.referenceId,
//                       required: a.required,
//                       values: a.values,
//                       order: a.order,
//                       regex: a.regex,
//                     ))
//                 .toList()))
//         .toList();
//   }
//
//   @override
//   Future<void> saveReferralReconDetails(
//       ReferralReconciliation saveReferralReconciliation) async {
//     await hfReferralLocalRepository.create(HcmHFReferralModel(
//       hfReferralModel: saveReferralReconciliation.hfReferralModel,
//       additionalFields:
//           getAdditionalData(saveReferralReconciliation.additionalData),
//       auditDetails: AuditDetails(
//         createdBy: context.loggedInUserUuid,
//         createdTime: context.millisecondsSinceEpoch(),
//         lastModifiedTime: context.millisecondsSinceEpoch(),
//         lastModifiedBy: context.loggedInUserUuid,
//       ),
//       clientAuditDetails: ClientAuditDetails(
//         createdBy: context.loggedInUserUuid,
//         createdTime: context.millisecondsSinceEpoch(),
//         lastModifiedTime: context.millisecondsSinceEpoch(),
//         lastModifiedBy: context.loggedInUserUuid,
//       ),
//     ));
//   }
//
//   @override
//   Future<void> saveServiceRequestDetails(
//       SaveServiceRequest saveServiceRequest) {
//     // TODO: implement saveServiceRequestDetails
//     throw UnimplementedError();
//   }
// }
