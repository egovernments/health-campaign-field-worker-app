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
/// from SearchStateManager for the current screen. It's useful for:
/// - Infinite scroll / load more functionality
/// - Refreshing search results without changing filters
///
/// Configuration:
/// ```json
/// {
///   "actionType": "REFRESH_SEARCH",
///   "properties": {
///     "pagination": {
///       "limit": 10,
///       "append": true
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

    // Execute with pagination support (handles both with and without pagination)
    return _executeWithPagination(
      context,
      contextData,
      screenKey,
      paginationConfig,
    );
  }

  Future<Map<String, dynamic>> _executeWithPagination(
    BuildContext context,
    Map<String, dynamic> contextData,
    String screenKey,
    Map<String, dynamic>? paginationConfig,
  ) async {
    final stateManager = SearchStateManager();

    // Get config for default pagination and wrapper building
    final config = FlowRegistry.getByName(screenKey.split('::').last);

    // Get default limit from wrapperConfig.searchConfig.pagination
    final defaultPaginationConfig = config?['wrapperConfig']?['searchConfig']?['pagination'];
    final defaultLimit = defaultPaginationConfig?['limit'] as int?;

    // Handle pagination - use override from action or default from config
    int? offset;
    int? limit;
    bool append = false;

    // Determine limit: action override > wrapperConfig default
    if (paginationConfig != null) {
      limit = paginationConfig['limit'] as int? ?? defaultLimit;
      append = paginationConfig['append'] as bool? ?? true;
    } else if (defaultLimit != null) {
      limit = defaultLimit;
      append = true; // Default to append for scroll
    }

    if (limit != null) {
      // Use a default key for pagination tracking
      const paginationKey = '_pagination';
      final currentPagination = stateManager.getPagination(screenKey, paginationKey);

      if (currentPagination == null || currentPagination['offset'] == null) {
        // First REFRESH_SEARCH - continue from where SEARCH_EVENT left off
        // SEARCH_EVENT already fetched offset=0, so start from limit
        offset = limit;
        stateManager.updatePagination(screenKey, paginationKey, offset: offset, limit: limit);
      } else {
        // Load more - increment offset
        offset = stateManager.incrementOffset(screenKey, paginationKey, defaultLimit: limit);
      }

      debugPrint('REFRESH_SEARCH: Pagination offset=$offset, limit=$limit, append=$append');
    }

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

    // Build search params with optional pagination
    final searchParams = GlobalSearchParameters(
      filters: filters,
      primaryModel: config?['wrapperConfig']?['searchConfig']?['primary'],
      select: (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
              ?.cast<String>() ??
          [],
      pagination: (offset != null && limit != null)
          ? PaginationParams(offset: offset, limit: limit)
          : null,
      filterLogic: MultiTableFilterLogic.and,
    );

    // Set append mode in registry - FlowCrudBloc.onTransition will handle it
    if (append) {
      // Use the screen name (without screenType prefix) for the registry key
      final registryKey = screenKey.split('::').last;
      FlowCrudStateRegistry().setAppendMode(registryKey, true);
    }

    debugPrint('REFRESH_SEARCH: Dispatching search with ${filters.length} filters, append=$append');

    // Dispatch search - FlowCrudBloc.onTransition handles state update
    final crudBloc = context.read<CrudBloc>();
    crudBloc.add(CrudEventSearch(searchParams));

    return contextData;
  }
}
