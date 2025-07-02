import 'dart:io';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/blocs/app_localization.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_config_schema.dart';
import 'package:digit_dss/data/remote/dashboard.dart';
import 'package:digit_dss/models/entities/dashboard_request.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../models/entities/dss_enums.dart';

const dashboardAPIPath = '/dashboard-analytics/dashboard/getChartV2';

Future<bool> getIsConnected() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }

    return false;
  } on SocketException catch (_) {
    return false;
  }
}

Widget buildMetric(
  BuildContext context,
  String label,
  String value,
  int index,
  DashboardLocalization localizations,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      if (index > 2)
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.6,
          child: Divider(
            indent: 0,
            height: spacer1,
            endIndent: 0,
            thickness: 2,
            color: DigitTheme.instance.mobileTheme.colorScheme.outline,
          ),
        ),
      ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 5),
        child: Text(
          value,
          style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3.6),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            localizations.translate(
              label,
            ),
            textAlign: TextAlign.center,
            style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
          ),
        ),
      ),
    ],
  );
}

DashboardRequestModel getRequestModel({
  required String visualizationCode,
  required String visualizationType,
  required int startDate,
  required int endDate,
}) {
  return DashboardRequestModel(
    aggregationRequestDto: AggregationRequestDto(
        visualizationCode: visualizationCode,
        visualizationType: visualizationType,
        requestDate: RequestDate(
          startDate: startDate,
          endDate: endDate,
          interval: DSSEnums.day.toValue(),
          title: DSSEnums.home.toValue(),
        )),
    headers: DSSHeaders(
      tenantId: DashboardSingleton().tenantId,
    ),
  );
}

Future<void> processDashboardConfig(
  List<DashboardChartConfigSchema> dashboardConfig,
  int startDate,
  int endDate,
  Isar isar,
  DateTime lastSelectedDate,
  DashboardRemoteRepository dashboardRemoteRepo,
  String actionPath,
  String tenantId,
  String projectId,
  List<String> userList,
) async {
  if (dashboardConfig.isNotEmpty) {
    for (var entry in dashboardConfig) {
      String visualizationType = entry.chartType ?? '';
      String visualizationCode = entry.name ?? '';
      await dashboardRemoteRepo.searchAndWriteToDB(
        apiEndPoint: actionPath,
        lastSelectedDate: lastSelectedDate,
        query: DashboardRequestModel(
            aggregationRequestDto: AggregationRequestDto(
                visualizationType: visualizationType,
                visualizationCode: visualizationCode,
                filters: {
                  DSSEnums.uuid.toValue(): userList,
                  DSSEnums.projectId.toValue(): projectId
                },
                moduleLevel: "",
                queryType: "",
                requestDate: RequestDate(
                  startDate: startDate,
                  endDate: endDate,
                  interval: DSSEnums.day.toValue(),
                  title: DSSEnums.home.toValue(),
                )),
            headers: DSSHeaders(
              tenantId: tenantId,
            )).toMap(),
        projectId: projectId,
        isar: isar,
      );
    }
  }
}

String transformToLocaleCode(String input) {
  // Replace spaces with underscores and convert to uppercase
  return input.replaceAll(' ', '_').toUpperCase();
}

// create a singleton class for Dashboard package where set data and get data methods are defined

class DashboardSingleton {
  static final DashboardSingleton _singleton = DashboardSingleton._internal();

  factory DashboardSingleton() {
    return _singleton;
  }

  DashboardSingleton._internal();

  String? _tenantId;
  String? _projectId;
  String? _actionPath;
  String? _appVersion;
  ProjectModel? _selectedProject;
  DashboardConfigSchema? _dashboardConfig;

  void setInitialData({
    required String projectId,
    required String tenantId,
    required String actionPath,
    required String appVersion,
    required ProjectModel selectedProject,
    DashboardConfigSchema? dashboardConfig,
  }) {
    _projectId = projectId;
    _tenantId = tenantId;
    _actionPath = actionPath.trim().isNotEmpty
        ? actionPath
        : dashboardAPIPath; //[TODO: To be added to MDMS Service registry
    _appVersion = appVersion;
    _selectedProject = selectedProject;
    _dashboardConfig = dashboardConfig;
  }

  String get tenantId => _tenantId ?? '';

  String get projectId => _projectId ?? '';

  String get appVersion => _appVersion ?? '';

  String get actionPath =>
      _actionPath ??
      dashboardAPIPath; //[TODO: To be added to MDMS Service registry
  ProjectModel? get selectedProject => _selectedProject;

  DashboardConfigSchema? get dashboardConfig => _dashboardConfig;
}
