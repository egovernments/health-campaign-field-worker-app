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
    final existingState =
        FlowCrudStateRegistry().getByCompositeKey(compositeKey);

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

    // Handle error state - reset loading
    if (crudState is CrudStateError) {
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: existingState?.stateWrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
        isLoading: false,
      );
      FlowCrudStateRegistry().updateByCompositeKey(compositeKey, flowState);
      return;
    }

    if (crudState is CrudStateLoaded) {
      // Consume scroll direction and pagination info when we have loaded data
      // This prevents intermediate states (Loading) from consuming the flags
      final scrollDirection = FlowCrudStateRegistry()
          .consumeScrollDirectionByCompositeKey(compositeKey);
      final paginationInfo = FlowCrudStateRegistry()
          .consumePaginationInfoByCompositeKey(compositeKey);

      // Fallback to legacy append mode for backwards compatibility
      final legacyAppendMode =
          FlowCrudStateRegistry().consumeAppendModeByCompositeKey(compositeKey);

      final newEntities =
          crudState.results.values.expand((list) => list).toList();
      final wrapperConfig =
          flowConfig['wrapperConfig'] as Map<String, dynamic>?;
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
          rawEntityCount: newEntities.length,
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
      } else if ((scrollDirection != null || legacyAppendMode) &&
          newEntities.isEmpty) {
        // Scroll/append mode but no new entities - preserve existing data
        wrapper = existingState?.stateWrapper;

        // Update SearchStateManager to mark no more data in this direction
        _updateNoMoreData(scrollDirection);
      } else {
        // Normal mode: replace with new entities
        wrapper = newWrapper;

        // Update pagination window for initial load
        // For groupByType configs, use raw entity count since WrapperBuilder
        // groups N entities into 1 wrapper item, skewing the pagination count.
        // For other configs, use wrapper length (original behavior).
        final isGrouped = wrapperConfig?['groupByType'] == true;
        final initialLoadCount =
            isGrouped ? newEntities.length : newWrapper.length;
        _updatePaginationWindowInitial(initialLoadCount, paginationInfo);
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
      // final persistedWrapperConfig = flowConfig['wrapperConfig'] as Map<String, dynamic>?;
      // Preserve the existing stateWrapper if the screen already has one
      // (typically a search page with its loaded results). Otherwise this
      // overwrite would briefly replace e.g. the household-list wrapper with
      // the just-created entities (e.g. ProjectBeneficiaryModel rows) during
      // the gap between the CREATE dispatch settling and the post-create
      // navigation completing — causing empty cards to flash on screen.
      // Form pages that haven't loaded anything still fall through to the
      // persisted entities, so their post-submit display path is unchanged.
      wrapper = existingState?.stateWrapper ?? entities;
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
    required int rawEntityCount,
    required String direction,
    Map<String, int>? paginationInfo,
  }) {
    final limit = paginationInfo?['limit'] ?? 10;
    // Support both maxItems (new) and windowSize (legacy)
    final maxItems = paginationInfo?['maxItems'] ??
        ((paginationInfo?['windowSize'] ?? 3) * limit);

    final wrapperConfig = flowConfig['wrapperConfig'] as Map<String, dynamic>?;
    final isGroupedByType = wrapperConfig?['groupByType'] == true;

    List<dynamic> result;
    int totalBeforeTrim; // Track pre-trim total for accurate offset calculation

    if (isGroupedByType) {
      // groupByType wrappers: each item is {"TypeName": [entities]}.
      // Merge entity lists within the same type key instead of appending
      // separate group objects.
      result = _mergeGroupedWrappers(existingWrapper, newWrapper, direction);
      totalBeforeTrim = _countGroupedEntities(result);

      // Trim entities (not wrapper items) if exceeds max
      if (totalBeforeTrim > maxItems) {
        result = _trimGroupedWrappers(result, maxItems, direction);

      }

    } else if (direction == 'down') {
      // Append new items to the end, filtering duplicates by
      // clientReferenceId — paginated windows can overlap when rows shift
      // between fetches (e.g. new inserts, changing sort keys).
      result = List<dynamic>.from(existingWrapper);
      final existingRefIds = _collectClientRefIds(existingWrapper);
      for (final item in newWrapper) {
        final refId = _refIdOf(item);
        if (refId != null && existingRefIds.contains(refId)) continue;
        if (refId != null) existingRefIds.add(refId);
        result.add(item);
      }
      totalBeforeTrim = result.length; // Capture before trimming

      // Trim from the start if exceeds max
      if (result.length > maxItems) {
        final trimCount = result.length - maxItems;
        result = result.sublist(trimCount);
      }
    } else if (direction == 'up') {
      // Prepend new items, filtering duplicates by clientReferenceId. Keep
      // the FIRST occurrence (the incoming older row) since scroll-up loads
      // pages older than what's already in view.
      final seen = <String>{};
      result = <dynamic>[];
      for (final item in newWrapper) {
        final refId = _refIdOf(item);
        if (refId != null && seen.contains(refId)) continue;
        if (refId != null) seen.add(refId);
        result.add(item);
      }
      for (final item in existingWrapper) {
        final refId = _refIdOf(item);
        if (refId != null && seen.contains(refId)) continue;
        if (refId != null) seen.add(refId);
        result.add(item);
      }
      totalBeforeTrim = result.length; // Capture before trimming

      // Trim from the end if exceeds max
      if (result.length > maxItems) {
        final trimCount = result.length - maxItems;
        result = result.sublist(0, result.length - trimCount);
      }
    } else {
      // Unknown direction, just use new wrapper
      result = newWrapper;
      totalBeforeTrim = result.length;
    }

    // Update pagination window state with PRE-TRIM total so offsets are calculated correctly.
    // For groupByType, use rawEntityCount since wrapper items != entity count.
    // For non-grouped, use newWrapper.length (original behavior) to avoid side effects.
    final loadedCount = isGroupedByType ? rawEntityCount : newWrapper.length;
    _updatePaginationWindow(
        direction, loadedCount, totalBeforeTrim, paginationInfo);

    return result;
  }

  /// Merge grouped wrappers by combining entity lists under the same type key.
  /// Input format: [{"TypeName": [entities]}]
  List<dynamic> _mergeGroupedWrappers(
    List<dynamic> existing,
    List<dynamic> newItems,
    String direction,
  ) {
    final typeMap = <String, List<dynamic>>{};

    // Collect existing entities by type
    for (final item in existing) {
      if (item is Map) {
        for (final entry in item.entries) {
          typeMap.putIfAbsent(entry.key.toString(), () => []);
          if (entry.value is List) {
            typeMap[entry.key.toString()]!.addAll(entry.value as List);
          }
        }
      }
    }

    // Merge new entities (append for down, prepend for up) — filter out
    // duplicates by clientReferenceId per type key. Paginated windows can
    // overlap when a row is inserted between fetches or the sort key
    // shifts, so the same entity can arrive on two consecutive pages.
    for (final item in newItems) {
      if (item is Map) {
        for (final entry in item.entries) {
          final key = entry.key.toString();
          typeMap.putIfAbsent(key, () => []);
          if (entry.value is! List) continue;
          final incoming = entry.value as List;
          final existingRefIds = _collectClientRefIds(typeMap[key]!);
          final filtered = <dynamic>[];
          for (final e in incoming) {
            final refId = _refIdOf(e);
            if (refId != null && existingRefIds.contains(refId)) continue;
            if (refId != null) existingRefIds.add(refId);
            filtered.add(e);
          }
          if (direction == 'up') {
            typeMap[key] = [...filtered, ...typeMap[key]!];
          } else {
            typeMap[key]!.addAll(filtered);
          }
        }
      }
    }

    return typeMap.entries
        .map((e) => <String, dynamic>{e.key: e.value})
        .toList();
  }

  /// Extract the clientReferenceId from a wrapper item or entity, handling
  /// Map, EntityModel, and null-safe drill into wrapped {typeName: [entities]}
  /// shapes. Returns null when no id can be extracted.
  static String? _refIdOf(dynamic obj) {
    if (obj == null) return null;
    if (obj is Map) {
      // Direct entity map with clientReferenceId key.
      final direct = obj['clientReferenceId'];
      if (direct is String && direct.isNotEmpty) return direct;
      // Grouped-wrapper map {typeName: [entities]} — inspect first entity.
      for (final v in obj.values) {
        if (v is List && v.isNotEmpty) {
          final id = _refIdOf(v.first);
          if (id != null) return id;
        }
      }
      return null;
    }
    // EntityModel or similar — try toMap() then read clientReferenceId.
    try {
      final map = (obj as dynamic).toMap();
      if (map is Map) {
        final v = map['clientReferenceId'];
        if (v is String && v.isNotEmpty) return v;
      }
    } catch (_) {}
    return null;
  }

  /// Collect the clientReferenceIds already present in [items]. Used to
  /// filter incoming duplicates during paginated merges.
  static Set<String> _collectClientRefIds(List<dynamic> items) {
    final ids = <String>{};
    for (final item in items) {
      final id = _refIdOf(item);
      if (id != null) ids.add(id);
    }
    return ids;
  }

  /// Count total entities across all type groups.
  int _countGroupedEntities(List<dynamic> wrapper) {
    int count = 0;
    for (final item in wrapper) {
      if (item is Map) {
        for (final value in item.values) {
          if (value is List) count += value.length;
        }
      }
    }
    return count;
  }

  /// Trim grouped wrappers to maxItems entities.
  /// For 'down' direction, trim from start; for 'up', trim from end.
  List<dynamic> _trimGroupedWrappers(
    List<dynamic> wrapper,
    int maxItems,
    String direction,
  ) {
    final typeMap = <String, List<dynamic>>{};
    for (final item in wrapper) {
      if (item is Map) {
        for (final entry in item.entries) {
          typeMap.putIfAbsent(entry.key.toString(), () => []);
          if (entry.value is List) {
            typeMap[entry.key.toString()]!.addAll(entry.value as List);
          }
        }
      }
    }

    // Trim each type's entity list
    for (final key in typeMap.keys) {
      final entities = typeMap[key]!;
      if (entities.length > maxItems) {
        if (direction == 'down') {
          // Keep the last maxItems (trim from start)
          typeMap[key] = entities.sublist(entities.length - maxItems);
        } else {
          // Keep the first maxItems (trim from end)
          typeMap[key] = entities.sublist(0, maxItems);
        }
      }
    }

    return typeMap.entries
        .map((e) => <String, dynamic>{e.key: e.value})
        .toList();
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

    if (limit != null) {
      SearchStateManager().onDataLoadedByCompositeKey(
        compositeKey,
        '_pagination',
        direction: 'initial',
        loadedCount: loadedCount,
        totalInWindow: loadedCount,
      );
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
      totalInWindow: FlowCrudStateRegistry()
              .getByCompositeKey(compositeKey)
              ?.stateWrapper
              ?.length ??
          0,
    );
  }

  @override
  Future<void> close() {
    // Dispose using composite key - each page instance has its own state
    FlowCrudStateRegistry().disposeByCompositeKey(compositeKey);
    SearchStateManager().disposeByCompositeKey(compositeKey);
    return super.close();
  }
}

