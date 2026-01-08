import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_flow_builder/blocs/search_state_manager.dart';
import 'package:digit_flow_builder/blocs/state_wrapper_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowCrudBloc extends CrudBloc {
  final Map<String, dynamic> flowConfig;
  final String screenKey;
  final void Function(String screenKey, FlowCrudState state)? onUpdate;

  FlowCrudBloc({
    required this.flowConfig,
    required super.service,
    this.onUpdate,
  }) : screenKey = '${flowConfig["name"]}' {
    // We don't listen directly anymore — handled in onTransition
  }

  @override
  void onTransition(Transition<CrudEvent, CrudState> transition) {
    super.onTransition(transition);

    final CrudState crudState = transition.nextState;
    List<dynamic>? wrapper;
    final existingState = FlowCrudStateRegistry().get(screenKey);

    // Handle loading state
    if (crudState is CrudStateLoading) {
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: existingState?.stateWrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: true,
      );
      FlowCrudStateRegistry().update(screenKey, flowState);
      return;
    }

    if (crudState is CrudStateLoaded) {
      // Consume scroll direction and pagination info when we have loaded data
      // This prevents intermediate states (Loading) from consuming the flags
      final scrollDirection =
          FlowCrudStateRegistry().consumeScrollDirection(screenKey);
      final paginationInfo =
          FlowCrudStateRegistry().consumePaginationInfo(screenKey);

      // Fallback to legacy append mode for backwards compatibility
      final legacyAppendMode =
          FlowCrudStateRegistry().consumeAppendMode(screenKey);

      final newEntities =
          crudState.results.values.expand((list) => list).toList();
      final newWrapper = WrapperBuilder(
        newEntities,
        flowConfig['wrapperConfig'],
        screenKey: screenKey,
      ).build();

      if (scrollDirection != null && existingState?.stateWrapper != null) {
        // Bidirectional pagination mode
        wrapper = _handleBidirectionalPagination(
          existingWrapper: existingState!.stateWrapper!,
          newWrapper: newWrapper,
          direction: scrollDirection,
          paginationInfo: paginationInfo,
        );
      } else if (legacyAppendMode &&
          existingState?.stateWrapper != null &&
          newEntities.isNotEmpty) {
        // Legacy append mode: add new entities to existing wrapper
        final existingWrapper =
            List<dynamic>.from(existingState!.stateWrapper!);
        existingWrapper.addAll(newWrapper);
        wrapper = existingWrapper;
        debugPrint(
            'FlowCrudBloc: Legacy appended ${newWrapper.length} items, total=${wrapper.length}');
      } else if ((scrollDirection != null || legacyAppendMode) &&
          newEntities.isEmpty) {
        // Scroll/append mode but no new entities - preserve existing data
        wrapper = existingState?.stateWrapper;
        debugPrint(
            'FlowCrudBloc: No new data, preserving ${wrapper?.length ?? 0} existing items');

        // Update SearchStateManager to mark no more data in this direction
        _updateNoMoreData(scrollDirection);
      } else {
        // Normal mode: replace with new entities
        wrapper = newWrapper;

        // Update pagination window for initial load
        _updatePaginationWindowInitial(newWrapper.length, paginationInfo);
      }

      // Preserve existing formData and widgetData when creating new state
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: wrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: false,
      );

      onUpdate?.call(screenKey, flowState);
      FlowCrudStateRegistry().update(screenKey, flowState);
    } else if (crudState is CrudStatePersisted) {
      final entities = crudState.entities;
      wrapper = WrapperBuilder(
        entities,
        flowConfig['wrapperConfig'],
        screenKey: screenKey,
      ).build();
      // Preserve existing formData and widgetData when creating new state
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: wrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: false,
      );

      onUpdate?.call(screenKey, flowState);
      FlowCrudStateRegistry().update(screenKey, flowState);
    }
  }

  /// Handle bidirectional pagination with window trimming
  List<dynamic> _handleBidirectionalPagination({
    required List<dynamic> existingWrapper,
    required List<dynamic> newWrapper,
    required String direction,
    Map<String, int>? paginationInfo,
  }) {
    final limit = paginationInfo?['limit'] ?? 10;
    // Support both maxItems (new) and windowSize (legacy)
    final maxItems = paginationInfo?['maxItems'] ??
        ((paginationInfo?['windowSize'] ?? 3) * limit);

    List<dynamic> result;
    int totalBeforeTrim; // Track pre-trim total for accurate offset calculation

    if (direction == 'down') {
      // Append new items to the end
      result = List<dynamic>.from(existingWrapper);
      result.addAll(newWrapper);
      totalBeforeTrim = result.length; // Capture before trimming

      // Trim from the start if exceeds max
      if (result.length > maxItems) {
        final trimCount = result.length - maxItems;
        result = result.sublist(trimCount);
        debugPrint('FlowCrudBloc: Trimmed $trimCount items from start');
      }

      debugPrint(
          'FlowCrudBloc: Appended ${newWrapper.length} items (down), totalBeforeTrim=$totalBeforeTrim, afterTrim=${result.length}');
    } else if (direction == 'up') {
      // Prepend new items to the start
      result = List<dynamic>.from(newWrapper);
      result.addAll(existingWrapper);
      totalBeforeTrim = result.length; // Capture before trimming

      // Trim from the end if exceeds max
      if (result.length > maxItems) {
        final trimCount = result.length - maxItems;
        result = result.sublist(0, result.length - trimCount);
        debugPrint('FlowCrudBloc: Trimmed $trimCount items from end');
      }

      debugPrint(
          'FlowCrudBloc: Prepended ${newWrapper.length} items (up), totalBeforeTrim=$totalBeforeTrim, afterTrim=${result.length}');
    } else {
      // Unknown direction, just use new wrapper
      result = newWrapper;
      totalBeforeTrim = result.length;
    }

    // Update pagination window state with PRE-TRIM total so offsets are calculated correctly
    debugPrint(
        'FlowCrudBloc: Calling _updatePaginationWindow - direction=$direction, '
        'loadedCount=${newWrapper.length}, totalBeforeTrim=$totalBeforeTrim');
    _updatePaginationWindow(
        direction, newWrapper.length, totalBeforeTrim, paginationInfo);

    return result;
  }

  /// Update pagination window after data loaded
  void _updatePaginationWindow(
    String direction,
    int loadedCount,
    int totalInWindow,
    Map<String, int>? paginationInfo,
  ) {
    // Use screenKey without prefix - matches how SearchExecutor initializes the window
    SearchStateManager().onDataLoaded(
      screenKey, // Use screenKey without prefix to match initialization
      '_pagination',
      direction: direction,
      loadedCount: loadedCount,
      totalInWindow: totalInWindow,
    );
  }

  /// Update pagination window for initial load
  void _updatePaginationWindowInitial(
      int loadedCount, Map<String, int>? paginationInfo) {
    // Use screenKey without prefix - matches how SearchExecutor initializes the window
    final limit = paginationInfo?['limit'];

    debugPrint('FlowCrudBloc: _updatePaginationWindowInitial called - '
        'screenKey=$screenKey, loadedCount=$loadedCount, limit=$limit');

    if (limit != null) {
      SearchStateManager().onDataLoaded(
        screenKey, // Use screenKey without prefix to match initialization
        '_pagination',
        direction: 'initial',
        loadedCount: loadedCount,
        totalInWindow: loadedCount,
      );
      debugPrint(
          'FlowCrudBloc: Updated pagination window - endOffset should now be $loadedCount');
    } else {
      debugPrint(
          'FlowCrudBloc: Skipped pagination window update - limit is null (paginationInfo=$paginationInfo)');
    }
  }

  /// Mark no more data available in a direction
  void _updateNoMoreData(String? direction) {
    if (direction == null) return;

    // Use screenKey without prefix - matches how SearchExecutor initializes the window
    SearchStateManager().onDataLoaded(
      screenKey, // Use screenKey without prefix to match initialization
      '_pagination',
      direction: direction,
      loadedCount: 0,
      totalInWindow:
          FlowCrudStateRegistry().get(screenKey)?.stateWrapper?.length ?? 0,
    );
  }

  @override
  Future<void> close() {
    // Build full screenKey with screenType for SearchStateManager
    final screenType = flowConfig['screenType'] ?? 'TEMPLATE';
    final fullScreenKey = '$screenType::$screenKey';

    // Dispose FlowCrudStateRegistry
    FlowCrudStateRegistry().dispose(screenKey);

    // Dispose SearchStateManager (clears accumulated filters, callbacks, etc.)
    SearchStateManager().dispose(fullScreenKey);

    debugPrint('FlowCrudBloc: Disposed state for $fullScreenKey');
    return super.close();
  }
}

