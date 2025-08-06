import 'package:flutter/material.dart';

import '../navigation_service/navigation_service.dart';
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
        final transformerConfig = await fetchTransformerConfig(configName);
        contextData['transformerConfig'] = transformerConfig;
        break;
      case 'CREATE_EVENT':
        final entities = createEntities(
          contextData['transformerConfig'],
          contextData['formData'],
          contextData,
        );
        await persistEntities(entities);
        contextData['createdEntities'] = entities;
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
