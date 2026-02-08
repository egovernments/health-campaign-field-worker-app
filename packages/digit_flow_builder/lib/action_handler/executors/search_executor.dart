import 'dart:async';

import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/state_wrapper_builder.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
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
    final searchName = data['name'] as String? ?? 'default';

    // Get screen key - try CrudItemContext first (has correct format),
    // then fall back to route args and parentScreenKey (from popup context)
    final crudCtx = CrudItemContext.of(context);
    final screenKey =
        crudCtx?.screenKey ?? getEffectiveScreenKey(context, contextData);

    // Get composite key for FlowCrudStateRegistry operations
    // IMPORTANT: Try CrudItemContext.compositeKey first - it's correctly passed
    // from popups via ActionPopupWidget. Only fall back to getEffectiveCompositeKey
    // when not in a popup context (i.e., CrudItemContext is null or has no compositeKey)
    final compositeKey =
        crudCtx?.compositeKey ?? getEffectiveCompositeKey(context, contextData);

    // Register search callback (SearchStateManager handles deduplication)
    // This allows ClearStateExecutor to trigger search with accumulated filters
    if (screenKey != null && compositeKey != null) {
      final crudBloc = context.read<CrudBloc>();
      final config = FlowRegistry.getByName(screenKey.split('::').last);

      SearchStateManager().registerSearchCallback(
        compositeKey,
        searchName,
        () => _executeSearchWithAccumulatedFilters(
          crudBloc,
          compositeKey,
          searchName,
          config,
        ),
      );
    }

    // Get widgetData from FlowCrudStateRegistry (for filter values)
    final widgetData = compositeKey != null
        ? FlowCrudStateRegistry().get(compositeKey)?.widgetData ?? {}
        : <String, dynamic>{};

    // Get formData from FlowCrudStateRegistry (for dropdown values)
    final formData = compositeKey != null
        ? FlowCrudStateRegistry().get(compositeKey)?.formData ?? {}
        : <String, dynamic>{};

    // Get navigation params from contextData or registry
    final navigationFromContext =
        contextData['navigation'] as Map<String, dynamic>? ?? {};
    final navigationFromRegistry = compositeKey != null
        ? FlowCrudStateRegistry().getNavigationParams(compositeKey) ??
            FlowCrudStateRegistry()
                .getNavigationParams(screenKey?.split('::').last ?? '') ??
            {}
        : <String, dynamic>{};
    final mergedNavigation = {
      ...navigationFromRegistry,
      ...navigationFromContext,
    };

    // Build context data that includes entities, form values, widgetData, and navigation params
    // widgetData is included at root level so templates like {{selectedStatus}} resolve directly
    final resolveContext = {
      if (contexts != null) ...contexts,
      ...formData,
      ...widgetData, // Include widgetData at root for direct access
      'widgetData': widgetData, // Also include with prefix for explicit access
      'navigation': mergedNavigation,
    };

    // Process all filters from the data array and resolve their values
    final filtersList = data['data'] as List<dynamic>? ?? [];
    final resolvedFilters = <Map<String, dynamic>>[];

    for (var filterData in filtersList) {
      // Check applyIf condition first
      final applyIf = filterData['applyIf'];
      if (applyIf != null) {
        // Resolve all {{template}} placeholders in the expression
        String expression = resolveTemplate(
          applyIf.toString(),
          resolveContext,
          screenKey: screenKey,
        );

        debugPrint('SEARCH_EVENT: Evaluating applyIf resolved="$expression"');

        // Build context for formula parser
        final parserContext = <String, dynamic>{
          ...formData,
          ...widgetData,
          'widgetData': widgetData,
          'singleton': singletonToMap(),
        };

        try {
          final parser = FormulaParser(
            expression,
            parserContext.isEmpty ? {'_dummy': ''} : parserContext,
          );
          final result = parser.parse;
          final conditionMet =
              result["isSuccess"] == true && result["value"] == true;

          debugPrint(
              'SEARCH_EVENT: applyIf result=$result, conditionMet=$conditionMet');

          if (!conditionMet) {
            debugPrint(
                'SEARCH_EVENT: Skipping filter ${filterData['key']} - applyIf condition not met');
            continue;
          }
        } catch (e) {
          debugPrint(
              'SEARCH_EVENT: Error evaluating applyIf for ${filterData['key']}: $e');
          continue;
        }
      }

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
      // try direct lookup in formData or widgetData
      if ((resolvedValue == null ||
              (resolvedValue is String && resolvedValue.startsWith('{{'))) &&
          rawValue is String) {
        // Match simple keys: {{key}} or dotted paths: {{key.path.to.value}}
        final templateMatch =
            RegExp(r'^\{\{([A-Za-z0-9_\-\.]+)\}\}$').firstMatch(rawValue);
        if (templateMatch != null) {
          final path = templateMatch.group(1)!;
          final parts = path.split('.');

          // Helper to resolve path from a map
          dynamic resolvePath(Map<String, dynamic> source) {
            dynamic value = source;
            for (final part in parts) {
              if (value is Map && value.containsKey(part)) {
                value = value[part];
              } else {
                return null;
              }
            }
            return value != source ? value : null;
          }

          // Try to resolve from formData first
          resolvedValue = resolvePath(formData);

          // If not found in formData, try widgetData (for filter selections)
          resolvedValue ??= resolvePath(widgetData);
        }
      }

      // Skip filters with null or unresolved values (still in template form)
      if (resolvedValue == null ||
          (resolvedValue is String && resolvedValue.startsWith('{{'))) {
        continue;
      }

      // Use per-filter root if specified, fallback to data['name'] for backward compatibility
      final filterRoot =
          filterData['root'] as String? ?? data['name'] as String?;

      // Store resolved filter as map for accumulation
      resolvedFilters.add({
        'key': resolvedKey.toString(),
        'value': resolvedValue,
        'operation': operation,
        'root': filterRoot ?? '',
        if (filterData['lat'] != null) 'lat': filterData['lat'],
        if (filterData['long'] != null) 'long': filterData['long'],
      });
    }

    // Update SearchStateManager with resolved filters (will merge with existing)
    if (compositeKey != null && resolvedFilters.isNotEmpty) {
      SearchStateManager().updateFilters(
        compositeKey,
        searchName,
        resolvedFilters,
        triggerSearch: false, // We'll execute search directly below
      );

      // Reset pagination when filters change (new search starts from offset 0)
      SearchStateManager().resetPagination(compositeKey, searchName);
    }

    // Get ALL accumulated filters from SearchStateManager (across all searchNames)
    final accumulatedFilters = compositeKey != null
        ? SearchStateManager().getAllFilters(compositeKey)
        : resolvedFilters;

    // Convert accumulated filters to SearchFilter objects
    final filters = <SearchFilter>[];
    for (final filterMap in accumulatedFilters) {
      if (filterMap is! Map) continue;

      // Extract coordinates if present
      LatLng? latLng;
      if (filterMap['lat'] != null && filterMap['long'] != null) {
        final parsedLat = double.tryParse(filterMap['lat'].toString());
        final parsedLong = double.tryParse(filterMap['long'].toString());

        if (parsedLat != null && parsedLong != null) {
          latLng = LatLng(latitude: parsedLat, longitude: parsedLong);
        }
      }

      filters.add(SearchFilter(
        root: filterMap['root']?.toString() ?? '',
        field: filterMap['key']?.toString() ?? '',
        operator: filterMap['operation']?.toString() ?? 'equals',
        value: filterMap['value'],
        coordinates: latLng,
      ));
    }

    // Early return if no filters are applicable
    if (filters.isEmpty) {
      debugPrint(
          'SEARCH_EVENT: No filters to apply - all filters were skipped or empty. Returning early.');
      return contextData;
    }

    debugPrint(
        'SEARCH_EVENT: Executing with ${filters.length} accumulated filters for $searchName');

    final config = FlowRegistry.getByName(screenKey ?? '');

    // Get orderBy from action properties or fall back to config or accumulated state
    SearchOrderBy? orderBy;
    Map<String, dynamic>? orderByData;

    if (data['orderBy'] != null) {
      orderByData = Map<String, dynamic>.from(data['orderBy']);
    } else if (config?['wrapperConfig']?['searchConfig']?['orderBy'] != null) {
      orderByData = Map<String, dynamic>.from(
          config!['wrapperConfig']['searchConfig']['orderBy']);
    }

    if (orderByData != null) {
      // Resolve templates in orderBy fields
      final resolvedOrderBy = <String, dynamic>{};

      for (final entry in orderByData.entries) {
        final value = entry.value?.toString() ?? '';

        // First resolve any {{ }} templates in the value
        String resolvedValue = value;
        if (value.contains('{{')) {
          resolvedValue = resolveTemplate(
            value,
            resolveContext,
            screenKey: screenKey,
          );
        }

        // Now check for ternary expression: condition ? valueIfTrue : valueIfFalse
        final ternaryMatch =
            RegExp(r'(.+?)\s*\?\s*(\w+)\s*:\s*(\w+)').firstMatch(resolvedValue);

        if (ternaryMatch != null) {
          // Evaluate ternary expression
          final condition = ternaryMatch.group(1)!.trim();
          final valueIfTrue = ternaryMatch.group(2)!;
          final valueIfFalse = ternaryMatch.group(3)!;

          debugPrint(
              'SEARCH_EVENT: Ternary condition="$condition", ifTrue=$valueIfTrue, ifFalse=$valueIfFalse');

          // Evaluate condition with formula parser
          try {
            final parserContext = <String, dynamic>{
              ...formData,
              ...widgetData,
            };

            final parser = FormulaParser(
              condition,
              parserContext.isEmpty ? {'_dummy': ''} : parserContext,
            );
            final result = parser.parse;
            final conditionMet =
                result["isSuccess"] == true && result["value"] == true;

            resolvedOrderBy[entry.key] =
                conditionMet ? valueIfTrue : valueIfFalse;
            debugPrint(
                'SEARCH_EVENT: Ternary result=$result, resolved to: ${resolvedOrderBy[entry.key]}');
          } catch (e) {
            // Fallback to valueIfFalse on error
            resolvedOrderBy[entry.key] = valueIfFalse;
            debugPrint(
                'SEARCH_EVENT: Ternary evaluation failed: $e, using default: $valueIfFalse');
          }
        } else {
          // No ternary, use resolved value directly
          resolvedOrderBy[entry.key] = resolvedValue;
        }
      }

      // Store resolved orderBy in SearchStateManager
      if (compositeKey != null) {
        SearchStateManager().updateOrderBy(
          compositeKey,
          searchName,
          resolvedOrderBy,
          triggerSearch: false,
        );
      }

      orderBy = SearchOrderBy.fromJson(resolvedOrderBy);
      debugPrint(
          'SEARCH_EVENT: OrderBy resolved - field: ${orderBy.field}, order: ${orderBy.order}');
    } else if (compositeKey != null) {
      // Check for accumulated orderBy from previous search events
      final accumulatedOrderBy =
          SearchStateManager().getOrderBy(compositeKey, searchName);
      if (accumulatedOrderBy != null) {
        orderBy = SearchOrderBy.fromJson(accumulatedOrderBy);
        debugPrint(
            'SEARCH_EVENT: Using accumulated orderBy - field: ${orderBy.field}, order: ${orderBy.order}');
      }
    }

    // Get filterLogic from action properties (defaults to 'and')
    final filterLogicStr = data['filterLogic'] as String? ?? 'and';
    final filterLogic = filterLogicStr.toLowerCase() == 'or'
        ? MultiTableFilterLogic.or
        : MultiTableFilterLogic.and;

    // Get pagination from wrapperConfig.searchConfig.pagination (if configured)
    PaginationParams? pagination;
    final paginationConfig =
        config?['wrapperConfig']?['searchConfig']?['pagination'];
    if (paginationConfig != null) {
      final limit = paginationConfig['limit'] as int?;
      // Support both maxItems (new) and windowSize (legacy, converted to maxItems)
      final maxItems = paginationConfig['maxItems'] as int? ??
          ((paginationConfig['windowSize'] as int? ?? 3) * (limit ?? 10));

      if (limit != null) {
        // First search always starts at offset 0
        pagination = PaginationParams(offset: 0, limit: limit);

        // Initialize pagination window for bidirectional support
        if (compositeKey != null) {
          debugPrint(
              'SEARCH_EVENT: Initializing pagination window with compositeKey=$compositeKey');

          // Legacy pagination state (for backwards compatibility)
          SearchStateManager().updatePagination(
            compositeKey,
            '_pagination',
            offset: 0,
            limit: limit,
          );

          // Initialize bidirectional pagination window
          SearchStateManager().initPaginationWindow(
            compositeKey,
            '_pagination',
            limit: limit,
            maxItems: maxItems,
          );

          // Set pagination info in registry so FlowCrudBloc can update window after data loads
          final registryKey = screenKey?.split('::').last ?? '';
          debugPrint(
              'SEARCH_EVENT: Setting paginationInfo with registryKey=$registryKey');
          FlowCrudStateRegistry().setPaginationInfo(
            registryKey,
            limit: limit,
            maxItems: maxItems,
          );
        }
        debugPrint(
            'SEARCH_EVENT: Using pagination - offset=0, limit=$limit, maxItems=$maxItems');
      }
    }

    // Get primaryModel and select from config
    final primaryModel = config?['wrapperConfig']?['searchConfig']?['primary'];
    final select = (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
            ?.cast<String>() ??
        [];

    // If no config available (e.g., on form pages), skip the search
    // The MERGE_UPDATE_ADDITIONAL_FIELDS action has its own search mechanism
    if (primaryModel == null || select.isEmpty) {
      debugPrint('SEARCH_EVENT: No searchConfig in config, skipping search. primaryModel=$primaryModel, select=$select');
      return contextData;
    }

    final searchParams = GlobalSearchParameters(
      filters: filters,
      primaryModel: primaryModel,
      select: select,
      pagination: pagination,
      orderBy: orderBy,
      filterLogic: filterLogic,
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
          if (compositeKey != null) {
            final currentState = FlowCrudStateRegistry().get(compositeKey);

            // Build wrapper if config exists
            List<dynamic>? wrapper;
            if (config?['wrapperConfig'] != null && entities.isNotEmpty) {
              wrapper = WrapperBuilder(
                entities,
                config?['wrapperConfig'],
                screenKey: compositeKey,
              ).build();
            }

            final updatedState =
                (currentState ?? const FlowCrudState()).copyWith(
              base: state,
              stateWrapper: wrapper ?? entities,
            );
            FlowCrudStateRegistry().update(compositeKey, updatedState);
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

  /// Execute search with accumulated filters from SearchStateManager
  /// This is called via the registered callback when triggered by ClearStateExecutor
  static void _executeSearchWithAccumulatedFilters(
    CrudBloc crudBloc,
    String compositeKey,
    String searchName,
    Map<String, dynamic>? config,
  ) {
    // Use getAllFilters (across all searchNames) — consistent with the main search path
    final accumulatedFilters =
        SearchStateManager().getAllFilters(compositeKey);
    final accumulatedOrderBy =
        SearchStateManager().getOrderBy(compositeKey, searchName);

    if (accumulatedFilters.isEmpty) {
      debugPrint(
          'SearchCallback: No accumulated filters for $compositeKey, skipping');
      return;
    }

    // Convert to SearchFilter objects
    final filters = <SearchFilter>[];
    for (final filterMap in accumulatedFilters) {
      if (filterMap is! Map) continue;

      LatLng? latLng;
      if (filterMap['lat'] != null && filterMap['long'] != null) {
        final parsedLat = double.tryParse(filterMap['lat'].toString());
        final parsedLong = double.tryParse(filterMap['long'].toString());
        if (parsedLat != null && parsedLong != null) {
          latLng = LatLng(latitude: parsedLat, longitude: parsedLong);
        }
      }

      filters.add(SearchFilter(
        root: filterMap['root']?.toString() ?? '',
        field: filterMap['key']?.toString() ?? '',
        operator: filterMap['operation']?.toString() ?? 'equals',
        value: filterMap['value'],
        coordinates: latLng,
      ));
    }

    // Build orderBy
    SearchOrderBy? orderBy;
    if (accumulatedOrderBy != null) {
      orderBy = SearchOrderBy.fromJson(accumulatedOrderBy);
    }

    // Build search params
    final searchParams = GlobalSearchParameters(
      filters: filters,
      primaryModel: config?['wrapperConfig']?['searchConfig']?['primary'],
      select: (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
              ?.cast<String>() ??
          [],
      pagination: null,
      orderBy: orderBy,
      filterLogic: MultiTableFilterLogic.and,
    );

    debugPrint(
        'SearchCallback: Executing search with ${filters.length} accumulated filters for $searchName');

    // Execute search
    crudBloc.add(CrudEventSearch(searchParams));
  }
}
