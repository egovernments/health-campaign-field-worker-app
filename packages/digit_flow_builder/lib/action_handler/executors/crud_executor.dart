import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CREATE_EVENT action type
class CrudExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CREATE_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final navigation = contextData['navigation'] as Map<String, dynamic>? ?? {};
    debugPrint('CREATE_EVENT: navigation params: $navigation');
    debugPrint('CREATE_EVENT: isUpdate value: ${navigation['isUpdate']}');

    // Check applyIf condition if specified
    final applyIf = action.properties['applyIf'] as String?;
    if (applyIf != null) {
      final resolveContext = {'navigation': navigation, ...contextData};

      if (!_evaluateCondition(applyIf, resolveContext)) {
        debugPrint('CREATE_EVENT: Skipping - applyIf condition not met: $applyIf');
        return contextData;
      }
    }

    debugPrint('CREATE_EVENT: Executing create with entities');
    final entities = contextData['entities'];
    context.read<CrudBloc>().add(CrudEventCreate(entities: entities));
    return contextData;
  }

  /// Evaluate a simple condition like "navigation.isUpdate!=true"
  bool _evaluateCondition(String condition, Map<String, dynamic> context) {
    try {
      final isNotEqual = condition.contains('!=');
      final isEqual = condition.contains('==');

      if (!isEqual && !isNotEqual) {
        return false;
      }

      final separator = isNotEqual ? '!=' : '==';
      final parts = condition.split(separator);

      if (parts.length != 2) {
        return false;
      }

      final leftPath = parts[0].trim();
      final rightValue = parts[1].trim();

      final pathParts = leftPath.split('.');
      dynamic value = context;

      for (final part in pathParts) {
        if (value is Map && value.containsKey(part)) {
          value = value[part];
        } else {
          value = null;
          break;
        }
      }

      final leftValue = value?.toString() ?? '';

      if (isNotEqual) {
        return leftValue != rightValue;
      } else {
        return leftValue == rightValue;
      }
    } catch (e) {
      debugPrint('CREATE_EVENT: Error evaluating condition "$condition": $e');
      return false;
    }
  }
}

/// Executor for UPDATE_EVENT action type
///
/// Supports:
/// 1. Basic update: updates all entities in contextData['entities']
/// 2. Filtered update with field overrides:
///    ```json
///    {
///      "actionType": "UPDATE_EVENT",
///      "properties": {
///        "entity": "HouseholdModel, TaskModel",
///        "modify": [
///          {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
///        ]
///      }
///    }
///    ```
class UpdateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final navigation =
        contextData['navigation'] as Map<String, dynamic>? ?? {};
    debugPrint('UPDATE_EVENT: navigation params: $navigation');

    // Check applyIf condition if specified
    final applyIf = action.properties['applyIf'] as String?;
    if (applyIf != null) {
      final resolveContext = {'navigation': navigation, ...contextData};

      if (!_evaluateCondition(applyIf, resolveContext)) {
        debugPrint(
            'UPDATE_EVENT: Skipping - applyIf condition not met: $applyIf');
        return contextData;
      }
    }

    final entities = contextData['entities'];
    if (entities == null || entities is! List || entities.isEmpty) {
      debugPrint('UPDATE_EVENT: No entities found in contextData');
      return contextData;
    }

    // Cast List<dynamic> to List<EntityModel>
    var entityList = entities.whereType<EntityModel>().toList();
    if (entityList.isEmpty) {
      debugPrint('UPDATE_EVENT: No valid EntityModel instances found');
      return contextData;
    }

    // Check if entity filter is specified
    final entityFilter = action.properties['entity'] as String?;
    if (entityFilter != null && entityFilter.isNotEmpty) {
      final allowedTypes = entityFilter
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toSet();

      entityList = entityList
          .where((e) => allowedTypes.contains(getEntityTypeName(e)))
          .toList();

      debugPrint(
          'UPDATE_EVENT: Filtered to ${entityList.length} entities of types: $allowedTypes');
    }

    if (entityList.isEmpty) {
      debugPrint('UPDATE_EVENT: No entities after filtering');
      return contextData;
    }

    // Parse modify array: [{"key": "EntityType.fieldName", "value": "..."}]
    final modifyList = action.properties['modify'] as List<dynamic>?;
    final modifyMap = <String, dynamic>{};
    if (modifyList != null) {
      for (final modify in modifyList) {
        if (modify is Map<String, dynamic>) {
          final key = modify['key'] as String?;
          final value = modify['value'];
          if (key != null) {
            modifyMap[key] = value;
          }
        }
      }
    }

    // Update audit fields and apply field updates for each entity
    final updatedEntities = entityList.map((entity) {
      final entityType = getEntityTypeName(entity);
      final clientAudit = entity.clientAuditDetails;

      final updatedClientAudit = clientAudit?.copyWith(
        lastModifiedBy: FlowBuilderSingleton().loggedInUserUuid,
        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
      );

      // Check if there are field updates for this entity type
      if (modifyMap.isNotEmpty) {
        final entityUpdates = <String, dynamic>{};

        for (final entry in modifyMap.entries) {
          // Parse "EntityType.fieldName" format
          final parts = entry.key.split('.');
          if (parts.length == 2 && parts[0] == entityType) {
            entityUpdates[parts[1]] = entry.value;
          }
        }

        if (entityUpdates.isNotEmpty) {
          debugPrint(
              'UPDATE_EVENT: Applying updates to $entityType: $entityUpdates');

          // Convert entity to map, apply updates, recreate entity
          final entityMap = entity.toMap();
          entityUpdates.forEach((key, value) {
            entityMap[key] = value;
          });

          // Update clientAuditDetails in map
          if (updatedClientAudit != null) {
            entityMap['clientAuditDetails'] = {
              'createdBy': updatedClientAudit.createdBy,
              'createdTime': updatedClientAudit.createdTime,
              'lastModifiedBy': updatedClientAudit.lastModifiedBy,
              'lastModifiedTime': updatedClientAudit.lastModifiedTime,
            };
          }

          // Recreate entity using model factory
          final factory = DataConverterSingleton()
              .dynamicEntityModelListener
              ?.modelFactoryRegistry[entityType];

          if (factory != null) {
            return factory(entityMap);
          }
        }
      }

      // No field updates, just update audit
      return entity.copyWith(clientAuditDetails: updatedClientAudit);
    }).toList();

    debugPrint('UPDATE_EVENT: Updating ${updatedEntities.length} entities');
    context.read<CrudBloc>().add(CrudEventUpdate(entities: updatedEntities));
    return contextData;
  }

  /// Evaluate a simple condition like "navigation.isUpdate==true"
  bool _evaluateCondition(String condition, Map<String, dynamic> context) {
    try {
      final isNotEqual = condition.contains('!=');
      final isEqual = condition.contains('==');

      if (!isEqual && !isNotEqual) {
        return false;
      }

      final separator = isNotEqual ? '!=' : '==';
      final parts = condition.split(separator);

      if (parts.length != 2) {
        return false;
      }

      final leftPath = parts[0].trim();
      final rightValue = parts[1].trim();

      final pathParts = leftPath.split('.');
      dynamic value = context;

      for (final part in pathParts) {
        if (value is Map && value.containsKey(part)) {
          value = value[part];
        } else {
          value = null;
          break;
        }
      }

      final leftValue = value?.toString() ?? '';

      if (isNotEqual) {
        return leftValue != rightValue;
      } else {
        return leftValue == rightValue;
      }
    } catch (e) {
      debugPrint('UPDATE_EVENT: Error evaluating condition "$condition": $e');
      return false;
    }
  }
}
