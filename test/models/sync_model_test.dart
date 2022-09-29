
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaigns_flutter/models/delivery/delivery_model.dart';
import 'package:health_campaigns_flutter/models/registration/registration_model.dart';
import 'package:health_campaigns_flutter/models/sync/sync_model.dart';
import 'package:health_campaigns_flutter/data/repositories/fake_store/delivery.dart';
import 'package:health_campaigns_flutter/data/repositories/fake_store/registration.dart';

void main() {
  group('Sync Model', () {
    test('is generated for given registration and delivery models', () {
      final registrationList = FakeRegistrationStore.instance.getFakeDataList();
      final deliveryList = FakeDeliveryStore.instance.getFakeDataList();

      final syncRegistration = SyncObjectModel<RegistrationModel>(
        type: 'registration',
        items: registrationList,
      );

      final syncDelivery = SyncObjectModel<DeliveryModel>(
        type: 'registration',
        items: deliveryList,
      );

      final syncData = SyncDataModel(
        data: [syncDelivery, syncRegistration],
      );
      
      expect(syncData.data.length, 2);
    });
  });
}
