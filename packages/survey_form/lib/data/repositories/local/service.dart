import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:survey_form/survey_form.dart';

class ServiceLocalRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  ServiceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> bulkCreate(
    List<ServiceModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      // Collect all service companions
      final serviceCompanions = entities.map((e) => e.companion).toList();

      // Collect all attribute companions from all entities
      final List<Insertable<ServiceAttribute>> attributesCompanions = [];

      for (final entity in entities) {
        if (entity.attributes != null) {
          for (final attr in entity.attributes!) {
            final transformedAttr = attr.dataType == 'Number'
                ? attr.copyWith(
                    value: attr.value.toString(), // Convert int back to string
                  )
                : attr.dataType == 'MultiValueList' ||
                        attr.value
                            is List // Convert list back to dot-separated string
                    ? attr.copyWith(
                        value: (attr.value is List)
                            ? (attr.value as List).join('.')
                            : attr
                                .value, // Convert list back to dot-separated string
                        additionalDetails: attr.additionalDetails != null
                            ? {"value": attr.additionalDetails}
                            : attr.additionalDetails, // Keep original if null
                      )
                    : attr.dataType == 'SingleValueList'
                        ? attr.copyWith(
                            additionalDetails: attr.additionalDetails != null
                                ? {"value": attr.additionalDetails}
                                : attr
                                    .additionalDetails, // Keep original if null
                          )
                        : attr;

            attributesCompanions.add(transformedAttr.companion);
          }
        }
      }

      await sql.batch((batch) async {
        // Bulk insert services
        if (serviceCompanions.isNotEmpty) {
          batch.insertAll(
            sql.service,
            serviceCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }

        // Bulk insert attributes
        if (attributesCompanions.isNotEmpty) {
          batch.insertAll(
            sql.serviceAttributes,
            attributesCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  // function to create a Service entity in the local database
  @override
  FutureOr<void> create(
    ServiceModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.singleCreate,
  }) async {
    return retryLocalCallOperation(() async {
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
        referenceId: entity.referenceId,
        serviceDefId: entity.serviceDefId,
        isActive: entity.isActive,
        accountId: entity.accountId,
        tenantId: entity.tenantId,
        isDeleted: entity.isDeleted,
        rowVersion: entity.rowVersion,
        additionalFields: entity.additionalFields,
        auditDetails: entity.auditDetails,
        clientAuditDetails: entity.clientAuditDetails,
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
    });
  }

  //function to search Service entities corresponding to selected service definition from local database
  @override
  FutureOr<List<ServiceModel>> search(
    ServiceSearchModel query,
  ) async {
    return retryLocalCallOperation<List<ServiceModel>>(() async {
      final selectQuery = sql.select(sql.service).join([]);
      final results = await (selectQuery
            ..where(buildAnd([
              if (query.id != null) sql.service.serviceDefId.equals(query.id!),
              if (query.clientId != null)
                sql.service.clientId.equals(query.clientId!),
              if (query.referenceIds != null && query.referenceIds!.isNotEmpty)
                sql.service.referenceId.isIn(query.referenceIds!),
            ])))
          .get();

      final List<ServiceModel> serviceList = [];
      for (final e in results) {
        final data = e.readTable(sql.service);
        final selectAttributeQuery = sql.select(sql.serviceAttributes).join([]);

        final val = await (selectAttributeQuery
              ..where(buildAnd([
                sql.serviceAttributes.serviceClientReferenceId.equals(
                  data.clientId,
                ),
              ])))
            .get();

        final res = val.map((e) {
          final attribute = e.readTableOrNull(sql.serviceAttributes);
          if (attribute != null) {
            return ServiceAttributesModel(
                id: attribute.id,
                clientReferenceId: attribute.clientReferenceId,
                attributeCode: attribute.attributeCode,
                value: attribute.value,
                referenceId: attribute.referenceId,
                dataType: attribute.dataType,
                additionalDetails: attribute.additionalDetails,
                tenantId: attribute.tenantId,
                isDeleted: attribute.isDeleted,
                rowVersion: attribute.rowVersion,
                serviceClientReferenceId: attribute.serviceClientReferenceId,
                auditDetails: (attribute.auditCreatedBy != null &&
                        attribute.auditCreatedTime != null)
                    ? AuditDetails(
                        createdBy: attribute.auditCreatedBy!,
                        createdTime: attribute.auditCreatedTime!,
                        lastModifiedBy: attribute.auditModifiedBy,
                        lastModifiedTime: attribute.auditModifiedTime,
                      )
                    : null,
                additionalFields: attribute.additionalFields != null
                    ? ServiceAttributesAdditionalFieldsMapper.fromJson(
                        attribute.additionalFields!)
                    : null);
          }
        }).toList();

        serviceList.add(ServiceModel(
            clientId: data.clientId,
            id: data.id,
            accountId: data.accountId,
            tenantId: data.tenantId,
            rowVersion: data.rowVersion,
            isActive: data.isActive,
            isDeleted: data.isDeleted,
            serviceDefId: data.serviceDefId,
            createdAt: data.createdAt,
            attributes: res.whereNotNull().toList(),
            referenceId: data.referenceId));
      }

      return serviceList;
    });
  }

  @override
  FutureOr<void> update(
    ServiceModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.singleUpdate,
  }) async {
    return retryLocalCallOperation(() async {
      final serviceCompanion = entity.companion;

      final attributes = entity.attributes;

      // transformation logic to send attributes values in proper format
      final transformedAttributesForLocal = attributes?.map((e) {
        final value = e.value;

        return e.value is List
            ? e.copyWith(
                value: value.join('.'),
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
      }).toList();

      // transform attributes value for local update
      final transformedAttributesForServer = attributes?.map((e) {
        final value = e.value;

        return e.value is List
            ? e.copyWith(
                value: value.join('.'),
                additionalDetails: e.additionalDetails != null
                    ? {"value": e.additionalDetails}
                    : null,
              )
            : e.dataType == 'Number'
                ? e.copyWith(value: int.tryParse('$value'))
                : value is String && value.contains('.')
                    ? e.copyWith(
                        value: value.split('.'),
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
                        : e.dataType == 'MultiValueList'
                            ? e.copyWith(
                                value:
                                    value == 'NOT_SELECTED' ? [value] : value,
                                additionalDetails: e.additionalDetails != null
                                    ? {"value": e.additionalDetails}
                                    : null,
                              )
                            : e;
      }).toList();

      // Update each attributes individually with correct where clause
      if (transformedAttributesForLocal != null &&
          transformedAttributesForLocal.isNotEmpty) {
        for (final a in transformedAttributesForLocal ?? []) {
          final selectNestedQuery = sql.select(sql.serviceAttributes).join([]);

          final query = await (selectNestedQuery
                ..where(buildAnd([
                  sql.serviceAttributes.clientReferenceId
                      .equals(a.clientReferenceId!),
                ])))
              .get();

          var attTable = query
              .map((e) => e.readTableOrNull(sql.serviceAttributes))
              .toList();

          if (attTable.isNotEmpty) {
            await (sql.update(sql.serviceAttributes)
                  ..where((table) => table.clientReferenceId.equals(
                        a.clientReferenceId ?? '',
                      )))
                .write(attTable.first!.copyWith(
                    id: Value(a.id),
                    value: Value(a.value),
                    referenceId: entity.id != null
                        ? Value(entity.id)
                        : Value(entity.clientId)));
          }
        }
      }

      await sql.batch((batch) async {
        batch.update(
          sql.service,
          serviceCompanion,
          where: (table) => table.referenceId.equals(
            entity.referenceId ?? '',
          ),
        );
      });

      // Create a new entity with transformed attributes to pass to super.update
      final updatedEntity = ServiceModel(
        id: entity.id,
        clientId: entity.clientId,
        referenceId: entity.referenceId,
        serviceDefId: entity.serviceDefId,
        isActive: entity.isActive,
        accountId: entity.accountId,
        tenantId: entity.tenantId,
        isDeleted: entity.isDeleted,
        rowVersion: entity.rowVersion,
        additionalFields: entity.additionalFields,
        auditDetails: entity.auditDetails,
        clientAuditDetails: entity.clientAuditDetails,
        attributes: transformedAttributesForServer,
      );

      await super.update(updatedEntity,
          dataOperation: DataOperation.singleUpdate, createOpLog: createOpLog);
    });
  }

  @override
  DataModelType get type => DataModelType.service;
}
