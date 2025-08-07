import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:flutter/foundation.dart';

class FlowCrudBloc extends CrudBloc {
  final Map<String, dynamic> flowConfig;
  final String screenKey;
  final void Function(String screenKey, CrudState state)? onUpdate;

  FlowCrudBloc({
    required this.flowConfig,
    required super.service,
    this.onUpdate,
  }) : screenKey = '${flowConfig["screenType"]}::${flowConfig["name"]}' {
    // Notify parent coordinator whenever state updates
    stream.listen((state) {
      onUpdate?.call(screenKey, state);
      FlowCrudStateRegistry().update(screenKey, state); // ✅ Save & notify
    });
  }
}

class FlowCrudStateRegistry extends ChangeNotifier {
  static final FlowCrudStateRegistry _instance =
      FlowCrudStateRegistry._internal();

  final Map<String, CrudState> _stateMap = {};

  FlowCrudStateRegistry._internal();

  factory FlowCrudStateRegistry() => _instance;

  void update(String screenKey, CrudState state) {
    _stateMap[screenKey] = state;
    notifyListeners(); // Notifies all listeners
  }

  CrudState? get(String screenKey) => _stateMap[screenKey];
}
