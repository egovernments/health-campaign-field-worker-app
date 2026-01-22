import 'dart:async';

import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for MERGE_UPDATE_ADDITIONAL_FIELDS action type
///
/// This executor:
/// 1. Searches for an existing entity by clientReferenceId
/// 2. Updates main entity fields and additionalFields
/// 3. Updates the entity in the database
///
/// Supports two modes for collecting additional fields:
/// - Explicit: Use "fieldsToMerge" with "fieldPrefix" to specify exact fields
/// - Dynamic: Use "collectFromPages" to automatically collect ALL non-null fields from specified pages
///
/// Example usage with explicit fields:
/// ```json
/// {
///   "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
///   "properties": {
///     "applyIf": "navigation.isUpdate==true",
///     "entityType": "HFReferralModel",
///     "clientReferenceId": "{{navigation.clientReferenceId}}",
///     "fieldsToMerge": ["referralCycle", "ageInMonths", "gender"],
///     "fieldPrefix": "referralDetails",
///     "mainFieldsToUpdate": [
///       {"entityField": "name", "formField": "nameOfChild"},
///       {"entityField": "beneficiaryId", "formField": "beneficiaryId"}
///     ]
///   }
/// }
/// ```
///
/// Example usage with dynamic collection:
/// ```json
/// {
///   "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
///   "properties": {
///     "applyIf": "navigation.isUpdate==true",
///     "entityType": "HFReferralModel",
///     "clientReferenceId": "{{navigation.clientReferenceId}}",
///     "collectFromPages": ["sideEffectFever", "sideEffectSick", "sideEffectFromCurrentCycle"]
///   }
/// }
/// ```
class MergeUpdateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) =>
      actionType == 'MERGE_UPDATE_ADDITIONAL_FIELDS';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final properties = action.properties;
    final entityType = properties['entityType'] as String?;
    final clientReferenceIdTemplate =
        properties['clientReferenceId'] as String?;
    final fieldsToMerge =
        (properties['fieldsToMerge'] as List<dynamic>?)?.cast<String>() ?? [];
    final fieldPrefix = properties['fieldPrefix'] as String?;
    final applyIf = properties['applyIf'] as String?;
    final mainFieldsToUpdate =
        (properties['mainFieldsToUpdate'] as List<dynamic>?)
                ?.cast<Map<String, dynamic>>() ??
            [];
    // Support dynamic collection from multiple pages
    final collectFromPages =
        (properties['collectFromPages'] as List<dynamic>?)?.cast<String>() ??
            [];

    debugPrint('MERGE_UPDATE: ========== STARTING ==========');
    debugPrint('MERGE_UPDATE: entityType: $entityType');
    debugPrint('MERGE_UPDATE: clientReferenceIdTemplate: $clientReferenceIdTemplate');
    debugPrint('MERGE_UPDATE: fieldsToMerge: $fieldsToMerge');
    debugPrint('MERGE_UPDATE: fieldPrefix: $fieldPrefix');
    debugPrint('MERGE_UPDATE: collectFromPages: $collectFromPages');
    debugPrint('MERGE_UPDATE: applyIf: $applyIf');
    debugPrint('MERGE_UPDATE: mainFieldsToUpdate: $mainFieldsToUpdate');

    // Check applyIf condition (e.g., "navigation.isUpdate==true")
    if (applyIf != null) {
      final navigation =
          contextData['navigation'] as Map<String, dynamic>? ?? {};
      final resolveContext = {'navigation': navigation, ...contextData};

      if (!_evaluateCondition(applyIf, resolveContext)) {
        debugPrint('MERGE_UPDATE: Skipping - condition not met: $applyIf');
        return contextData;
      }
    }

    if (entityType == null || clientReferenceIdTemplate == null) {
      debugPrint('MERGE_UPDATE: Missing entityType or clientReferenceId');
      return contextData;
    }

    // Resolve the clientReferenceId from navigation params
    final navigation =
        contextData['navigation'] as Map<String, dynamic>? ?? {};
    final clientReferenceId =
        _resolveTemplate(clientReferenceIdTemplate, navigation, contextData);

    if (clientReferenceId == null || clientReferenceId.isEmpty) {
      debugPrint('MERGE_UPDATE: Could not resolve clientReferenceId');
      return contextData;
    }

    debugPrint('MERGE_UPDATE: Searching for entity with clientReferenceId: $clientReferenceId');

    // Get CrudBloc before async operations
    final crudBloc = context.read<CrudBloc>();

    // Search for the existing entity
    final existingEntity = await _searchEntity(
      crudBloc,
      entityType,
      clientReferenceId,
    );

    if (existingEntity == null) {
      debugPrint('MERGE_UPDATE: No entity found');
      return contextData;
    }

    debugPrint('MERGE_UPDATE: Found entity: ${existingEntity.runtimeType}');

    // Get form data
    final formData = contextData['formData'] as Map<String, dynamic>? ?? {};

    debugPrint('MERGE_UPDATE: formData keys: ${formData.keys.toList()}');
    debugPrint('MERGE_UPDATE: fieldsToMerge: $fieldsToMerge');
    debugPrint('MERGE_UPDATE: fieldPrefix: $fieldPrefix');

    // Build additional fields to merge
    final additionalFieldsToMerge =
        _buildAdditionalFields(fieldsToMerge, fieldPrefix, formData, collectFromPages);

    debugPrint('MERGE_UPDATE: additionalFieldsToMerge: $additionalFieldsToMerge');

    // Build main entity field updates
    final mainFieldUpdates =
        _buildMainFieldUpdates(mainFieldsToUpdate, fieldPrefix, formData);

    debugPrint('MERGE_UPDATE: mainFieldUpdates: $mainFieldUpdates');

    if (additionalFieldsToMerge.isEmpty && mainFieldUpdates.isEmpty) {
      debugPrint('MERGE_UPDATE: No fields to update');
      return contextData;
    }

    // Merge and update entity
    final updatedEntity = _mergeAndCreateEntity(
      existingEntity,
      entityType,
      mainFieldUpdates,
      additionalFieldsToMerge,
    );

    if (updatedEntity == null) {
      debugPrint('MERGE_UPDATE: Failed to create updated entity');
      return contextData;
    }

    debugPrint('MERGE_UPDATE: Updating entity in database');

    // Update the entity using CrudBloc
    crudBloc.add(CrudEventUpdate(entities: [updatedEntity]));

    return {
      ...contextData,
      'updatedEntity': updatedEntity,
      'entities': [updatedEntity],
    };
  }

  /// Resolve template like "{{navigation.clientReferenceId}}"
  String? _resolveTemplate(
    String template,
    Map<String, dynamic> navigation,
    Map<String, dynamic> contextData,
  ) {
    if (!template.contains('{{')) {
      return template;
    }

    final match = RegExp(r'\{\{([^}]+)\}\}').firstMatch(template);
    if (match == null) return null;

    final path = match.group(1)!.trim();
    final parts = path.split('.');

    final resolveContext = {'navigation': navigation, ...contextData};
    dynamic value = resolveContext;

    for (final part in parts) {
      if (value is Map && value.containsKey(part)) {
        value = value[part];
      } else {
        return null;
      }
    }

    return value?.toString();
  }

  /// Search for an entity by clientReferenceId
  Future<EntityModel?> _searchEntity(
    CrudBloc crudBloc,
    String entityType,
    String clientReferenceId,
  ) async {
    final completer = Completer<List<EntityModel>>();

    late StreamSubscription<CrudState> subscription;
    subscription = crudBloc.stream.listen((state) {
      if (state is CrudStateLoaded) {
        subscription.cancel();
        final results = state.results;
        List<EntityModel> entities = [];
        for (final entityList in results.values) {
          entities.addAll(entityList);
        }
        completer.complete(entities);
      } else if (state is CrudStateError) {
        subscription.cancel();
        completer.complete([]);
      }
    });

    final searchRoot = entityType.replaceAll('Model', '');
    final searchParams = GlobalSearchParameters(
      filters: [
        SearchFilter(
          root: searchRoot,
          field: 'clientReferenceId',
          operator: 'equals',
          value: clientReferenceId,
        ),
      ],
      primaryModel: searchRoot,
      select: [],
    );

    crudBloc.add(CrudEventSearch(searchParams));

    try {
      final entities = await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          subscription.cancel();
          return [];
        },
      );
      return entities.isNotEmpty ? entities.first : null;
    } catch (e) {
      debugPrint('MERGE_UPDATE: Search error: $e');
      return null;
    }
  }

  /// Build additional fields map from form data
  /// formData is structured as: { "pageName": { "field1": value, "field2": value } }
  /// Supports both explicit fieldsToMerge list and dynamic collectFromPages
  Map<String, dynamic> _buildAdditionalFields(
    List<String> fieldsToMerge,
    String? fieldPrefix,
    Map<String, dynamic> formData,
    List<String> collectFromPages,
  ) {
    final fields = <String, dynamic>{};

    // First, handle dynamic collection from specified pages
    // This collects ALL non-null fields from the specified pages
    for (final pageName in collectFromPages) {
      final pageData = formData[pageName];
      if (pageData is Map<String, dynamic>) {
        pageData.forEach((fieldKey, fieldValue) {
          if (fieldValue != null && fieldValue.toString().trim().isNotEmpty) {
            fields[fieldKey] = fieldValue.toString();
          }
        });
      }
    }

    // Then, handle explicit fieldsToMerge (existing behavior)
    // Get nested page data if fieldPrefix is provided
    Map<String, dynamic>? pageData;
    if (fieldPrefix != null && formData[fieldPrefix] is Map) {
      pageData = formData[fieldPrefix] as Map<String, dynamic>;
    }

    for (final fieldName in fieldsToMerge) {
      dynamic value;

      // First try nested structure: formData[fieldPrefix][fieldName]
      if (pageData != null) {
        value = pageData[fieldName];
      }

      // Fallback to flat key: formData['fieldPrefix.fieldName']
      if (value == null && fieldPrefix != null) {
        value = formData['$fieldPrefix.$fieldName'];
      }

      // Fallback to direct key: formData[fieldName]
      value ??= formData[fieldName];

      if (value != null && value.toString().isNotEmpty) {
        fields[fieldName] = value.toString();
      }
    }

    return fields;
  }

  /// Build main field updates from config
  /// formData is structured as: { "pageName": { "field1": value, "field2": value } }
  Map<String, dynamic> _buildMainFieldUpdates(
    List<Map<String, dynamic>> mainFieldsToUpdate,
    String? fieldPrefix,
    Map<String, dynamic> formData,
  ) {
    final updates = <String, dynamic>{};

    // Get nested page data if fieldPrefix is provided
    Map<String, dynamic>? pageData;
    if (fieldPrefix != null && formData[fieldPrefix] is Map) {
      pageData = formData[fieldPrefix] as Map<String, dynamic>;
    }

    for (final fieldConfig in mainFieldsToUpdate) {
      final entityField = fieldConfig['entityField'] as String?;
      final formField = fieldConfig['formField'] as String?;

      if (entityField != null && formField != null) {
        dynamic value;

        // First try nested structure: formData[fieldPrefix][formField]
        if (pageData != null) {
          value = pageData[formField];
        }

        // Fallback to flat key: formData['fieldPrefix.formField']
        if (value == null && fieldPrefix != null) {
          value = formData['$fieldPrefix.$formField'];
        }

        // Fallback to direct key: formData[formField]
        value ??= formData[formField];

        if (value != null) {
          updates[entityField] = value;
        }
      }
    }

    return updates;
  }

  /// Merge updates into existing entity and create new entity
  EntityModel? _mergeAndCreateEntity(
    EntityModel existingEntity,
    String entityType,
    Map<String, dynamic> mainFieldUpdates,
    Map<String, dynamic> additionalFieldsToMerge,
  ) {
    try {
      final entityMap = existingEntity.toMap();
      debugPrint('MERGE_UPDATE: Existing entity map keys: ${entityMap.keys.toList()}');
      debugPrint('MERGE_UPDATE: Existing additionalFields: ${entityMap['additionalFields']}');

      // Update main fields
      mainFieldUpdates.forEach((key, value) {
        entityMap[key] = value;
        debugPrint('MERGE_UPDATE: Updated main field $key = $value');
      });

      // Merge additional fields
      if (additionalFieldsToMerge.isNotEmpty) {
        final existingAdditionalFields =
            entityMap['additionalFields'] as Map<String, dynamic>? ?? {};
        final existingFieldsList =
            existingAdditionalFields['fields'] as List<dynamic>? ?? [];

        debugPrint('MERGE_UPDATE: Existing additionalFields structure: $existingAdditionalFields');
        debugPrint('MERGE_UPDATE: Existing fields list: $existingFieldsList');

        // Convert to map for merging
        final fieldsMap = <String, dynamic>{};
        for (final field in existingFieldsList) {
          if (field is Map<String, dynamic>) {
            final key = field['key'] as String?;
            if (key != null) {
              fieldsMap[key] = field['value'];
            }
          }
        }

        debugPrint('MERGE_UPDATE: Fields map before merge: $fieldsMap');

        // Add new fields
        fieldsMap.addAll(additionalFieldsToMerge);

        debugPrint('MERGE_UPDATE: Fields map after merge: $fieldsMap');

        // Convert back to list
        final mergedFieldsList = fieldsMap.entries
            .map((e) => {'key': e.key, 'value': e.value})
            .toList();

        entityMap['additionalFields'] = {
          'schema': existingAdditionalFields['schema'] ??
              entityType.replaceAll('Model', ''),
          'version': existingAdditionalFields['version'] ?? 1,
          'fields': mergedFieldsList,
        };

        debugPrint('MERGE_UPDATE: Final additionalFields: ${entityMap['additionalFields']}');
      } else {
        debugPrint('MERGE_UPDATE: No additional fields to merge');
      }

      // Update audit details
      final existingClientAudit =
          entityMap['clientAuditDetails'] as Map<String, dynamic>?;
      if (existingClientAudit != null) {
        entityMap['clientAuditDetails'] = {
          ...existingClientAudit,
          'lastModifiedBy': FlowBuilderSingleton().loggedInUserUuid,
          'lastModifiedTime': DateTime.now().millisecondsSinceEpoch,
        };
      }

      // Recreate entity using factory
      final factory = DataConverterSingleton()
          .dynamicEntityModelListener
          ?.modelFactoryRegistry[entityType];

      debugPrint('MERGE_UPDATE: Factory for $entityType: ${factory != null ? "found" : "NOT FOUND"}');

      if (factory != null) {
        final updatedEntity = factory(entityMap);
        debugPrint('MERGE_UPDATE: Created updated entity: ${updatedEntity.runtimeType}');
        debugPrint('MERGE_UPDATE: Updated entity map: ${updatedEntity.toMap()['additionalFields']}');
        return updatedEntity;
      }

      debugPrint('MERGE_UPDATE: No factory found for $entityType');
      return null;
    } catch (e) {
      debugPrint('MERGE_UPDATE: Error creating entity: $e');
      return null;
    }
  }

  /// Evaluate condition like "navigation.isUpdate==true"
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

      debugPrint('MERGE_UPDATE: Condition check - "$leftValue" ${isNotEqual ? '!=' : '=='} "$rightValue"');

      return isNotEqual ? leftValue != rightValue : leftValue == rightValue;
    } catch (e) {
      debugPrint('MERGE_UPDATE: Error evaluating condition: $e');
      return false;
    }
  }
}
