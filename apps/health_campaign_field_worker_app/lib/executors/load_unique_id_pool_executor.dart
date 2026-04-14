import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/id_status.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      UniqueIdPoolModel? latestIdModel;
      if (availableIds.isNotEmpty) {
        availableIds.sort((a, b) {
          final aTime = a.auditDetails?.createdTime ?? 0;
          final bTime = b.auditDetails?.createdTime ?? 0;
          return aTime.compareTo(bTime);
        });
        latestIdModel = availableIds.first;
      }

      final currentState = FlowCrudStateRegistry().get(compositeKey);
      final currentWidgetData =
          Map<String, dynamic>.from(currentState?.widgetData ?? {});

      currentWidgetData['uniqueIdPoolCount'] = count;
      currentWidgetData['latestBeneficiaryIdModel'] = latestIdModel;
      currentWidgetData['latestBeneficiaryId'] = latestIdModel?.id;

      final updatedState =
          currentState?.copyWith(widgetData: currentWidgetData);
      if (updatedState != null) {
        FlowCrudStateRegistry().update(compositeKey, updatedState);
      }

      return {
        ...contextData,
        'uniqueIdPoolCount': count,
        'latestBeneficiaryId': latestIdModel?.id,
        'latestBeneficiaryIdModel': latestIdModel,
      };
    } catch (e) {
      return contextData;
    }
  }
}
