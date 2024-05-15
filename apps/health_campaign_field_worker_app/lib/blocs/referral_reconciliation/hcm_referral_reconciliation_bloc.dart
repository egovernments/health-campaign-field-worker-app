// Import statements
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';

import '../sync/sync.dart';

// Bloc for handling inventory related operations
class HcmReferralReconBloc extends ReferralReconListener {
  // Class variables
  BuildContext context;
  final String userName;
  final String userId;
  final String tenantId;
  final ProjectModel selectedProject;
  final List<String> checklistTypes;

  // Constructor for the HcmReferralBloc
  HcmReferralReconBloc({
    required this.context,
    required this.userName,
    required this.userId,
    required this.tenantId,
    required this.selectedProject,
    required this.checklistTypes,
  });

  // Method to call the sync method
  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId));
  }

  // Method to get additional data
  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }

  // Fetch project facilities for project ID
  @override
  Future<List<ProjectFacilityModel>>
      fetchProjectFacilitiesForProjectId() async {
    final facilitiesBloc = context.read<ProjectFacilityBloc>();
    facilitiesBloc.add(ProjectFacilityLoadEvent(
      query: ProjectFacilitySearchModel(
        projectId: [selectedProject.id],
      ),
    ));

    final facilitiesState = await facilitiesBloc.stream.firstWhere(
      (state) => state.maybeWhen(
        fetched: (
          facilities,
        ) =>
            true,
        orElse: () => false,
      ),
    );

    List<ProjectFacilityModel> hcmReferralProjectFacilityModel = [];
    facilitiesState.maybeWhen(
      fetched: (
        facilities,
      ) {
        for (var element in facilities) {
          hcmReferralProjectFacilityModel.add(
            element,
          );
        }
      },
      orElse: () {},
    );

    return hcmReferralProjectFacilityModel;
  }

  // Fetch service definitions
  @override
  Future<List<ServiceDefinitionModel>> fetchSelectedServiceDefinitions(
      String code) async {
    return [];
  }

  // Save referral reconciliation details
  @override
  Future<bool> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    return false;
  }

  // Save service request details
  @override
  Future<bool> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    return false;
  }

  // Fetch referral reconciliations
  @override
  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation) async {
    return [];
  }

  @override
  Future<ServiceModel?> fetchSavedChecklist(
      ServiceSearchModel reconServiceSearchModel) async {
    return null;
  }

  @override
  Future<List<ServiceDefinitionModel>> fetchAllServiceDefinitions() async {
    return [];
  }
}
