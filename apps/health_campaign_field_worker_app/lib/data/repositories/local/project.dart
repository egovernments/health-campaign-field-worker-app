import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/project_base.dart';

class ProjectLocalRepository extends ProjectLocalBaseRepository {
  ProjectLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    ProjectModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final projectCompanion = entity.companion;

    final targets = entity.targets;
    final addressCompanion =
        entity.address?.copyWith(relatedClientReferenceId: entity.id).companion;
    await sql.batch((batch) {
      batch.insert(
        sql.project,
        projectCompanion,
        mode: InsertMode.insertOrReplace,
      );
      if (addressCompanion != null) {
        batch.insert(
          sql.address,
          addressCompanion,
          mode: InsertMode.insertOrReplace,
        );
      }
      if (targets != null) {
        final targetsCompanions = targets.map((e) {
          return e.copyWith(clientReferenceId: entity.id).companion;
        }).toList();

        batch.insertAll(
          sql.target,
          targetsCompanions,
          mode: InsertMode.insertOrReplace,
        );
      }
    });

    await super.create(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<List<ProjectModel>> search(
    ProjectSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.project).join([
      leftOuterJoin(
        sql.address,
        sql.address.relatedClientReferenceId.equalsExp(
          sql.project.id,
        ),
      ),
    ]);

    final results = await (selectQuery
          ..where(
            buildAnd([if (query.id != null) sql.project.id.equals(query.id)]),
          ))
        .get();

    final targetResults = await (selectQuery
          ..where(buildAnd([
            if (query.id != null) sql.target.clientReferenceId.equals(query.id),
          ])))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.project);
      final address = e.readTableOrNull(sql.address);

      return ProjectModel(
        id: data.id,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
        name: data.name,
        address: address == null
            ? null
            : AddressModel(
                id: address.id,
                relatedClientReferenceId: data.id,
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
                type: address.type,
                boundary: address.boundary,
                boundaryType: address.boundaryType,
                rowVersion: address.rowVersion,
              ),
        targets: targetResults.isEmpty
            ? null
            : targetResults
                .map((e) {
                  final target = e.readTableOrNull(sql.target);
                  if (target == null) return null;

                  return TargetModel(
                    id: target.id,
                    beneficiaryType: target.beneficiaryType,
                  );
                })
                .whereNotNull()
                .toList(),
      );
    }).toList();
  }
}
