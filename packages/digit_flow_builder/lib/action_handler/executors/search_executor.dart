import 'dart:async';

import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/state_wrapper_builder.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import 'action_executor.dart';

class SearchExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'SEARCH_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final data = action.properties;
    final contexts = contextData['entities'];

    // Get screen key - try CrudItemContext first (has correct format),
    // then fall back to route args
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Get widgetData from FlowCrudStateRegistry (for filter values)
    final widgetData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.widgetData ?? {}
        : <String, dynamic>{};

    // Get formData from FlowCrudStateRegistry (for dropdown values)
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData ?? {}
        : <String, dynamic>{};

    // Build context data that includes both entities and form values
    final resolveContext = {
      if (contexts != null) ...contexts,
      ...formData,
    };

    // Process all filters from the data array
    final filtersList = data['data'] as List<dynamic>;
    final filters = <SearchFilter>[];

    for (var filterData in filtersList) {
      final rawKey = filterData['key'];
      final rawValue = filterData['value'];
      final operation = filterData['operation'];

      // Resolve the key (for dynamic keys like {{fn:getSenderOrReceiver(...)}})
      final resolvedKey = resolveValue(rawKey, resolveContext,
          widgetData: widgetData, screenKey: screenKey);

      // Resolve the value
      var resolvedValue = resolveValueRaw(rawValue, resolveContext,
          widgetData: widgetData, screenKey: screenKey);

      // If resolveValueRaw didn't work, try resolveValue as fallback
      if (resolvedValue == null ||
          (resolvedValue is String && resolvedValue == rawValue)) {
        resolvedValue = resolveValue(rawValue, resolveContext,
            widgetData: widgetData, screenKey: screenKey);
      }

      // Special case: if still unresolved and it's a template
      // try direct lookup in formData (for dropdown selections)
      if ((resolvedValue == null ||
              (resolvedValue is String && resolvedValue.startsWith('{{'))) &&
          rawValue is String) {
        // Match simple keys: {{key}} or dotted paths: {{key.path.to.value}}
        final templateMatch =
            RegExp(r'^\{\{([A-Za-z0-9_\-\.]+)\}\}$').firstMatch(rawValue);
        if (templateMatch != null) {
          final path = templateMatch.group(1)!;
          final parts = path.split('.');

          // Try to resolve from formData
          dynamic value = formData;
          bool found = true;
          for (final part in parts) {
            if (value is Map && value.containsKey(part)) {
              value = value[part];
            } else {
              found = false;
              break;
            }
          }

          if (found && value != formData) {
            resolvedValue = value;
          }
        }
      }

      // Skip filters with null or unresolved values (still in template form)
      if (resolvedValue == null ||
          (resolvedValue is String && resolvedValue.startsWith('{{'))) {
        continue;
      }

      // extract coordinates if present
      LatLng? latLng;
      if (filterData['lat'] != null && filterData['long'] != null) {
        final latRaw = filterData['lat'];
        final longRaw = filterData['long'];

        final parsedLat = double.tryParse(latRaw.toString());
        final parsedLong = double.tryParse(longRaw.toString());

        if (parsedLat != null && parsedLong != null) {
          latLng = LatLng(
            latitude: parsedLat,
            longitude: parsedLong,
          );
        }
      }

      filters.add(SearchFilter(
        root: data['name'],
        field: resolvedKey.toString(),
        operator: operation,
        value: resolvedValue,
        coordinates: latLng,
      ));
    }

    final config = FlowRegistry.getByName(screenKey ?? '');

    // Get orderBy from action properties or fall back to config
    SearchOrderBy? orderBy;
    if (data['orderBy'] != null) {
      orderBy =
          SearchOrderBy.fromJson(Map<String, dynamic>.from(data['orderBy']));
    } else if (config?['wrapperConfig']['searchConfig']['orderBy'] != null) {
      orderBy = SearchOrderBy.fromJson(Map<String, dynamic>.from(
          config!['wrapperConfig']['searchConfig']['orderBy']));
    }

    final searchParams = GlobalSearchParameters(
      filters: filters,
      primaryModel: config?['wrapperConfig']['searchConfig']['primary'],
      select: (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
              ?.cast<String>() ??
          [],
      pagination: null,
      orderBy: orderBy,
    );

    // Check if we should wait for results (for chained actions like REVERSE_TRANSFORM)
    final awaitResults = action.properties['awaitResults'] as bool? ?? false;

    final crudBloc = context.read<CrudBloc>();

    if (awaitResults) {
      // Wait for search results before returning
      final completer = Completer<Map<String, dynamic>>();

      late StreamSubscription<CrudState> subscription;
      subscription = crudBloc.stream.listen((state) {
        if (state is CrudStateLoaded) {
          subscription.cancel();

          // Extract entities from results
          final results = state.results;
          List<EntityModel> entities = [];

          for (final entityList in results.values) {
            entities.addAll(entityList);
          }

          debugPrint('SEARCH_EVENT: Found ${entities.length} entities');

          // Update FlowCrudStateRegistry with search results
          if (screenKey != null) {
            final currentState = FlowCrudStateRegistry().get(screenKey);

            // Build wrapper if config exists
            List<dynamic>? wrapper;
            if (config?['wrapperConfig'] != null && entities.isNotEmpty) {
              wrapper = WrapperBuilder(entities, config?['wrapperConfig']).build();
            }

            final updatedState =
                (currentState ?? const FlowCrudState()).copyWith(
              base: state,
              stateWrapper: wrapper ?? entities,
            );
            FlowCrudStateRegistry().update(screenKey, updatedState);
          }

          // Return context with entities
          completer.complete({
            ...contextData,
            'entities': entities,
            'searchResults': results,
          });
        } else if (state is CrudStateError) {
          subscription.cancel();
          debugPrint('SEARCH_EVENT: Error - ${state.message}');
          completer.complete({
            ...contextData,
            'errorType': 'searchError',
            'errorMessage': state.message,
          });
        }
      });

      // Dispatch the search event
      crudBloc.add(CrudEventSearch(searchParams));

      // Wait for results - bloc will always emit loaded or error state
      return completer.future;
    } else {
      // Fire and forget - original behavior
      crudBloc.add(CrudEventSearch(searchParams));
      return contextData;
    }
  }
}
