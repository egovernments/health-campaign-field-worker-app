import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';

import '../../data_repository.dart';

class ServiceLocalRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  ServiceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ServiceModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.singleCreate,
  }) async {
    final serviceCompanion = entity.companion;
    final attributes = entity.attributes;
    await sql.batch((batch) {
      batch.insert(
        sql.service,
        serviceCompanion,
        mode: InsertMode.insertOrReplace,
      );
      if (attributes != null) {
        final attributesCompanions = attributes.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(
          sql.serviceAttributes,
          attributesCompanions,
          mode: InsertMode.insertOrReplace,
        );
      }
    });

    final newEntity = ServiceModel(
      id: entity.id,
      clientId: entity.clientId,
      serviceDefId: entity.serviceDefId,
      isActive: entity.isActive,
      accountId: entity.accountId,
      additionalDetails: entity.additionalDetails,
      tenantId: entity.tenantId,
      isDeleted: entity.isDeleted,
      rowVersion: entity.rowVersion,
      attributes: entity.attributes?.map((e) {
        return e.dataType == 'Number'
            ? ServiceAttributesModel(
                value: int.parse(e.value),
                attributeCode: e.attributeCode,
                tenantId: e.tenantId,
                clientReferenceId: e.clientReferenceId,
                additionalDetails: e.additionalDetails,
                isDeleted: e.isDeleted,
                auditDetails: e.auditDetails,
              )
            : e.dataType == 'MultiValueList' || e.dataType == 'SingleValueList'
                ? ServiceAttributesModel(
                    value: [e.value],
                    attributeCode: e.attributeCode,
                    tenantId: e.tenantId,
                    clientReferenceId: e.clientReferenceId,
                    additionalDetails: e.additionalDetails,
                    isDeleted: e.isDeleted,
                    auditDetails: e.auditDetails,
                  )
                : ServiceAttributesModel(
                    value: e.value,
                    attributeCode: e.attributeCode,
                    tenantId: e.tenantId,
                    clientReferenceId: e.clientReferenceId,
                    additionalDetails: e.additionalDetails,
                    isDeleted: e.isDeleted,
                    auditDetails: e.auditDetails,
                  );
      }).toList(),
    );

    await super.create(
      newEntity,
      dataOperation: DataOperation.singleCreate,
    );
  }

  @override
  FutureOr<List<ServiceModel>> search(ServiceSearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  // TODO: implement type
  DataModelType get type => DataModelType.service;
}
