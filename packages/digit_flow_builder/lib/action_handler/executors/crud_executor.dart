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
    debugPrint('CREATE_EVENT: ========== STARTING ==========');
    debugPrint('CREATE_EVENT: contextData keys: ${contextData.keys.toList()}');

    // Check applyIf condition before executing
    final applyIf = action.properties['applyIf'] as String?;
    debugPrint('CREATE_EVENT: applyIf condition: $applyIf');

    if (applyIf != null) {
      final navigation =
          contextData['navigation'] as Map<String, dynamic>? ?? {};
      debugPrint('CREATE_EVENT: navigation params: $navigation');

      final resolveContext = {'navigation': navigation, ...contextData};

      if (!_evaluateCondition(applyIf, resolveContext)) {
        debugPrint('CREATE_EVENT: Skipping - condition not met: $applyIf');
        return contextData;
      }
      debugPrint('CREATE_EVENT: Condition met, proceeding with create');
    }

    final entities = contextData['entities'];
    if (entities == null || (entities is List && entities.isEmpty)) {
      debugPrint('CREATE_EVENT: No entities to create');
      return contextData;
    }

    debugPrint('CREATE_EVENT: Creating ${entities is List ? entities.length : 1} entities');
    context.read<CrudBloc>().add(CrudEventCreate(entities: entities));
    return contextData;
  }

  /// Evaluate condition like "navigation.isUpdate!=true"
  bool _evaluateCondition(String condition, Map<String, dynamic> context) {
    try {
      final isNotEqual = condition.contains('!=');
      final isEqual = condition.contains('==');

      if (!isEqual && !isNotEqual) return false;

      final separator = isNotEqual ? '!=' : '==';
      final parts = condition.split(separator);

      if (parts.length != 2) return false;

      final leftPath = parts[0].trim();
      final rightValue = parts[1].trim().toLowerCase();

      // Resolve left path
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

      final leftValue = value?.toString().toLowerCase() ?? '';

      debugPrint(
          'CREATE_EVENT: Condition check - "$leftValue" ${isNotEqual ? '!=' : '=='} "$rightValue"');

      return isNotEqual ? leftValue != rightValue : leftValue == rightValue;
    } catch (e) {
      debugPrint('CREATE_EVENT: Error evaluating condition: $e');
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
/// 3. Change detection: compares entities with existingModels and only updates changed ones
class UpdateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // Support 'source' property to pick which entities to update
    // Default: 'entities' (the transformed entities)
    // 'existingModels': use the original entities (e.g., to mark original stock as accepted)
    final source = action.properties['source'] as String? ?? 'entities';
    final entities = contextData[source];
    if (entities == null || entities is! List || entities.isEmpty) {
      debugPrint('UPDATE_EVENT: No entities found in contextData[$source]');
      return contextData;
    }

    // Get existing models for change comparison
    final existingModels = contextData['existingModels'] as List<dynamic>?;
    final existingModelsList = existingModels?.whereType<EntityModel>().toList() ?? [];

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
    // Also supports deeper paths for additionalFields:
    //   "EntityType.additionalFields.fields.fieldKey" adds/updates a field in additionalFields
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
    final processedEntities = <EntityModel>[];

    for (final entity in entityList) {
      final entityType = getEntityTypeName(entity);
      final clientAudit = entity.clientAuditDetails;

      final updatedClientAudit = clientAudit?.copyWith(
        lastModifiedBy: FlowBuilderSingleton().loggedInUserUuid,
        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
      );

      EntityModel updatedEntity = entity;

      // Check if there are field updates for this entity type
      if (modifyMap.isNotEmpty) {
        final entityUpdates = <String, dynamic>{};
        final additionalFieldUpdates = <String, dynamic>{};

        for (final entry in modifyMap.entries) {
          final parts = entry.key.split('.');
          if (parts.length == 2 && parts[0] == entityType) {
            // Simple: "EntityType.fieldName"
            entityUpdates[parts[1]] = entry.value;
          } else if (parts.length == 4 &&
              parts[0] == entityType &&
              parts[1] == 'additionalFields' &&
              parts[2] == 'fields') {
            // Deep: "EntityType.additionalFields.fields.fieldKey"
            additionalFieldUpdates[parts[3]] = entry.value;
          }
        }

        if (entityUpdates.isNotEmpty || additionalFieldUpdates.isNotEmpty) {
          debugPrint(
              'UPDATE_EVENT: Applying updates to $entityType: $entityUpdates, additionalFields: $additionalFieldUpdates');

          // Convert entity to map, apply updates, recreate entity
          final entityMap = entity.toMap();
          entityUpdates.forEach((key, value) {
            entityMap[key] = value;
          });

          // Merge additional field updates into existing additionalFields
          if (additionalFieldUpdates.isNotEmpty) {
            final existingAF = entityMap['additionalFields'];
            if (existingAF is Map<String, dynamic>) {
              final existingFields =
                  (existingAF['fields'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
              final updatedFields = <Map<String, dynamic>>[];

              // Keep existing fields, replacing any with matching keys
              final updatedKeys = additionalFieldUpdates.keys.toSet();
              for (final field in existingFields) {
                if (!updatedKeys.contains(field['key'])) {
                  updatedFields.add(field);
                }
              }
              // Add new/updated fields
              for (final entry in additionalFieldUpdates.entries) {
                updatedFields.add({'key': entry.key, 'value': entry.value});
              }

              entityMap['additionalFields'] = {
                ...existingAF,
                'fields': updatedFields,
              };
            } else {
              // No existing additionalFields, create new
              entityMap['additionalFields'] = {
                'schema': entityType.replaceAll('Model', ''),
                'version': 1,
                'fields': additionalFieldUpdates.entries
                    .map((e) => {'key': e.key, 'value': e.value})
                    .toList(),
              };
            }
          }

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
            updatedEntity = factory(entityMap);
          }
        } else {
          // No field updates, just update audit
          updatedEntity = entity.copyWith(clientAuditDetails: updatedClientAudit);
        }
      } else {
        // No field updates, just update audit
        updatedEntity = entity.copyWith(clientAuditDetails: updatedClientAudit);
      }

      // Find the original entity of the same type for comparison
      final originalEntity = existingModelsList.isEmpty
          ? null
          : existingModelsList.cast<EntityModel?>().firstWhere(
              (e) => getEntityTypeName(e!) == entityType,
              orElse: () => null,
            );

      // If no original found, treat as changed (always update)
      if (originalEntity == null || _hasEntityChanged(originalEntity, updatedEntity)) {
        processedEntities.add(updatedEntity);
        debugPrint('UPDATE_EVENT: $entityType has changes - will be updated');
      } else {
        debugPrint('UPDATE_EVENT: $entityType has NO changes - skipping update');
      }
    }

    if (processedEntities.isEmpty) {
      debugPrint('UPDATE_EVENT: No entities have changes, skipping update');
      return contextData;
    }

    debugPrint('UPDATE_EVENT: Updating ${processedEntities.length} entities (${entityList.length - processedEntities.length} unchanged)');
    context.read<CrudBloc>().add(CrudEventUpdate(entities: processedEntities));
    return contextData;
  }

  /// Compares two entities to check if actual data has changed.
  /// Excludes audit fields and rowVersion from comparison.
  bool _hasEntityChanged(EntityModel original, EntityModel updated) {
    final originalMap = original.toMap();
    final updatedMap = updated.toMap();

    // Fields to exclude from comparison (metadata that changes on every update)
    const excludeFields = {
      'clientAuditDetails',
      'auditDetails',
      'rowVersion',
      'lastModifiedBy',
      'lastModifiedTime',
      'createdBy',
      'createdTime',
    };

    // Compare all fields except excluded ones
    final allKeys = <String>{
      ...originalMap.keys,
      ...updatedMap.keys,
    }..removeAll(excludeFields);

    for (final key in allKeys) {
      final originalValue = originalMap[key];
      final updatedValue = updatedMap[key];

      if (!_deepEquals(originalValue, updatedValue)) {
        debugPrint(
            'UPDATE_EVENT: Field "$key" changed: $originalValue -> $updatedValue');
        return true;
      }
    }

    return false;
  }

  /// Deep equality check for nested maps and lists
  bool _deepEquals(dynamic a, dynamic b) {
    if (a == b) return true;
    if (a == null || b == null) return false;
    if (a.runtimeType != b.runtimeType) return false;

    if (a is Map && b is Map) {
      if (a.length != b.length) return false;
      for (final key in a.keys) {
        if (!b.containsKey(key)) return false;
        if (!_deepEquals(a[key], b[key])) return false;
      }
      return true;
    }

    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (!_deepEquals(a[i], b[i])) return false;
      }
      return true;
    }

    return a == b;
  }
}
