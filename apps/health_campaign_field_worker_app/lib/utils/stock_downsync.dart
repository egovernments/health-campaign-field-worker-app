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

  bool _isRunning = false;

  StockDownsyncService({
    required this.localSecureStore,
    required this.projectFacilityLocalRepository,
    required this.facilityLocalRepository,
    required this.stockRemoteRepository,
    required this.stockLocalRepository,
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

      final projectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [context.selectedProject.id]),
      );

      final allFacilities = await facilityLocalRepository.search(
        FacilitySearchModel(),
      );

      Map<String, String> facilityIdUsageMap = {};

      for (var element in allFacilities) {
        facilityIdUsageMap[element.id] = element.usage ?? "";
      }

      final boundaryType = context.selectedProject.address?.boundaryType;

      if (userRoles.contains(RolesType.healthFacilitySupervisor.toValue())) {
        List<String> receiverIds =
            projectFacilities.map((e) => e.facilityId).toList();

        // receiverIds = receiverIds
        //     .where((e) => facilityIdUsageMap[e] == Constants.healthFacility)
        //     .toList();

        await _processStock(receiverIds, lastChangedSince);
      } else if (userRoles.contains(RolesType.warehouseManager.toValue())) {
        List<String> receiverIds =
            projectFacilities.map((e) => e.facilityId).toList();

        // receiverIds = receiverIds
        //     .where((e) => facilityIdUsageMap[e] == Constants.lgaFacility)
        //     .toList();

        await _processStock(receiverIds, lastChangedSince);
      } else if (userRoles.contains(RolesType.communityDistributor.toValue())) {
        final receiverIds = [userObject.uuid];

        await _processStock(receiverIds, lastChangedSince);
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
  Future<void> _processStock(
      List<String> receiverIds, int? lastChangedSince) async {
    if (receiverIds.isEmpty) return;

    final stockSearchModel = StockSearchModel(
      receiverId: receiverIds,
      transactionType: [TransactionType.dispatched.toValue()],
    );

    final stockEntries = await stockRemoteRepository.search(
      stockSearchModel,
      limit: 10,
      offSet: 0,
      lastChangedSince: lastChangedSince,
    );

    if (stockEntries.isNotEmpty) {
      await stockLocalRepository.bulkCreate(stockEntries);
    }
  }
}
