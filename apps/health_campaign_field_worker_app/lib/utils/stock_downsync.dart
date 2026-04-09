import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:flutter/material.dart';

import '../blocs/localization/app_localization.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../models/entities/roles_type.dart';
import '../models/entities/transaction_type.dart';
import 'extensions/extensions.dart';
import 'i18_key_constants.dart' as i18;

class StockDownsyncService {
  final LocalSecureStore localSecureStore;

  final LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>
      projectFacilityLocalRepository;

  final LocalRepository<FacilityModel, FacilitySearchModel>
      facilityLocalRepository;

  final RemoteRepository<StockModel, StockSearchModel> stockRemoteRepository;

  final LocalRepository<StockModel, StockSearchModel> stockLocalRepository;

  final LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>
      projectResourceLocalRepository;

  bool _isRunning = false;

  StockDownsyncService({
    required this.localSecureStore,
    required this.projectFacilityLocalRepository,
    required this.facilityLocalRepository,
    required this.stockRemoteRepository,
    required this.stockLocalRepository,
    required this.projectResourceLocalRepository,
  });

  /// ======================================================
  /// PUBLIC METHOD
  /// ======================================================
  Future<void> execute(BuildContext context) async {
    if (_isRunning) return;
    _isRunning = true;

    final localizations = AppLocalizations.of(context);

    if (context.mounted) {
      DigitSyncDialog.show(
        context,
        type: DialogType.inProgress,
        label: localizations.translate(
          i18.home.stockSyncDataLabel,
        ),
        barrierDismissible: false,
      );
    }

    try {
      final userObject = await localSecureStore.userRequestModel;
      final userRoles = userObject!.roles.map((e) => e.code);

      final currentRunningCycle =
          _getCurrentRunningCycle(context.selectedProject);
      final lastChangedSince = currentRunningCycle?.startDate;

      final allProjectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [context.selectedProject.id]),
      );

      // Filter to only current level facilities
      final projectFacilities = allProjectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      // Get product variant IDs from project resources
      final projectResources = await projectResourceLocalRepository.search(
        ProjectResourceSearchModel(projectId: [context.selectedProject.id]),
      );
      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();

      if (userRoles.contains(RolesType.healthFacilitySupervisor.toValue())) {
        List<String> receiverIds =
            projectFacilities.map((e) => e.facilityId).toList();

        await _processStock(receiverIds, lastChangedSince, productVariantIds);
      } else if (userRoles.contains(RolesType.warehouseManager.toValue())) {
        List<String> receiverIds =
            projectFacilities.map((e) => e.facilityId).toList();

        await _processStock(receiverIds, lastChangedSince, productVariantIds);
      } else if (userRoles.contains(RolesType.distributor.toValue()) ||
          userRoles.contains(RolesType.communityDistributor.toValue())) {
        final receiverIds = [userObject.uuid];

        await _processStock(receiverIds, lastChangedSince, productVariantIds);
      }
    } catch (e) {
      rethrow;
    } finally {
      _isRunning = false;
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true)
            .popUntil((route) => route is! PopupRoute);
      }
    }
  }

  /// ======================================================
  /// CURRENT RUNNING CYCLE
  /// ======================================================
  ProjectCycle? _getCurrentRunningCycle(ProjectModel project) {
    final now = DateTime.now().millisecondsSinceEpoch;

    for (final cycle in project.additionalDetails?.projectType?.cycles ?? []) {
      final start = cycle.startDate ?? 0;
      final end = cycle.endDate ?? 0;

      if (now >= start && now <= end) {
        return cycle;
      }
    }

    return null;
  }

  /// ======================================================
  /// STOCK PROCESSING
  /// ======================================================
  Future<void> _processStock(List<String> receiverIds, int? lastChangedSince,
      List<String> productVariantIds) async {
    if (receiverIds.isEmpty) return;

    final stockSearchModel = StockSearchModel(
      receiverId: receiverIds.first,
      transactionType: [TransactionType.dispatched.toValue()],
      productVariantId: productVariantIds.isNotEmpty ? productVariantIds : null,
    );

    const limit = 10;
    int offSet = 0;

    while (true) {
      final stockEntries = await stockRemoteRepository.search(
        stockSearchModel,
        limit: limit,
        offSet: offSet,
        lastSyncedTime: lastChangedSince,
      );

      if (stockEntries.isNotEmpty) {
        await stockLocalRepository.bulkCreate(stockEntries);
      }

      if (stockEntries.length < limit) break;

      offSet += limit;
    }
  }
}
