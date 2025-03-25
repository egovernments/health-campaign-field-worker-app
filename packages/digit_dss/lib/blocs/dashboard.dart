import 'dart:async'; // Import the dart:async library for asynchronous operations

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/utils/typedefs.dart';
import 'package:collection/collection.dart'; // Import the collection package for collection utilities
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/digit_dss.dart'; // Import the digit_dss.dart file from the digit_dss package
import 'package:digit_ui_components/theme/colors.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the flutter_bloc package for state management
import 'package:freezed_annotation/freezed_annotation.dart'; // Import the freezed_annotation package for code generation
import 'package:isar/isar.dart'; // Import the isar package for database management

part 'dashboard.freezed.dart'; // Generate the part file for freezed annotations

typedef DashboardEmitter = Emitter<
    DashboardState>; // Define a typedef for the Emitter of DashboardState

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Isar isar; // Isar database instance
  final DashboardRemoteRepository
      dashboardRemoteRepo; // Remote repository for dashboard data
  final AttendanceDataRepository attendanceDataRepository;
  final IndividualDataRepository individualDataRepository;

  DashboardBloc(
    super.initialState, {
    required this.isar,
    required this.dashboardRemoteRepo,
    required this.attendanceDataRepository,
    required this.individualDataRepository,
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
    try {
      bool enableDashboard =
          DashboardSingleton().dashboardConfig?.enableDashboard ??
              false; // Check if dashboard is enabled
      final dashboardConfig = DashboardSingleton()
          .dashboardConfig
          ?.charts; // Get dashboard configuration
      if (!enableDashboard ||
          (dashboardConfig?.where((chart) =>
                      (chart.name ?? '').isNotEmpty &&
                      (chart.chartType ?? '').isNotEmpty) ??
                  [])
              .toList()
              .isEmpty) {
        emit(
            const DashboardErrorState()); // Emit error state if dashboard is not enabled or config is empty
      } else {
        final isConnected =
            await getIsConnected(); // Check network connectivity
        if (isConnected && event.syncFromServer) {
          final startDate = DateTime(event.selectedDate.year,
                  event.selectedDate.month, event.selectedDate.day)
              .toLocal()
              .millisecondsSinceEpoch; // Get start date in milliseconds
          final endDate = DateTime(event.selectedDate.year,
                  event.selectedDate.month, event.selectedDate.day, 23, 59)
              .toLocal()
              .millisecondsSinceEpoch; // Get end date in milliseconds

          try {
            final registers = await attendanceDataRepository.search(
              AttendanceRegisterSearchModel(
                staffId: AttendanceSingleton().loggedInIndividualId,
                referenceId: AttendanceSingleton().projectId,
              ),
            );
            List<String> attendeesIndividualIds = [];
            for (var r in registers) {
              r.attendees?.where((a) => a.individualId != null).forEach((att) {
                attendeesIndividualIds.add(att.individualId.toString());
              });
            }
            final individuals =
                await individualDataRepository.search(IndividualSearchModel(
              id: attendeesIndividualIds,
            ));
            final userUUIDList = individuals
                .where((ind) => ind.userUuid != null)
                .map((i) => i.userUuid.toString())
                .toList();
            await processDashboardConfig(
              dashboardConfig: dashboardConfig
                      ?.where((chart) =>
                          (chart.name ?? '').isNotEmpty &&
                          (chart.chartType ?? '').isNotEmpty)
                      .toList() ??
                  [],
              startDate: startDate,
              endDate: endDate,
              isar: isar,
              lastSelectedDate: event.selectedDate,
              dashboardRemoteRepo: dashboardRemoteRepo,
              actionPath: DashboardSingleton().actionPath,
              tenantId: DashboardSingleton().tenantId,
              projectId: DashboardSingleton().projectId,
              projectTypeId: DashboardSingleton().projectTypeId,
              userList: userUUIDList,
            ); // Process dashboard configuration

            add(DashboardEvent.handleSearch(
                selectedDate: event.selectedDate)); // Trigger search event
          } catch (e) {
            debugPrint(e.toString()); // Print error
            add(const DashboardEvent.handleSearch(
              isNetworkError: true,
            ));
          }
        } else if (!isConnected && event.syncFromServer) {
          emit(
              const DashboardErrorState()); // Emit error state if not connected and sync is required
        } else {
          add(const DashboardEvent.handleSearch()); // Trigger search event
        }
      }
    } catch (e) {
      debugPrint(e.toString());
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
          .chartTypeEqualTo(DSSEnums.metric.toValue())
          .projectIdEqualTo(DashboardSingleton().projectId)
          .findAll(); // Query metric charts from Isar database
      Map<String, MetricWrapper> metrics = {}; // Initialize metrics map
      List<TableWrapper> tableWrapperList = []; // Initialize table wrapper list
      DashboardConfigSchema? dashboardConfig =
          DashboardSingleton().dashboardConfig;
      for (DashboardResponse chart in metricCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          for (DashboardChartData data in (chart.data ?? [])) {
            metrics.addAll({
              data.headerName.toString(): MetricWrapper(
                header: data.headerName ?? '',
                value: data.headerValue ?? '0',
                insight: data.insight,
                isHorizontal: dashboardConfig?.charts
                        ?.where((metric) =>
                            metric.name == chart.visualizationCode &&
                            metric.chartType ==
                                DSSEnums.metric.name.toUpperCase())
                        .first
                        .vizType ==
                    DSSEnums.row.toValue(),
              ),
            }); // Populate metrics map
          }
        }
      }
      final tableCharts = await isar.dashboardResponses
          .where()
          .filter()
          .chartTypeEqualTo(DSSEnums.table.toValue())
          .projectIdEqualTo(DashboardSingleton().projectId)
          .findAll(); // Query table charts from Isar database
      for (DashboardResponse chart in tableCharts) {
        if ((chart.data ?? []).isNotEmpty) {
          // Create table headers
          final List<DigitTableColumn> tableHeaderList = chart.data?.first.plots
                  ?.where((p) =>
                      p.name != DSSEnums.serialNumber.toValue() &&
                      p.name != DSSEnums.startDate.toValue() &&
                      p.name != DSSEnums.endDate.toValue() &&
                      p.name != null)
                  .map((e) {
                final headerData = transformToLocaleCode(e.name ?? '');
                return DigitTableColumn(header: headerData, cellValue: e.name!);
              }).toList() ??
              [];

          // Create table details
          final tableDetails = chart.data?.map((e) {
            final rowTableData = e.plots
                ?.where((p) =>
                    p.name != DSSEnums.serialNumber.toValue() &&
                    p.name != DSSEnums.startDate.toValue() &&
                    p.name != DSSEnums.endDate.toValue())
                .mapIndexed(
                  (i, plot) => DigitTableData(
                    plot.symbol == DSSEnums.number.toValue() ||
                            plot.symbol == DSSEnums.percentage.toValue() ||
                            plot.symbol == DSSEnums.amount.toValue()
                        ? plot.name == DSSEnums.lastSyncedTime.toValue()
                            ? double.tryParse(plot.value.toString())?.toInt() !=
                                    0
                                ? DigitDateUtils.getDateFromTimestamp(int.parse(
                                    double.parse(plot.value.toString())
                                        .toInt()
                                        .toString()))
                                : ''
                            : double.parse(plot.value.toString()) ==
                                    double.parse(plot.value.toString()).toInt()
                                ? double.parse(plot.value.toString())
                                    .toInt()
                                    .toString()
                                : double.parse(plot.value.toString())
                                    .toStringAsFixed(2)
                        : plot.label.toString(),
                    cellKey: plot.name!,
                    style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium
                        ?.apply(
                      color: i == 0
                          ? const DigitColors().light.primary1
                          : const DigitColors().light.textPrimary,
                    ),
                  ),
                )
                .toList();
            return DigitTableRow(tableRow: rowTableData!);
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
        isNetworkError: event.isNetworkError,
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
    @Default(false) bool? isNetworkError,
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
  const factory DashboardState.initialState() =
      DashboardInitialState; // Define initial state
  const factory DashboardState.fetched({
    Map<String, MetricWrapper>? metricData,
    List<TableWrapper>? tableData,
    DateTime? selectedDate,
    @Default(false) bool? isNetworkError,
  }) = DashboardFetchedState; // Define fetched state
  const factory DashboardState.error() =
      DashboardErrorState; // Define error state
}

// Class for wrapping metric data
class MetricWrapper {
  final String header; // Header of the metric
  final String value; // Value of the metric
  final Insight? insight; // Insight related to the metric
  final bool? isHorizontal;
  MetricWrapper({
    required this.header,
    required this.value,
    this.insight,
    this.isHorizontal = true,
  });
}

// Class for wrapping table data
class TableWrapper {
  final List<DigitTableColumn> headerList; // List of table headers
  final List<DigitTableRow> tableData; // List of table data rows

  TableWrapper({
    required this.headerList,
    required this.tableData,
  });
}
