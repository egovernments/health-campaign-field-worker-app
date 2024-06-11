import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/local/household.dart';
import '../../data/repositories/local/product_variant.dart';
import '../../data/repositories/local/task.dart';
import '../../models/data_model.dart';
import '../../models/performance_summary.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';

part 'performance_summary_report.freezed.dart';

typedef PerformanceSummaryReportEmitter
    = Emitter<PerformanceSummaryReportState>;

class PerformannceSummaryReportBloc
    extends Bloc<PerformanceSummaryReportEvent, PerformanceSummaryReportState> {
  final IndividualDataRepository individualRepository;

  final HouseholdDataRepository householdRepository;

  final TaskDataRepository taskRepository;

  final ProductVariantDataRepository productVariantRepository;

  PerformannceSummaryReportBloc({
    required this.individualRepository,
    required this.householdRepository,
    required this.taskRepository,
    required this.productVariantRepository,
  }) : super(const PerformanceSummaryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    PerformanceSummaryReportLoadDataEvent event,
    PerformanceSummaryReportEmitter emit,
  ) async {
    var userId = event.userId;
    // Map<String, List<IndividualModel>> dayVsIndividualListMap = {};
    Map<String, List<HouseholdModel>> dayVsHouseholdListMap = {};
    Map<String, List<TaskModel>> dayVsTaskListMap = {};
    Map<String?, String> variantIdVsProduct = {};
    Set<String> availableDates = {};
    final householdList =
        await (householdRepository as HouseholdLocalRepository).search(
      HouseholdSearchModel(tenantId: envConfig.variables.tenantId),
      userId,
    );
    // final individualList =
    //     await (individualRepository as IndividualLocalRepository).search(
    //   IndividualSearchModel(tenantId: envConfig.variables.tenantId),
    //   userId,
    // );
    final productVariantList =
        await (productVariantRepository as ProductVariantLocalRepository)
            .search(
      ProductVariantSearchModel(tenantId: envConfig.variables.tenantId),
    );
    final taskList = await (taskRepository as TaskLocalRepository).search(
      TaskSearchModel(
        tenantId: envConfig.variables.tenantId,
        status: Status.administeredSuccess.toValue(),
      ),
      userId,
    );

    for (var productVariant in productVariantList) {
      variantIdVsProduct[productVariant.sku] = productVariant.id;
    }

    var albendazoleResourceKey = variantIdVsProduct.keys
        .where((element) => element!
            .toUpperCase()
            .contains(BeneficiaryType.albendazole.name.toUpperCase()))
        .first;
    var albendazoleResourceId = variantIdVsProduct[albendazoleResourceKey];
    var ivermectinResourceKey = variantIdVsProduct.keys
        .where((element) => element!
            .toUpperCase()
            .contains(BeneficiaryType.ivermectin.name.toUpperCase()))
        .first;
    var ivermectinResourceId = variantIdVsProduct[ivermectinResourceKey];

    for (var element in householdList) {
      var dateKey = DigitDateUtils.getDateFromTimestamp(
        element.auditDetails!.createdTime,
      );
      if (dayVsHouseholdListMap.containsKey(dateKey) &&
          dayVsHouseholdListMap[dateKey] != null) {
        dayVsHouseholdListMap[dateKey]!.add(element);
      } else {
        dayVsHouseholdListMap[dateKey] = [element];
      }
    }
    // for (var element in individualList) {
    //   var dateKey = DigitDateUtils.getDateFromTimestamp(
    //     element.auditDetails!.createdTime,
    //   );
    //   if (dayVsIndividualListMap.containsKey(dateKey) &&
    //       dayVsIndividualListMap[dateKey] != null) {
    //     dayVsIndividualListMap[dateKey]!.add(element);
    //   } else {
    //     dayVsIndividualListMap[dateKey] = [element];
    //   }
    // }
    for (var element in taskList) {
      var dateKey = DigitDateUtils.getDateFromTimestamp(
        element.auditDetails!.createdTime,
      );
      if (dayVsTaskListMap.containsKey(dateKey) &&
          dayVsTaskListMap[dateKey] != null) {
        dayVsTaskListMap[dateKey]!.add(element);
      } else {
        dayVsTaskListMap[dateKey] = [element];
      }
    }
    availableDates.addAll(dayVsHouseholdListMap.keys.toSet());
    // availableDates.addAll(dayVsIndividualListMap.keys.toSet());
    availableDates.addAll(dayVsTaskListMap.keys.toSet());

    Map<String, PerformanceSummary> dayVsDataCount = {};
    Map<String, Map<String?, int>> dayVsDrugsQuantityMap = {};

    for (var entry in dayVsTaskListMap.entries) {
      var date = entry.key;
      var taskListForADate = entry.value;
      getDrugsVsQuantityMap(
        taskListForADate,
        date,
        dayVsDrugsQuantityMap,
      );
    }

    for (var date in availableDates) {
      // int totatlIndividualForADay = 0;
      int totatlHouseholdForADay = 0;
      int totalTaskForADay = 0;

      // if (dayVsIndividualListMap.containsKey(date) &&
      //     dayVsIndividualListMap[date] != null) {
      //   totatlIndividualForADay += dayVsIndividualListMap[date]!.length;
      // }
      if (dayVsHouseholdListMap.containsKey(date) &&
          dayVsHouseholdListMap[date] != null) {
        totatlHouseholdForADay += dayVsHouseholdListMap[date]!.length;
      }
      if (dayVsTaskListMap.containsKey(date) &&
          dayVsTaskListMap[date] != null) {
        totalTaskForADay += dayVsTaskListMap[date]!.length;
      }

      // denominator is fixed here
      // assumption here is drugOne Albendazole and drugTwo is Ivermectin
      var drugOne = 0;
      var drugTwo = 0;
      if (dayVsDrugsQuantityMap.containsKey(date) &&
          dayVsDrugsQuantityMap[date] != null &&
          dayVsDrugsQuantityMap[date]!.containsKey(albendazoleResourceId)) {
        drugOne = dayVsDrugsQuantityMap[date]![albendazoleResourceId] ?? 0;
      }
      if (dayVsDrugsQuantityMap.containsKey(date) &&
          dayVsDrugsQuantityMap[date] != null &&
          dayVsDrugsQuantityMap[date]!.containsKey(ivermectinResourceId)) {
        drugTwo = dayVsDrugsQuantityMap[date]![ivermectinResourceId] ?? 0;
      }
      final treatedPercentage = (totalTaskForADay / 75) * 100;
      //Rounded treatedPercentage to 2 degree
      PerformanceSummary summary = PerformanceSummary(
        treatedPercentage: double.parse(treatedPercentage.toStringAsFixed(2)),
        householdCount: totatlHouseholdForADay,
        taskCount: totalTaskForADay,
        drugOne: drugOne,
        drugTwo: drugTwo,
      );
      dayVsDataCount[date] = summary;
    }

    emit(PerformanceSummaryReportSummaryDataState(
      summaryData: dayVsDataCount,
    ));
  }

  void getDrugsVsQuantityMap(
    List<TaskModel> taskList,
    String date,
    Map<String, Map<String?, int>> dayVsDrugsQuantityMap,
  ) {
    const quantityWastedKey = 'quantityWasted';
    Map<String?, int> resourceVsQuantity = {};
    List<TaskResourceModel> taskResourceList = [];

    for (var task in taskList) {
      if (task.resources == null) {
        continue;
      }
      taskResourceList.addAll(task.resources!.toList());
    }
    for (var resource in taskResourceList) {
      var quantityDistributed = 0;
      var quantityWasted = 0;

      //todo remove the double and int checks once , data type is finalized
      var resourceId = resource.productVariantId;
      quantityDistributed = quantityDistributed +
          (resource.quantity!.contains(".")
              ? double.parse(resource.quantity ?? "0.0").toInt()
              : int.parse(resource.quantity ?? "0"));
      if (resource.additionalFields != null) {
        var value = resource.additionalFields!.fields
            .firstWhere((element) => element.key == quantityWastedKey)
            .value;
        quantityWasted = quantityWasted +
            (value is String && value.contains(".")
                ? double.parse(value ?? "0.0").toInt()
                : int.parse(value ?? "0"));
      }
      final quantityUsed = quantityDistributed + quantityWasted;
      if (resourceVsQuantity.containsKey(resourceId) &&
          resourceVsQuantity[resourceId] != null) {
        resourceVsQuantity[resourceId] =
            resourceVsQuantity[resourceId]! + quantityUsed;
      } else {
        resourceVsQuantity[resourceId] = quantityUsed;
      }
    }
    dayVsDrugsQuantityMap[date] = resourceVsQuantity;
  }

  Future<void> _handleLoadingEvent(
    PerformanceSummaryReportLoadingEvent event,
    PerformanceSummaryReportEmitter emit,
  ) async {
    emit(const PerformanceSummaryReportLoadingState());
  }
}

@freezed
class PerformanceSummaryReportEvent with _$PerformanceSummaryReportEvent {
  const factory PerformanceSummaryReportEvent.loadData({
    required String userId,
  }) = PerformanceSummaryReportLoadDataEvent;

  const factory PerformanceSummaryReportEvent.loading() =
      PerformanceSummaryReportLoadingEvent;
}

@freezed
class PerformanceSummaryReportState with _$PerformanceSummaryReportState {
  const factory PerformanceSummaryReportState.loading() =
      PerformanceSummaryReportLoadingState;
  const factory PerformanceSummaryReportState.empty() =
      PerformanceSummaryReportEmptyState;

  const factory PerformanceSummaryReportState.summaryData({
    @Default({}) Map<String, PerformanceSummary> summaryData,
  }) = PerformanceSummaryReportSummaryDataState;
}
