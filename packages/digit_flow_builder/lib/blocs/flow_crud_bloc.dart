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
}

class FlowCrudStateRegistry extends ChangeNotifier {
  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  final Map<String, FlowCrudState> _stateMap = {};

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

  void update(String screenKey, FlowCrudState state) {
    _stateMap[screenKey] = state;
    notifyListeners(); // Notifies all listeners
  }

  FlowCrudState? get(String screenKey) => _stateMap[screenKey];
}

class FlowCrudState {
  final CrudState base;
  final List<dynamic>? stateWrapper;

  const FlowCrudState({
    required this.base,
    this.stateWrapper,
  });

  FlowCrudState copyWith({
    CrudState? base,
    List<dynamic>? stateWrapper,
  }) {
    return FlowCrudState(
      base: base ?? this.base,
      stateWrapper: stateWrapper ?? this.stateWrapper,
    );
  }
}
