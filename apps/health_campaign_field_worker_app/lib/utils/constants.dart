import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_initialization/app_initialization.dart';

class Constants {
  static const String baseURL = 'https://health-dev.digit.org/';
  static const String mdmsApiPath = 'egov-mdms-service/v1/_search';
  static getEndPoint(BuildContext context, service, String action) {
    final actionResult = context
        .read<AppInitializationBloc>()
        .state
        .localizationList
        .firstWhereOrNull((element) => element.service == service)
        ?.actions
        ?.first;

    switch (action) {
      case 'CREATE':
        return actionResult?.create;
      case 'SEARCH':
        return actionResult?.search;
      case 'UPDATE':
        return actionResult?.update;
      case 'LOGIN':
        return actionResult?.login;
    }
  }
}

/// By using this key, we can push pages without context
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
