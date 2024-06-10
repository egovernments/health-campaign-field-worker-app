import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../data/data_repository.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/local_store/sql_store/tables/task.dart';
import '../../data/repositories/local/household.dart';
import '../../data/repositories/local/individual.dart';
import '../../data/repositories/local/task.dart';
import '../../models/data_model.dart';
import '../../models/performance_summary.dart';
import '../../utils/app_exception.dart';
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

  PerformannceSummaryReportBloc({
    required this.individualRepository,
    required this.householdRepository,
    required this.taskRepository,
  }) : super(const PerformanceSummaryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    PerformanceSummaryReportLoadDataEvent event,
    PerformanceSummaryReportEmitter emit,
  ) async {
    var userId = event.userId;
    Map<String, List<IndividualModel>> dayVsIndividualListMap = {};
    Map<String, List<HouseholdModel>> dayVsHouseholdListMap = {};
    Map<String, List<TaskModel>> dayVsTaskListMap = {};
    Set<String> availableDates = {};
    final householdList =
        await (householdRepository as HouseholdLocalRepository).search(
      HouseholdSearchModel(tenantId: envConfig.variables.tenantId),
      userId,
    );
    final individualList =
        await (individualRepository as IndividualLocalRepository).search(
      IndividualSearchModel(tenantId: envConfig.variables.tenantId),
      userId,
    );
    final taskList = await (taskRepository as TaskLocalRepository).search(
      TaskSearchModel(
        tenantId: envConfig.variables.tenantId,
        status: Status.administeredSuccess.toValue(),
      ),
      userId,
    );
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
    for (var element in individualList) {
      var dateKey = DigitDateUtils.getDateFromTimestamp(
        element.auditDetails!.createdTime,
      );
      if (dayVsIndividualListMap.containsKey(dateKey) &&
          dayVsIndividualListMap[dateKey] != null) {
        dayVsIndividualListMap[dateKey]!.add(element);
      } else {
        dayVsIndividualListMap[dateKey] = [element];
      }
    }
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
    availableDates.addAll(dayVsIndividualListMap.keys.toSet());
    availableDates.addAll(dayVsTaskListMap.keys.toSet());

    Map<String, PerformanceSummary> dayVsDataCount = {};

    for (var date in availableDates) {
      int totatlIndividualForADay = 0;
      int totatlHouseholdlForADay = 0;
      int totatlTaskForADay = 0;

      if (dayVsIndividualListMap.containsKey(date) &&
          dayVsIndividualListMap[date] != null) {
        totatlIndividualForADay += dayVsIndividualListMap[date]!.length;
      }
      if (dayVsHouseholdListMap.containsKey(date) &&
          dayVsHouseholdListMap[date] != null) {
        totatlHouseholdlForADay += dayVsHouseholdListMap[date]!.length;
      }
      if (dayVsTaskListMap.containsKey(date) &&
          dayVsTaskListMap[date] != null) {
        totatlTaskForADay += dayVsTaskListMap[date]!.length;
      }
      PerformanceSummary summary = PerformanceSummary(
        individualCount: totatlIndividualForADay,
        householdCount: totatlHouseholdlForADay,
        taskCount: totatlTaskForADay,
      );
      dayVsDataCount[date] = summary;
    }

    emit(PerformanceSummaryReportSummaryDataState(
      summaryData: dayVsDataCount,
    ));
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
