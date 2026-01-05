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

    if (crudState is CrudStateLoaded) {
      // Only consume append mode when we have loaded data
      // This prevents intermediate states (Loading) from consuming the flag
      final appendMode = FlowCrudStateRegistry().consumeAppendMode(screenKey);
      final newEntities = crudState.results.values.expand((list) => list).toList();

      if (appendMode && existingState?.stateWrapper != null && newEntities.isNotEmpty) {
        // Append mode: add new entities to existing wrapper
        final existingWrapper = List<dynamic>.from(existingState!.stateWrapper!);
        final newWrapper = WrapperBuilder(newEntities, flowConfig['wrapperConfig']).build();
        existingWrapper.addAll(newWrapper);
        wrapper = existingWrapper;
        debugPrint('FlowCrudBloc: Appended ${newWrapper.length} items, total=${wrapper.length}');
      } else if (appendMode && newEntities.isEmpty) {
        // Append mode but no new entities - preserve existing data
        wrapper = existingState?.stateWrapper;
        debugPrint('FlowCrudBloc: No new data, preserving ${wrapper?.length ?? 0} existing items');
      } else {
        // Normal mode: replace with new entities
        wrapper = WrapperBuilder(newEntities, flowConfig['wrapperConfig']).build();
      }
      // Preserve existing formData and widgetData when creating new state
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: wrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
      );

      onUpdate?.call(screenKey, flowState);
      FlowCrudStateRegistry().update(screenKey, flowState);
    } else if (crudState is CrudStatePersisted) {
      final entities = crudState.entities;
      wrapper = WrapperBuilder(entities, flowConfig['wrapperConfig']).build();
      // Preserve existing formData and widgetData when creating new state
      final flowState = FlowCrudState(
        base: crudState,
        stateWrapper: wrapper,
        formData: existingState?.formData,
        widgetData: existingState?.widgetData,
      );

      onUpdate?.call(screenKey, flowState);
      FlowCrudStateRegistry().update(screenKey, flowState);
    }
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

  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

  /// Set append mode for next state update (used by REFRESH_SEARCH)
  void setAppendMode(String key, bool append) {
    _appendMode[key] = append;
    debugPrint('FlowCrudStateRegistry: Set appendMode=$append for $key');
  }

  /// Get and consume append mode (called during state update)
  bool consumeAppendMode(String key) {
    final append = _appendMode[key] ?? false;
    _appendMode.remove(key);
    return append;
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
  }

  void clearAll() {
    for (final notifier in _map.values) {
      notifier.value = null;
    }
    _navParams.clear();
  }

  void dispose(String key) {
    if (_map.containsKey(key)) {
      _map[key]!.dispose();
      _map.remove(key);
    }
    _navParams.remove(key);
  }

  void disposeAll() {
    for (final notifier in _map.values) {
      notifier.dispose();
    }
    _map.clear();
    _navParams.clear();
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

  const FlowCrudState({
    this.base,
    this.stateWrapper,
    this.formData,
    this.widgetData,
  });

  FlowCrudState copyWith({
    CrudState? base,
    List<dynamic>? stateWrapper,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? widgetData,
  }) {
    return FlowCrudState(
      base: base ?? this.base,
      stateWrapper: stateWrapper ?? this.stateWrapper,
      formData: formData ?? this.formData,
      widgetData: widgetData ?? this.widgetData,
    );
  }
}