class FlowCrudStateRegistry {
  final Map<String, ValueNotifier<FlowCrudState?>> _map = {};
  final Map<String, Map<String, dynamic>?> _navParams = {};
  final Map<String, bool> _appendMode = {};
  final Map<String, String> _scrollDirection = {}; // 'up' or 'down'
  final Map<String, Map<String, int>> _paginationInfo = {}; // limit, windowSize

  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

  /// Set append mode for next state update (used by REFRESH_SEARCH) - DEPRECATED
  void setAppendMode(String key, bool append) {
    _appendMode[key] = append;
    debugPrint('FlowCrudStateRegistry: Set appendMode=$append for $key');
  }

  /// Get and consume append mode (called during state update) - DEPRECATED
  bool consumeAppendMode(String key) {
    final append = _appendMode[key] ?? false;
    _appendMode.remove(key);
    return append;
  }

  /// Set scroll direction for next state update (used by REFRESH_SEARCH)
  void setScrollDirection(String key, String direction) {
    _scrollDirection[key] = direction;
    debugPrint(
        'FlowCrudStateRegistry: Set scrollDirection=$direction for $key');
  }

  /// Get and consume scroll direction (called during state update)
  /// Returns 'down', 'up', or null if not set
  String? consumeScrollDirection(String key) {
    final direction = _scrollDirection[key];
    _scrollDirection.remove(key);
    return direction;
  }

