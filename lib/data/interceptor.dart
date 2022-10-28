// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('body: ${options.data}');
    super.onRequest(options, handler);
  }
}
