import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../models/data_model.dart';
import 'dart:async';

import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

class HouseholdLocalRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdModel>> search(HouseholdSearchModel query) async {
    final selectQuery = sql.select(sql.household).join(
      [
        leftOuterJoin(
          sql.householdAddress,
          sql.householdAddress.address.equalsExp(
            sql.household.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.address,
          sql.address.clientReferenceId.equalsExp(
            sql.householdAddress.address,
          ),
        ),
      ],
    );
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.clientReferenceId != null)
                  sql.household.clientReferenceId.equals(
                    query.clientReferenceId,
                  ),
                if (query.id != null)
                  sql.household.id.equals(
                    query.id,
                  ),
                if (query.tenantId != null)
                  sql.household.tenantId.equals(
                    query.tenantId,
                  ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final household = e.readTable(sql.household);
      final address = e.readTable(sql.address);

      return HouseholdModel(
        id: household.id,
        tenantId: household.tenantId,
        clientReferenceId: household.clientReferenceId,
        memberCount: household.memberCount,
        rowVersion: household.rowVersion,
        address: AddressModel(
          tenantId: address.tenantId,
          clientReferenceId: address.clientReferenceId,
          doorNo: address.doorNo,
          latitude: address.latitude,
          longitude: address.longitude,
          locationAccuracy: address.locationAccuracy,
          addressLine1: address.addressLine1,
          addressLine2: address.addressLine2,
          city: address.city,
          pincode: address.pincode,
          locality: BoundaryModel(
            clientReferenceId: '',
            code: '',
            name: '',
          ),
          type: address.type,
        ),
      );
    }).toList();
  }

  @override
  FutureOr<void> create(HouseholdModel entity) async {
    final addressValue = entity.address;

    final householdCompanion = _getHouseholdCompanion(entity);
    final addressCompanion = _getAddressCompanion(addressValue);

    await sql.batch((batch) async {
      batch.insert(sql.household, householdCompanion);
      batch.insert(sql.address, addressCompanion);

      batch.insert(
        sql.householdAddress,
        HouseholdAddressCompanion.insert(
          clientReferenceId: const Uuid().v1(),
          household: entity.clientReferenceId,
          address: addressValue.clientReferenceId,
        ),
      );
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(HouseholdModel entity) async {
    final addressValue = entity.address;

    final householdCompanion = _getHouseholdCompanion(entity);
    final addressCompanion = _getAddressCompanion(addressValue);

    await sql.batch((batch) async {
      batch.update(
        sql.household,
        householdCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );

      batch.update(
        sql.address,
        addressCompanion,
        where: (table) => table.clientReferenceId.equals(
          addressValue.clientReferenceId,
        ),
      );
    });

    await super.update(entity);
  }

  @override
  DataModelType get type => DataModelType.household;

  HouseholdCompanion _getHouseholdCompanion(HouseholdModel entity) {
    return HouseholdCompanion.insert(
      tenantId: entity.tenantId,
      clientReferenceId: entity.clientReferenceId,
      memberCount: entity.memberCount,
      rowVersion: entity.rowVersion,
      id: Value(entity.id),
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
}
