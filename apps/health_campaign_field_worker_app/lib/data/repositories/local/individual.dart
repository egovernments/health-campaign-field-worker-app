import 'dart:async';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

class IndividualRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  IndividualRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(IndividualModel entity) async {
    final nameValue = entity.name;
    final addressValue = entity.address;
    final identifiers = entity.identifiers;

    final nameCompanion = _getNameCompanion(nameValue);
    final addressCompanions = addressValue.map((e) {
      return _getAddressCompanion(e);
    }).toList();

    final identifiersCompanion = identifiers.map((e) {
      return _getIdentifierCompanion(e);
    }).toList();

    final individualCompanion = _getIndividualCompanion(entity);

    await sql.batch((batch) async {
      batch.insert(sql.name, nameCompanion);
      batch.insert(sql.individual, individualCompanion);
      batch.insertAll(sql.address, addressCompanions);
      batch.insertAll(sql.identifier, identifiersCompanion);

      batch.insert(
        sql.individualName,
        IndividualNameCompanion.insert(
          clientReferenceId: const Uuid().v1(),
          individual: individualCompanion.clientReferenceId.value,
          name: nameCompanion.clientReferenceId.value,
        ),
      );

      batch.insertAll(
        sql.individualAddress,
        addressCompanions.map(
          (e) => IndividualAddressCompanion.insert(
            clientReferenceId: const Uuid().v1(),
            individual: individualCompanion.clientReferenceId.value,
            address: e.clientReferenceId.value,
          ),
        ),
      );

      batch.insertAll(
        sql.individualIdentifier,
        identifiersCompanion.map(
          (e) => IndividualIdentifierCompanion.insert(
            clientReferenceId: const Uuid().v1(),
            individual: individualCompanion.clientReferenceId.value,
            identifier: e.clientReferenceId.value,
          ),
        ),
      );
    });
  }

  @override
  FutureOr<void> deleteOplogEntry(OpLogEntry<IndividualModel> entry) {
    // TODO: implement deleteOplogEntry
    throw UnimplementedError();
  }

  @override
  FutureOr<List<IndividualModel>> search(IndividualSearchModel query) async {
    return [];
  }

  @override
  FutureOr<int> update(IndividualModel entity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  NameCompanion _getNameCompanion(NameModel nameValue) {
    return NameCompanion.insert(
      givenName: nameValue.givenName,
      familyName: nameValue.familyName,
      otherNames: Value(nameValue.otherNames),
      clientReferenceId: nameValue.clientReferenceId,
    );
  }

  AddressCompanion _getAddressCompanion(AddressModel e) {
    return AddressCompanion.insert(
      tenantId: e.tenantId,
      clientReferenceId: e.clientReferenceId,
      doorNo: e.doorNo,
      latitude: e.latitude,
      longitude: e.longitude,
      locationAccuracy: e.locationAccuracy,
      addressLine1: e.addressLine1,
      addressLine2: e.addressLine2,
      city: e.city,
      pincode: e.pincode,
      type: e.type,
      locality: e.locality.clientReferenceId,
      id: Value(e.id),
      buildingName: Value(e.buildingName),
      landmark: Value(e.landmark),
      street: Value(e.street),
    );
  }

  IdentifierCompanion _getIdentifierCompanion(IdentifierModel e) {
    return IdentifierCompanion.insert(
      type: e.type,
      clientReferenceId: e.clientReferenceId,
      id: e.id,
    );
  }

  IndividualCompanion _getIndividualCompanion(IndividualModel entity) {
    return IndividualCompanion.insert(
      tenantId: entity.tenantId,
      clientReferenceId: entity.clientReferenceId,
      dateOfBirth: entity.dateOfBirth,
      mobileNumber: entity.mobileNumber,
      rowVersion: entity.rowVersion,
      bloodGroup: entity.bloodGroup,
      gender: entity.gender,
      altContactNumber: Value(entity.altContactNumber),
      email: Value(entity.email),
      fatherName: Value(entity.fatherName),
      husbandName: Value(entity.husbandName),
      photo: Value(entity.photo),
      id: Value(entity.id),
      userId: Value(entity.userId),
    );
  }
}
