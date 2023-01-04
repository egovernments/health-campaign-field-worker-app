import 'package:flutter/material.dart';

class Constants {
  static const String baseURL = 'https://health-dev.digit.org/';
  static const String mdmsApiEndPoint = 'egov-mdms-service/v1/_search';
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
