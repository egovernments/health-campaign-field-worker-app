import 'dart:math';

import 'package:faker/faker.dart';
import 'package:health_campaigns_flutter/models/delivery/delivery_model.dart';
import 'package:health_campaigns_flutter/repositories/fake_store/fake_store.dart';
import 'package:uuid/uuid.dart';


class FakeDeliveryStore extends FakeDataStore<DeliveryModel> {
  static FakeDeliveryStore get instance => _instance;
  static final FakeDeliveryStore _instance = FakeDeliveryStore._();

  FakeDeliveryStore._();

  @override
  DeliveryModel get fake {
    final faker = Faker();

    return DeliveryModel(
      campaignId: 'ID-1',
      registrationId: const Uuid().v1(),
      clientReferenceId: const Uuid().v1(),
      resources: [],
      deliveryDate: faker.date
          .dateTime(minYear: 2020, maxYear: 2022)
          .millisecondsSinceEpoch,
      deliveredBy: const Uuid().v1(),
      status: DeliveryStatus.values
          .elementAt(Random().nextInt(DeliveryStatus.values.length)),
      tenantId: 'TenantA',
    );
  }
}
