import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/delivery/delivery_model.dart';
import 'package:health_campaign_field_worker_app/models/registration/registration_model.dart';
import 'package:health_campaign_field_worker_app/models/sync/sync_model.dart';
import 'package:health_campaign_field_worker_app/data/repositories/fake_store/delivery.dart';
import 'package:health_campaign_field_worker_app/data/repositories/fake_store/registration.dart';

void main() {
  group('Sync Model', () {
    test('is generated for given registration and delivery models', () {
      final registrationList = FakeRegistrationStore.instance.getFakeDataList();
      final deliveryList = FakeDeliveryStore.instance.getFakeDataList();

      final syncRegistration = SyncObjectModel<CampaignRegistrationModel>(
        items: registrationList,
      );

      final syncDelivery = SyncObjectModel<DeliveryModel>(items: deliveryList);

      final syncData = SyncDataModel(
        syncUpData: [syncDelivery, syncRegistration],
      );
      final json = syncData.toJson();

      List<CampaignRegistrationModel> parsedRegistration =
          <CampaignRegistrationModel>[];
      List<DeliveryModel> parsedDelivery = <DeliveryModel>[];

      final parsedData = SyncDataModel.fromJson(json);
      for (final syncData in parsedData.syncUpData) {
        for (final item in syncData.items) {
          // ignore: avoid_dynamic_calls
          switch (item.type) {
            case SyncObjectModelType.registration:
              parsedRegistration.add(item);
              break;
            case SyncObjectModelType.delivery:
              parsedDelivery.add(item);
              break;
          }
        }
      }
      expect(parsedRegistration, registrationList);
    });
  });
}
