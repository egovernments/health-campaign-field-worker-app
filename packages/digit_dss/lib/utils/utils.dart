import 'dart:io';

import 'package:digit_components/digit_components.dart';
import 'package:digit_dss/blocs/app_localization.dart';
import 'package:flutter/material.dart';

class TotalDetails {
  num noOfHousesVisited;
  num noOfHousesSprayed;
  num noOfHousesNotSprayed;
  num bottlesUsed;
  num noOfRemainingBottles;
  TotalDetails({
    this.noOfHousesVisited = 0,
    this.noOfHousesSprayed = 0,
    this.noOfHousesNotSprayed = 0,
    this.bottlesUsed = 0,
    this.noOfRemainingBottles = 0,
  });
}

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
            height: kPadding,
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

  void setInitialData({
    required String projectId,
    required String tenantId,
    required String actionPath,
    required String appVersion,
  }) {
    _projectId = projectId;
    _tenantId = tenantId;
    _actionPath = actionPath.trim().isNotEmpty
        ? actionPath
        : 'dashboard-analytics/dashboard/getChartV2';
    _appVersion = appVersion;
  }

  String get tenantId => _tenantId ?? '';
  String get projectId => _projectId ?? '';
  String get appVersion => _appVersion ?? '';
  String get actionPath =>
      _actionPath ?? 'dashboard-analytics/dashboard/getChartV2';
}
