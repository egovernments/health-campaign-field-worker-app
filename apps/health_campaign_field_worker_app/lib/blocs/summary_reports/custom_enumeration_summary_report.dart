import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/utils/typedefs.dart'
    hide ProductVariantDataRepository;
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'package:registration_delivery/utils/typedefs.dart';

import '../../utils/environment_config.dart';

part 'custom_enumeration_summary_report.freezed.dart';

typedef CustomEnumerationSummaryReportEmitter
    = Emitter<CustomEnumerationSummaryReportState>;

class CustomEnumerationSummaryReportBloc extends Bloc<
    CustomEnumerationSummaryReportEvent, CustomEnumerationSummaryReportState> {
  final HouseholdDataRepository householdRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskRepository;

  CustomEnumerationSummaryReportBloc({
    required this.householdRepository,
    required this.projectBeneficiaryRepository,
    required this.taskRepository,
  }) : super(const CustomEnumerationSummaryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    CustomEnumerationSummaryReportLoadDataEvent event,
    CustomEnumerationSummaryReportEmitter emit,
  ) async {
    List<HouseholdModel> householdList = [];
    List<ProjectBeneficiaryModel> projectBeneficiaryList = [];
    List<TaskModel> closedHouseholdTaskList = [];

    final userId = event.userId;

    //  read all households from db which are created by userId
    householdList = await (householdRepository as HouseholdLocalRepository)
        .search(HouseholdSearchModel(tenantId: envConfig.variables.tenantId),
            userId);

    //  read all projectBeneficiaries from db which are created by userId
    projectBeneficiaryList = await (projectBeneficiaryRepository
            as ProjectBeneficiaryLocalRepository)
        .search(
            ProjectBeneficiarySearchModel(
                tenantId: envConfig.variables.tenantId),
            userId);
    //  read all closed household task from db which are created by userId
    closedHouseholdTaskList =
        await (taskRepository as TaskLocalRepository).search(
      TaskSearchModel(status: Status.closeHousehold.toValue()),
      userId,
    );

    Map<int?, List<HouseholdModel>> dateVsHousehold = {};
    Map<int?, List<ProjectBeneficiaryModel>> dateVsProjectBeneficiary = {};
    Map<int?, List<TaskModel>> dateVsClosedHouseholdTask = {};
    Set<int?> uniqueDates = {};

    // for (var i = 0; i < maxLength; i++) {
    //   if (i < householdList.length) {
    //     var element = householdList[i];
    //     var key = element.clientAuditDetails?.createdTime;
    //     if (dateVsHousehold.containsKey(key)) {
    //       dateVsHousehold[key]?.add(element);
    //     } else {
    //       dateVsHousehold[key] = [element];
    //     }
    //   } else if (i < projectBeneficiaryList.length) {
    //     var projectBeneficiary = projectBeneficiaryList[i];
    //     var key = projectBeneficiary.clientAuditDetails?.createdTime;
    //     if (dateVsProjectBeneficiary.containsKey(key)) {
    //       dateVsProjectBeneficiary[key]?.add(projectBeneficiary);
    //     } else {
    //       dateVsProjectBeneficiary[key] = [projectBeneficiary];
    //     }
    //   } else if (i < closedHouseholdTaskList.length) {
    //     var closeHousehold = closedHouseholdTaskList[i];
    //     var key = closeHousehold.clientAuditDetails?.createdTime;

    //     if (dateVsClosedHouseholdTask.containsKey(key)) {
    //       dateVsClosedHouseholdTask[key]?.add(closeHousehold);
    //     } else {
    //       dateVsClosedHouseholdTask[key] = [closeHousehold];
    //     }
    //   }
    // }
    Map<int?, int> dateVsHouseholdCount = {};
    Map<int?, int> dateVsProjectBeneficiaryCount = {};
    Map<int?, int> dateVsClosedHouseholdTaskCount = {};

    // populate the day vs list of elements registered on that day
    addToMap(householdList, dateVsHousehold);
    addToMap(projectBeneficiaryList, dateVsProjectBeneficiary);
    addToMap(closedHouseholdTaskList, dateVsClosedHouseholdTask);

    // populate the day vs count for that day map
    populateDateVsCountMap(dateVsHousehold, dateVsHouseholdCount);
    populateDateVsCountMap(
        dateVsProjectBeneficiary, dateVsProjectBeneficiaryCount);
    populateDateVsCountMap(
        dateVsClosedHouseholdTask, dateVsClosedHouseholdTaskCount);

    Map<int?, Map<String, int>> dateVsEntityVsCountMap = {};

    // get a set of unique dates
    getUniqueSetOfDates(
      dateVsHousehold,
      dateVsProjectBeneficiary,
      dateVsClosedHouseholdTask,
      uniqueDates,
    );

    popoulateDateVsEntityCountMap(
      dateVsEntityVsCountMap,
      dateVsHouseholdCount,
      dateVsProjectBeneficiaryCount,
      dateVsClosedHouseholdTaskCount,
      uniqueDates,
    );

    emit(const CustomEnumerationSummaryReportSummaryDataState(
      summaryData: {},
    ));
  }

  void popoulateDateVsEntityCountMap(
    Map<int?, Map<String, int?>> dateVsEntityVsCountMap,
    Map<int?, int> dateVsHouseholdCount,
    Map<int?, int> dateVsProjectBeneficiaryCount,
    Map<int?, int> dateVsClosedHouseholdTaskCount,
    Set<int?> uniqueDates,
  ) {
    for (var date in uniqueDates) {
      Map<String, int?> elementVsCount = {};
      if (dateVsHouseholdCount.containsKey(date) &&
          dateVsHouseholdCount[date] != null) {
        var count = dateVsHouseholdCount[date];
        elementVsCount["Household"] = count;
      }
      if (dateVsProjectBeneficiaryCount.containsKey(date) &&
          dateVsProjectBeneficiaryCount[date] != null) {
        var count = dateVsProjectBeneficiaryCount[date];
        elementVsCount["ProjectBeneficiary"] = count;
      }
      if (dateVsClosedHouseholdTaskCount.containsKey(date) &&
          dateVsClosedHouseholdTaskCount[date] != null) {
        var count = dateVsClosedHouseholdTaskCount[date];
        elementVsCount["ClosedHousehold"] = count;
      }
      dateVsEntityVsCountMap[date] = elementVsCount;
    }
  }

//   void populateDateVsEntityCountMap(
//   Map<int?, Map<String, int?>> dateVsEntityVsCountMap,
//   Map<int?, int> dateVsHouseholdCount,
//   Map<int?, int> dateVsProjectBeneficiaryCount,
//   Map<int?, int> dateVsClosedHouseholdTaskCount,
//   Set<int?> uniqueDates,
// ) {
//   // List of the maps to check and their corresponding keys
//   var counts = {
//     "Household": dateVsHouseholdCount,
//     "ProjectBeneficiary": dateVsProjectBeneficiaryCount,
//     "ClosedHousehold": dateVsClosedHouseholdTaskCount
//   };

//   // Loop through each unique date
//   for (var date in uniqueDates) {
//     Map<String, int?> elementVsCount = {};

//     // Loop through each count map and check if the date exists
//     counts.forEach((entity, countMap) {
//       var count = countMap[date];
//       if (count != null) {
//         elementVsCount[entity] = count;
//       }
//     });

//     // Assign the result to the final map
//     dateVsEntityVsCountMap[date] = elementVsCount;
//   }
// }

  void addToMap(List list, Map<int?, List> map) {
    for (var element in list) {
      var key = element.clientAuditDetails?.createdTime;
      if (key != null) {
        if (map.containsKey(key)) {
          map[key]?.add(element);
        } else {
          map[key] = [element];
        }
      }
    }
  }

  void populateDateVsCountMap(Map<int?, List> map, Map<int?, int> dateVsCount) {
    map.forEach((key, value) {
      dateVsCount[key] = value.length;
    });
  }

  void getUniqueSetOfDates(
    Map<int?, List<HouseholdModel>> dateVsHousehold,
    Map<int?, List<ProjectBeneficiaryModel>> dateVsProjectBeneficiary,
    Map<int?, List<TaskModel>> dateVsClosedHouseholdTask,
    Set<int?> uniqueDates,
  ) {
    uniqueDates.addAll(dateVsHousehold.keys.toSet());
    uniqueDates.addAll(dateVsProjectBeneficiary.keys.toSet());
    uniqueDates.addAll(dateVsClosedHouseholdTask.keys.toSet());
  }

  Future<void> _handleLoadingEvent(
    CustomEnumerationSummaryReportLoadingEvent event,
    CustomEnumerationSummaryReportEmitter emit,
  ) async {
    emit(const CustomEnumerationSummaryReportLoadingState());
  }
}

@freezed
class CustomEnumerationSummaryReportEvent
    with _$CustomEnumerationSummaryReportEvent {
  const factory CustomEnumerationSummaryReportEvent.loadData({
    required String userId,
  }) = CustomEnumerationSummaryReportLoadDataEvent;

  const factory CustomEnumerationSummaryReportEvent.loading() =
      CustomEnumerationSummaryReportLoadingEvent;
}

@freezed
class CustomEnumerationSummaryReportState
    with _$CustomEnumerationSummaryReportState {
  const factory CustomEnumerationSummaryReportState.loading() =
      CustomEnumerationSummaryReportLoadingState;
  const factory CustomEnumerationSummaryReportState.empty() =
      CustomEnumerationSummaryReportEmptyState;

  const factory CustomEnumerationSummaryReportState.summaryData({
    @Default({}) Map<int?, Map<String, int>> summaryData,
  }) = CustomEnumerationSummaryReportSummaryDataState;
}
