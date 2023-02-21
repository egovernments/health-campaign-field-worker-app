import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../blocs/app_initialization/app_initialization.dart';

class Constants {
  static const String localizationApiPath = 'localization/messages/v1/_search';

  static String getEndPoint({
    required AppInitialized state,
    required String service,
    required String action,
    required String entityName,
  }) {
    final actionResult = state.serviceRegistryList
        .firstWhereOrNull((element) => element.service == service)
        ?.actions
        .firstWhereOrNull((element) => element.entityName == entityName)
        ?.path;

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

class EntityPlurals {
  static String getPluralForEntityName(String entity) {
    switch (entity) {
      case 'Beneficiary':
        return 'Beneficiaries';
      case 'ProjectBeneficiary':
        return 'ProjectBeneficiaries';
      case 'Address':
        return 'Addresses';
      case 'Facility':
        return 'Facilities';
      case 'ProjectFacility':
        return 'ProjectFacilities';
      case 'Project':
        return 'Projects';
      default:
        return '${entity}s';
    }
  }
}
