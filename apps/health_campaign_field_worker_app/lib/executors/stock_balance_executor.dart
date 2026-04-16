import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../models/entities/roles_type.dart';
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

      debugPrint('UPDATE_STOCK_BALANCE: entities = ${entities?.length ?? 0}');
      debugPrint(
          'UPDATE_STOCK_BALANCE: entity type from action = ${action.properties['entity']}');

      if (projectId == null || boundaryCode == null) {
        debugPrint('UPDATE_STOCK_BALANCE: Missing projectId or boundaryCode');
        return contextData;
      }

      // Auto-detect entity type from the entities in contextData,
      // falling back to the action config property if present
      final hasStock = entities.any((e) => e is StockModel);
      final hasTask = entities.any((e) => e is TaskModel);
      final entityType = action.properties['entity'] as String?;

      debugPrint(
          'UPDATE_STOCK_BALANCE: hasStock=$hasStock, hasTask=$hasTask, entityType=$entityType');

      if (hasStock || entityType == 'STOCK') {
        await _handleStockEntity(context, entities, projectId, boundaryCode);
      }
      if (hasTask || entityType == 'TASK' || entityType == 'TaskModel') {
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

    final userRoles = context.loggedInUserRoles;
    debugPrint(
        '_handleStockEntity: userRoles = ${userRoles.map((r) => r.code).toList()}');
    debugPrint(
        '_handleStockEntity: looking for ${RolesType.distributor.toValue()}');
    final isDistributor =
        userRoles.any((role) => role.code == RolesType.distributor.toValue());
    debugPrint('_handleStockEntity: isDistributor = $isDistributor');

    final productQuantities = <String, double>{};
    for (final stock in stockEntities) {
      final productVariantId = stock.productVariantId;
      if (productVariantId == null) continue;
      final quantity = double.tryParse(stock.quantity ?? '0') ?? 0;
      productQuantities[productVariantId] =
          (productQuantities[productVariantId] ?? 0) + quantity;
    }

    String? facilityId;
    if (isDistributor) {
      facilityId = FlowBuilderSingleton().loggedInUserUuid;
    } else {
      facilityId = stockEntities.first.facilityId;
    }

    if (facilityId == null) return;

    for (final entry in productQuantities.entries) {
      await _updateStockBalanceFromStock(
        context: context,
        userActionRepo: userActionRepo,
        facilityId: facilityId,
        productVariantId: entry.key,
        projectId: projectId,
        boundaryCode: boundaryCode,
        isDistributor: isDistributor,
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
    debugPrint('_handleTaskEntity: taskEntities = ${taskEntities.length}');
    if (taskEntities.isEmpty) {
      debugPrint('_handleTaskEntity: No task entities found');
      return;
    }

    final userActionRepo = context.read<UserActionLocalRepository>();

    // Check if user is a distributor
    final isDistributor = context.loggedInUserRoles.any((role) =>
        role.code == RolesType.distributor.toValue() ||
        role.code == RolesType.communityDistributor.toValue());
    debugPrint('_handleTaskEntity: isDistributor = $isDistributor');

    // Aggregate delivered quantities by product variant
    final deliveredQuantities = <String, double>{};

    for (final task in taskEntities) {
      final resources = task.resources;
      debugPrint(
          '_handleTaskEntity: task has ${resources?.length ?? 0} resources');
      if (resources == null || resources.isEmpty) continue;

      // Only count delivered resources
      for (final resource in resources) {
        debugPrint(
            '_handleTaskEntity: resource.isDelivered = ${resource.isDelivered}, quantity = ${resource.quantity}');
        if (resource.isDelivered != true) continue;

        final productVariantId = resource.productVariantId;
        if (productVariantId == null) continue;

        final quantity = double.tryParse(resource.quantity ?? '0') ?? 0;
        deliveredQuantities[productVariantId] =
            (deliveredQuantities[productVariantId] ?? 0) + quantity;
      }
    }

    debugPrint('_handleTaskEntity: deliveredQuantities = $deliveredQuantities');

    // Determine facility ID
    String? facilityId;
    if (isDistributor) {
      facilityId = FlowBuilderSingleton().loggedInUserUuid;
    } else {
      final projectFacilityRepo =
          context.read<ProjectFacilityLocalRepository>();

      final projectFacilities = await projectFacilityRepo.search(
        ProjectFacilitySearchModel(projectId: [projectId]),
      );

      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      if (currentFacilities.isNotEmpty) {
        facilityId = currentFacilities.first.facilityId;
      }
    }

    if (facilityId == null) {
      debugPrint(
          '_handleTaskEntity: facilityId is null, skipping balance update');
      return;
    }

    debugPrint('_handleTaskEntity: facilityId = $facilityId');

    // Update balance for each delivered product
    for (final entry in deliveredQuantities.entries) {
      debugPrint(
          '_handleTaskEntity: Updating balance for ${entry.key} with delivered quantity ${entry.value}');
      await _updateStockBalanceFromDelivery(
        context: context,
        userActionRepo: userActionRepo,
        facilityId: facilityId,
        productVariantId: entry.key,
        deliveredQuantity: entry.value,
        projectId: projectId,
        boundaryCode: boundaryCode,
        isDistributor: isDistributor,
      );
    }
  }

  Future<void> _updateStockBalanceFromDelivery({
    required BuildContext context,
    required UserActionLocalRepository userActionRepo,
    required String facilityId,
    required String productVariantId,
    required double deliveredQuantity,
    required String projectId,
    required String boundaryCode,
    required bool isDistributor,
  }) async {
    final balanceKey = generateBalanceKey(facilityId, productVariantId);

    final existingBalances = await userActionRepo.search(
      UserActionSearchModel(
        clientReferenceId: [balanceKey],
      ),
    );

    // Calculate the current balance from stock transactions
    final stockRepo =
        context.read<LocalRepository<StockModel, StockSearchModel>>();

    // For distributors: search by receiverId (user UUID)
    // For warehouse managers: search by both receiverId and senderId (facility IDs)
    List<StockModel> receivedStocks = [];
    List<StockModel> sentStocks = [];

    if (isDistributor) {
      // Distributors: use receiverId (their user UUID) to find received stocks
      // and senderId to find returned/dispatched stocks
      receivedStocks = await stockRepo.search(
        StockSearchModel(receiverId: facilityId),
      );
      sentStocks = await stockRepo.search(
        StockSearchModel(senderId: facilityId),
      );
    } else {
      // Warehouse managers: use both receiverId and senderId (facility IDs)
      receivedStocks = await stockRepo.search(
        StockSearchModel(receiverId: facilityId),
      );
      sentStocks = await stockRepo.search(
        StockSearchModel(senderId: facilityId),
      );
    }

    debugPrint(
        '_updateStockBalanceFromDelivery: receivedStocks=${receivedStocks.length}, sentStocks=${sentStocks.length}');

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
      isDistributor: isDistributor,
    );

    debugPrint('_updateStockBalanceFromDelivery: metrics=$metrics');
    debugPrint(
        '_updateStockBalanceFromDelivery: stockInHand from transactions = ${metrics['stockInHand'] ?? 0.0}');

    // Current stock in hand from transactions, minus delivered quantity
    final stockInHand = (metrics['stockInHand'] ?? 0.0) - deliveredQuantity;
    debugPrint(
        '_updateStockBalanceFromDelivery: final stockInHand = $stockInHand (after subtracting deliveredQuantity=$deliveredQuantity)');

    final now = DateTime.now().millisecondsSinceEpoch;
    final loggedInUserUuid = FlowBuilderSingleton().loggedInUserUuid ?? '';
    final existing =
        existingBalances.isNotEmpty ? existingBalances.first : null;

    final existingBalanceField = existing?.additionalFields?.fields
        ?.firstWhereOrNull((f) => f.key == 'balance');
    debugPrint(
        '_updateStockBalanceFromDelivery: existing balance = ${existingBalanceField?.value}');

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
          AdditionalField('balance', stockInHand.toString()),
          AdditionalField('facilityId', facilityId),
          AdditionalField('productVariantId', productVariantId),
          AdditionalField('deliveredQuantity', deliveredQuantity.toString()),
        ],
      ),
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
      'UPDATE_STOCK_BALANCE: Updated balance for $facilityId/$productVariantId = $stockInHand (delivered: $deliveredQuantity)',
    );
  }

  Future<void> _updateStockBalanceFromStock({
    required BuildContext context,
    required UserActionLocalRepository userActionRepo,
    required String facilityId,
    required String productVariantId,
    required String projectId,
    required String boundaryCode,
    bool isDistributor = false,
  }) async {
    final balanceKey = generateBalanceKey(facilityId, productVariantId);

    final existingBalances = await userActionRepo.search(
      UserActionSearchModel(clientReferenceId: [balanceKey]),
    );

    final stockRepo =
        context.read<LocalRepository<StockModel, StockSearchModel>>();

    List<StockModel> receivedStocks = [];
    List<StockModel> sentStocks = [];

    if (isDistributor) {
      receivedStocks =
          await stockRepo.search(StockSearchModel(receiverId: facilityId));
      sentStocks =
          await stockRepo.search(StockSearchModel(senderId: facilityId));
    } else {
      receivedStocks =
          await stockRepo.search(StockSearchModel(receiverId: facilityId));
      sentStocks =
          await stockRepo.search(StockSearchModel(senderId: facilityId));
    }

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
      isDistributor: isDistributor,
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
      auditDetails: existing?.auditDetails ??
          AuditDetails(createdBy: loggedInUserUuid, createdTime: now),
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
  }
}
