import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_flow_builder/blocs/search_state_manager.dart';
import 'package:digit_flow_builder/blocs/state_wrapper_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowCrudBloc extends CrudBloc {
  final Map<String, dynamic> flowConfig;
  final String screenKey;
  final String instanceId;
  final String compositeKey;
  final void Function(String screenKey, FlowCrudState state)? onUpdate;

  FlowCrudBloc({
    required this.flowConfig,
    required super.service,
    required this.instanceId,
    this.onUpdate,
  })  : screenKey = '${flowConfig["name"]}',
        compositeKey = '${flowConfig["name"]}::$instanceId' {
    // We don't listen directly anymore — handled in onTransition
  }

  @override
  void onTransition(Transition<CrudEvent, CrudState> transition) {
    super.onTransition(transition);

    final CrudState crudState = transition.nextState;
    List<dynamic>? wrapper;
    final existingState = FlowCrudStateRegistry().getByCompositeKey(compositeKey);

    // Handle loading state
    if (crudState is CrudStateLoading) {
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: existingState?.stateWrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: true,
      );
      FlowCrudStateRegistry().updateByCompositeKey(compositeKey, flowState);
      return;
    }

    if (crudState is CrudStateLoaded) {
      // Consume scroll direction and pagination info when we have loaded data
      // This prevents intermediate states (Loading) from consuming the flags
      final scrollDirection =
          FlowCrudStateRegistry().consumeScrollDirectionByCompositeKey(compositeKey);
      final paginationInfo =
          FlowCrudStateRegistry().consumePaginationInfoByCompositeKey(compositeKey);

      // Fallback to legacy append mode for backwards compatibility
      final legacyAppendMode =
          FlowCrudStateRegistry().consumeAppendModeByCompositeKey(compositeKey);

      final newEntities =
          crudState.results.values.expand((list) => list).toList();
      final wrapperConfig = flowConfig['wrapperConfig'] as Map<String, dynamic>?;
      final newWrapper = wrapperConfig != null
          ? WrapperBuilder(
              newEntities,
              wrapperConfig,
              screenKey: screenKey,
            ).build()
          : newEntities;
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

      onUpdate?.call(compositeKey, flowState);
      FlowCrudStateRegistry().updateByCompositeKey(compositeKey, flowState);
    } else if (crudState is CrudStatePersisted) {
      final entities = crudState.entities;
      final persistedWrapperConfig = flowConfig['wrapperConfig'] as Map<String, dynamic>?;
      wrapper = persistedWrapperConfig != null
          ? WrapperBuilder(
              entities,
              persistedWrapperConfig,
              screenKey: screenKey,
            ).build()
          : entities;
      // Preserve existing formData and widgetData when creating new state
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: wrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: false,
      );

      onUpdate?.call(compositeKey, flowState);
      FlowCrudStateRegistry().updateByCompositeKey(compositeKey, flowState);
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
    // Use compositeKey for this page instance's state
    SearchStateManager().onDataLoadedByCompositeKey(
      compositeKey,
      '_pagination',
      direction: direction,
      loadedCount: loadedCount,
      totalInWindow: totalInWindow,
    );
  }

  /// Update pagination window for initial load
  void _updatePaginationWindowInitial(
      int loadedCount, Map<String, int>? paginationInfo) {
    final limit = paginationInfo?['limit'];

    debugPrint('FlowCrudBloc: _updatePaginationWindowInitial called - '
        'compositeKey=$compositeKey, loadedCount=$loadedCount, limit=$limit');

    if (limit != null) {
      SearchStateManager().onDataLoadedByCompositeKey(
        compositeKey,
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

    // Use compositeKey for this page instance's state
    SearchStateManager().onDataLoadedByCompositeKey(
      compositeKey,
      '_pagination',
      direction: direction,
      loadedCount: 0,
      totalInWindow:
          FlowCrudStateRegistry().getByCompositeKey(compositeKey)?.stateWrapper?.length ?? 0,
    );
  }

  @override
  Future<void> close() {
    // Dispose using composite key - each page instance has its own state
    FlowCrudStateRegistry().disposeByCompositeKey(compositeKey);
    SearchStateManager().disposeByCompositeKey(compositeKey);

    debugPrint('FlowCrudBloc: Disposed state for $compositeKey');
    return super.close();
  }
}

class FlowCrudStateRegistry {
  final Map<String, ValueNotifier<FlowCrudState?>> _map = {};
  final Map<String, Map<String, dynamic>?> _navParams = {};
  final Map<String, bool> _appendMode = {};
  final Map<String, String> _scrollDirection = {}; // 'up' or 'down'
  final Map<String, Map<String, int>> _paginationInfo = {}; // limit, windowSize
  final Map<String, String> _instanceIds = {}; // screenKey -> current instanceId

  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

  /// Get composite key using screenKey and instanceId
  String _compositeKey(String screenKey, String instanceId) =>
      '${screenKey}::$instanceId';

  /// Get composite key for current instance of a screenKey
  String? _currentCompositeKey(String screenKey) {
    final instanceId = _instanceIds[screenKey];
    if (instanceId == null) return null;
    return _compositeKey(screenKey, instanceId);
  }

  /// Register instanceId for a screen key
  void registerInstance(String key, String instanceId) {
    _instanceIds[key] = instanceId;
    debugPrint('FlowCrudStateRegistry: Registered instanceId $instanceId for $key');
  }

  /// Get the current instanceId for a screen key
  String? getInstanceId(String key) => _instanceIds[key];

  /// Check if the given instanceId matches the current one for this key
  bool isCurrentInstance(String key, String instanceId) {
    return _instanceIds[key] == instanceId;
  }

  /// Dispose state only if the given instanceId is the current owner
  /// Returns true if disposed, false if skipped
  bool disposeIfOwner(String key, String instanceId) {
    if (_instanceIds[key] != instanceId) {
      debugPrint('FlowCrudStateRegistry: Skipped dispose for $key - instanceId $instanceId is not current owner (current: ${_instanceIds[key]})');
      return false;
    }
    // Use composite key for actual disposal
    final compositeKey = _compositeKey(key, instanceId);
    _disposeCompositeKey(compositeKey);
    _instanceIds.remove(key);
    return true;
  }

  /// Internal dispose using composite key
  void _disposeCompositeKey(String compositeKey) {
    if (_map.containsKey(compositeKey)) {
      _map[compositeKey]!.dispose();
      _map.remove(compositeKey);
    }
    _navParams.remove(compositeKey);
    _scrollDirection.remove(compositeKey);
    _paginationInfo.remove(compositeKey);
    debugPrint('FlowCrudStateRegistry: Disposed compositeKey $compositeKey');
  }

  /// Dispose state directly using a composite key (pageName::instanceId)
  /// Use this when you have the full composite key
  void disposeByCompositeKey(String compositeKey) {
    _disposeCompositeKey(compositeKey);
  }

  // ============ Composite Key Methods (Direct Access) ============

  /// Update state using composite key directly
  void updateByCompositeKey(String compositeKey, FlowCrudState state) {
    _map.putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null)).value = state;
  }

  /// Get state using composite key directly
  FlowCrudState? getByCompositeKey(String compositeKey) => _map[compositeKey]?.value;

  /// Listen to state using composite key directly
  ValueNotifier<FlowCrudState?> listenByCompositeKey(String compositeKey) {
    return _map.putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null));
  }

  /// Consume append mode using composite key directly
  bool consumeAppendModeByCompositeKey(String compositeKey) {
    final append = _appendMode[compositeKey] ?? false;
    _appendMode.remove(compositeKey);
    return append;
  }

  /// Consume scroll direction using composite key directly
  String? consumeScrollDirectionByCompositeKey(String compositeKey) {
    final direction = _scrollDirection[compositeKey];
    _scrollDirection.remove(compositeKey);
    return direction;
  }

  /// Consume pagination info using composite key directly
  Map<String, int>? consumePaginationInfoByCompositeKey(String compositeKey) {
    final info = _paginationInfo[compositeKey];
    _paginationInfo.remove(compositeKey);
    return info;
  }

  /// Set scroll direction using composite key directly
  void setScrollDirectionByCompositeKey(String compositeKey, String direction) {
    _scrollDirection[compositeKey] = direction;
    debugPrint('FlowCrudStateRegistry: Set scrollDirection=$direction for $compositeKey');
  }

  /// Set pagination info using composite key directly
  void setPaginationInfoByCompositeKey(String compositeKey, {required int limit, required int maxItems}) {
    _paginationInfo[compositeKey] = {'limit': limit, 'maxItems': maxItems};
    debugPrint('FlowCrudStateRegistry: Set paginationInfo limit=$limit, maxItems=$maxItems for $compositeKey');
  }

  /// Update navigation params using composite key directly
  void updateNavigationParamsByCompositeKey(String compositeKey, Map<String, dynamic>? params) {
    _navParams[compositeKey] = params;
  }

  /// Get navigation params using composite key directly
  Map<String, dynamic>? getNavigationParamsByCompositeKey(String compositeKey) {
    return _navParams[compositeKey];
  }

  // ============ End Composite Key Methods ============

  /// Set append mode for next state update (used by REFRESH_SEARCH) - DEPRECATED
  void setAppendMode(String key, bool append) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    _appendMode[compositeKey] = append;
    debugPrint('FlowCrudStateRegistry: Set appendMode=$append for $compositeKey');
  }

  /// Get and consume append mode (called during state update) - DEPRECATED
  bool consumeAppendMode(String key) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    final append = _appendMode[compositeKey] ?? false;
    _appendMode.remove(compositeKey);
    return append;
  }

  /// Set scroll direction for next state update (used by REFRESH_SEARCH)
  void setScrollDirection(String key, String direction) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    _scrollDirection[compositeKey] = direction;
    debugPrint(
        'FlowCrudStateRegistry: Set scrollDirection=$direction for $compositeKey');
  }

  /// Get and consume scroll direction (called during state update)
  /// Returns 'down', 'up', or null if not set
  String? consumeScrollDirection(String key) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    final direction = _scrollDirection[compositeKey];
    _scrollDirection.remove(compositeKey);
    return direction;
  }

  /// Set pagination info for window management
  void setPaginationInfo(String key,
      {required int limit, required int maxItems}) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    _paginationInfo[compositeKey] = {'limit': limit, 'maxItems': maxItems};
    debugPrint(
        'FlowCrudStateRegistry: Set paginationInfo limit=$limit, maxItems=$maxItems for $compositeKey');
  }

  /// Get and consume pagination info
  Map<String, int>? consumePaginationInfo(String key) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    final info = _paginationInfo[compositeKey];
    _paginationInfo.remove(compositeKey);
    return info;
  }

  void update(String key, FlowCrudState state) {
    // Use composite key if instanceId is registered for this screenKey
    final compositeKey = _currentCompositeKey(key) ?? key;
    _map.putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null)).value =
        state;
  }

  ValueNotifier<FlowCrudState?> listen(String key) {
    // Use composite key if instanceId is registered for this screenKey
    final compositeKey = _currentCompositeKey(key) ?? key;
    return _map.putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null));
  }

  FlowCrudState? get(String key) {
    // Use composite key if instanceId is registered for this screenKey
    final compositeKey = _currentCompositeKey(key) ?? key;
    return _map[compositeKey]?.value;
  }

  void clear(String key) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    if (_map.containsKey(compositeKey)) {
      _map[compositeKey]!.value = null;
    }
    _navParams.remove(compositeKey);
    _scrollDirection.remove(compositeKey);
    _paginationInfo.remove(compositeKey);
  }

  void clearAll() {
    for (final notifier in _map.values) {
      notifier.value = null;
    }
    _navParams.clear();
    _scrollDirection.clear();
    _paginationInfo.clear();
    _instanceIds.clear();
  }

  void dispose(String key) {
    final compositeKey = _currentCompositeKey(key) ?? key;
    if (_map.containsKey(compositeKey)) {
      _map[compositeKey]!.dispose();
      _map.remove(compositeKey);
    }
    _navParams.remove(compositeKey);
    _scrollDirection.remove(compositeKey);
    _paginationInfo.remove(compositeKey);
    _instanceIds.remove(key);
  }

  void disposeAll() {
    for (final notifier in _map.values) {
      notifier.dispose();
    }
    _map.clear();
    _navParams.clear();
    _scrollDirection.clear();
    _paginationInfo.clear();
    _instanceIds.clear();
  }

  void updateNavigationParams(String key, Map<String, dynamic>? params) {
    final compositeKey =  key;
    _navParams[compositeKey] = params;
  }

  Map<String, dynamic>? getNavigationParams(String key) {
    final compositeKey = key ;
    return _navParams[compositeKey];
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
