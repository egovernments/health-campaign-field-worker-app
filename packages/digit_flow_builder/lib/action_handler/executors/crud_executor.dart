import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CREATE_EVENT action type
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

/// Executor for UPDATE_EVENT action type
class UpdateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final entities = contextData['entities'];
    if (entities == null || entities is! List || entities.isEmpty) {
      debugPrint('UPDATE_EVENT: No entities found in contextData');
      return contextData;
    }

    // Cast List<dynamic> to List<EntityModel>
    final entityList = entities.whereType<EntityModel>().toList();
    if (entityList.isEmpty) {
      debugPrint('UPDATE_EVENT: No valid EntityModel instances found');
      return contextData;
    }

    debugPrint('UPDATE_EVENT: Updating ${entityList.length} entities');
    context.read<CrudBloc>().add(CrudEventUpdate(entities: entityList));
    return contextData;
  }
}
