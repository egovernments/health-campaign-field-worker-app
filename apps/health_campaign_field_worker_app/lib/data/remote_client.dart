import "package:dio/dio.dart";

import '../utils/environment_config.dart';
import 'repositories/api_interceptors.dart';

class Client {
  Dio init() {
    final Dio dio = Dio()
      ..options = BaseOptions(
        connectTimeout: const Duration(minutes: 2).inMilliseconds,
        sendTimeout: const Duration(minutes: 2).inMilliseconds,
        receiveTimeout: const Duration(minutes: 2).inMilliseconds,
      )
      ..interceptors.add(ApiInterceptors())
      ..options.baseUrl = envConfig.variables.baseUrl;

    return dio;
  }
}
