// ignore_for_file: depend_on_referenced_packages

import 'package:digit_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('body: ${options.data}');
    AppLogger.instance.info(options.uri);
    super.onRequest(options, handler);
  }
}
