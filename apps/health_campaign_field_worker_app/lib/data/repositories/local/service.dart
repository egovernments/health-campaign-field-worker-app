import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../models/entities/service.dart';
import '../../data_repository.dart';

class ServiceLocalRepository
    extends LocalRepository<ServiceModel, ServiceSearchModel> {
  ServiceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ServiceModel entity, {
    bool createOpLog = false,
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

    await super.create(entity);
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
