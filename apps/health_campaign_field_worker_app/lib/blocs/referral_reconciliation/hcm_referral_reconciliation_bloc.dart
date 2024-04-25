// Import statements
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_attributes.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../models/entities/hcm_hf_referral.dart';
import '../../models/entities/project.dart';
import '../../models/entities/project_facility.dart';
import '../../models/entities/roles_type.dart';
import '../../models/entities/service.dart';
import '../../models/entities/service_attributes.dart';
import '../../models/entities/service_definition.dart';
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
      '${selectedProject.name}.HF_RF_$code.${RolesType.healthFacilityWorker.toValue()}'
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
  Future<bool> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    try {
      await hfReferralLocalRepository.create(HcmHFReferralModel(
        hFReferral: saveReferralReconciliation.hfReferralModel,
        additionalFields: HFReferralAdditionalFields(
          version: 1,
          fields: getAdditionalData(saveReferralReconciliation.additionalData),
        ),
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
      return true;
    } catch (e) {
      return false;
    }
  }

  // Save service request details
  @override
  Future<bool> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    try {
      await serviceLocalRepository.create(ServiceModel(
          clientId: saveServiceRequest.serviceModel.clientId,
          isActive: saveServiceRequest.serviceModel.isActive,
          tenantId: envConfig.variables.tenantId,
          serviceDefId: saveServiceRequest.serviceModel.serviceDefId,
          rowVersion: 1,
          accountId: context.projectId,
          attributes: saveServiceRequest.serviceModel.attributes
              ?.map((a) => ServiceAttributesModel(
                    clientReferenceId: a.clientReferenceId,
                    attributeCode: a.attributeCode,
                    value: a.value,
                    tenantId: a.tenantId,
                    additionalDetails: a.additionalDetails,
                    dataType: a.dataType,
                    referenceId: a.referenceId,
                  ))
              .toList(),
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
      return true;
    } catch (e) {
      return false;
    }
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
          name: searchReferralReconciliation.name,
          beneficiaryId: searchReferralReconciliation.tag,
        ),
      ),
    );

    return beneficiaries.map((e) {
      // Convert additionalFields to Iterable<MapEntry<String, dynamic>>
      Map<String, Object> additionalFieldsMap = e.additionalFields != null
          ? {for (var item in e.additionalFields!.fields) item.key: item.value}
          : {};

      return ReferralReconciliation(
          hfReferralModel: e.hFReferral!, additionalData: additionalFieldsMap);
    }).toList();
  }

  @override
  Future<ReferralReconServiceModel?> fetchSavedChecklist(
      ReferralReconServiceSearchModel reconServiceSearchModel) async {
    final selectedChecklist = await serviceLocalRepository
        .search(ServiceSearchModel(clientId: reconServiceSearchModel.clientId));
    return selectedChecklist.isNotEmpty
        ? ReferralReconServiceModel(
            clientId: selectedChecklist.first.clientId,
            serviceDefId: selectedChecklist.first.serviceDefId,
            accountId: selectedChecklist.first.accountId,
            createdAt: selectedChecklist.first.createdAt,
            tenantId: selectedChecklist.first.tenantId,
            attributes: selectedChecklist.first.attributes
                ?.map((e) => ReferralReconServiceAttributesModel(
                    clientReferenceId: e.clientReferenceId,
                    attributeCode: e.attributeCode,
                    value: e.value,
                    dataType: e.dataType,
                    referenceId: e.referenceId,
                    tenantId: e.tenantId,
                    rowVersion: e.rowVersion,
                    additionalDetails: e.additionalDetails,
                    nonRecoverableError: e.nonRecoverableError))
                .toList())
        : null;
  }
}
