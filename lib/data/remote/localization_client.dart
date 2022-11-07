import 'package:dio/dio.dart';
import 'package:health_campaigns_flutter/models/localization/localization_model.dart';
import 'package:health_campaigns_flutter/utils/env.dart';
import 'package:retrofit/retrofit.dart';

part 'localization_client.g.dart';

@RestApi(
  baseUrl: '${EvnironmentVariables.baseUrl}localization/messages/v1',
)
abstract class LocalizationClient {
  factory LocalizationClient(Dio dio, {String baseUrl}) = _LocalizationClient;

  @POST('/_search?')
  Future<LocalizationModel?> search(
    @Query("module") String module,
    @Query("locale") String locale,
    @Query("tenantId") String tenantId,
  );
}
