import 'dart:async';
import 'dart:convert';

import 'package:digit_components/utils/app_logger.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_response.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../models/entities/dashboard_response_model.dart';

class DashboardRemoteRepository {
  final Dio _client;
  DashboardRemoteRepository(this._client);

  FutureOr<void> searchAndWriteToDB({
    required String apiEndPoint,
    Object? query,
    required String projectId,
    DateTime? lastSelectedDate,
    required Isar isar,
  }) async {
    try {
      final response = await _client.post(
        apiEndPoint,
        data: query,
      );

      final dashboardResponse = DashboardResponseModelMapper.fromMap(
        json.decode(response.data)['responseData'],
      );

      if (dashboardResponse != null) {
        await isar.writeTxn(() async {
          await isar.dashboardResponses
              .where()
              .filter()
              .projectIdEqualTo(projectId)
              .visualizationCodeEqualTo(dashboardResponse.visualizationCode)
              .chartTypeEqualTo(dashboardResponse.chartType)
              .deleteAll();
        });
        final data = dashboardResponse;
        final chart = DashboardResponse();
        chart.chartType = data.chartType;
        chart.hideHeaderDenomination = data.hideHeaderDenomination;
        chart.lastSelectedDate = lastSelectedDate ?? DateTime.now();
        chart.visualizationCode = data.visualizationCode;
        chart.projectId = projectId;
        chart.drillDownChartId = data.drillDownChartId;
        chart.hideInsights = data.hideInsights;
        chart.showLabel = data.showLabel;
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
          final insight = Insight();
          insight.value = c.insight?.value;
          insight.name = c.insight?.name;
          insight.colorCode = c.insight?.colorCode;
          insight.indicator = c.insight?.indicator;
          chartData.insight = insight;
          return chartData;
        }).toList();
        chart.data = dataPlots;
        return await isar.writeTxn(() async {
          await isar.dashboardResponses.put(chart);
        });
      }
    } on DioException catch (e) {
      print(e);
      AppLogger.instance.error(
        title: 'Dashboard Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }
}
