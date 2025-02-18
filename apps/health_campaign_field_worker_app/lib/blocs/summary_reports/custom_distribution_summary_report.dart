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

part 'custom_distribution_summary_report.freezed.dart';

typedef CustomDistributionSummaryReportEmitter
    = Emitter<CustomDistributionSummaryReportState>;

class CustomDistributionSummaryReportBloc extends Bloc<
    CustomDistributionSummaryReportEvent,
    CustomDistributionSummaryReportState> {
  final HouseholdDataRepository householdRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskRepository;

  CustomDistributionSummaryReportBloc({
    required this.householdRepository,
    required this.projectBeneficiaryRepository,
    required this.taskRepository,
  }) : super(const CustomDistributionSummaryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    CustomDistributionSummaryReportLoadDataEvent event,
    CustomDistributionSummaryReportEmitter emit,
  ) async {
    try {
      List<HouseholdModel> householdList = [];
      List<ProjectBeneficiaryModel> projectBeneficiaryList = [];
      List<TaskModel> successfulTaskList = [];

      final userId = event.userId;

      //  read all closed household task from db which are created by userId
      successfulTaskList =
          await (taskRepository as CustomTaskLocalRepository).progressBarSearch(
        TaskSearchModel(status: Status.administeredSuccess.toValue()),
        userId,
      );

      Set<String> projectBeneficiaryClientReferenceIds = successfulTaskList
          .map((e) => e.projectBeneficiaryClientReferenceId ?? "")
          .toSet()
          .where((element) => element.isNotEmpty)
          .toSet();

      //  read all projectBeneficiaries from db which are created by userId
      projectBeneficiaryList = await (projectBeneficiaryRepository
              as ProjectBeneficiaryLocalRepository)
          .search(ProjectBeneficiarySearchModel(
              tenantId: envConfig.variables.tenantId,
              clientReferenceId:
                  projectBeneficiaryClientReferenceIds.toList()));

      Set<String> pbBeneficiaryClientReferenceIds = projectBeneficiaryList
          .map((e) => e.beneficiaryClientReferenceId ?? "")
          .toSet()
          .where((element) => element.isNotEmpty)
          .toSet();

      //  read all households from db which are created by userId
      householdList =
          await (householdRepository as HouseholdLocalRepository).search(
        HouseholdSearchModel(
            tenantId: envConfig.variables.tenantId,
            clientReferenceId: pbBeneficiaryClientReferenceIds.toList()),
      );

      Map<String, List<HouseholdModel>> dateVsHouseholds = {};
      Map<String, List<ProjectBeneficiaryModel>> dateVsProjectBeneficiaries =
          {};
      Map<String, List<TaskModel>> dateVsSuccessfulTasks = {};
      Set<String> uniqueDates = {};

      Map<String, int> dateVsHouseholdCount = {};
      Map<String, int> dateVsBeneficiaryImpactedCount = {};
      Map<String, int> dateVsBedNetDistributedCount = {};

      for (var element in householdList) {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        dateVsHouseholds.putIfAbsent(dateKey, () => []).add(element);
      }

      for (var element in successfulTaskList) {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        dateVsSuccessfulTasks.putIfAbsent(dateKey, () => []).add(element);
      }

      // get a set of unique dates
      getUniqueSetOfDates(
        dateVsHouseholds,
        dateVsProjectBeneficiaries,
        dateVsSuccessfulTasks,
        uniqueDates,
      );

      // populate the day vs count for that day map
      populateDateVsCountMap(dateVsHouseholds, dateVsHouseholdCount);

      populateDateVsBednetDistributedMap(
          dateVsSuccessfulTasks, dateVsBedNetDistributedCount);

      populateDateVsBeneficiaryImpactedMap(
          dateVsHouseholds, dateVsBeneficiaryImpactedCount);

      Map<String, Map<String, int>> dateVsEntityVsCountMap = {};

      popoulateDateVsEntityCountMap(
        dateVsEntityVsCountMap,
        dateVsHouseholdCount,
        dateVsBeneficiaryImpactedCount,
        dateVsBedNetDistributedCount,
        uniqueDates,
      );

      emit(CustomDistributionSummaryReportSummaryDataState(
        summaryData: dateVsEntityVsCountMap,
      ));
    } catch (e) {
      emit(const CustomDistributionSummaryReportLoadingState());
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

  void popoulateDateVsEntityCountMap(
    Map<String, Map<String, int>> dateVsEntityVsCountMap,
    Map<String, int> dateVsHouseholdCount,
    Map<String, int> dateVsBeneficiaryImpactedCount,
    Map<String, int> dateVsBedNetDistributedCount,
    Set<String> uniqueDates,
  ) {
    for (var date in uniqueDates) {
      Map<String, int> elementVsCount = {};
      if (dateVsHouseholdCount.containsKey(date) &&
          dateVsHouseholdCount[date] != null) {
        var count = dateVsHouseholdCount[date];
        elementVsCount[Constants.household] = count ?? 0;
      }
      if (dateVsBeneficiaryImpactedCount.containsKey(date) &&
          dateVsBeneficiaryImpactedCount[date] != null) {
        var count = dateVsBeneficiaryImpactedCount[date];
        elementVsCount[Constants.projectBeneficiary] = count ?? 0;
      }
      if (dateVsBedNetDistributedCount.containsKey(date) &&
          dateVsBedNetDistributedCount[date] != null) {
        var count = dateVsBedNetDistributedCount[date];
        elementVsCount[Constants.bednetDistributed] = count ?? 0;
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

  void populateDateVsBednetDistributedMap(
      Map<String, List<TaskModel>> map, Map<String, int> dateVsCount) {
    map.forEach((key, taskList) {
      int totalBednetDistributed = 0;

      for (var task in taskList) {
        totalBednetDistributed =
            totalBednetDistributed + resourceDistributed(task.resources);
      }

      dateVsCount[key] = totalBednetDistributed;
    });
  }

  int resourceDistributed(List<TaskResourceModel>? taskResources) {
    int resourceDistributed = 0;
    RegExp intPattern = RegExp(r'^\d+$');
    RegExp doublePattern = RegExp(r'^\d+\.\d+$');
    if (taskResources != null) {
      for (var resource in taskResources) {
        // Info quantity is string type as per model
        String quantity = resource.quantity ?? "0";
        try {
          if (intPattern.hasMatch(quantity)) {
            resourceDistributed = resourceDistributed + int.parse(quantity);
          } else if (doublePattern.hasMatch(quantity)) {
            //info will round the decimal and convert to int
            double parsedQuantity = double.parse(quantity);
            if (parsedQuantity.isNaN ||
                parsedQuantity.isInfinite ||
                parsedQuantity.isNegative) {
              continue;
            } else {
              int correctedQuantity = parsedQuantity.ceil();
              resourceDistributed = resourceDistributed + correctedQuantity;
            }
          } else {
            continue;
          }
        } catch (e) {
          continue;
        }
      }
    }
    return resourceDistributed;
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

  Future<void> _handleLoadingEvent(
    CustomDistributionSummaryReportLoadingEvent event,
    CustomDistributionSummaryReportEmitter emit,
  ) async {
    emit(const CustomDistributionSummaryReportLoadingState());
  }
}

@freezed
class CustomDistributionSummaryReportEvent
    with _$CustomDistributionSummaryReportEvent {
  const factory CustomDistributionSummaryReportEvent.loadData({
    required String userId,
  }) = CustomDistributionSummaryReportLoadDataEvent;

  const factory CustomDistributionSummaryReportEvent.loading() =
      CustomDistributionSummaryReportLoadingEvent;
}

@freezed
class CustomDistributionSummaryReportState
    with _$CustomDistributionSummaryReportState {
  const factory CustomDistributionSummaryReportState.loading() =
      CustomDistributionSummaryReportLoadingState;
  const factory CustomDistributionSummaryReportState.empty() =
      CustomDistributionSummaryReportEmptyState;

  const factory CustomDistributionSummaryReportState.summaryData({
    @Default({}) Map<String, Map<String, int>> summaryData,
  }) = CustomDistributionSummaryReportSummaryDataState;
}
