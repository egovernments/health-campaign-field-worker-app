// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:health_campaigns_flutter/models/localization/localization_model.dart';
import 'package:retrofit/retrofit.dart';

part 'localization_client.g.dart';

@RestApi(
  baseUrl: 'https://health-dev.digit.org/localization/messages/v1',
)
abstract class LocalizationClient {
  factory LocalizationClient(Dio dio, {String baseUrl}) = _LocalizationClient;

  @POST('/_search')
  Future<LocalizationModel> search(
    @Query("module") String module,
    @Query("local") String local,
    @Query("tenantId") String tenantId,
  );
}
