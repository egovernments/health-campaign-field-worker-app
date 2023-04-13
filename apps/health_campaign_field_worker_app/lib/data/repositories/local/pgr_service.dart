import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

class PgrServiceLocalRepository
    extends LocalRepository<PgrServiceModel, PgrServiceSearchModel> {
  PgrServiceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    PgrServiceModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final address = entity.address;
    final complainant = entity.citizen;

    final addressCompanion = address.companion;
    final complainantCompanion = complainant.companion;

    await sql.batch((batch) {
      batch.insert(
        sql.pgrService,
        entity.companion,
        mode: InsertMode.insertOrReplace,
      );
      batch.insert(
        sql.pgrComplainant,
        complainantCompanion,
        mode: InsertMode.insertOrReplace,
      );
      batch.insert(
        sql.address,
        addressCompanion,
        mode: InsertMode.insertOrReplace,
      );
    });

    return super.create(
      entity,
      createOpLog: createOpLog,
      dataOperation: dataOperation,
    );
  }

  @override
  FutureOr<void> update(
    PgrServiceModel entity, {
    bool createOpLog = true,
  }) async {
    if (entity.serviceRequestId == null) return;

    await sql.batch((batch) async {
      batch.update(
        sql.pgrService,
        PgrServiceCompanion(
          applicationStatus: Value(entity.applicationStatus),
        ),
        where: (tbl) => tbl.serviceRequestId.equals(entity.serviceRequestId),
      );
    });

    await super.update(
      entity,
      createOpLog: createOpLog,
    );
  }

  @override
  FutureOr<List<PgrServiceModel>> search(
    PgrServiceSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.pgrService).join([
      leftOuterJoin(
        sql.pgrComplainant,
        sql.pgrComplainant.complaintClientReferenceId.equalsExp(
          sql.pgrService.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.address,
        sql.address.relatedClientReferenceId.equalsExp(
          sql.pgrService.clientReferenceId,
        ),
      ),
    ]);

    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.tenantId != null)
                  sql.pgrService.tenantId.equals(query.tenantId),
                if (query.clientReferenceId != null)
                  sql.pgrService.clientReferenceId
                      .equals(query.clientReferenceId),
                if (query.serviceRequestId != null)
                  sql.pgrService.serviceRequestId
                      .equals(query.serviceRequestId),
                if (query.complaintAssignedTo != null) ...[
                  if (query.complaintAssignedTo ==
                      "COMPLAINTS_ASSIGNED_TO_SELF") ...[
                    sql.pgrComplainant.name.equals(query.currentUserName),
                  ] else ...[
                    sql.pgrComplainant.name.equals(query.currentUserName).not(),
                  ],
                ],
                if (query.complaintTypeCode != null)
                  sql.pgrService.serviceCode.equals(query.complaintTypeCode),
                if (query.locality != null)
                  sql.address.boundary.equals(query.locality),
                if (query.complaintStatus != null)
                  if (query.complaintStatus?.isNotEmpty ?? false)
                    sql.pgrService.applicationStatus
                        .isIn(query.complaintStatus?.map((e) => e.index) ?? []),
                if (query.complainantMobileNumber != null)
                  sql.pgrComplainant.mobileNumber
                      .contains(query.complainantMobileNumber.toString()),
                if (query.serviceRequestId != null)
                  sql.pgrService.serviceRequestId
                      .contains(query.serviceRequestId.toString()),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final pgrService = e.readTable(sql.pgrService);
      final pgrComplainant = e.readTable(sql.pgrComplainant);
      final address = e.readTable(sql.address);

      return PgrServiceModel(
        clientReferenceId: pgrService.clientReferenceId,
        tenantId: pgrService.tenantId,
        serviceCode: pgrService.serviceCode,
        description: pgrService.description,
        applicationStatus: pgrService.applicationStatus,
        citizen: PgrComplainantModel(
          complaintClientReferenceId: pgrComplainant.complaintClientReferenceId,
          clientReferenceId: pgrComplainant.clientReferenceId,
          tenantId: pgrComplainant.tenantId,
          name: pgrComplainant.name,
          mobileNumber: pgrComplainant.mobileNumber,
          emailId: pgrComplainant.emailId,
          type: pgrComplainant.type,
          auditDetails: AuditDetails(
            createdBy: pgrComplainant.auditCreatedBy!,
            createdTime: pgrComplainant.auditCreatedTime!,
            lastModifiedBy: pgrComplainant.auditModifiedBy,
            lastModifiedTime: pgrComplainant.auditModifiedTime,
          ),
          id: pgrComplainant.id,
          uuid: pgrComplainant.uuid,
        ),
        address: PgrAddressModel(
          relatedClientReferenceId: pgrService.clientReferenceId,
          tenantId: address.tenantId,
          doorNo: address.doorNo,

          /// boundary: address.boundary,
          geoLocation: GeoLocation(
            latitude: address.latitude,
            longitude: address.longitude,
          ),
          landmark: address.landmark,
          city: address.city,
          pincode: address.pincode,
          rowVersion: address.rowVersion,
        ),
        id: pgrService.id,
        auditDetails: AuditDetails(
          createdBy: pgrService.auditCreatedBy!,
          createdTime: pgrService.auditCreatedTime!,
          lastModifiedBy: pgrService.auditModifiedBy,
          lastModifiedTime: pgrService.auditModifiedTime,
        ),
        accountId: pgrService.accountId,
        serviceRequestId: pgrService.serviceRequestId,
        active: pgrService.active,
        source: pgrService.source,
      );
    }).toList();
  }

  @override
  DataModelType get type => DataModelType.complaints;
}
