import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../data/transformer_config.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import 'action_executor.dart';

class TransformerExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'FETCH_TRANSFORMER_CONFIG';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final configName = action.properties['configName'];
    final formDataConfig = action.properties['formDataConfig'];
    final transformerConfig =
        jsonConfig[configName]?['models'] as Map<String, dynamic>;

    final formEntityMapper = FormEntityMapper(config: jsonConfig);

    final fallBackModel = jsonConfig[configName]?['fallbackModel'] as String?;
    final multiEntityField =
        jsonConfig[configName]?['multiEntityField'] as String?;

    // Determine which form data to use
    Map<String, dynamic>? formValuesToUse = contextData['formData'];

    // 🔹 Collect extra key-values from action.properties['data']
    final Map<String, dynamic> extraContext = {};
    final List<dynamic>? extraData = action.properties['data'];
    if (extraData != null) {
      for (final entry in extraData) {
        final key = entry['key'] as String;
        final valuePath = entry['value'] as String?;
        if (valuePath != null) {
          final resolvedValue = resolveValue(valuePath, contextData);
          if (resolvedValue != null) {
            extraContext[key] = resolvedValue;
          }
        }
      }
    }

    if (formDataConfig != null) {
      final collectedFormData =
          FlowCrudStateRegistry().get(formDataConfig)?.formData;
      if (collectedFormData != null) {
        // Merge collected data with current form data
        formValuesToUse = {...collectedFormData, ...contextData['formData']};
      }
    }

    final flowState = const FlowCrudState().copyWith(formData: formValuesToUse);

    final config = FlowRegistry.getByName(getScreenKeyFromArgs(context) ?? '');

    FlowCrudStateRegistry().update(config?["name"], flowState);

    final contextMap = {
      "projectId": FlowBuilderSingleton().selectedProject?.id,
      "user": FlowBuilderSingleton().loggedInUser,
      "tenantId": FlowBuilderSingleton().selectedProject?.tenantId,
      "selectedBoundaryCode": FlowBuilderSingleton().boundary?.code,
      // converting in json format to match nested object value as passing model will cause issue
      'userUUID': FlowBuilderSingleton().loggedInUser?.uuid,
      'householdType': HouseholdType.family.toValue(),
      ...extraContext,

      /// TODO: NEED TO REMOVE THIS
      "beneficiaryType": BeneficiaryType.individual.toValue(),
      //// FIXME: HARDCODING TO INDIVIDUAL FOR TESTING SMC FLOW
      // FlowBuilderSingleton().beneficiaryType?.toValue(),
    };

    List<EntityModel> entities = [];

    // Check if multiEntityField is configured
    if (multiEntityField != null) {
      // Manually traverse the nested path to get the multi-select array
      final multiEntityValue =
          _getNestedValue(formValuesToUse ?? {}, multiEntityField);

      if (multiEntityValue is List && multiEntityValue.isNotEmpty) {
        // Create multiple entities, one for each item in the multi-select field
        for (int i = 0; i < multiEntityValue.length; i++) {
          final item = multiEntityValue[i];
          final modifiedFormValues =
              Map<String, dynamic>.from(formValuesToUse ?? {});

          // Replace the multi-select array with the single item
          _setNestedValue(modifiedFormValues, multiEntityField, item);

          final itemEntities = formEntityMapper.mapFormToEntities(
            formValues: modifiedFormValues,
            modelsConfig: transformerConfig,
            context: contextMap,
            fallbackFormDataString: fallBackModel,
          );
          entities.addAll(itemEntities);
        }
      } else {
        // No items selected, create entities normally
        entities = formEntityMapper.mapFormToEntities(
          formValues: formValuesToUse ?? {},
          modelsConfig: transformerConfig,
          context: contextMap,
          fallbackFormDataString: fallBackModel,
        );
      }
    } else {
      // No multiEntityField configured, create entities normally
      entities = formEntityMapper.mapFormToEntities(
        formValues: formValuesToUse ?? {},
        modelsConfig: transformerConfig,
        context: contextMap,
        fallbackFormDataString: fallBackModel,
      );
    }

    contextData['entities'] = entities;
    return contextData;
  }

  /// Helper method to get a nested value from a map using dot notation
  dynamic _getNestedValue(Map<String, dynamic> map, String path) {
    final keys = path.split('.');
    dynamic current = map;

    for (final key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }

    return current;
  }

  /// Helper method to set a nested value in a map using dot notation
  void _setNestedValue(Map<String, dynamic> map, String path, dynamic value) {
    final keys = path.split('.');
    Map<String, dynamic> current = map;

    for (int i = 0; i < keys.length - 1; i++) {
      if (!current.containsKey(keys[i])) {
        current[keys[i]] = <String, dynamic>{};
      }
      current = current[keys[i]] as Map<String, dynamic>;
    }

    current[keys.last] = value;
  }
}
