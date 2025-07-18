import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/household.dart';

class HouseholdLocalRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdModel>> search(
    HouseholdSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<HouseholdModel>>(() async {
      final selectQuery = sql.select(sql.household).join(
        [
          leftOuterJoin(
            sql.address,
            sql.address.relatedClientReferenceId.equalsExp(
              sql.household.clientReferenceId,
            ),
          ),
        ],
      );

      (selectQuery
        ..where(
          buildAnd(
            [
              if (query.clientReferenceId != null)
                sql.household.clientReferenceId.isIn(query.clientReferenceId!),
              if (query.id != null)
                sql.household.id.isIn(
                  query.id!,
                ),
              if (query.tenantId != null)
                sql.household.tenantId.equals(
                  query.tenantId!,
                ),
              if (userId != null)
                sql.household.auditCreatedBy.equals(
                  userId,
                ),
              if (query.latitude != null &&
                  query.longitude != null &&
                  query.maxRadius != null &&
                  query.isProximityEnabled == true)
                CustomExpression<bool>('''
        (6371393 * acos(
            cos(${query.latitude! * math.pi / 180.0}) * cos((address.latitude * ${math.pi / 180.0}))
            * cos((address.longitude * ${math.pi / 180.0}) - ${query.longitude! * math.pi / 180.0})
            + sin(${query.latitude! * math.pi / 180.0}) * sin((address.latitude * ${math.pi / 180.0}))
        )) <= ${query.maxRadius!}
    '''),
            ],
          ),
        ));

      final results = await selectQuery.get();

      return results
          .map((e) {
            final household = e.readTable(sql.household);
            final address = e.readTableOrNull(sql.address);

            return HouseholdModel(
              id: household.id,
              householdType: household.householdType,
              tenantId: household.tenantId,
              clientReferenceId: household.clientReferenceId,
              memberCount: household.memberCount,
              rowVersion: household.rowVersion,
              isDeleted: household.isDeleted,
              additionalFields: household.additionalFields != null &&
                      household.additionalFields.toString().isNotEmpty
                  ? HouseholdAdditionalFieldsMapper.fromJson(
                      household.additionalFields.toString())
                  : null,
              auditDetails: (household.auditCreatedBy != null &&
                      household.auditCreatedTime != null)
                  ? AuditDetails(
                      createdBy: household.auditCreatedBy!,
                      createdTime: household.auditCreatedTime!,
                      lastModifiedBy: household.auditModifiedBy,
                      lastModifiedTime: household.auditModifiedTime,
                    )
                  : null,
              clientAuditDetails: (household.clientCreatedBy != null &&
                      household.clientCreatedTime != null)
                  ? ClientAuditDetails(
                      createdBy: household.clientCreatedBy!,
                      createdTime: household.clientCreatedTime!,
                      lastModifiedBy: household.clientModifiedBy,
                      lastModifiedTime: household.clientModifiedTime,
                    )
                  : null,
              address: address == null
                  ? null
                  : AddressModel(
                      id: address.id,
                      buildingName: address.buildingName,
                      relatedClientReferenceId: household.clientReferenceId,
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
                      locality: address.localityBoundaryCode != null
                          ? LocalityModel(
                              code: address.localityBoundaryCode!,
                              name: address.localityBoundaryName,
                            )
                          : null,
                      type: address.type,
                      rowVersion: address.rowVersion,
                      auditDetails: (household.auditCreatedBy != null &&
                              household.auditCreatedBy != null)
                          ? AuditDetails(
                              createdBy: household.auditCreatedBy!,
                              createdTime: household.auditCreatedTime!,
                              lastModifiedBy: household.auditModifiedBy,
                              lastModifiedTime: household.auditModifiedTime,
                            )
                          : null,
                      clientAuditDetails: (household.clientCreatedBy != null &&
                              household.clientCreatedTime != null)
                          ? ClientAuditDetails(
                              createdBy: household.clientCreatedBy!,
                              createdTime: household.clientCreatedTime!,
                              lastModifiedBy: household.clientModifiedBy,
                              lastModifiedTime: household.clientModifiedTime,
                            )
                          : null,
                    ),
            );
          })
          .where((element) => element.isDeleted != true)
          .toList();
    });
  }

  @override
  FutureOr<void> create(
    HouseholdModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    retryLocalCallOperation(() async {
      final householdCompanion = entity.companion;
      final localityCompanion = entity.address?.locality?.companion;
      final addressCompanion = entity.address?.companion;

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
        }
        if (localityCompanion != null) {
          batch.insert(
            sql.locality,
            localityCompanion,
            mode: InsertMode.insertOrReplace,
          );
        }
      });

      await super.create(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HouseholdModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final householdCompanions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        final addressCompanions = entities.map((e) {
          if (e.address != null) {
            return e.address!
                .copyWith(
                  relatedClientReferenceId: e.clientReferenceId,
                  clientAuditDetails: e.clientAuditDetails,
                  auditDetails: e.auditDetails,
                )
                .companion;
          }
        }).toList();

        if (addressCompanions.isNotEmpty) {
          batch.insertAll(
            sql.address,
            addressCompanions.whereNotNull().toList(),
            mode: InsertMode.insertOrReplace,
          );
        }

        batch.insertAll(
          sql.household,
          householdCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    HouseholdModel entity, {
    bool createOpLog = true,
        DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      final householdCompanion = entity.companion;
      final addressCompanion = entity.address
          ?.copyWith(
            relatedClientReferenceId: entity.clientReferenceId,
            auditDetails: entity.auditDetails,
            clientAuditDetails: entity.clientAuditDetails,
          )
          .companion;

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
            where: (table) => table.relatedClientReferenceId.equals(
              addressCompanion.relatedClientReferenceId.value!,
            ),
          );
        }
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> delete(
    HouseholdModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final updated = entity.copyWith(
        isDeleted: true,
        clientAuditDetails: (entity.clientAuditDetails?.createdBy != null &&
                entity.clientAuditDetails?.createdTime != null)
            ? ClientAuditDetails(
                createdBy: entity.clientAuditDetails!.createdBy,
                createdTime: entity.clientAuditDetails!.createdTime,
                lastModifiedBy: entity.clientAuditDetails!.lastModifiedBy,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
              )
            : null,
        rowVersion: entity.rowVersion,
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
    });
  }

  @override
  DataModelType get type => DataModelType.household;
}
