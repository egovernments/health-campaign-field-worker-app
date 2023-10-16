import 'dart:async';

import 'package:drift/drift.dart';
import 'dart:math' as math;
import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../local_store/sql_store/sql_store.dart';
import '../oplog/oplog.dart';

class AddressLocalRepository {
  final LocalSqlDataStore sql;
  final OpLogManager<AddressModel> opLogManager;

  AddressLocalRepository(this.sql, this.opLogManager);

  FutureOr<List<HouseholdModel>> searchHouseHoldbyAddress(
    AddressSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.address).join(
      [
        leftOuterJoin(
          sql.household,
          sql.household.clientReferenceId.equalsExp(
            sql.address.relatedClientReferenceId,
          ),
        ),
      ],
    );

    (selectQuery
      ..where(buildAnd([
        sql.address.relatedClientReferenceId.isNotNull(),
        sql.household.clientReferenceId.isNotNull(),
        if (query.latitude != null &&
            query.longitude != null &&
            query.maxRadius != null)
          CustomExpression<bool>('''
        (6371393 * acos(
            cos(${query.latitude! * math.pi / 180.0}) * cos((address.latitude * ${math.pi / 180.0}))
            * cos((address.longitude * ${math.pi / 180.0}) - ${query.longitude! * math.pi / 180.0})
            + sin(${query.latitude! * math.pi / 180.0}) * sin((address.latitude * ${math.pi / 180.0}))
        )) <= ${query.maxRadius!}
    '''),
        if (query.latitude != null &&
            query.longitude != null &&
            query.maxRadius != null)
          sql.address.longitude.isNotNull(),
        sql.address.latitude.isNotNull(),
      ])));
    final results = await selectQuery.get();

    return results
        .map((e) {
          final household = e.readTableOrNull(sql.household);
          final address = e.readTableOrNull(sql.address);

          return HouseholdModel(
            id: household?.id,
            tenantId: household?.tenantId,
            clientReferenceId: household!.clientReferenceId,
            memberCount: household.memberCount,
            rowVersion: household.rowVersion,
            isDeleted: household.isDeleted,
            auditDetails: AuditDetails(
              createdBy: household.auditCreatedBy!,
              createdTime: household.auditCreatedTime!,
              lastModifiedBy: household.auditModifiedBy,
              lastModifiedTime: household.auditModifiedTime,
            ),
            address: address == null
                ? null
                : AddressModel(
                    id: address.id,
                    relatedClientReferenceId: address.relatedClientReferenceId,
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
                    auditDetails: AuditDetails(
                      createdBy: household.auditCreatedBy!,
                      createdTime: household.auditCreatedTime!,
                      lastModifiedBy: household.auditModifiedBy,
                      lastModifiedTime: household?.auditModifiedTime,
                    ),
                  ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }
}
