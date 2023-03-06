import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class FacilityLocalRepository
    extends LocalRepository<FacilityModel, FacilitySearchModel> {
  FacilityLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<FacilityModel>> search(FacilitySearchModel query) async {
    final selectQuery = sql.select(sql.facility).join(
      [
        leftOuterJoin(
          sql.address,
          sql.address.relatedClientReferenceId.equalsExp(sql.facility.id),
        ),
      ],
    );

    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.id != null) sql.facility.id.isIn(query.id!),
                if (query.isPermanent != null)
                  sql.facility.isPermanent.equals(
                    query.isPermanent!,
                  ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final facility = e.readTable(sql.facility);
      final address = e.readTableOrNull(sql.address);

      return FacilityModel(
        id: facility.id,
        rowVersion: facility.rowVersion,
        tenantId: facility.tenantId,
        isDeleted: facility.isDeleted,
        isPermanent: facility.isPermanent,
        storageCapacity: facility.storageCapacity,
        usage: facility.usage,
        address: address == null
            ? null
            : AddressModel(
                id: address.id,
                relatedClientReferenceId: facility.id,
                tenantId: address.tenantId,
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
    }).toList();
  }

  @override
  FutureOr<void> create(
    FacilityModel entity, {
    bool createOpLog = false,
  }) async {
    final facilityCompanion = entity.companion;
    final addressCompanion = entity.address?.companion;

    await sql.batch((batch) async {
      batch.insert(
        sql.facility,
        facilityCompanion,
        mode: InsertMode.insertOrReplace,
      );

      if (addressCompanion != null) {
        batch.insert(
          sql.address,
          addressCompanion,
          mode: InsertMode.insertOrReplace,
        );
      }
    });

    await super.create(
      entity,
      createOpLog: createOpLog,
    );
  }

  @override
  DataModelType get type => DataModelType.facility;
}
