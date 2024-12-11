import 'dart:async'; // Import the dart:async library for asynchronous operations
import 'dart:convert'; // Import the dart:convert library for JSON encoding and decoding

import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_response.dart'; // Import the dashboard_response.dart file from the digit_dss package
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart'; // Import the dio package for HTTP client functionality
import 'package:flutter/material.dart';
import 'package:isar/isar.dart'; // Import the isar package for database management

import '../../models/entities/dashboard_config.dart';
import '../../models/entities/dashboard_response_model.dart';
import '../../models/entities/dss_enums.dart';
import '../local_store/no_sql/schema/dashboard_config_schema.dart'; // Import the dashboard_response_model.dart file from the models/entities directory

// DashboardRemoteRepository class handles remote API requests and database transactions
class DashboardRemoteRepository {
  final Dio _client; // Dio HTTP client instance
  DashboardRemoteRepository(
      this._client); // Constructor to initialize the Dio client

  // Method to search data from the API and write it to the Isar database
  FutureOr<void> searchAndWriteToDB({
    required String apiEndPoint, // API endpoint URL
    Object? query, // Query parameters for the API request
    required String projectId, // Project ID for filtering data
    DateTime? lastSelectedDate, // Last selected date for filtering data
    required Isar isar, // Isar database instance
  }) async {
    try {
      final response = await _client.post(
        apiEndPoint,
        data: query,
      ); // Make a POST request to the API endpoint with the query parameters

      // Map the response data to the DashboardResponseModel
      final dashboardResponse = DashboardResponseModelMapper.fromMap(
        json.decode(response.data)[DSSEnums.responseData.toValue()],
      );

      if (dashboardResponse.data != null) {
        // Write transaction to delete existing data and insert new data
        isar.writeTxnSync(() {
          isar.dashboardResponses
              .where()
              .filter()
              .projectIdEqualTo(projectId)
              .visualizationCodeEqualTo(dashboardResponse.visualizationCode)
              .chartTypeEqualTo(dashboardResponse.chartType)
              .deleteAllSync(); // Delete existing data matching the project ID, visualization code, and chart type
        });

        final data =
            dashboardResponse; // Assign the dashboard response data to a local variable
        final chart =
            DashboardResponse(); // Create a new DashboardResponse instance
        chart.chartType = data.chartType; // Set chart type
        chart.hideHeaderDenomination =
            data.hideHeaderDenomination; // Set hide header denomination flag
        chart.lastSelectedDate =
            lastSelectedDate ?? DateTime.now(); // Set last selected date
        chart.visualizationCode =
            data.visualizationCode; // Set visualization code
        chart.projectId = projectId; // Set project ID
        chart.drillDownChartId =
            data.drillDownChartId; // Set drill down chart ID
        chart.hideInsights = data.hideInsights; // Set hide insights flag
        chart.showLabel = data.showLabel; // Set show label flag

        // Map the data plots to the DashboardChartData and DashboardPlot instances
        final dataPlots = data.data?.map((c) {
          final chartData = DashboardChartData();
          chartData.headerValue = c.headerValue;
          chartData.headerName = c.headerName;
          chartData.headerSymbol = c.headerSymbol;
          chartData.plots = c.plots?.map((p) {
            final plot = DashboardPlot();
            plot.label = p.label;
            plot.strValue = p.strValue;
            plot.name = p.name;
            plot.value = p.value;
            plot.symbol = p.symbol;
            return plot;
          }).toList();

          // Map the insight data to the Insight instance
          final insight = Insight();
          insight.value = c.insight?.value;
          insight.name = c.insight?.name;
          insight.colorCode = c.insight?.colorCode;
          insight.indicator = c.insight?.indicator;
          chartData.insight = insight;
          return chartData;
        }).toList();
        chart.data = dataPlots; // Set the data plots

        // Write transaction to insert the new chart data
        return isar.writeTxnSync(() {
          isar.dashboardResponses.putSync(chart);
        });
      }
    } on DioException catch (e) {
      // Handle Dio exceptions and log the error
      debugPrint(e.toString());
      AppLogger.instance.error(
        title: 'Dashboard Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow; // Rethrow the exception
    }
  }

  Future<String> searchDashboardConfig(
    String apiEndPoint,
    Map body,
  ) async {
    try {
      final response = await _client.post(apiEndPoint, data: body);

      final appCon = jsonEncode(response.data);

      return appCon;
    } on DioException catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }

  FutureOr<void> writeToDashboardConfigDB(
    DashboardConfigWrapper dashboardConfigWrapper,
    Isar isar,
  ) async {
    final dashboardConfig = DashboardConfigSchema()
      ..enableDashboard = dashboardConfigWrapper.enableDashboard
      ..charts = dashboardConfigWrapper.charts?.map((chart) {
        final dssChart = DashboardChartConfigSchema()
          ..name = chart.name
          ..active = chart.active
          ..chartType = chart.chartType
          ..vizType = chart.vizType;
        return dssChart;
      }).toList();

    isar.writeTxnSync(() {
      isar.dashboardConfigSchemas.putSync(dashboardConfig);
    });
  }
}
