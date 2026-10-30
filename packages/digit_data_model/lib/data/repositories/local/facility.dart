import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class FacilityLocalRepository
    extends LocalRepository<FacilityModel, FacilitySearchModel> {
  FacilityLocalRepository(super.sql, super.opLogManager);

  /// Address rows are linked to a facility by its app-side key: the
  /// clientReferenceId when the facility has one (every outside-household
  /// site does), otherwise the server id.
  static String addressKeyOf(FacilityModel entity) =>
      entity.clientReferenceId ?? entity.id;

  @override
  FutureOr<List<FacilityModel>> search(
    FacilitySearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<FacilityModel>>(() async {
      final addressKey = coalesce<String>([
        sql.facility.clientReferenceId,
        sql.facility.id,
      ]);

      final selectQuery = sql.select(sql.facility).join(
        [
          leftOuterJoin(
            sql.address,
            sql.address.relatedClientReferenceId.equalsExp(addressKey),
          ),
        ],
      );

      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.id != null)
                    sql.facility.id.isIn(query.id!)
                  else
                    const Constant(true),
                  if (query.clientReferenceId != null)
                    sql.facility.clientReferenceId
                        .isIn(query.clientReferenceId!),
                  if (query.isPermanent != null)
                    sql.facility.isPermanent.equals(
                      query.isPermanent!,
                    ),
                  // Site type (TRANSIT_POST / OUTSIDE_HOUSEHOLD_PLACES) or
                  // any other facility type.
                  if (query.usage != null)
                    sql.facility.usage.equals(query.usage!),
                  // Boundary lives on the address row.
                  if (query.boundaryCode != null)
                    sql.address.localityBoundaryCode
                        .equals(query.boundaryCode!),
                ],
              ),
            ))
          .get();

      return results.map((e) {
        final facility = e.readTable(sql.facility);
        final address = e.readTableOrNull(sql.address);

        return FacilityModel(
          id: facility.id,
          clientReferenceId: facility.clientReferenceId,
          rowVersion: facility.rowVersion,
          tenantId: facility.tenantId,
          isDeleted: facility.isDeleted,
          isPermanent: facility.isPermanent,
          storageCapacity: facility.storageCapacity,
          usage: facility.usage,
          name: facility.name,
          nonRecoverableError: facility.nonRecoverableError,
          additionalFields: facility.additionalFields != null
              ? FacilityAdditionalFieldsMapper.fromJson(
                  facility.additionalFields!)
              : null,
          address: address == null
              ? null
              : AddressModel(
                  id: address.id,
                  relatedClientReferenceId:
                      facility.clientReferenceId ?? facility.id,
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
                  locality: address.localityBoundaryCode == null
                      ? null
                      : LocalityModel(
                          code: address.localityBoundaryCode!,
                          name: address.localityBoundaryName,
                        ),
                ),
        );
      }).toList();
    });
  }

  /// Writes the facility and, when present, its address and locality.
  ///
  /// Sites created on the phone must reach the server, so an oplog entry is
  /// written by default. Downloads go through [bulkCreate], which never
  /// writes one.
  @override
  FutureOr<void> create(
    FacilityModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final facilityCompanion = entity.companion;
      final addressCompanion = _addressCompanionOf(entity);
      final localityCompanion = entity.address?.locality?.companion;

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
        if (localityCompanion != null) {
          batch.insert(
            sql.locality,
            localityCompanion,
            mode: InsertMode.insertOrReplace,
          );
        }
      });

      await super.create(
        entity,
        createOpLog: createOpLog,
      );
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<FacilityModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final facilityCompanions = entities.map((e) => e.companion).toList();
      final addressCompanions =
          entities.map(_addressCompanionOf).whereType<AddressCompanion>();
      final localityCompanions = entities
          .map((e) => e.address?.locality?.companion)
          .whereType<LocalityCompanion>();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.facility,
          facilityCompanions,
          mode: InsertMode.insertOrReplace,
        );
        if (addressCompanions.isNotEmpty) {
          batch.insertAll(
            sql.address,
            addressCompanions.toList(),
            mode: InsertMode.insertOrReplace,
          );
        }
        if (localityCompanions.isNotEmpty) {
          batch.insertAll(
            sql.locality,
            localityCompanions.toList(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  /// Replaces the placeholder [FacilityModel.id] (the clientReferenceId) of
  /// a site created on the phone with the id the server assigned, and points
  /// any queued project-facility link at the new id so the link can be
  /// uploaded next.
  Future<void> applyServerGeneratedId({
    required String clientReferenceId,
    required String serverGeneratedId,
    int? rowVersion,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.transaction(() async {
        await (sql.update(sql.facility)
              ..where((t) => t.clientReferenceId.equals(clientReferenceId)))
            .write(FacilityCompanion(
          id: Value(serverGeneratedId),
          rowVersion: Value(rowVersion),
        ));
        await (sql.update(sql.projectFacility)
              ..where((t) => t.facilityId.equals(clientReferenceId)))
            .write(ProjectFacilityCompanion(
          facilityId: Value(serverGeneratedId),
        ));
      });
    });
  }

  AddressCompanion? _addressCompanionOf(FacilityModel entity) {
    final address = entity.address;
    if (address == null) return null;
    return address
        .copyWith(
          relatedClientReferenceId: addressKeyOf(entity),
          auditDetails: address.auditDetails ?? entity.auditDetails,
          clientAuditDetails:
              address.clientAuditDetails ?? entity.clientAuditDetails,
        )
        .companion;
  }

  @override
  DataModelType get type => DataModelType.facility;
}
