import 'package:flutter/foundation.dart';

/// Centralized manager for accumulated search filters per page/screen.
///
/// This manager:
/// - Stores filters and orderBy per screenKey + searchName
/// - Merges filters by 'key' field (new replaces old with same key)
/// - Notifies listeners when state changes
/// - Triggers search callback when filters/orderBy are updated
class SearchStateManager {
  static final SearchStateManager _instance = SearchStateManager._();
  factory SearchStateManager() => _instance;
  SearchStateManager._();

  // Storage: compositeKey (screenKey::searchName) -> {filters: [...], orderBy: {...}}
  final Map<String, Map<String, dynamic>> _state = {};

  // Change notifiers per composite key
  final Map<String, ValueNotifier<int>> _notifiers = {};

  // Search callbacks per composite key - called when state changes
  final Map<String, void Function()> _searchCallbacks = {};

  String _compositeKey(String screenKey, String searchName) =>
      '$screenKey::$searchName';

  /// Register a callback to be called when search state changes.
  /// Typically called from screen builder with access to CrudBloc.
  void registerSearchCallback(
    String screenKey,
    String searchName,
    void Function() onSearch,
  ) {
    final key = _compositeKey(screenKey, searchName);
    _searchCallbacks[key] = onSearch;
    debugPrint('SearchStateManager: Registered callback for $key');
  }

  /// Unregister search callback (call on dispose)
  void unregisterSearchCallback(String screenKey, String searchName) {
    final key = _compositeKey(screenKey, searchName);
    _searchCallbacks.remove(key);
    debugPrint('SearchStateManager: Unregistered callback for $key');
  }

  /// Get or create ValueNotifier for listening to changes
  ValueNotifier<int> listen(String screenKey, String searchName) {
    final key = _compositeKey(screenKey, searchName);
    return _notifiers.putIfAbsent(key, () => ValueNotifier<int>(0));
  }

  /// Notify listeners and trigger search callback
  void _notifyChange(String compositeKey) {
    // Increment notifier to trigger ValueListenableBuilder rebuilds
    if (_notifiers.containsKey(compositeKey)) {
      _notifiers[compositeKey]!.value++;
    }

    // Call search callback if registered
    if (_searchCallbacks.containsKey(compositeKey)) {
      debugPrint('SearchStateManager: Triggering search for $compositeKey');
      _searchCallbacks[compositeKey]!();
    }
  }

