import 'dart:async';

import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_data_model/utils/typedefs.dart'
    hide ProductVariantDataRepository;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/registration_delivery.dart';
import '../../data/repositories/local/custom_task.dart';
import '../../utils/constants.dart';
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
    try {
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
          await (taskRepository as CustomTaskLocalRepository).progressBarSearch(
        TaskSearchModel(status: Status.closeHousehold.toValue()),
        userId,
      );

      // get the closed household projectBeneficiaries
      Set<String> projectBeneficiaryClientReferenceIds = closedHouseholdTaskList
          .map((e) => e.projectBeneficiaryClientReferenceId ?? "")
          .where((element) => element.isNotEmpty)
          .toSet();

      // closedhousehold projectbeneficiairy beneficiaryClientRefIds
      Set<String?> filteredBeneficiariesClientRefId = {};
      getClosedHouseholdProjectBeneficiary(projectBeneficiaryClientReferenceIds,
          projectBeneficiaryList, filteredBeneficiariesClientRefId);

      // filteredHouseholds list (remove closed ones)
      List<HouseholdModel> filteredHouseholdsList = [];

      // filteredProjectBeneficiaryList list (remove closed ones)
      List<ProjectBeneficiaryModel> filteredProjectBeneficiaryList = [];

      // filter closed households from householdList
      filteredHouseholds(householdList, filteredBeneficiariesClientRefId,
          filteredHouseholdsList);

      // filter closedhousehold projectBeneficairy from list
      filterProjectBeneficiaryList(projectBeneficiaryList,
          filteredBeneficiariesClientRefId, filteredProjectBeneficiaryList);

      Map<String, List<HouseholdModel>> dateVsHousehold = {};
      Map<String, List<ProjectBeneficiaryModel>> dateVsProjectBeneficiary = {};
      Map<String, List<TaskModel>> dateVsClosedHouseholdTask = {};
      Map<String, List<TaskModel>> dateVsClosedHouseholdRefusedTask = {};
      Map<String, List<TaskModel>> dateVsClosedHouseholdAbsentTask = {};

      Set<String> uniqueDates = {};

      Map<String, int> dateVsHouseholdCount = {};
      // info this captures total project beneficiary created / registered
      Map<String, int> dateVsProjectBeneficiaryCount = {};
      // info this captures total members in the households registered
      Map<String, int> dateVsTotalMemberCount = {};
      Map<String, int> dateVsClosedHouseholdTaskCount = {};
      Map<String, int> dateVsClosedHouseholdAbsentTaskCount = {};
      Map<String, int> dateVsClosedHouseholdRefusedTaskCount = {};

      for (var element in filteredHouseholdsList) {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        dateVsHousehold.putIfAbsent(dateKey, () => []).add(element);
      }
      for (var element in filteredProjectBeneficiaryList) {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        dateVsProjectBeneficiary.putIfAbsent(dateKey, () => []).add(element);
      }
      for (var element in closedHouseholdTaskList) {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        String reason = getClosedReason(element);
        if (reason.isEmpty) {
          dateVsClosedHouseholdAbsentTask
              .putIfAbsent(dateKey, () => [])
              .add(element);
        } else if (reason == "REFUSAL") {
          dateVsClosedHouseholdRefusedTask
              .putIfAbsent(dateKey, () => [])
              .add(element);
        }
        dateVsClosedHouseholdTask.putIfAbsent(dateKey, () => []).add(element);
      }

      // get a set of unique dates
      getUniqueSetOfDates(
        dateVsHousehold,
        dateVsProjectBeneficiary,
        dateVsClosedHouseholdTask,
        uniqueDates,
      );

      // populate the day vs count for that day map
      populateDateVsCountMap(dateVsHousehold, dateVsHouseholdCount);
      populateDateVsCountMap(
          dateVsProjectBeneficiary, dateVsProjectBeneficiaryCount);

      // total closed household count day wise
      populateDateVsCountMap(
          dateVsClosedHouseholdTask, dateVsClosedHouseholdTaskCount);

      // closed household absent count day wise

      populateDateVsCountMap(dateVsClosedHouseholdAbsentTask,
          dateVsClosedHouseholdAbsentTaskCount);

      // closed household refused count day wise

      populateDateVsCountMap(dateVsClosedHouseholdRefusedTask,
          dateVsClosedHouseholdRefusedTaskCount);

      // populate the day vs total members impacted (sum of members of each household registered)
      populateDateVsBeneficiaryImpactedMap(
          dateVsHousehold, dateVsTotalMemberCount);

      Map<String, Map<String, int>> dateVsEntityVsCountMap = {};

      popoulateDateVsEntityCountMap(
        dateVsEntityVsCountMap,
        dateVsHouseholdCount,
        dateVsTotalMemberCount,
        dateVsClosedHouseholdTaskCount,
        dateVsClosedHouseholdAbsentTaskCount,
        dateVsClosedHouseholdRefusedTaskCount,
        uniqueDates,
      );

      emit(CustomEnumerationSummaryReportSummaryDataState(
        summaryData: dateVsEntityVsCountMap,
      ));
    } catch (e) {
      emit(const CustomEnumerationSummaryReportLoadingState());
    }
  }

  void popoulateDateVsEntityCountMap(
    Map<String, Map<String, int>> dateVsEntityVsCountMap,
    Map<String, int> dateVsHouseholdCount,
    Map<String, int> dateVsProjectBeneficiaryCount,
    Map<String, int> dateVsClosedHouseholdTaskCount,
    Map<String, int> dateVsClosedHouseholdAbsentTaskCount,
    Map<String, int> dateVsClosedHouseholdRefusedTaskCount,
    Set<String> uniqueDates,
  ) {
    for (var date in uniqueDates) {
      Map<String, int> elementVsCount = {};
      if (dateVsHouseholdCount.containsKey(date) &&
          dateVsHouseholdCount[date] != null) {
        var count = dateVsHouseholdCount[date];
        elementVsCount[Constants.household] = count ?? 0;
      }
      if (dateVsProjectBeneficiaryCount.containsKey(date) &&
          dateVsProjectBeneficiaryCount[date] != null) {
        var count = dateVsProjectBeneficiaryCount[date];
        elementVsCount[Constants.projectBeneficiary] = count ?? 0;
      }
      if (dateVsClosedHouseholdTaskCount.containsKey(date) &&
          dateVsClosedHouseholdTaskCount[date] != null) {
        var count = dateVsClosedHouseholdTaskCount[date];
        elementVsCount[Constants.closedHousehold] = count ?? 0;
      }
      if (dateVsClosedHouseholdAbsentTaskCount.containsKey(date) &&
          dateVsClosedHouseholdAbsentTaskCount[date] != null) {
        var count = dateVsClosedHouseholdAbsentTaskCount[date];
        elementVsCount[Constants.closedHouseholdAbsent] = count ?? 0;
      }
      if (dateVsClosedHouseholdRefusedTaskCount.containsKey(date) &&
          dateVsClosedHouseholdRefusedTaskCount[date] != null) {
        var count = dateVsClosedHouseholdRefusedTaskCount[date];
        elementVsCount[Constants.closedHouseholdRefused] = count ?? 0;
      }
      dateVsEntityVsCountMap[date] = elementVsCount;
    }
  }

  void populateDateVsCountMap(
      Map<String, List> map, Map<String, int> dateVsCount) {
    map.forEach((key, value) {
      dateVsCount[key] = value.length;
    });
  }

  void getUniqueSetOfDates(
    Map<String, List<HouseholdModel>> dateVsHousehold,
    Map<String, List<ProjectBeneficiaryModel>> dateVsProjectBeneficiary,
    Map<String, List<TaskModel>> dateVsClosedHouseholdTask,
    Set<String> uniqueDates,
  ) {
    uniqueDates.addAll(dateVsHousehold.keys.toSet());
    uniqueDates.addAll(dateVsProjectBeneficiary.keys.toSet());
    uniqueDates.addAll(dateVsClosedHouseholdTask.keys.toSet());
  }

