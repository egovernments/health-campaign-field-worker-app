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
  String _getLoggedInUserUuid(BuildContext context) {
    final flowBuilderUuid = FlowBuilderSingleton().loggedInUserUuid;
    final String? contextUuid = _tryGetContextUuid(context);
    final result = flowBuilderUuid ?? contextUuid ?? '';

    return result;
  }

  String? _tryGetContextUuid(BuildContext context) {
    try {
      return context.loggedInUserUuid;
    } catch (_) {
      return null;
    }
  }

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
      final boundaryCode = FlowBuilderSingleton().selectedProject?.address?.boundary;

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
    final isDistributor =
        userRoles.any((role) => role.code == RolesType.distributor.toValue());

    final projectFacilityRepo = context.read<
        LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();

    final projectFacilities = await projectFacilityRepo.search(
      ProjectFacilitySearchModel(projectId: [projectId]),
    );

    // Filter to only include facilities where facilityLevel is 'current'
    final currentFacilities = projectFacilities.where((pf) {
      final facilityLevel = pf.additionalFields?.fields
          .where((f) => f.key == 'facilityLevel')
          .firstOrNull
          ?.value;
      return facilityLevel == null || facilityLevel == 'current';
    }).toList();

    String? facilityId;

    if (isDistributor) {
      facilityId = _getLoggedInUserUuid(context);
    } else {
      if (currentFacilities.isNotEmpty) {
        facilityId = currentFacilities.first.facilityId;
      } else {
        facilityId = stockEntities.first.facilityId;
      }
    }

    if (facilityId == null || facilityId.isEmpty) return;

    // Calculate the delta for each product variant based on transaction type
    final productDeltas = <String, double>{};
    for (final stock in stockEntities) {
      final productVariantId = stock.productVariantId;
      if (productVariantId == null) continue;

      final quantity = double.tryParse(stock.quantity ?? '0') ?? 0;
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final stockEntryType = _getStockEntryType(stock);
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      double delta = 0;

      // Determine if this is a distributor context
      final isDistributorReturn = isSender && stockEntryType == 'RETURNED';
      final isDistContext = isDistributor || isDistributorReturn;

      if (isDistContext) {
        // For distributors: received adds, everything else (issued, returned, lost, damaged, wastage) subtracts
        if (transactionType == 'RECEIVED' && isReceiver) {
          delta = quantity; // Add received stock
        } else if (stockEntryType == 'RETURNED' && isReceiver) {
          delta = quantity; // Add returned stock (coming back to distributor)
        } else if (stockEntryType == 'RETURNED' && isSender) {
          delta = -quantity; // Sent return (going out)
        } else {
          delta = -quantity; // All other transactions subtract
        }
      } else {
        // For non-distributors (warehouses, facilities)
        if (isReceiver && transactionType == 'RECEIVED') {
          delta = quantity; // Add received stock
        } else if (isReceiver &&
            transactionType == 'DISPATCHED' &&
            stock.additionalFields?.fields
                    ?.firstWhere((f) => f.key == 'status',
                        orElse: () => const AdditionalField('', ''))
                    .value ==
                'ACCEPTED') {
          delta = quantity; // Add accepted stock from dispatch
        } else if (isSender && transactionType == 'DISPATCHED') {
          delta = -quantity; // Subtract issued/dispatched stock
        } else if (isSender && stockEntryType == 'RETURNED') {
          delta = quantity; // Add returned stock (coming back)
        } else if (isSender && stockEntryType == 'LOSS') {
          delta = -quantity; // Subtract loss
        } else if (isSender && stockEntryType == 'DAMAGED') {
          delta = -quantity; // Subtract damaged
        }
      }

      productDeltas[productVariantId] =
          (productDeltas[productVariantId] ?? 0) + delta;
    }

    for (final entry in productDeltas.entries) {
      await _updateStockBalanceFromStock(
        context: context,
        userActionRepo: userActionRepo,
        facilityId: facilityId,
        productVariantId: entry.key,
        quantityDelta: entry.value,
        projectId: projectId,
        boundaryCode: boundaryCode,
        isDistributor: isDistributor,
      );
    }
  }

  String _getStockEntryType(StockModel stock) {
    final fields = stock.additionalFields?.fields;
    if (fields == null) return '';
    for (final field in fields) {
      if (field.key == 'stockEntryType') {
        return field.value?.toString().toUpperCase() ?? '';
      }
    }
    return '';
  }

  Future<void> _handleTaskEntity(
    BuildContext context,
    List<dynamic> entities,
    String projectId,
    String boundaryCode,
  ) async {
    final taskEntities = entities.whereType<TaskModel>().toList();
    if (taskEntities.isEmpty) {
      debugPrint('_handleTaskEntity: No task entities found');
      return;
    }

    final userActionRepo = context.read<UserActionLocalRepository>();

    final isDistributor = context.loggedInUserRoles.any((role) =>
        role.code == RolesType.distributor.toValue() ||
        role.code == RolesType.communityDistributor.toValue());

    final deliveredQuantities = <String, double>{};

    for (final task in taskEntities) {
      final resources = task.resources;
      if (resources == null || resources.isEmpty) continue;

      for (final resource in resources) {
        if (resource.isDelivered != true) continue;

        final productVariantId = resource.productVariantId;
        if (productVariantId == null) continue;

        final quantity = double.tryParse(resource.quantity ?? '0') ?? 0;
        deliveredQuantities[productVariantId] =
            (deliveredQuantities[productVariantId] ?? 0) + quantity;
      }
    }

    String? facilityId;
    if (isDistributor) {
      facilityId = _getLoggedInUserUuid(context);
    } else {
      final projectFacilityRepo = context.read<
          LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();

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

    if (facilityId == null || facilityId.isEmpty) {
      debugPrint(
          '_handleTaskEntity: facilityId is null, skipping balance update');
      return;
    }

    for (final entry in deliveredQuantities.entries) {
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
    final loggedInUserUuid = _getLoggedInUserUuid(context);
    final balanceKey = generateBalanceKey(facilityId, productVariantId);

    final existingBalances = await userActionRepo.search(
      UserActionSearchModel(clientReferenceId: [balanceKey]),
    );

    final existing =
        existingBalances.isNotEmpty ? existingBalances.first : null;

    // Get the current balance from UserAction (reflects all previous transactions including deliveries/returns)
    double currentBalance = 0.0;
    if (existing != null) {
      final existingBalanceField = existing.additionalFields?.fields
          ?.firstWhereOrNull((f) => f.key == 'balance');
      currentBalance =
          double.tryParse(existingBalanceField?.value ?? '0') ?? 0.0;
    }

    // deliveredQuantity can be positive (delivery) or negative (return)
    // For delivery: new balance = current - delivered
    // For return: new balance = current + |returned| (since returned quantity comes as negative)
    final stockInHand = currentBalance - deliveredQuantity;

    final now = DateTime.now().millisecondsSinceEpoch;

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
      'UPDATE_STOCK_BALANCE: Updated balance for $facilityId/$productVariantId = $stockInHand (current: $currentBalance, delivered: $deliveredQuantity, existing record: ${existing != null})',
    );
  }

  Future<void> _updateStockBalanceFromStock({
    required BuildContext context,
    required UserActionLocalRepository userActionRepo,
    required String facilityId,
    required String productVariantId,
    required String projectId,
    required String boundaryCode,
    required double quantityDelta,
    bool isDistributor = false,
  }) async {
    final loggedInUserUuid = _getLoggedInUserUuid(context);
    final balanceKey = generateBalanceKey(facilityId, productVariantId);

    final existingBalances = await userActionRepo.search(
      UserActionSearchModel(clientReferenceId: [balanceKey]),
    );

    final existing =
        existingBalances.isNotEmpty ? existingBalances.first : null;

    // Always use the UserAction balance as the authoritative source
    double currentBalance = 0.0;
    if (existing != null) {
      final existingBalanceField = existing.additionalFields?.fields
          ?.firstWhereOrNull((f) => f.key == 'balance');
      currentBalance =
          double.tryParse(existingBalanceField?.value ?? '0') ?? 0.0;
    }

    // Apply the transaction delta to the current balance
    final newBalance = currentBalance + quantityDelta;

    final now = DateTime.now().millisecondsSinceEpoch;

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
          AdditionalField('balance', newBalance.toString()),
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

    debugPrint(
      'UPDATE_STOCK_BALANCE: Updated balance for $facilityId/$productVariantId = $newBalance (previous: $currentBalance, delta: $quantityDelta, existing record: ${existing != null})',
    );
  }
}
