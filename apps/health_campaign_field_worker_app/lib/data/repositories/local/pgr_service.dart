import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

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
    final complainant = entity.employee;

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
    final companion = entity.companion;
    final complainant = entity.employee;
    final address = entity.address;

    final complainantCompanion = complainant.companion;
    final addressCompanion = address.companion;

    await sql.batch((batch) async {
      batch.update(
        sql.pgrService,
        companion,
        where: (tbl) => tbl.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
      batch.update(
        sql.pgrComplainant,
        complainantCompanion,
        where: (tbl) => tbl.complaintClientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
      batch.update(
        sql.address,
        addressCompanion,
        where: (tbl) => tbl.relatedClientReferenceId.equals(
          entity.clientReferenceId,
        ),
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
        employee: PgrComplainantModel(
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
        address: AddressModel(
          relatedClientReferenceId: pgrService.clientReferenceId,
          tenantId: address.tenantId,
          doorNo: address.doorNo,
          boundary: address.boundary,
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
          auditDetails: AuditDetails(
            createdBy: address.auditCreatedBy!,
            createdTime: address.auditCreatedTime!,
            lastModifiedBy: address.auditModifiedBy,
            lastModifiedTime: address.auditModifiedTime,
          ),
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