class FlowCrudStateRegistry {
  final Map<String, ValueNotifier<FlowCrudState?>> _map = {};
  final Map<String, Map<String, dynamic>?> _navParams = {};
  final Map<String, bool> _appendMode = {};
  final Map<String, String> _scrollDirection = {}; // 'up' or 'down'
  final Map<String, Map<String, int>> _paginationInfo = {}; // limit, windowSize
  final Map<String, String> _instanceIds =
      {}; // screenKey -> current instanceId

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
  }

  /// Dispose state directly using a composite key (pageName::instanceId)
  /// Use this when you have the full composite key
  void disposeByCompositeKey(String compositeKey) {
    _disposeCompositeKey(compositeKey);
  }

  // ============ Composite Key Methods (Direct Access) ============

  /// Update state using composite key directly
  void updateByCompositeKey(String compositeKey, FlowCrudState state) {
    _map
        .putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null))
        .value = state;
  }

  /// Get state using composite key directly
  FlowCrudState? getByCompositeKey(String compositeKey) =>
      _map[compositeKey]?.value;

  /// Listen to state using composite key directly
  ValueNotifier<FlowCrudState?> listenByCompositeKey(String compositeKey) {
    return _map.putIfAbsent(
        compositeKey, () => ValueNotifier<FlowCrudState?>(null));
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
  }

  /// Set pagination info using composite key directly
  void setPaginationInfoByCompositeKey(String compositeKey,
      {required int limit, required int maxItems}) {
    _paginationInfo[compositeKey] = {'limit': limit, 'maxItems': maxItems};
  }

  /// Update navigation params using composite key directly
  void updateNavigationParamsByCompositeKey(
      String compositeKey, Map<String, dynamic>? params) {
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
    _map
        .putIfAbsent(compositeKey, () => ValueNotifier<FlowCrudState?>(null))
        .value = state;
  }

  ValueNotifier<FlowCrudState?> listen(String key) {
    // Use composite key if instanceId is registered for this screenKey
    final compositeKey = _currentCompositeKey(key) ?? key;
    return _map.putIfAbsent(
        compositeKey, () => ValueNotifier<FlowCrudState?>(null));
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
    final compositeKey = key;
    _navParams[compositeKey] = params;
  }

  Map<String, dynamic>? getNavigationParams(String key) {
    final compositeKey = key;
    return _navParams[compositeKey];
  }

  FlowCrudState? getFirstOf(String screenKey) {
    final currentCompositeKey = _currentCompositeKey(screenKey);
    if (currentCompositeKey != null) {
      final state = _map[currentCompositeKey]?.value;
      if (state != null) return state;
    }

    for (final entry in _map.entries) {
      if (entry.key.startsWith('$screenKey::') && entry.value.value != null) {
        return entry.value.value;
      }
    }

    return _map[screenKey]?.value;
  }

  Map<String, FlowCrudState> getAllOf(String screenKey) {
    final result = <String, FlowCrudState>{};

    for (final entry in _map.entries) {
      if ((entry.key.startsWith('$screenKey::') || entry.key == screenKey) &&
          entry.value.value != null) {
        result[entry.key] = entry.value.value!;
      }
    }

    return result;
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
