import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class HouseholdLocalRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  HouseholdLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HouseholdModel>> search(
    HouseholdSearchModel query, [
    String? userId,
  ]) async {
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
              sql.household.id.equals(
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
            tenantId: household.tenantId,
            clientReferenceId: household.clientReferenceId,
            memberCount: household.memberCount,
            rowVersion: household.rowVersion,
            isDeleted: household.isDeleted,
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
            additionalFields: household.additionalFields == null
                ? null
                : HouseholdAdditionalFieldsMapper.fromJson(
                    household.additionalFields!,
                  ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    HouseholdModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
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
  }

  @override
  FutureOr<void> bulkCreate(
    List<HouseholdModel> entities,
  ) async {
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
  }

  @override
  FutureOr<void> update(
    HouseholdModel entity, {
    bool createOpLog = true,
  }) async {
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
  }

  @override
  FutureOr<void> delete(
    HouseholdModel entity, {
    bool createOpLog = true,
  }) async {
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
  }

  @override
  DataModelType get type => DataModelType.household;

  appendCustomQuery(
    JoinedSelectStatement<HasResultSet, dynamic> selectQuery,
  ) async {
    // Construct the SQL query string
    var query =
        selectQuery.constructQuery().buffer.toString().replaceAll(';', '');
    var variables = selectQuery.constructQuery().introducedVariables;
    var indexesLength = selectQuery.constructQuery().variableIndices;

    try {
      // Custom query to filter based on additional_fields
      return await sql
          .customSelect(
            'SELECT * FROM ($query), json_each(household.additional_fields) WHERE json_valid(household.additional_fields) = 1 AND json_each.value->>"key" = "schoolName" AND json_each.value->>"value" = "SchoolA"; ',
          )
          .get();
    } catch (e) {
      debugPrint('Error executing custom query: $e');
    }
  }
}

class CustomHouseHoldRepo extends LocalRepository {
  CustomHouseHoldRepo(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  // TODO: implement type
  DataModelType get type => throw UnimplementedError();

  Future<List<HouseholdModel>> customSchoolSearch(
    String schoolName,
    String boundaryCode,
  ) async {
    var selectQuery = sql.customSelect(
      r"SELECT * FROM household, json_each(household.additional_fields, '$.fields') "
      "WHERE json_valid(additional_fields) = 1 "
      "AND json_each.value->>'key' = 'schoolName' "
      "AND json_each.value->>'value' = ?;", // Use parameterized query
      variables: [
        Variable.withString(schoolName),
      ], // Pass the school name as a variable
    );
    final results = await selectQuery.get();

    // Map the results to a list of HouseholdModel
    List<HouseholdModel> households = results.map((row) {
      // Read the necessary fields from QueryRow
      String? id = row.read<String>('id');
      int? memberCount = row.read<int>('member_count');
      String clientReferenceId = row.read<String>('client_reference_id');
      String? additionalFieldsJson = row.read<String>('additional_fields');

      // Parse the additional fields JSON into an object
      HouseholdAdditionalFields? additionalFields;
      additionalFields =
          HouseholdAdditionalFieldsMapper.fromJson(additionalFieldsJson);

      // Create and return a HouseholdModel instance
      return HouseholdModel(
        id: id,
        memberCount: memberCount,
        clientReferenceId: clientReferenceId,
        additionalFields: additionalFields,
      );
    }).toList();

    return households;
  }
}
