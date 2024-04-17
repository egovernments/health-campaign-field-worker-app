// Import statements
import 'dart:convert';

import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:referral_reconciliation/models/entities/referral_project_facility.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_attributes.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';
import '../project_facility/project_facility.dart';
import '../sync/sync.dart';

// Bloc for handling inventory related operations
class HcmReferralReconBloc extends ReferralReconListener {
  // Class variables
  BuildContext context;
  final String userName;
  final String userId;
  final String tenantId;
  final ProjectModel selectedProject;
  final LocalRepository<HcmHFReferralModel, HcmHFReferralSearchModel>
      hfReferralLocalRepository;
  final LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceDefinitionLocalRepository;
  final LocalRepository<ServiceModel, ServiceSearchModel>
      serviceLocalRepository;

  // Constructor for the HcmReferralBloc
  HcmReferralReconBloc({
    required this.context,
    required this.userName,
    required this.userId,
    required this.tenantId,
    required this.selectedProject,
    required this.hfReferralLocalRepository,
    required this.serviceDefinitionLocalRepository,
    required this.serviceLocalRepository,
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
  Future<List<ReferralProjectFacilityModel>>
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

    List<ReferralProjectFacilityModel> hcmReferralProjectFacilityModel = [];
    facilitiesState.maybeWhen(
      fetched: (
        facilities,
      ) {
        for (var element in facilities) {
          hcmReferralProjectFacilityModel.add(
            ReferralProjectFacilityModel(
              id: element.id,
              facilityId: element.facilityId,
              nonRecoverableError: element.nonRecoverableError,
              rowVersion: element.rowVersion,
              tenantId: element.tenantId,
            ),
          );
        }
      },
      orElse: () {},
    );

    return hcmReferralProjectFacilityModel;
  }

  // Fetch service definitions
  @override
  Future<List<ReferralReconServiceDefinitionModel>> fetchServiceDefinitions(
      String code) async {
    final selectedServiceDefinition = await serviceDefinitionLocalRepository
        .search(ServiceDefinitionSearchModel(tenantId: tenantId, code: [
      '${selectedProject.name}.$code.${RolesType.healthFacilityWorker.toValue()}'
    ]));
    return selectedServiceDefinition
        .map((e) => ReferralReconServiceDefinitionModel(
            id: e.id,
            tenantId: e.tenantId,
            code: e.code,
            attributes: e.attributes
                ?.map((a) => ReferralReconAttributesModel(
                      id: a.id,
                      code: a.code,
                      tenantId: a.tenantId,
                      isActive: a.isActive,
                      dataType: a.dataType,
                      referenceId: a.referenceId,
                      required: a.required,
                      values: a.values,
                      order: a.order,
                      regex: a.regex,
                    ))
                .toList()))
        .toList();
  }

  // Save referral reconciliation details
  @override
  Future<void> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    await hfReferralLocalRepository.create(HcmHFReferralModel(
      hFReferral: saveReferralReconciliation.hfReferralModel,
      additionalFields:
          getAdditionalData(saveReferralReconciliation.additionalData),
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
      ),
    ));
  }

  // Save service request details
  @override
  Future<void> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    await serviceLocalRepository.create(ServiceModel(
        clientId: saveServiceRequest.serviceModel.clientId,
        isActive: saveServiceRequest.serviceModel.isActive,
        tenantId: envConfig.variables.tenantId,
        serviceDefId: saveServiceRequest.serviceModel.serviceDefId,
        rowVersion: 1,
        accountId: context.projectId,
        additionalDetails: context.boundary.code,
        createdAt: DigitDateUtils.getDateFromTimestamp(
          DateTime.now().toLocal().millisecondsSinceEpoch,
          dateFormat: "dd/MM/yyyy hh:mm a",
        ),
        auditDetails: AuditDetails(
          createdTime: DateTime.now().millisecondsSinceEpoch,
          createdBy: context.loggedInUserUuid,
          lastModifiedBy: context.loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        clientAuditDetails: ClientAuditDetails(
          createdTime: DateTime.now().millisecondsSinceEpoch,
          createdBy: context.loggedInUserUuid,
          lastModifiedBy: context.loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        )));
  }

  // Fetch referral reconciliations
  @override
  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation) async {
    List<HcmHFReferralModel> beneficiaries =
        await hfReferralLocalRepository.search(
      HcmHFReferralSearchModel(
        hFReferral: HFReferralSearchModel(
          projectId: context.projectId,
          beneficiaryId: searchReferralReconciliation.tag,
        ),
      ),
    );

    return beneficiaries
        .map((e) => ReferralReconciliation(
            hfReferralModel: e.hFReferral!,
            additionalData: jsonDecode(e.additionalFields!.toJson())))
        .toList();
  }

  // Fetch service request for recorded referral
  @override
  Future<List<ReferralReconServiceModel>>
      fetchServiceRequestForRecordedReferral(
          ReferralReconServiceSearchModel serviceSearchModel) async {
    final results = await serviceLocalRepository
        .search(ServiceSearchModel(clientId: serviceSearchModel.clientId));

    return results
        .map((e) => ReferralReconServiceModel(
            id: e.id,
            clientId: e.clientId,
            serviceDefId: e.serviceDefId,
            accountId: e.accountId,
            tenantId: e.tenantId,
            attributes: e.attributes
                ?.map((a) => ReferralReconServiceAttributesModel(
                      clientReferenceId: a.clientReferenceId,
                      attributeCode: a.attributeCode,
                      dataType: a.dataType,
                      value: a.value,
                      referenceId: a.referenceId,
                      tenantId: a.tenantId,
                      rowVersion: a.rowVersion,
                      additionalDetails: a.additionalDetails,
                      nonRecoverableError: a.nonRecoverableError,
                    ))
                .toList()))
        .toList();
  }
}
