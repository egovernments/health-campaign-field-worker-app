import 'dart:async';

import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_response.dart';
import 'package:digit_dss/data/remote/dashboard.dart';
import 'package:digit_dss/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'dashboard.freezed.dart';

typedef DashboardEmitter = Emitter<DashboardState>;

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Isar isar;
  final DashboardRemoteRepository dashboardRemoteRepo;
  DashboardBloc(
    super.initialState, {
    required this.isar,
    required this.dashboardRemoteRepo,
  }) {
    on(_handleSearch);
    on(_handleRefresh);
  }

  FutureOr<void> _handleRefresh(
    DashboardRefreshEvent event,
    DashboardEmitter emit,
  ) async {
    emit(const DashboardState.loading());
    final isConnected = await getIsConnected();
    if (isConnected && event.syncFromServer) {
      emit(const DashboardState.loading());
      final startDate = DateTime(event.selectedDate.year,
              event.selectedDate.month, event.selectedDate.day)
          .toLocal()
          .millisecondsSinceEpoch;
      final endDate = DateTime(event.selectedDate.year,
              event.selectedDate.month, event.selectedDate.day, 11, 59)
          .toLocal()
          .millisecondsSinceEpoch;

      try {
        await isar.writeTxn(() async {
          await isar.dashboardResponses.clear();
        });
        await dashboardRemoteRepo.searchAndWriteToDB(
          apiEndPoint: DashboardSingleton().actionPath,
          lastSelectedDate: event.selectedDate,
          query: {
            "aggregationRequestDto": {
              "visualizationType": "METRIC",
              "visualizationCode": "populationCoveredToday",
              "queryType": "",
              "filters": {},
              "moduleLevel": "",
              "aggregationFactors": null,
              "requestDate": {
                "startDate": startDate,
                "endDate": endDate,
                "interval": "day",
                "title": "home"
              }
            },
            "headers": {
              "tenantId": DashboardSingleton().tenantId,
            }
          },
          projectId: event.projectId,
          isar: isar,
        );
        await dashboardRemoteRepo.searchAndWriteToDB(
          apiEndPoint: DashboardSingleton().actionPath,
          lastSelectedDate: event.selectedDate,
          query: {
            "aggregationRequestDto": {
              "visualizationType": "METRIC",
              "visualizationCode": "totalPopulationCovered",
              "queryType": "",
              "filters": {},
              "moduleLevel": "",
              "aggregationFactors": null,
              "requestDate": {
                "startDate": startDate,
                "endDate": endDate,
                "interval": "day",
                "title": "home"
              }
            },
            "headers": {
              "tenantId": DashboardSingleton().tenantId,
            }
          },
          projectId: event.projectId,
          isar: isar,
        );
        await dashboardRemoteRepo.searchAndWriteToDB(
          apiEndPoint: DashboardSingleton().actionPath,
          lastSelectedDate: event.selectedDate,
          query: {
            "aggregationRequestDto": {
              "visualizationType": "METRIC",
              "visualizationCode": "todayDistributions",
              "queryType": "",
              "filters": {},
              "moduleLevel": "",
              "aggregationFactors": null,
              "requestDate": {
                "startDate": startDate,
                "endDate": endDate,
                "interval": "day",
                "title": "home"
              }
            },
            "headers": {
              "tenantId": DashboardSingleton().tenantId,
            }
          },
          projectId: event.projectId,
          isar: isar,
        );

        add(DashboardEvent.handleSearch(selectedDate: event.selectedDate));
      } catch (e) {
        print(e);
        emit(const DashboardErrorState());
      }
    } else if (!isConnected && event.syncFromServer) {
      emit(const DashboardErrorState());
    } else {
      add(const DashboardEvent.handleSearch());
    }
  }

  FutureOr<void> _handleSearch(
    DashboardSearchEvent event,
    DashboardEmitter emit,
  ) async {
    try {
      final dashboardCharts = await isar.dashboardResponses.where().findAll();
      final totalHouseSprayedChart = dashboardCharts
          .where((d) =>
              d.visualizationCode == 'populationCoveredToday' &&
              d.chartType == 'metric')
          .firstOrNull
          ?.data
          ?.firstOrNull;
      final totalHousesSprayed = MetricWrapper(
          // header: totalHouseSprayedChart?.headerName ?? '',
          header: 'Total houses sprayed today',
          value: totalHouseSprayedChart?.headerValue ?? '0',
          insight: totalHouseSprayedChart?.insight);
      final targetAchievementChart = dashboardCharts
          .where((d) =>
              d.visualizationCode == 'todayDistributions' &&
              d.chartType == 'metric')
          .firstOrNull
          ?.data
          ?.firstOrNull;
      final targetAchievement = MetricWrapper(
          header: '% of target achieved today',
          // header: targetAchievementChart?.headerName ?? '',
          value: targetAchievementChart?.headerValue ?? '0',
          insight: targetAchievementChart?.insight);
      final noOfBottlesChart = dashboardCharts
          .where((d) =>
              d.visualizationCode == 'totalPopulationCovered' &&
              d.chartType == 'metric')
          .firstOrNull
          ?.data
          ?.firstOrNull;
      final noOfBottlesUsed = MetricWrapper(
          header: 'No. of bottles used today',
          // header: noOfBottlesChart?.headerName ?? '',
          value: noOfBottlesChart?.headerValue ?? '0',
          insight: noOfBottlesChart?.insight);

      emit(DashboardFetchedState(
        metricData: {
          totalHousesSprayed.header: totalHousesSprayed,
          noOfBottlesUsed.header: noOfBottlesUsed,
          targetAchievement.header: targetAchievement,
        },
        tableData: null,
        selectedDate: dashboardCharts.first.lastSelectedDate ??
            event.selectedDate ??
            DateTime.now(),
      ));
    } catch (error) {
      rethrow;
    }
  }
}

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.handleSearch({
    DateTime? selectedDate,
  }) = DashboardSearchEvent;
  const factory DashboardEvent.handleRefresh({
    required DateTime selectedDate,
    required String projectId,
    @Default(false) bool syncFromServer,
  }) = DashboardRefreshEvent;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = DashboardLoadingState;
  const factory DashboardState.fetched({
    Map<String, MetricWrapper>? metricData,
    List<TableDataRow>? tableData,
    DateTime? selectedDate,
  }) = DashboardFetchedState;
  const factory DashboardState.error() = DashboardErrorState;
}

class MetricWrapper {
  final String header;
  final String value;
  final Insight? insight;

  MetricWrapper({
    required this.header,
    required this.value,
    this.insight,
  });
}