  /// Update/add filters - merges by 'key' field.
  /// Filters with same 'key' will be replaced, new ones added.
  /// Set [triggerSearch] to false to update without triggering search.
  void updateFilters(
    String screenKey,
    String searchName,
    List<dynamic> newFilters, {
    bool triggerSearch = true,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    _state.putIfAbsent(
        compositeKey, () => {'filters': <dynamic>[], 'orderBy': null});

    final existing =
        List<dynamic>.from(_state[compositeKey]!['filters'] as List? ?? []);

    // Merge: for each new filter, replace if same 'key' exists, else add
    for (final newFilter in newFilters) {
      if (newFilter is! Map) continue;

      final filterKey = newFilter['key'];
      if (filterKey == null) continue;

      final existingIndex =
          existing.indexWhere((f) => f is Map && f['key'] == filterKey);

      if (existingIndex >= 0) {
        existing[existingIndex] = newFilter;
        debugPrint(
            'SearchStateManager: Updated filter key=$filterKey for $compositeKey');
      } else {
        existing.add(newFilter);
        debugPrint(
            'SearchStateManager: Added filter key=$filterKey for $compositeKey');
      }
    }

    _state[compositeKey]!['filters'] = existing;

    if (triggerSearch) {
      _notifyChange(compositeKey);
    }
  }

  /// Remove filters by their 'key' field values
  void removeFiltersByKeys(
    String screenKey,
    String searchName,
    List<String> filterKeys, {
    bool triggerSearch = true,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    if (!_state.containsKey(compositeKey)) return;

    final existing =
        List<dynamic>.from(_state[compositeKey]!['filters'] as List? ?? []);
    final beforeCount = existing.length;

    existing.removeWhere((f) => f is Map && filterKeys.contains(f['key']));

    _state[compositeKey]!['filters'] = existing;

    debugPrint(
        'SearchStateManager: Removed ${beforeCount - existing.length} filters for keys=$filterKeys from $compositeKey');

    if (triggerSearch && beforeCount != existing.length) {
      _notifyChange(compositeKey);
    }
  }

  /// Remove filters by their 'key' field values across ALL searchNames for a screen
  /// This is useful when filters are added with different searchNames but need to be cleared together
  void removeFiltersByKeysForScreen(
    String screenKey,
    List<String> filterKeys, {
    bool triggerSearch = true,
  }) {
    int totalRemoved = 0;
    String? lastModifiedKey;

    // Find all composite keys for this screen
    final keysToCheck = _state.keys.where((k) => k.startsWith('$screenKey::')).toList();

    for (final compositeKey in keysToCheck) {
      final existing =
          List<dynamic>.from(_state[compositeKey]!['filters'] as List? ?? []);
      final beforeCount = existing.length;

      existing.removeWhere((f) => f is Map && filterKeys.contains(f['key']));

      if (beforeCount != existing.length) {
        _state[compositeKey]!['filters'] = existing;
        totalRemoved += beforeCount - existing.length;
        lastModifiedKey = compositeKey;
        debugPrint(
            'SearchStateManager: Removed ${beforeCount - existing.length} filters for keys=$filterKeys from $compositeKey');
      }
    }

    debugPrint(
        'SearchStateManager: Total removed $totalRemoved filters for keys=$filterKeys across screen $screenKey');

    // Trigger search on the default composite key if any filters were removed
    if (triggerSearch && totalRemoved > 0) {
      final defaultKey = _compositeKey(screenKey, 'default');
      if (_searchCallbacks.containsKey(defaultKey)) {
        _notifyChange(defaultKey);
      } else if (lastModifiedKey != null && _searchCallbacks.containsKey(lastModifiedKey)) {
        _notifyChange(lastModifiedKey);
      }
    }
  }

  /// Get accumulated filters for a specific searchName
  List<dynamic> getFilters(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    return List<dynamic>.from(
        _state[compositeKey]?['filters'] as List? ?? []);
  }

  /// Get ALL accumulated filters across all searchNames for a screen
  /// Deduplicates by filter 'key' field - if same key exists in multiple searchNames,
  /// the later one (by iteration order) wins
  List<dynamic> getAllFilters(String screenKey) {
    final filtersByKey = <String, dynamic>{};
    for (final entry in _state.entries) {
      if (entry.key.startsWith('$screenKey::')) {
        final filters = entry.value['filters'] as List? ?? [];
        for (final filter in filters) {
          if (filter is Map && filter['key'] != null) {
            // Deduplicate by filter key - later entries override earlier ones
            filtersByKey[filter['key'].toString()] = filter;
          }
        }
      }
    }
    final allFilters = filtersByKey.values.toList();
    debugPrint('SearchStateManager: getAllFilters for $screenKey found ${allFilters.length} filters (deduplicated by key)');
    return allFilters;
  }

  /// Check if there are any filters for the screen (across all searchNames)
  bool hasFiltersForScreen(String screenKey) {
    for (final entry in _state.entries) {
      if (entry.key.startsWith('$screenKey::')) {
        final filters = entry.value['filters'] as List? ?? [];
        if (filters.isNotEmpty) return true;
      }
    }
    return false;
  }

  /// Update orderBy - only one active at a time, last one wins
  void updateOrderBy(
    String screenKey,
    String searchName,
    Map<String, dynamic>? orderBy, {
    bool triggerSearch = true,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    _state.putIfAbsent(
        compositeKey, () => {'filters': <dynamic>[], 'orderBy': null});

    final oldOrderBy = _state[compositeKey]!['orderBy'];
    _state[compositeKey]!['orderBy'] = orderBy;

    debugPrint('SearchStateManager: Updated orderBy for $compositeKey: $orderBy');

    // Only trigger if orderBy actually changed
    if (triggerSearch && _orderByChanged(oldOrderBy, orderBy)) {
      _notifyChange(compositeKey);
    }
  }

  bool _orderByChanged(dynamic old, dynamic newVal) {
    if (old == null && newVal == null) return false;
    if (old == null || newVal == null) return true;
    if (old is Map && newVal is Map) {
      return old['field'] != newVal['field'] || old['order'] != newVal['order'];
    }
    return true;
  }

  /// Get current orderBy
  Map<String, dynamic>? getOrderBy(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final orderBy = _state[compositeKey]?['orderBy'];
    return orderBy is Map<String, dynamic> ? orderBy : null;
  }

  /// Initialize pagination window after first search
  /// Called by SEARCH_EVENT when pagination is configured
  void initPaginationWindow(
    String screenKey,
    String searchName, {
    required int limit,
    int? maxItems,
    int initialItemCount = 0,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    _state.putIfAbsent(
        compositeKey, () => {'filters': <dynamic>[], 'orderBy': null, 'paginationWindow': <String, dynamic>{}});

    // Default maxItems to 3 pages worth if not specified
    final effectiveMaxItems = maxItems ?? (limit * 3);

    _state[compositeKey]!['paginationWindow'] = <String, dynamic>{
      'startOffset': 0,
      'endOffset': initialItemCount, // Will be updated when data loads
      'limit': limit,
      'maxItems': effectiveMaxItems,
      'hasMoreUp': false, // Initially at the beginning
      'hasMoreDown': true, // Assume more data exists
      'totalInWindow': initialItemCount,
    };

    debugPrint('SearchStateManager: Initialized pagination window for $compositeKey: limit=$limit, maxItems=$effectiveMaxItems');
  }

  /// Get current pagination window state
  PaginationWindow? getPaginationWindow(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final windowData = _state[compositeKey]?['paginationWindow'];
    if (windowData is! Map<String, dynamic>) return null;

    final limit = windowData['limit'] as int? ?? 10;
    // Support both maxItems (new) and windowSize (legacy)
    final maxItems = windowData['maxItems'] as int? ??
        ((windowData['windowSize'] as int? ?? 3) * limit);

    return PaginationWindow(
      startOffset: windowData['startOffset'] as int? ?? 0,
      endOffset: windowData['endOffset'] as int? ?? 0,
      limit: limit,
      maxItems: maxItems,
      hasMoreUp: windowData['hasMoreUp'] as bool? ?? false,
      hasMoreDown: windowData['hasMoreDown'] as bool? ?? true,
      totalInWindow: windowData['totalInWindow'] as int? ?? 0,
    );
  }

  /// Check if we can load more data in a direction
  bool canLoadDown(String screenKey, String searchName) {
    final window = getPaginationWindow(screenKey, searchName);
    return window?.hasMoreDown ?? false;
  }

  bool canLoadUp(String screenKey, String searchName) {
    final window = getPaginationWindow(screenKey, searchName);
    return window?.hasMoreUp ?? false;
  }

  /// Prepare for loading next page (scroll down)
  /// Returns the offset to fetch, or null if can't load more
  int? prepareLoadDown(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final windowData = _state[compositeKey]?['paginationWindow'] as Map<String, dynamic>?;
    if (windowData == null) return null;

    final endOffset = windowData['endOffset'] as int? ?? 0;
    final hasMoreDown = windowData['hasMoreDown'] as bool? ?? false;

    if (!hasMoreDown) {
      debugPrint('SearchStateManager: Cannot load down - no more data');
      return null;
    }

    debugPrint('SearchStateManager: Preparing load down from offset $endOffset');
    return endOffset;
  }

  /// Prepare for loading previous page (scroll up)
  /// Returns the offset to fetch, or null if can't load more
  int? prepareLoadUp(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final windowData = _state[compositeKey]?['paginationWindow'] as Map<String, dynamic>?;
    if (windowData == null) return null;

    final startOffset = windowData['startOffset'] as int? ?? 0;
    final limit = windowData['limit'] as int? ?? 10;
    final hasMoreUp = windowData['hasMoreUp'] as bool? ?? false;

    if (!hasMoreUp || startOffset <= 0) {
      debugPrint('SearchStateManager: Cannot load up - at beginning');
      return null;
    }

    final newOffset = (startOffset - limit).clamp(0, startOffset);
    debugPrint('SearchStateManager: Preparing load up from offset $newOffset');
    return newOffset;
  }

  /// Update window after data is loaded
  /// Call this from FlowCrudBloc after data arrives
  void onDataLoaded(
    String screenKey,
    String searchName, {
    required String direction, // 'down', 'up', or 'initial'
    required int loadedCount,
    required int totalInWindow,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final windowData = _state[compositeKey]?['paginationWindow'] as Map<String, dynamic>?;

    debugPrint('SearchStateManager.onDataLoaded: screenKey=$screenKey, direction=$direction, '
        'loadedCount=$loadedCount, totalInWindow=$totalInWindow, windowData=${windowData != null}');

    if (windowData == null) return;

    final limit = windowData['limit'] as int? ?? 10;
    // Support both maxItems (new) and windowSize (legacy)
    final maxItems = windowData['maxItems'] as int? ??
        ((windowData['windowSize'] as int? ?? 3) * limit);

    debugPrint('SearchStateManager.onDataLoaded: limit=$limit, maxItems=$maxItems, '
        'willTrim=${totalInWindow > maxItems} (totalInWindow=$totalInWindow > maxItems=$maxItems)');

    if (direction == 'initial') {
      // First load
      windowData['startOffset'] = 0;
      windowData['endOffset'] = loadedCount;
      windowData['hasMoreUp'] = false;
      windowData['hasMoreDown'] = loadedCount >= limit; // Assume more if we got full page
      windowData['totalInWindow'] = loadedCount;
    } else if (direction == 'down') {
      // Loaded next page
      final oldEndOffset = windowData['endOffset'] as int? ?? 0;
      windowData['endOffset'] = oldEndOffset + loadedCount;
      windowData['hasMoreDown'] = loadedCount >= limit;
      windowData['totalInWindow'] = totalInWindow;

      // Check if we need to trim from start
      if (totalInWindow > maxItems) {
        final trimCount = totalInWindow - maxItems;
        final oldStartOffset = windowData['startOffset'] as int? ?? 0;
        windowData['startOffset'] = oldStartOffset + trimCount;
        windowData['hasMoreUp'] = true;
        windowData['totalInWindow'] = maxItems;
      }
    } else if (direction == 'up') {
      // Loaded previous page
      final oldStartOffset = windowData['startOffset'] as int? ?? 0;
      final newStartOffset = (oldStartOffset - loadedCount).clamp(0, oldStartOffset);
      windowData['startOffset'] = newStartOffset;
      windowData['hasMoreUp'] = newStartOffset > 0;
      windowData['totalInWindow'] = totalInWindow;

      // Check if we need to trim from end
      if (totalInWindow > maxItems) {
        final trimCount = totalInWindow - maxItems;
        final oldEndOffset = windowData['endOffset'] as int? ?? 0;
        windowData['endOffset'] = oldEndOffset - trimCount;
        windowData['hasMoreDown'] = true;
        windowData['totalInWindow'] = maxItems;
      }
    }

    _state[compositeKey]!['paginationWindow'] = windowData;
    debugPrint('SearchStateManager: Updated window after $direction load: '
        'startOffset=${windowData['startOffset']}, endOffset=${windowData['endOffset']}, '
        'totalInWindow=${windowData['totalInWindow']}, hasMoreUp=${windowData['hasMoreUp']}, hasMoreDown=${windowData['hasMoreDown']}');
  }

  /// Reset pagination window (call when filters change)
  void resetPaginationWindow(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    if (_state.containsKey(compositeKey)) {
      _state[compositeKey]!.remove('paginationWindow');
      debugPrint('SearchStateManager: Reset pagination window for $compositeKey');
    }
  }

  // Legacy methods for backwards compatibility
  /// Update pagination state (offset, limit) - DEPRECATED: use initPaginationWindow instead
  void updatePagination(
    String screenKey,
    String searchName, {
    int? offset,
    int? limit,
  }) {
    final compositeKey = _compositeKey(screenKey, searchName);
    _state.putIfAbsent(
        compositeKey, () => {'filters': <dynamic>[], 'orderBy': null, 'pagination': <String, dynamic>{}});

    final pagination = _state[compositeKey]!['pagination'] as Map<String, dynamic>? ?? {};
    if (offset != null) pagination['offset'] = offset;
    if (limit != null) pagination['limit'] = limit;
    _state[compositeKey]!['pagination'] = pagination;

    debugPrint('SearchStateManager: Updated pagination for $compositeKey: offset=$offset, limit=$limit');
  }

  /// Get current pagination state - DEPRECATED: use getPaginationWindow instead
  Map<String, dynamic>? getPagination(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    final pagination = _state[compositeKey]?['pagination'];
    return pagination is Map<String, dynamic> ? pagination : null;
  }

  /// Increment offset by limit (for load more) - DEPRECATED
  int incrementOffset(String screenKey, String searchName, {int defaultLimit = 10}) {
    final compositeKey = _compositeKey(screenKey, searchName);
    _state.putIfAbsent(
        compositeKey, () => {'filters': <dynamic>[], 'orderBy': null, 'pagination': <String, dynamic>{}});

    final pagination = _state[compositeKey]!['pagination'] as Map<String, dynamic>? ?? {};
    final currentOffset = pagination['offset'] as int? ?? 0;
    final limit = pagination['limit'] as int? ?? defaultLimit;
    final newOffset = currentOffset + limit;

    pagination['offset'] = newOffset;
    _state[compositeKey]!['pagination'] = pagination;

    debugPrint('SearchStateManager: Incremented offset for $compositeKey: $currentOffset -> $newOffset');
    return newOffset;
  }

  /// Reset pagination (call when filters change) - DEPRECATED: use resetPaginationWindow instead
  void resetPagination(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    if (_state.containsKey(compositeKey)) {
      _state[compositeKey]!['pagination'] = <String, dynamic>{'offset': 0};
      debugPrint('SearchStateManager: Reset pagination for $compositeKey');
    }
    // Also reset the window if it exists
    resetPaginationWindow(screenKey, searchName);
  }

  /// Check if there are any filters or orderBy set
  bool hasState(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    if (!_state.containsKey(compositeKey)) return false;

    final filters = _state[compositeKey]!['filters'] as List?;
    final orderBy = _state[compositeKey]!['orderBy'];

    return (filters != null && filters.isNotEmpty) || orderBy != null;
  }

  /// Clear all state for a specific search (or all searches for a screen if searchName is null)
  void clear(String screenKey, [String? searchName]) {
    if (searchName != null) {
      final compositeKey = _compositeKey(screenKey, searchName);
      _state.remove(compositeKey);
      debugPrint('SearchStateManager: Cleared state for $compositeKey');
    } else {
      // Clear all for this screen
      final keysToRemove =
          _state.keys.where((k) => k.startsWith('$screenKey::')).toList();
      for (final key in keysToRemove) {
        _state.remove(key);
      }
      debugPrint(
          'SearchStateManager: Cleared all state for screen $screenKey (${keysToRemove.length} entries)');
    }
  }

  /// Dispose notifiers and callbacks for a screen
  void dispose(String screenKey, [String? searchName]) {
    if (searchName != null) {
      final compositeKey = _compositeKey(screenKey, searchName);
      _notifiers[compositeKey]?.dispose();
      _notifiers.remove(compositeKey);
      _searchCallbacks.remove(compositeKey);
      _state.remove(compositeKey);
    } else {
      // Dispose all for this screen
      final keysToRemove =
          _notifiers.keys.where((k) => k.startsWith('$screenKey::')).toList();
      for (final key in keysToRemove) {
        _notifiers[key]?.dispose();
        _notifiers.remove(key);
        _searchCallbacks.remove(key);
        _state.remove(key);
      }
    }
    debugPrint('SearchStateManager: Disposed for $screenKey${searchName != null ? '::$searchName' : ' (all)'}');
  }

  /// Dispose all state (use with caution, typically on app restart)
  void disposeAll() {
    for (final notifier in _notifiers.values) {
      notifier.dispose();
    }
    _notifiers.clear();
    _searchCallbacks.clear();
    _state.clear();
    debugPrint('SearchStateManager: Disposed all state');
  }
}

/// Represents the current pagination window state
class PaginationWindow {
  /// Offset of the first item in current window
  final int startOffset;

  /// Offset after the last item in current window (next fetch position for down)
  final int endOffset;

  /// Items per page/batch
  final int limit;

  /// Maximum items to keep in memory
  final int maxItems;

  /// Whether there's more data above current window
  final bool hasMoreUp;

  /// Whether there's more data below current window
  final bool hasMoreDown;

  /// Current total items in window
  final int totalInWindow;

  const PaginationWindow({
    required this.startOffset,
    required this.endOffset,
    required this.limit,
    required this.maxItems,
    required this.hasMoreUp,
    required this.hasMoreDown,
    required this.totalInWindow,
  });

  /// How many items to trim when window exceeds max
  int trimCountIfNeeded(int newTotal) {
    if (newTotal > maxItems) {
      return newTotal - maxItems;
    }
    return 0;
  }

  @override
  String toString() => 'PaginationWindow(start=$startOffset, end=$endOffset, '
      'total=$totalInWindow, maxItems=$maxItems, hasUp=$hasMoreUp, hasDown=$hasMoreDown)';
}
