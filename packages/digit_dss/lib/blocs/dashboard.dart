import 'dart:async'; // Import the dart:async library for asynchronous operations

import 'package:collection/collection.dart'; // Import the collection package for collection utilities
import 'package:digit_components/models/digit_table_model.dart'; // Import the digit_table_model.dart file from the digit_components package
import 'package:digit_components/theme/colors.dart'; // Import the colors.dart file from the digit_components package
import 'package:digit_components/theme/digit_theme.dart'; // Import the digit_theme.dart file from the digit_components package
import 'package:digit_dss/digit_dss.dart'; // Import the digit_dss.dart file from the digit_dss package
import 'package:flutter/cupertino.dart'; // Import the cupertino.dart file from the flutter package
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the flutter_bloc package for state management
import 'package:freezed_annotation/freezed_annotation.dart'; // Import the freezed_annotation package for code generation
import 'package:isar/isar.dart'; // Import the isar package for database management

part 'dashboard.freezed.dart'; // Generate the part file for freezed annotations

typedef DashboardEmitter = Emitter<
    DashboardState>; // Define a typedef for the Emitter of DashboardState

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Isar isar; // Isar database instance
  BuildContext context; // BuildContext for accessing UI elements
  final DashboardRemoteRepository
      dashboardRemoteRepo; // Remote repository for dashboard data

  DashboardBloc(
    super.initialState, {
    required this.context,
    required this.isar,
    required this.dashboardRemoteRepo,
  }) {
    on(_handleSearch); // Register the _handleSearch event handler
    on(_handleRefresh); // Register the _handleRefresh event handler
  }

  // Event handler for refreshing the dashboard
  FutureOr<void> _handleRefresh(
    DashboardRefreshEvent event,
    DashboardEmitter emit,
  ) async {
    emit(const DashboardState.loading()); // Emit loading state
    bool enableDashboard = DashboardSingleton()
            .selectedProject
            ?.additionalDetails
            ?.enableDashboard ??
        false; // Check if dashboard is enabled
    Map<String, List<String>> dashboardConfig = DashboardSingleton()
            .selectedProject
            ?.additionalDetails
            ?.dashboardConfig ??
        {}; // Get dashboard configuration
    if (!enableDashboard || dashboardConfig.keys.isEmpty) {
      emit(
          const DashboardErrorState()); // Emit error state if dashboard is not enabled or config is empty
    } else {
      final isConnected = await getIsConnected(); // Check network connectivity
      if (isConnected && event.syncFromServer) {
        final startDate = DateTime(event.selectedDate.year,
                event.selectedDate.month, event.selectedDate.day)
            .toLocal()
            .millisecondsSinceEpoch; // Get start date in milliseconds
        final endDate = DateTime(event.selectedDate.year,
                event.selectedDate.month, event.selectedDate.day, 11, 59)
            .toLocal()
            .millisecondsSinceEpoch; // Get end date in milliseconds

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
          ); // Process dashboard configuration

          add(DashboardEvent.handleSearch(
              selectedDate: event.selectedDate)); // Trigger search event
        } catch (e) {
          print(e); // Print error
          emit(const DashboardErrorState()); // Emit error state
        }
      } else if (!isConnected && event.syncFromServer) {
        emit(
            const DashboardErrorState()); // Emit error state if not connected and sync is required
      } else {
        add(const DashboardEvent.handleSearch()); // Trigger search event
      }
    }
  }

  // Event handler for searching the dashboard
  FutureOr<void> _handleSearch(
    DashboardSearchEvent event,
    DashboardEmitter emit,
  ) async {
    try {
      final metricCharts = await isar.dashboardResponses
          .where()
          .filter()
          .chartTypeEqualTo('metric')
          .findAll(); // Query metric charts from Isar database
      Map<String, MetricWrapper> metrics = {}; // Initialize metrics map
      List<TableWrapper> tableWrapperList = []; // Initialize table wrapper list
      for (DashboardResponse chart in metricCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          for (DashboardChartData data in (chart.data ?? [])) {
            metrics.addAll({
              data.headerName.toString(): MetricWrapper(
                header: data.headerName ?? '',
                value: data.headerValue ?? '0',
                insight: data.insight,
              ),
            }); // Populate metrics map
          }
        }
      }
      final tableCharts = await isar.dashboardResponses
          .where()
          .filter()
          .chartTypeEqualTo('xtable')
          .findAll(); // Query table charts from Isar database
      for (DashboardResponse chart in tableCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          // Create table headers
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

          // Create table details
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
        }
      }

      emit(DashboardFetchedState(
        metricData: metrics,
        tableData: tableWrapperList,
        selectedDate: metricCharts.firstOrNull?.lastSelectedDate ??
            event.selectedDate ??
            DateTime.now(),
      )); // Emit fetched state with metric and table data
    } catch (error) {
      rethrow; // Rethrow any caught errors
    }
  }
}

// Define DashboardEvent with freezed annotations
@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.handleSearch({
    DateTime? selectedDate,
  }) = DashboardSearchEvent; // Define handleSearch event
  const factory DashboardEvent.handleRefresh({
    required DateTime selectedDate,
    required String projectId,
    @Default(false) bool syncFromServer,
  }) = DashboardRefreshEvent; // Define handleRefresh event
}

// Define DashboardState with freezed annotations
@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() =
      DashboardLoadingState; // Define loading state
  const factory DashboardState.fetched({
    Map<String, MetricWrapper>? metricData,
    List<TableWrapper>? tableData,
    DateTime? selectedDate,
  }) = DashboardFetchedState; // Define fetched state
  const factory DashboardState.error() =
      DashboardErrorState; // Define error state
}

// Class for wrapping metric data
class MetricWrapper {
  final String header; // Header of the metric
  final String value; // Value of the metric
  final Insight? insight; // Insight related to the metric

  MetricWrapper({
    required this.header,
    required this.value,
    this.insight,
  });
}

// Class for wrapping table data
class TableWrapper {
  final List<TableHeader> headerList; // List of table headers
  final List<TableDataRow> tableData; // List of table data rows

  TableWrapper({
    required this.headerList,
    required this.tableData,
  });
}