  /// Set pagination info for window management
  void setPaginationInfo(String key,
      {required int limit, required int maxItems}) {
    _paginationInfo[key] = {'limit': limit, 'maxItems': maxItems};
    debugPrint(
        'FlowCrudStateRegistry: Set paginationInfo limit=$limit, maxItems=$maxItems for $key');
  }

  /// Get and consume pagination info
  Map<String, int>? consumePaginationInfo(String key) {
    final info = _paginationInfo[key];
    _paginationInfo.remove(key);
    return info;
  }

  void update(String key, FlowCrudState state) {
    _map.putIfAbsent(key, () => ValueNotifier<FlowCrudState?>(null)).value =
        state;
  }

  ValueNotifier<FlowCrudState?> listen(String key) {
    return _map.putIfAbsent(key, () => ValueNotifier<FlowCrudState?>(null));
  }

  FlowCrudState? get(String key) => _map[key]?.value;

  void clear(String key) {
    if (_map.containsKey(key)) {
      _map[key]!.value = null;
    }
    _navParams.remove(key);
    _scrollDirection.remove(key);
    _paginationInfo.remove(key);
  }

  void clearAll() {
    for (final notifier in _map.values) {
      notifier.value = null;
    }
    _navParams.clear();
    _scrollDirection.clear();
    _paginationInfo.clear();
  }

  void dispose(String key) {
    if (_map.containsKey(key)) {
      _map[key]!.dispose();
      _map.remove(key);
    }
    _navParams.remove(key);
    _scrollDirection.remove(key);
    _paginationInfo.remove(key);
  }

  void disposeAll() {
    for (final notifier in _map.values) {
      notifier.dispose();
    }
    _map.clear();
    _navParams.clear();
    _scrollDirection.clear();
    _paginationInfo.clear();
  }

  void updateNavigationParams(String key, Map<String, dynamic>? params) {
    _navParams[key] = params;
  }

  Map<String, dynamic>? getNavigationParams(String key) {
    return _navParams[key];
  }
}

class FlowCrudState {
  final CrudState? base;
  final List<dynamic>? stateWrapper;
  final Map<String, dynamic>? formData;
  final Map<String, dynamic>? widgetData;
  final bool isLoading;

  const FlowCrudState({
    this.base,
    this.stateWrapper,
    this.formData,
    this.widgetData,
    this.isLoading = false,
  });

  FlowCrudState copyWith({
    CrudState? base,
    List<dynamic>? stateWrapper,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? widgetData,
    bool? isLoading,
  }) {
    return FlowCrudState(
      base: base ?? this.base,
      stateWrapper: stateWrapper ?? this.stateWrapper,
      formData: formData ?? this.formData,
      widgetData: widgetData ?? this.widgetData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