// todo optimize this
  void getClosedHouseholdProjectBeneficiary(
      Set<String> projectBeneficiaryClientReferenceIds,
      List<ProjectBeneficiaryModel> projectBeneficiaryList,
      Set<String?> filteredBeneficiariesClientRefId) {
    if (projectBeneficiaryClientReferenceIds.isNotEmpty) {
      for (var beneficiairy in projectBeneficiaryList) {
        if (projectBeneficiaryClientReferenceIds
                .contains(beneficiairy.clientReferenceId) &&
            beneficiairy.beneficiaryClientReferenceId != null) {
          filteredBeneficiariesClientRefId
              .add(beneficiairy.beneficiaryClientReferenceId);
        }
      }
    }
  }

// todo optimize this
  void filteredHouseholds(
      List<HouseholdModel> householdList,
      Set<String?> filteredBeneficiariesClientRefId,
      List<HouseholdModel> filteredHouseholdsList) {
    for (var household in householdList) {
      if (!filteredBeneficiariesClientRefId
          .contains(household.clientReferenceId)) {
        filteredHouseholdsList.add(household);
      }
    }
  }

  // todo optimize this
  void filterProjectBeneficiaryList(
      List<ProjectBeneficiaryModel> projectBeneficiaryList,
      Set<String?> filteredBeneficiariesClientRefId,
      List<ProjectBeneficiaryModel> filteredProjectBeneficiaryList) {
    for (var projectBeneficiary in projectBeneficiaryList) {
      if (!filteredBeneficiariesClientRefId
          .contains(projectBeneficiary.beneficiaryClientReferenceId)) {
        filteredProjectBeneficiaryList.add(projectBeneficiary);
      }
    }
  }

  void populateDateVsBeneficiaryImpactedMap(
      Map<String, List<HouseholdModel>> dateVsHousehold,
      Map<String, int> dateVsBeneficiaryImpactedCount) {
    dateVsHousehold.forEach((key, value) {
      int memberCount = 0;
      memberCount = getMembersCount(value);

      dateVsBeneficiaryImpactedCount[key] = memberCount;
    });
  }

  int getMembersCount(List<HouseholdModel> households) {
    int memberCount = 0;

    for (var household in households) {
      memberCount = memberCount + (household.memberCount ?? 0);
    }

    return memberCount;
  }

  String getClosedReason(TaskModel task) {
    var reason = "";
    var reasonKey = "REASON";

    if (task.additionalFields == null ||
        (task.additionalFields?.fields ?? []).isEmpty) {
      return reason;
    } else {
      var reasonField = task.additionalFields?.fields
          .where((element) => element.key == reasonKey)
          .firstOrNull;

      if (reasonField == null) {
        return reason;
      } else {
        reason = reasonField.value;
        return reason;
      }
    }
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
    @Default({}) Map<String, Map<String, int>> summaryData,
  }) = CustomEnumerationSummaryReportSummaryDataState;
}
