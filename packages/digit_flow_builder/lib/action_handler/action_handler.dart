import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/transformer_config.dart';
import '../navigation_service/navigation_service.dart';
import '../utils/utils.dart';
import 'action_config.dart';

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
        final transformerConfig = jsonConfig['beneficiaryRegistration']
            ?['models'] as Map<String, dynamic>;

        final formEntityMapper = FormEntityMapper(config: jsonConfig);

        final fallBackModel =
            jsonConfig['beneficiaryRegistration']?['fallbackModel'] as String?;

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
