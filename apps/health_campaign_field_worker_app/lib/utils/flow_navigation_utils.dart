import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_flow_builder/data/digit_crud_service.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Configuration for a module's flow navigation
class FlowModuleConfig {
  /// The key used to retrieve schema from app_config_schemas (e.g., 'COMPLAINTS', 'CLOSEHOUSEHOLD')
  final String schemaKey;

  /// Sample flows to use as fallback when schema is not available
  final dynamic sampleFlows;

  /// Relationship mappings for the CRUD service
  final List<RelationshipMapping> relationshipMappings;

  /// Nested model mappings for the CRUD service
  final List<NestedModelMapping> nestedModelMappings;

  const FlowModuleConfig({
    required this.schemaKey,
    required this.sampleFlows,
    this.relationshipMappings = const [],
    this.nestedModelMappings = const [],
  });
}

/// Utility class for handling flow-based module navigation
class FlowNavigationUtils {
  /// Navigates to a flow-based module with the given configuration
  ///
  /// This handles:
  /// - Setting up CrudBlocSingleton with DigitCrudService
  /// - Initializing WidgetRegistry
  /// - Loading schema from SharedPreferences or using sample flows as fallback
  /// - Navigating to the FlowBuilderHomeRoute
  static Future<void> navigateToFlowModule({
    required BuildContext context,
    required FlowModuleConfig config,
  }) async {
    try {
      // Set up CRUD service
      CrudBlocSingleton().setData(
        crudService: DigitCrudService(
          context: context,
          relationshipMap: config.relationshipMappings,
          nestedModelMappings: config.nestedModelMappings,
          searchEntityRepository: context.read<SearchEntityRepository>(),
        ),
        dynamicEntityModelListener: EntityModelMapMapper(),
      );

      // Initialize widget registry
      WidgetRegistry.initialize();

      // Get schema from shared preferences
      final prefs = await SharedPreferences.getInstance();
      final schemaJsonRaw = prefs.getString('app_config_schemas');

      if (schemaJsonRaw != null) {
        final allSchemas = json.decode(schemaJsonRaw) as Map<String, dynamic>;
        final moduleSchema = allSchemas[config.schemaKey];

        if (moduleSchema != null) {
          final moduleData = moduleSchema['data'];
          final flowsData = (moduleData['flows'] as List<dynamic>?)
                  ?.map((e) => Map<String, dynamic>.from(e as Map))
                  .toList() ??
              [];

          FlowRegistry.setConfig(flowsData);
          NavigationRegistry.setupNavigation(context);

          context.router.push(
            FlowBuilderHomeRoute(pageName: moduleData["initialPage"]),
          );
          return;
        }
      }

      FlowRegistry.setConfig(
        config.sampleFlows["flows"] as List<Map<String, dynamic>>,
      );
      NavigationRegistry.setupNavigation(context);

      context.router.push(
        FlowBuilderHomeRoute(pageName: config.sampleFlows["initialPage"]),
      );
    } catch (e) {
      debugPrint('FlowNavigationUtils error: $e');
    }
  }
}
