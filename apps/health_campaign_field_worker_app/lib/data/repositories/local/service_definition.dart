import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/service_definition_base.dart';

class ServiceDefinitionLocalRepository
    extends ServiceDefinitionLocalBaseRepository {
  ServiceDefinitionLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ServiceDefinitionModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
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
  }

  @override
  FutureOr<List<ServiceDefinitionModel>> search(
    ServiceDefinitionSearchModel query, {
    bool createOpLog = false,
  }) async {
    final selectQuery = sql.select(sql.serviceDefinition).join([]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.id != null)
              sql.serviceDefinition.id.equals(
                query.id,
              ),
          ])))
        .get();

    final List<ServiceDefinitionModel> serviceDefinitionList = [];
    for (final e in results) {
      final data = e.readTable(sql.serviceDefinition);
      final selectattributeQuery = sql.select(sql.attributes).join([]);

      final val = await (selectattributeQuery
            ..where(buildAnd([
              sql.attributes.referenceId.equals(
                data.id,
              ),
            ])))
          .get();

      final res = val.map((e) {
        final resull = e.readTableOrNull(sql.attributes);
        if (resull != null) {
          List<String> list = resull.values != null
              ? resull.values!
                  .replaceFirst('[', '')
                  .replaceFirst(']', '')
                  .replaceAll(" ", '')
                  .split(',')
              : [];
          if (list.isEmpty) list.removeRange(0, list.length);

          return AttributesModel(
            id: resull.id,
            code: resull.code,
            dataType: resull.dataType,
            referenceId: resull.referenceId,
            tenantId: resull.tenantId,
            values: resull.values?.isNotEmpty == true ? list : null,
            isActive: resull.isActive,
            required: resull.required,
            regex: resull.regex,
            order: resull.order,
            isDeleted: resull.isDeleted,
            rowVersion: resull.rowVersion,
          );
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
      ));
    }

    return serviceDefinitionList;
  }
}
