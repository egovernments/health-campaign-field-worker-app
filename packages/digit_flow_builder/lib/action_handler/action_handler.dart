import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/flow_crud_bloc.dart';
import '../blocs/state_wrapper_builder.dart';
import '../data/transformer_config.dart';

class ActionHandler {
  /// Evaluates condition expressions using FormulaParser
  static bool evaluateCondition(
    Map<String, dynamic> condition,
    Map<String, dynamic> formData,
  ) {
    final expression = condition['expression'] as String?;
    if (expression == null || expression == 'DEFAULT') return true;

    try {
      final parser = FormulaParser(
        expression,
        formData.isEmpty ? {'dummy': {}} : formData,
      );
      
      final result = parser.parse;
      return result["isSuccess"] && result["value"] == true;
    } catch (e) {
      // If parsing fails, return false
      return false;
    }
  }

  /// Execute actions with conditional support
  static Future<Map<String, dynamic>> executeActions(
    List<dynamic> actions,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    for (final actionJson in actions) {
      if (actionJson['condition'] != null) {
        // Conditional action block
        final condition = actionJson['condition'] as Map<String, dynamic>;
        final formData = contextData['formData'] as Map<String, dynamic>? ?? {};
        
        if (evaluateCondition(condition, formData)) {
          final subActions = actionJson['actions'] as List? ?? [];
          for (final subActionJson in subActions) {
            final action = ActionConfig.fromJson(subActionJson);
            contextData = await execute(action, context, contextData);
          }
          break; // Execute only the first matching condition
        }
      } else {
        // Legacy direct action
        final action = ActionConfig.fromJson(actionJson);
        contextData = await execute(action, context, contextData);
      }
    }
    return contextData;
  }

  /// New async, context-aware version for flow builder onSubmit
  static Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    switch (action.actionType) {
      case 'FETCH_TRANSFORMER_CONFIG':
        final configName = action.properties['configName'];
        final transformerConfig =
            jsonConfig[configName]?['models'] as Map<String, dynamic>;

        final formEntityMapper = FormEntityMapper(config: jsonConfig);

        final fallBackModel =
            jsonConfig[configName]?['fallbackModel'] as String?;

        final entities = formEntityMapper.mapFormToEntities(
          formValues: contextData['formData'],
          modelsConfig: transformerConfig,
          context: {
            "projectId": FlowBuilderSingleton().selectedProject?.id,
            "user": FlowBuilderSingleton().loggedInUser,
            "tenantId": FlowBuilderSingleton().selectedProject?.tenantId,
            "selectedBoundaryCode": FlowBuilderSingleton().boundary?.code,
            // converting in json format to match nested object value as passing model will cause issue
            'userUUID': FlowBuilderSingleton().loggedInUser?.uuid,
            'householdType': HouseholdType.family.toValue(),

            /// TODO: NEED TO REMOVE THIS
            "beneficiaryType":
                FlowBuilderSingleton().beneficiaryType?.toValue(),
          },
          fallbackFormDataString: fallBackModel,
        );

        contextData['entities'] = entities;
        break;
      case 'CREATE_EVENT':
        final entities = contextData['entities'];

        context.read<CrudBloc>().add(CrudEventCreate(entities: entities));

        break;
      case 'SEARCH_EVENT':
        final data = action.properties;
        final contexts = contextData['entities'];
        final rawValue = data['data'][0]['value'];
        final resolvedValue = resolveValue(rawValue, contexts);

        final config =
            FlowRegistry.getByName(getScreenKeyFromArgs(context) ?? '');
        final searchParams = GlobalSearchParameters(
          filters: [
            SearchFilter(
              root: data['name'],
              field: data['data'][0]['key'],
              operator: data['data'][0]['operation'],
              value: data['value'] ?? resolvedValue,
            ),
          ], // Optional: if you're resolving linked entities
          primaryModel: config?['wrapperConfig']['searchConfig']['primary'],
          select: config?['wrapperConfig']['searchConfig']['select'],
          pagination: null,
        );

        context.read<CrudBloc>().add(CrudEventSearch(searchParams));

        break;
      case 'NAVIGATION':
        NavigationRegistry.navigateTo(action.properties);
        // await Future.delayed(Duration(seconds: 1));
        final entities = contextData['entities'];
        final config = FlowRegistry.getByName(action.properties['name']);
        if (entities != null) {
          final wrapper =
              WrapperBuilder(entities, config?['wrapperConfig']).build();
          final flowState = const FlowCrudState().copyWith(
            stateWrapper: wrapper,
          );

          FlowCrudStateRegistry().update(config?["name"], flowState);
        }

        break;
      case 'SHOW_TOAST':
        final message = action.properties['message'] ?? 'Unknown error';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        break;
      default:
        break;
    }
    return contextData;
  }
}
