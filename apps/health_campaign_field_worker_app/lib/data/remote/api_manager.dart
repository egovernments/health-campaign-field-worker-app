
import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;

DioClient(this._dio) {
  _dio
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout
    ..options.responseType = ResponseType.json
  }

}
