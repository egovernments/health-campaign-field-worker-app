import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:survey_form/survey_form.dart';

class ServiceDefinitionLocalRepository extends LocalRepository<
    ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  ServiceDefinitionLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ServiceDefinitionModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final serviceDefinitionCompanion = entity.companion;
      final attributes = entity.attributes;
      await sql.batch((batch) {
        batch.insert(
          sql.serviceDefinition,
          serviceDefinitionCompanion,
          mode: InsertMode.insertOrReplace,
        );
        if (attributes != null) {
          final attributesCompanions = attributes.map((e) {
            return e.companion;
          }).toList();

          batch.insertAll(
            sql.attributes,
            attributesCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }
      });

      await super.create(entity, createOpLog: false);
    });
  }

  @override
  FutureOr<List<ServiceDefinitionModel>> search(
    ServiceDefinitionSearchModel query, {
    bool createOpLog = false,
  }) async {
    return retryLocalCallOperation(() async {
      final selectQuery = sql.select(sql.serviceDefinition).join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              // To fetch service definition with the id
              if (query.id != null)
                sql.serviceDefinition.id.equals(
                  query.id!,
                ),
              // To fetch service definition of a single survey_form with the code
              if (query.code != null)
                sql.serviceDefinition.code.isIn(
                  query.code!,
                ),
            ])))
          .get();

      final List<ServiceDefinitionModel> serviceDefinitionList = [];
      for (final e in results) {
        final data = e.readTable(sql.serviceDefinition);
        final selectAttributeQuery = sql.select(sql.attributes).join([]);

        final val = await (selectAttributeQuery
              ..where(buildAnd([
                sql.attributes.referenceId.equals(
                  data.id!,
                ),
              ])))
            .get();

        final res = val.map((e) {
          final result = e.readTableOrNull(sql.attributes);
          if (result != null) {
            List<String> list = result.values != null
                ? result.values!
                    .replaceFirst('[', '')
                    .replaceFirst(']', '')
                    .replaceAll(" ", '')
                    .split(',')
                : [];
            if (list.isEmpty) list.removeRange(0, list.length);

            return AttributesModel(
                id: result.id,
                code: result.code,
                dataType: result.dataType,
                referenceId: result.referenceId,
                tenantId: result.tenantId,
                values: result.values?.isNotEmpty == true ? list : null,
                isActive: result.isActive,
                required: result.required,
                regex: result.regex,
                order: result.order,
                isDeleted: result.isDeleted,
                rowVersion: result.rowVersion,
                additionalFields: result.additionalFields != null
                    ? AttributesAdditionalFieldsMapper.fromJson(
                        result.additionalFields!.toString())
                    : null);
          }
        }).toList();

        serviceDefinitionList.add(ServiceDefinitionModel(
            id: data.id,
            tenantId: data.tenantId,
            rowVersion: data.rowVersion,
            code: data.code,
            isActive: data.isActive,
            isDeleted: data.isDeleted,
            attributes: res.whereNotNull().toList(),
            additionalFields: data.additionalFields != null
                ? ServiceDefinitionAdditionalFieldsMapper.fromJson(
                    data.additionalFields!.toString())
                : null));
      }

      return serviceDefinitionList;
    });
  }

  @override
  DataModelType get type => DataModelType.serviceDefinition;
}
