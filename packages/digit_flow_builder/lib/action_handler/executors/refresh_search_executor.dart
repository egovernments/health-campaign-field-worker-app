import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import 'action_executor.dart';

/// Executor for REFRESH_SEARCH action.
///
/// This action re-triggers the search using ALL accumulated filters
/// from SearchStateManager for the current screen. It supports:
/// - Infinite scroll / load more functionality (scroll down)
/// - Bidirectional pagination (scroll up to load previous)
/// - Window-based data management to prevent memory bloat
///
/// Configuration:
/// ```json
/// {
///   "actionType": "REFRESH_SEARCH",
///   "properties": {
///     "direction": "down",  // or "up" for bidirectional
///     "pagination": {
///       "limit": 10,
///       "windowSize": 3  // max pages to keep in memory
///     }
///   }
/// }
/// ```
class RefreshSearchExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'REFRESH_SEARCH';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final data = action.properties;
    final direction = data['direction'] as String? ?? 'down';
    final paginationConfig = data['pagination'] as Map<String, dynamic>?;

    // Get screen key
    final crudCtx = CrudItemContext.of(context);
    final screenKey =
        crudCtx?.screenKey ?? getEffectiveScreenKey(context, contextData);

    if (screenKey == null) {
      debugPrint('REFRESH_SEARCH: No screen key found, cannot refresh');
      return contextData;
    }

    // Check if there are any accumulated filters for this screen
    final hasFilters = SearchStateManager().hasFiltersForScreen(screenKey);

    if (!hasFilters) {
      debugPrint('REFRESH_SEARCH: No accumulated filters for screen, skipping');
      return contextData;
    }

    // Execute with bidirectional pagination support
    return _executeWithBidirectionalPagination(
      context,
      contextData,
      screenKey,
      direction,
      paginationConfig,
    );
  }

  Future<Map<String, dynamic>> _executeWithBidirectionalPagination(
    BuildContext context,
    Map<String, dynamic> contextData,
    String screenKey,
    String direction,
    Map<String, dynamic>? paginationConfig,
  ) async {
    final stateManager = SearchStateManager();
    const paginationKey = '_pagination';

    // Get config for default pagination settings
    final config = FlowRegistry.getByName(screenKey.split('::').last);
    final defaultPaginationConfig =
        config?['wrapperConfig']?['searchConfig']?['pagination'];
    final defaultLimit = defaultPaginationConfig?['limit'] as int? ?? 10;
    // Support both maxItems (new) and windowSize (legacy, converted to maxItems)
    final defaultMaxItems = defaultPaginationConfig?['maxItems'] as int? ??
        ((defaultPaginationConfig?['windowSize'] as int? ?? 3) * defaultLimit);

    // Determine limit and maxItems from action config or defaults
    final limit = paginationConfig?['limit'] as int? ?? defaultLimit;
    final maxItems = paginationConfig?['maxItems'] as int? ??
        (paginationConfig?['windowSize'] != null
            ? (paginationConfig!['windowSize'] as int) * limit
            : defaultMaxItems);

    // Get or initialize pagination window
    debugPrint('REFRESH_SEARCH: Looking for pagination window with screenKey=$screenKey');
    var window = stateManager.getPaginationWindow(screenKey, paginationKey);
    debugPrint('REFRESH_SEARCH: Found window=$window');

    if (window == null) {
      // Initialize window if not exists (shouldn't happen normally)
      debugPrint('REFRESH_SEARCH: Window not found, initializing new one');
      stateManager.initPaginationWindow(
        screenKey,
        paginationKey,
        limit: limit,
        maxItems: maxItems,
      );
      window = stateManager.getPaginationWindow(screenKey, paginationKey);
    }

    // Determine offset based on direction
    int? offset;
    if (direction == 'down') {
      offset = stateManager.prepareLoadDown(screenKey, paginationKey);
      if (offset == null) {
        debugPrint('REFRESH_SEARCH: Cannot load down - no more data');
        return contextData;
      }
    } else if (direction == 'up') {
      offset = stateManager.prepareLoadUp(screenKey, paginationKey);
      if (offset == null) {
        debugPrint('REFRESH_SEARCH: Cannot load up - at beginning');
        return contextData;
      }
    } else {
      debugPrint('REFRESH_SEARCH: Unknown direction: $direction');
      return contextData;
    }

    debugPrint(
        'REFRESH_SEARCH: Loading $direction from offset=$offset, limit=$limit');

    // Get ALL accumulated filters for the screen (across all searchNames)
    final accumulatedFilters = stateManager.getAllFilters(screenKey);

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

    if (filters.isEmpty) {
      debugPrint('REFRESH_SEARCH: No filters to apply');
      return contextData;
    }

    // Build search params with pagination
    final searchParams = GlobalSearchParameters(
      filters: filters,
      primaryModel: config?['wrapperConfig']?['searchConfig']?['primary'],
      select: (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
              ?.cast<String>() ??
          [],
      pagination: PaginationParams(offset: offset, limit: limit),
      filterLogic: MultiTableFilterLogic.and,
    );

    // Set mode in registry - FlowCrudBloc.onTransition will handle it
    final registryKey = screenKey.split('::').last;
    FlowCrudStateRegistry().setScrollDirection(registryKey, direction);
    FlowCrudStateRegistry().setPaginationInfo(
      registryKey,
      limit: limit,
      maxItems: maxItems,
    );

    debugPrint(
        'REFRESH_SEARCH: Dispatching search with ${filters.length} filters, direction=$direction');

    // Dispatch search - FlowCrudBloc.onTransition handles state update
    final crudBloc = context.read<CrudBloc>();
    crudBloc.add(CrudEventSearch(searchParams));

    return contextData;
  }
}
