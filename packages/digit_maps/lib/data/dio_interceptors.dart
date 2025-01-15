import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(options.uri.toString());
    super.onRequest(options, handler);
  }
}