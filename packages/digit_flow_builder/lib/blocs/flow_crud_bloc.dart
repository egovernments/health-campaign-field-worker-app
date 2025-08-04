import 'package:digit_crud_bloc/bloc/crud_bloc.dart';

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
    });
  }
}
