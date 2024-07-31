import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'dashboard.freezed.dart';

typedef DashboardEmitter = Emitter<DashboardState>;

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Isar isar;
  BuildContext context;
  final DashboardRemoteRepository dashboardRemoteRepo;
  DashboardBloc(
    super.initialState, {
    required this.context,
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
    bool enableDashboard = DashboardSingleton()
            .selectedProject
            ?.additionalDetails
            ?.enableDashboard ??
        false;
    Map<String, List<String>> dashboardConfig = DashboardSingleton()
            .selectedProject
            ?.additionalDetails
            ?.dashboardConfig ??
        {};
    if (!enableDashboard || dashboardConfig.keys.isEmpty) {
      emit(const DashboardErrorState());
    } else {
      final isConnected = await getIsConnected();
      if (isConnected && event.syncFromServer) {
        final startDate = DateTime(event.selectedDate.year,
                event.selectedDate.month, event.selectedDate.day)
            .toLocal()
            .millisecondsSinceEpoch;
        final endDate = DateTime(event.selectedDate.year,
                event.selectedDate.month, event.selectedDate.day, 11, 59)
            .toLocal()
            .millisecondsSinceEpoch;

        try {
          await processDashboardConfig(
            dashboardConfig,
            startDate,
            endDate,
            isar,
            event.selectedDate,
            dashboardRemoteRepo,
            DashboardSingleton().actionPath,
            DashboardSingleton().tenantId,
            DashboardSingleton().projectId,
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
  }

  FutureOr<void> _handleSearch(
    DashboardSearchEvent event,
    DashboardEmitter emit,
  ) async {
    try {
      final metricCharts = await isar.dashboardResponses
          .where()
          .filter()
          .chartTypeEqualTo('metric')
          .findAll();
      Map<String, MetricWrapper> metrics = {};
      List<TableWrapper> tableWrapperList = [];
      for (DashboardResponse chart in metricCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          for (DashboardChartData data in (chart.data ?? [])) {
            metrics.addAll({
              data.headerName.toString(): MetricWrapper(
                header: data.headerName ?? '',
                value: data.headerValue ?? '0',
                insight: data.insight,
              ),
            });
          }
        }
      }
      final tableCharts = await isar.dashboardResponses
          .where()
          .filter()
          .chartTypeEqualTo('xtable')
          .findAll();
      for (DashboardResponse chart in tableCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          // TotalDetails totalDetails = TotalDetails();
          final List<TableHeader> tableHeaderList = chart.data?.first.plots
                  ?.where((p) =>
                      p.name != "S.N." &&
                      p.name != "startDate" &&
                      p.name != "endDate" &&
                      p.name != null)
                  .map((e) {
                final headerData = transformToLocaleCode(e.name ?? '');
                return TableHeader(
                  headerData ?? '',
                  cellKey: e.name,
                );
              }).toList() ??
              [];

          final tableDetails = chart.data?.map((e) {
            final rowTableData = e.plots
                ?.where((p) =>
                    p.name != "S.N." &&
                    p.name != "startDate" &&
                    p.name != "endDate")
                .mapIndexed(
                  (i, plot) => TableData(
                    plot.symbol == "number" || plot.symbol == "percentage"
                        ? double.parse(plot.value.toString()) ==
                                double.parse(plot.value.toString()).toInt()
                            ? double.parse(plot.value.toString())
                                .toInt()
                                .toString()
                            : double.parse(plot.value.toString())
                                .toStringAsFixed(2)
                        : plot.label.toString(),
                    cellKey: plot.name,
                    style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium
                        ?.apply(
                      color: i == 0
                          ? const DigitColors().burningOrange
                          : const DigitColors().woodsmokeBlack,
                    ),
                  ),
                )
                .toList();
            return TableDataRow(rowTableData ?? []);
          }).toList();
          tableWrapperList.add(TableWrapper(
            headerList: tableHeaderList,
            tableData: tableDetails ?? [],
          ));

          // for (int i = 0; i < (chart.data ?? []).length; i++) {
          //   totalDetails.noOfHousesVisited +=
          //       int.parse(tableDetails?[i]['noOfHousesVisited'].toString());
          //   totalDetails.noOfHousesSprayed +=
          //       int.parse(chartData[i]['noOfHousesSprayed'].toString());
          //   totalDetails.noOfHousesNotSprayed +=
          //       (int.parse(chartData[i]['noOfHousesVisited'].toString()) -
          //           int.parse(chartData[i]['noOfHousesSprayed'].toString()));
          //   totalDetails.bottlesUsed +=
          //       int.parse(chartData[i]['bottlesUsed'].toString());
          //   totalDetails.noOfRemainingBottles +=
          //       (int.parse(chartData[i]['totalBottles'].toString()) -
          //           int.parse(chartData[i]['bottlesUsed'].toString()));
          // }
          //
          // tableData.add(TableDataRow([
          //   TableData('Total'),
          //   TableData(
          //     totalDetails.noOfHousesVisited.toString(),
          //     style:
          //         DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.apply(
          //       color: const DigitColors().darkSpringGreen,
          //     ),
          //   ),
          //   TableData(totalDetails.noOfHousesSprayed.toString()),
          //   TableData(totalDetails.noOfHousesNotSprayed.toString()),
          //   TableData(totalDetails.bottlesUsed.toString()),
          //   TableData(totalDetails.noOfRemainingBottles.toString()),
          //   TableData(''),
          // ]));
        }
      }

      emit(DashboardFetchedState(
        metricData: metrics,
        tableData: tableWrapperList,
        selectedDate: metricCharts.firstOrNull?.lastSelectedDate ??
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
    List<TableWrapper>? tableData,
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

class TableWrapper {
  final List<TableHeader> headerList;
  final List<TableDataRow> tableData;

  TableWrapper({
    required this.headerList,
    required this.tableData,
  });
}
