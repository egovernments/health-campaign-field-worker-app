import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaigns_frontline_worker/data/repositories/fake_store/delivery.dart';
import 'package:health_campaigns_frontline_worker/data/repositories/fake_store/registration.dart';

void main() {
  test('Fake data generated for registration', () {
    final data = FakeRegistrationStore.instance.getFakeDataList(80);
    expect(data.length, 80);
  });

  test('Fake data generated for deliveryModel', () {
    final data = FakeDeliveryStore.instance.getFakeDataList(80);
    expect(data.length, 80);
  });
}
