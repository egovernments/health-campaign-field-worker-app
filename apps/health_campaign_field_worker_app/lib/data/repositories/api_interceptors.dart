import 'package:dio/dio.dart';

import '../../models/request_info/request_info_model.dart';
import '../../utils/constants.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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

    super.onRequest(options, handler);
  }
}
