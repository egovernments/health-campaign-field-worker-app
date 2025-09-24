import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import 'action_executor.dart';

class SearchExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'SEARCH_EVENT';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final data = action.properties;
    final contexts = contextData['entities'];
    final rawValue = data['data'][0]['value'];
    final resolvedValue = resolveValue(rawValue, contexts);

    final config = FlowRegistry.getByName(getScreenKeyFromArgs(context) ?? '');
    final searchParams = GlobalSearchParameters(
      filters: [
        SearchFilter(
          root: data['name'],
          field: data['data'][0]['key'],
          operator: data['data'][0]['operation'],
          value: data['value'] ?? resolvedValue,
        ),
      ],
      primaryModel: config?['wrapperConfig']['searchConfig']['primary'],
      select: config?['wrapperConfig']['searchConfig']['select'],
      pagination: null,
    );

    context.read<CrudBloc>().add(CrudEventSearch(searchParams));
    return contextData;
  }
}
