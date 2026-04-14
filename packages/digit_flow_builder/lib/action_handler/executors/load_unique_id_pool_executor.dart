import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/id_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../action_config.dart';
import 'action_executor.dart';

class LoadUniqueIdPoolExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'LOAD_UNIQUE_ID_POOL';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final crudCtx = CrudItemContext.of(context);
    final compositeKey =
        crudCtx?.compositeKey ?? getEffectiveCompositeKey(context, contextData);

    if (compositeKey == null) return contextData;

    try {
      final repository = context
          .read<LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>();

      final searchResult = repository.search(UniqueIdPoolSearchModel(
        status: IdStatus.unAssigned.toValue(),
      ));

      List<UniqueIdPoolModel> availableIds;
      if (searchResult is Future) {
        availableIds = await (searchResult as Future<List<UniqueIdPoolModel>>);
      } else {
        availableIds = List<UniqueIdPoolModel>.from(searchResult as List);
      }

      final count = availableIds.length;
      String? latestId;
      if (availableIds.isNotEmpty) {
        availableIds.sort((a, b) {
          final aTime = a.auditDetails?.createdTime ?? 0;
          final bTime = b.auditDetails?.createdTime ?? 0;
          return aTime.compareTo(bTime);
        });
        latestId = availableIds.first.id;
      }

      final currentState = FlowCrudStateRegistry().get(compositeKey);
      final currentWidgetData =
          Map<String, dynamic>.from(currentState?.widgetData ?? {});

      currentWidgetData['uniqueIdPoolCount'] = count;
      currentWidgetData['latestBeneficiaryId'] = latestId;

      final updatedState =
          currentState?.copyWith(widgetData: currentWidgetData);
      if (updatedState != null) {
        FlowCrudStateRegistry().update(compositeKey, updatedState);
      }

      return {
        ...contextData,
        'uniqueIdPoolCount': count,
        'latestBeneficiaryId': latestId,
      };
    } catch (e) {
      return contextData;
    }
  }
}
