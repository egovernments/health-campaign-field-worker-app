import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
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

    if (crudState is CrudStateLoaded) {
      final entities = crudState.results.values.expand((list) => list).toList();
      wrapper = WrapperBuilder(entities, flowConfig['wrapperConfig']).build();
    } else if (crudState is CrudStatePersisted) {
      final entities = crudState.entities;
      wrapper = WrapperBuilder(entities, flowConfig['wrapperConfig']).build();
    }

    final flowState = FlowCrudState(
      base: crudState,
      stateWrapper: wrapper,
    );

    onUpdate?.call(screenKey, flowState);
    FlowCrudStateRegistry().update(screenKey, flowState);
  }

  @override
  Future<void> close() {
    FlowCrudStateRegistry().dispose(screenKey);
    return super.close();
  }
}

class FlowCrudStateRegistry {
  final Map<String, ValueNotifier<FlowCrudState?>> _map = {};
  final Map<String, Map<String, dynamic>?> _navParams = {};

  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

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

  const FlowCrudState({
    this.base,
    this.stateWrapper,
    this.formData,
  });

  FlowCrudState copyWith({
    CrudState? base,
    List<dynamic>? stateWrapper,
    Map<String, dynamic>? formData,
  }) {
    return FlowCrudState(
      base: base ?? this.base,
      stateWrapper: stateWrapper ?? this.stateWrapper,
      formData: formData ?? this.formData,
    );
  }
}
