import "package:dio/dio.dart";

import '../utils/environment_config.dart';
import 'repositories/api_interceptors.dart';

class DioClient {
  Dio init() {
    final Dio dio = Dio()
      ..options = BaseOptions(
        connectTimeout: envConfig.variables.connectTimeout,
        sendTimeout: envConfig.variables.sendTimeout,
        receiveTimeout: envConfig.variables.receiveTimeout,
      )
      ..interceptors.add(ApiInterceptors())
      ..options.baseUrl = envConfig.variables.baseUrl;

    return dio;
  }
}
