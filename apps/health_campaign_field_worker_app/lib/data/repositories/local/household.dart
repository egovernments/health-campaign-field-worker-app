import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../models/entities/household_address.dart';
import '../../../utils/environment_config.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class HouseholdLocalRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdModel>> search(HouseholdSearchModel query) async {
    final selectQuery = sql.select(sql.household).join(
      [
        leftOuterJoin(
          sql.householdAddress,
          sql.householdAddress.household.equalsExp(
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
                  sql.household.clientReferenceId
                      .isIn(query.clientReferenceId!),
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

    return results
        .map((e) {
          final household = e.readTable(sql.household);
          final address = e.readTableOrNull(sql.address);

          return HouseholdModel(
            id: household.id,
            tenantId: household.tenantId,
            clientReferenceId: household.clientReferenceId,
            memberCount: household.memberCount,
            rowVersion: household.rowVersion,
            isDeleted: household.isDeleted,
            address: address == null
                ? null
                : AddressModel(
                    tenantId: address.tenantId,
                    clientReferenceId: address.clientReferenceId,
                    doorNo: address.doorNo,
                    latitude: address.latitude,
                    longitude: address.longitude,
                    landmark: address.landmark,
                    locationAccuracy: address.locationAccuracy,
                    addressLine1: address.addressLine1,
                    addressLine2: address.addressLine2,
                    city: address.city,
                    pincode: address.pincode,
                    type: address.type,
                    rowVersion: address.rowVersion,
                  ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(HouseholdModel entity) async {
    final householdCompanion = entity.companion;
    final addressCompanion = entity.address?.companion;

    final householdAddressCompanion = HouseholdAddressModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      address: entity.address,
      household: entity,
    ).companion;

    await sql.batch((batch) async {
      batch.insert(
        sql.household,
        householdCompanion,
        mode: InsertMode.insertOrReplace,
      );

      if (addressCompanion != null) {
        batch.insert(
          sql.address,
          addressCompanion,
          mode: InsertMode.insertOrReplace,
        );
        batch.insert(
          sql.householdAddress,
          householdAddressCompanion,
          mode: InsertMode.insertOrReplace,
        );
      }
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(HouseholdModel entity) async {
    final householdCompanion = entity.companion;
    final addressCompanion = entity.address?.companion;

    await sql.batch((batch) async {
      batch.update(
        sql.household,
        householdCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );

      if (addressCompanion != null) {
        batch.update(
          sql.address,
          addressCompanion,
          where: (table) => table.clientReferenceId.equals(
            addressCompanion.clientReferenceId.value,
          ),
        );
      }
    });

    await super.update(entity);
  }

  @override
  FutureOr<void> delete(HouseholdModel entity) async {
    final updated = entity.copyWith(
      isDeleted: true,
      rowVersion: entity.rowVersion + 1,
    );
    await sql.batch((batch) {
      batch.update(
        sql.household,
        updated.companion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.delete(updated);
  }

  @override
  DataModelType get type => DataModelType.household;
}
