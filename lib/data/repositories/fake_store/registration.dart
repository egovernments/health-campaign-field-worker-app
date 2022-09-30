import 'dart:math';

import 'package:faker/faker.dart';
import 'package:health_campaigns_flutter/models/address/address_model.dart';
import 'package:health_campaigns_flutter/models/individual/individual_model.dart';
import 'package:health_campaigns_flutter/data/repositories/fake_store/fake_store.dart';
import 'package:health_campaigns_flutter/models/registration/registration_model.dart';
import 'package:health_campaigns_flutter/models/sync/sync_model.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class FakeRegistrationStore extends FakeDataStore<HouseholdRegistrationModel> {
  static FakeRegistrationStore get instance => _instance;
  static final FakeRegistrationStore _instance = FakeRegistrationStore._();

  FakeRegistrationStore._();

  @override
  HouseholdRegistrationModel get fake {
    final faker = Faker();

    return HouseholdRegistrationModel(
      apiMode: ApiMode.create,
      type: SyncObjectModelType.registration,
      campaignId: 'ID-1',
      tenantId: 'TenantA',
      clientReferenceId: const Uuid().v1(),
      numberOfIndividuals: Random().nextInt(12),
      address: AddressModel(
        addressId: const Uuid().v1(),
        addressText: [
          faker.address.streetAddress(),
        ].join(''),
      ),
      dateOfRegistration: faker.date.dateTime().millisecondsSinceEpoch,
      administrativeUnit: faker.address.city(),
      individuals: [
        IndividualModel(
          name: [
            faker.person.firstName(),
            faker.person.lastName(),
          ].join(' '),
          dateOfBirth: DateFormat('yyyyMMdd').format(faker.date.dateTime(
            maxYear: 2022,
            minYear: 1940,
          )),
          gender: Gender.values.elementAt(
            Random().nextInt(Gender.values.length),
          ),
          identifiers: [
            IndividualIdentifierModel(
              type: IndividualIdentifierType.values.elementAt(
                Random().nextInt(IndividualIdentifierType.values.length),
              ),
              identifierId: const Uuid().v1(),
            ),
          ],
        ),
      ],
    );
  }
}
