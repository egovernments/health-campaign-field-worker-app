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

  /// Get all accumulated filters
  List<dynamic> getFilters(String screenKey, String searchName) {
    final compositeKey = _compositeKey(screenKey, searchName);
    return List<dynamic>.from(
        _state[compositeKey]?['filters'] as List? ?? []);
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
