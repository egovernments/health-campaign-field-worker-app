import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_initialization/app_initialization.dart';

class Constants {
  static const String mdmsApiPath = 'egov-mdms-service/v1/_search';
  static const String localizationApiPath = 'localization/messages/v1/_search';

  static String getEndPoint(
    BuildContext context,
    service,
    String action,
    String entityName,
  ) {
    final actionResult = context
        .read<AppInitializationBloc>()
        .state
        .serviceRegistryList
        .firstWhereOrNull((element) => element.service == service)
        ?.actions
        .firstWhere((element) => element.entityName == entityName)
        .path;

    return actionResult ?? '';
  }
}

/// By using this key, we can push pages without context
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class RequestInfoData {
  static const String apiId = 'hcm';
  static const String ver = '.01';
  static String ts = DateTime.now().millisecondsSinceEpoch.toString();
  static const did = "1";
  static const key = "";
  static String? authToken;
}

class Modules {
  static const String localizationModule = "LOCALIZATION_MODULE";
}
