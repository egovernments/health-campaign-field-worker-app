import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/service_base.dart';

class ServiceLocalRepository extends ServiceLocalBaseRepository {
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
      additionalFields: ServiceAdditionalFields(
        version: 1,
        fields: [
          AdditionalField(
            'clientCreatedTime',
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            'clientCreatedBy',
            entity.auditDetails?.createdBy,
          ),
        ],
      ),
      auditDetails: entity.auditDetails,
      attributes: entity.attributes?.map((e) {
        return e.dataType == 'Number'
            ? e.copyWith(value: int.tryParse(e.value))
            : e.dataType == 'MultiValueList'
                ? e.copyWith(
                    value: e.value.toString().split('.'),
                    additionalDetails: e.additionalDetails != null
                        ? {"value": e.additionalDetails}
                        : null,
                  )
                : e.dataType == 'SingleValueList'
                    ? e.copyWith(
                        additionalDetails: e.additionalDetails != null
                            ? {"value": e.additionalDetails}
                            : null,
                      )
                    : e;
      }).toList(),
    );

    await super.create(
      newEntity,
      dataOperation: DataOperation.singleCreate,
      createOpLog: true,
    );
  }

  @override
  FutureOr<List<ServiceModel>> search(
    ServiceSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.service).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.id != null)
              sql.service.serviceDefId.equals(
                query.id,
              ),
          ])))
        .get();

    final List<ServiceModel> serviceList = [];
    for (final e in results) {
      final data = e.readTable(sql.service);
      final selectattributeQuery = sql.select(sql.serviceAttributes).join([]);

      final val = await (selectattributeQuery
            ..where(buildAnd([
              sql.serviceAttributes.referenceId.equals(
                data.clientId,
              ),
            ])))
          .get();
      final res = val.map((e) {
        final attribute = e.readTableOrNull(sql.serviceAttributes);
        if (attribute != null) {
          return ServiceAttributesModel(
            clientReferenceId: attribute.clientReferenceId,
            attributeCode: attribute.attributeCode,
            value: attribute.value,
            dataType: attribute.dataType,
            additionalDetails: attribute.additionalDetails,
            tenantId: attribute.tenantId,
            isDeleted: attribute.isDeleted,
            rowVersion: attribute.rowVersion,
          );
        }
      }).toList();

      serviceList.add(ServiceModel(
        clientId: data.clientId,
        id: data.id,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
        isActive: data.isActive,
        isDeleted: data.isDeleted,
        serviceDefId: data.serviceDefId,
        createdAt: data.createdAt,
        attributes: res.whereNotNull().toList(),
      ));
    }

    return serviceList;
  }
}
