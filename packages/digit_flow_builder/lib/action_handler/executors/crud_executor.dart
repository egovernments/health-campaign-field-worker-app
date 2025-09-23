import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../action_config.dart';
import 'action_executor.dart';

class CrudExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CREATE_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final entities = contextData['entities'];
    context.read<CrudBloc>().add(CrudEventCreate(entities: entities));
    return contextData;
  }
}