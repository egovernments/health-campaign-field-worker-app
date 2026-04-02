import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../utils/stock_calculation_utils.dart';
import '../utils/utils.dart';

/// Executor that maintains running stock balances in UserAction records.
///
/// When a stock transaction or task delivery occurs, this executor creates or
/// updates a UserAction record with the running stock balance for the
/// affected facility + product variant combination.
class StockBalanceExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_STOCK_BALANCE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    try {
      var entities = contextData['entities'];
      if (entities == null || entities is! List || entities.isEmpty) {
        // Fallback to existingModels (e.g., when accept flow only updates existing models)
        entities = contextData['existingModels'];
      }
      if (entities == null || entities is! List || entities.isEmpty) {
        debugPrint('UPDATE_STOCK_BALANCE: No entities found');
        return contextData;
      }

      final projectId = FlowBuilderSingleton().projectId;
      final boundaryCode = FlowBuilderSingleton().boundary?.code;

      if (projectId == null || boundaryCode == null) {
        debugPrint('UPDATE_STOCK_BALANCE: Missing projectId or boundaryCode');
        return contextData;
      }

      // Auto-detect entity type from the entities in contextData,
      // falling back to the action config property if present
      final hasStock = entities.any((e) => e is StockModel);
      final hasTask = entities.any((e) => e is TaskModel);
      final entityType = action.properties['entity'] as String?;

      if (hasStock || entityType == 'STOCK') {
        await _handleStockEntity(context, entities, projectId, boundaryCode);
      }
      if (hasTask || entityType == 'TASK') {
        await _handleTaskEntity(context, entities, projectId, boundaryCode);
      }
    } catch (e, stackTrace) {
      debugPrint('UPDATE_STOCK_BALANCE error: $e');
      debugPrint('Stack trace: $stackTrace');
    }

    return contextData;
  }

  Future<void> _handleStockEntity(
    BuildContext context,
    List<dynamic> entities,
    String projectId,
    String boundaryCode,
  ) async {
    final stockEntities = entities.whereType<StockModel>().toList();
    if (stockEntities.isEmpty) return;

    final userActionRepo = context.read<UserActionLocalRepository>();

    for (final stock in stockEntities) {
      final productVariantId = stock.productVariantId;
      if (productVariantId == null) continue;

      // Determine the facility this stock affects
      // For received stock, the facility is the receiver
      // For dispatched/loss/damaged stock, the facility is the sender
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      String? facilityId;
      if (transactionType == 'RECEIVED') {
        facilityId = stock.receiverId;
      } else {
        facilityId = stock.senderId;
      }

      if (facilityId == null) continue;

      await _updateStockBalance(
        context: context,
        userActionRepo: userActionRepo,
        facilityId: facilityId,
        productVariantId: productVariantId,
        projectId: projectId,
        boundaryCode: boundaryCode,
      );
    }
  }

  Future<void> _handleTaskEntity(
    BuildContext context,
    List<dynamic> entities,
    String projectId,
    String boundaryCode,
  ) async {
    final taskEntities = entities.whereType<TaskModel>().toList();
    if (taskEntities.isEmpty) return;

    final userActionRepo = context.read<UserActionLocalRepository>();

    for (final task in taskEntities) {
      final resources = task.resources;
      if (resources == null || resources.isEmpty) continue;

      for (final resource in resources) {
        final productVariantId = resource.productVariantId;
        if (productVariantId == null) continue;

        // For task delivery, the facility is the current user's facility
        // Get facility from project facilities
        final projectFacilityRepo = context.read<
            LocalRepository<ProjectFacilityModel,
                ProjectFacilitySearchModel>>();
        final projectFacilities = await projectFacilityRepo.search(
          ProjectFacilitySearchModel(projectId: [projectId]),
        );

        if (projectFacilities.isEmpty) continue;

        // Use the first facility (or find the relevant one)
        final facilityId = projectFacilities.first.facilityId;

        await _updateStockBalance(
          context: context,
          userActionRepo: userActionRepo,
          facilityId: facilityId,
          productVariantId: productVariantId,
          projectId: projectId,
          boundaryCode: boundaryCode,
        );
      }
    }
  }

  Future<void> _updateStockBalance({
    required BuildContext context,
    required UserActionLocalRepository userActionRepo,
    required String facilityId,
    required String productVariantId,
    required String projectId,
    required String boundaryCode,
  }) async {
    final balanceKey = 'stock_balance_${facilityId}_$productVariantId';

    // Search for existing stock balance UserAction
    final existingBalances = await userActionRepo.search(
      UserActionSearchModel(
        clientReferenceId: [balanceKey],
      ),
    );

    // Calculate the current balance from stock transactions
    final stockRepo =
        context.read<LocalRepository<StockModel, StockSearchModel>>();

    final receivedStocks = await stockRepo.search(
      StockSearchModel(receiverId: facilityId),
    );
    final sentStocks = await stockRepo.search(
      StockSearchModel(senderId: facilityId),
    );

    // Deduplicate by clientReferenceId
    final allStocksMap = <String, StockModel>{};
    for (final stock in receivedStocks) {
      allStocksMap[stock.clientReferenceId] = stock;
    }
    for (final stock in sentStocks) {
      allStocksMap[stock.clientReferenceId] = stock;
    }
    final allStocks = allStocksMap.values.toList();

    final metrics = StockCalculationUtils.calculateStockMetrics(
      stockList: allStocks,
      facilityId: facilityId,
      productId: productVariantId,
    );
    final balance = metrics['stockInHand'] ?? 0.0;

    final now = DateTime.now().millisecondsSinceEpoch;
    final loggedInUserUuid = FlowBuilderSingleton().loggedInUserUuid ?? '';
    final existing =
        existingBalances.isNotEmpty ? existingBalances.first : null;

    final balanceAction = UserActionModel(
      clientReferenceId: balanceKey,
      action: 'STOCK_BALANCE',
      projectId: projectId,
      boundaryCode: boundaryCode,
      latitude: 0.0,
      longitude: 0.0,
      locationAccuracy: 0.0,
      isSync: false,
      timestamp: now,
      id: existing?.id,
      rowVersion: existing?.rowVersion,
      tenantId: existing?.tenantId ?? context.selectedProject.tenantId,
      nonRecoverableError: false,
      additionalFields: UserActionAdditionalFields(
        version: 1,
        fields: [
          AdditionalField('balance', balance.toString()),
          AdditionalField('facilityId', facilityId),
          AdditionalField('productVariantId', productVariantId),
        ],
      ),
      // auditDetails is required for oplog creation — must not be null
      auditDetails: existing?.auditDetails ??
          AuditDetails(
            createdBy: loggedInUserUuid,
            createdTime: now,
          ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: existing?.clientAuditDetails?.createdBy ?? loggedInUserUuid,
        createdTime: existing?.clientAuditDetails?.createdTime ?? now,
        lastModifiedBy: loggedInUserUuid,
        lastModifiedTime: now,
      ),
    );

    if (existing != null) {
      await userActionRepo.update(balanceAction);
    } else {
      await userActionRepo.create(balanceAction);
    }

    debugPrint(
      'UPDATE_STOCK_BALANCE: Updated balance for $facilityId/$productVariantId = $balance',
    );
  }
}
