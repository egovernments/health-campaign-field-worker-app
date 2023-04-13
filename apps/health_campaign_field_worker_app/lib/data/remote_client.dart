import "package:dio/dio.dart";

import '../utils/environment_config.dart';
import 'repositories/api_interceptors.dart';

class DioClient {
  late Dio _dio;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    init();
  }

  Dio get dio => _dio;

  void init() {
    _dio = Dio()
      ..interceptors.addAll([
        AuthTokenInterceptor(),
        if (envConfig.variables.envType == EnvType.dev) ApiLoggerInterceptor(),
      ])
      ..options = BaseOptions(
        connectTimeout: envConfig.variables.connectTimeout,
        sendTimeout: envConfig.variables.sendTimeout,
        receiveTimeout: envConfig.variables.receiveTimeout,
        baseUrl: envConfig.variables.baseUrl,
      );
  }
}
