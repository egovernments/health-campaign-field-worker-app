import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/transformer_config.dart';

class ActionHandler {
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
              value: resolvedValue,
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

  // --- Helper methods (replace with your real logic) ---
  static Future<Map<String, dynamic>> fetchTransformerConfig(
      String? name) async {
    return {'configName': name, 'models': {}};
  }

  static List<Map<String, dynamic>> createEntities(
    Map<String, dynamic>? transformerConfig,
    Map<String, dynamic>? formData,
    Map<String, dynamic> contextData,
  ) {
    return [
      {
        'entityType': 'ExampleEntity',
        'data': formData,
        'configUsed': transformerConfig,
      }
    ];
  }

  static Future<void> persistEntities(
      List<Map<String, dynamic>> entities) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
