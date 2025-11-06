import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/flow_crud_bloc.dart';
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
    final screenKey = getScreenKeyFromArgs(context);

    // Get widgetData from FlowCrudStateRegistry (for filter values)
    final widgetData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.widgetData ?? {}
        : <String, dynamic>{};

    debugPrint('🔍 SearchExecutor: screenKey=$screenKey');
    debugPrint('🔍 SearchExecutor: widgetData=$widgetData');

    final rawValue = data['data'][0]['value'];
    debugPrint('🔍 SearchExecutor: rawValue=$rawValue');

    final resolvedValue =
        resolveValue(rawValue, contexts, widgetData: widgetData);

    debugPrint('🔍 SearchExecutor: resolvedValue=$resolvedValue');

    final config = FlowRegistry.getByName(screenKey ?? '');
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
      select: (config?['wrapperConfig']?['searchConfig']?['select'] as List?)
              ?.cast<String>() ??
          [],
      pagination: null,
      orderBy: config?['wrapperConfig']['searchConfig']['orderBy'] != null
          ? SearchOrderBy.fromJson(Map<String, dynamic>.from(
              config!['wrapperConfig']['searchConfig']['orderBy']))
          : null,
    );

    context.read<CrudBloc>().add(CrudEventSearch(searchParams));
    return contextData;
  }
}
