import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../models/request_info/request_info_model.dart';
import '../../utils/constants.dart';
import '../local_store/secure_store/secure_store.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = await storage.read(key: 'access_token');
    print('=====>>>>> Auth token is $authToken');
    if (options.data is Map) {
      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId,
          ver: RequestInfoData.ver,
          ts: RequestInfoData.ts,
          action: options.path.split('/').last,
          did: RequestInfoData.did,
          key: RequestInfoData.key,
          authToken: RequestInfoData.authToken,
        ).toJson(),
      };
    } else if (options.data is String) {
      if (json.decode(options.data) is Map) {
        options.data = jsonEncode({
          ...json.decode(options.data),
          "RequestInfo": RequestInfoModel(
            apiId: RequestInfoData.apiId,
            ver: RequestInfoData.ver,
            ts: RequestInfoData.ts,
            action: options.path.split('/').last,
            did: RequestInfoData.did,
            key: RequestInfoData.key,
            authToken: authToken,
          ).toJson(),
        });
      }
    }

    print("+==========");

    print(options.data);
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print('CustomInterceptor Response');
  //   print(response);
  //   super.onResponse(response, handler);
  // }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // ignore: no-empty-block
    if (err.type == DioErrorType.response && err.response?.statusCode == 401) {
    } else {
      handler.next(err);
    }
  }

  @override
  Future<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    print('========== ${response}');
    return handler.next(response);
  }
}
