import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class IndividualLocalRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  const IndividualLocalRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.individual;

  @override
  FutureOr<List<IndividualModel>> search(
    IndividualSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.individual).join(
      [
        leftOuterJoin(
          sql.address,
          sql.address.relatedClientReferenceId.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.name,
          sql.name.individualClientReferenceId.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.identifier,
          sql.identifier.individualClientReferenceId.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
      ],
    );

    final results = await (selectQuery
          ..where(
            buildAnd([
              if (query.clientReferenceId != null)
                sql.individual.clientReferenceId.isIn(
                  query.clientReferenceId!,
                ),
              if (query.id != null)
                sql.individual.id.equals(
                  query.id,
                ),
              if (query.tenantId != null)
                sql.individual.tenantId.equals(
                  query.tenantId,
                ),
              if (query.dateOfBirth != null)
                sql.individual.dateOfBirth.equals(
                  query.dateOfBirth,
                ),
              if (query.gender != null)
                sql.individual.gender.equals(
                  query.gender?.index,
                ),
              if (query.name?.givenName != null)
                sql.name.givenName.contains(
                  query.name!.givenName!,
                ),
              if (query.name?.familyName != null)
                sql.name.familyName.equals(
                  query.name!.familyName,
                ),
              if (query.name?.otherNames != null)
                sql.name.otherNames.equals(
                  query.name!.otherNames,
                ),
              if (userId != null)
                sql.individual.auditCreatedBy.equals(
                  userId,
                ),
            ]),
          ))
        .get();

    return results
        .map((e) {
          final individual = e.readTable(sql.individual);
          final name = e.readTableOrNull(sql.name);
          final address = e.readTableOrNull(sql.address);
          final identifier = e.readTableOrNull(sql.identifier);

          return IndividualModel(
            id: individual.id,
            tenantId: individual.tenantId,
            clientReferenceId: individual.clientReferenceId,
            dateOfBirth: individual.dateOfBirth,
            mobileNumber: individual.mobileNumber,
            isDeleted: individual.isDeleted,
            rowVersion: individual.rowVersion,
            name: name == null
                ? null
                : NameModel(
                    individualClientReferenceId: individual.clientReferenceId,
                    familyName: name.familyName,
                    givenName: name.givenName,
                    otherNames: name.otherNames,
                    rowVersion: name.rowVersion,
                    tenantId: name.tenantId,
                  ),
            bloodGroup: individual.bloodGroup,
            address: [
              address == null
                  ? null
                  : AddressModel(
                      relatedClientReferenceId: individual.clientReferenceId,
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
                      rowVersion: address.rowVersion,
                    ),
            ].whereNotNull().toList(),
            gender: individual.gender,
            identifiers: [
              if (identifier != null)
                IdentifierModel(
                  individualClientReferenceId: individual.clientReferenceId,
                  identifierType: identifier.identifierType,
                  identifierId: identifier.identifierId,
                  rowVersion: identifier.rowVersion,
                  tenantId: identifier.tenantId,
                ),
            ],
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    IndividualModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final addresses = entity.address;
    final identifiers = entity.identifiers;

    final individualCompanion = entity.companion;
    final nameCompanion = entity.name?.companion;

    await sql.batch((batch) async {
      batch.insert(
        sql.individual,
        individualCompanion,
        mode: InsertMode.insertOrReplace,
      );
      if (nameCompanion != null) {
        batch.insert(
          sql.name,
          nameCompanion,
          mode: InsertMode.insertOrReplace,
        );
      }

      if (addresses != null) {
        final addressCompanions = addresses.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(
          sql.address,
          addressCompanions,
          mode: InsertMode.insertOrReplace,
        );
      }

      if (identifiers != null) {
        final identifierCompanions = identifiers.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(sql.identifier, identifierCompanions);
      }
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(
    IndividualModel entity, {
    bool createOpLog = true,
  }) async {
    final individualCompanion = entity.companion;

    final nameCompanion = entity.name?.companion;
    final addressCompanions = entity.address?.map((e) {
          return e
              .copyWith(relatedClientReferenceId: entity.clientReferenceId)
              .companion;
        }).toList() ??
        [];

    final identifierCompanions = entity.identifiers?.map((e) {
          return e.companion;
        }).toList() ??
        [];

    await sql.batch((batch) async {
      if (nameCompanion != null) {
        batch.update(
          sql.name,
          nameCompanion,
          where: (table) => table.individualClientReferenceId.equals(
            nameCompanion.individualClientReferenceId.value,
          ),
        );
      }

      batch.update(
        sql.individual,
        individualCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );

      batch.insertAllOnConflictUpdate(sql.address, addressCompanions);
      batch.insertAllOnConflictUpdate(sql.identifier, identifierCompanions);
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<void> delete(
    IndividualModel entity, {
    bool createOpLog = true,
  }) async {
    final updated = entity.copyWith(
      isDeleted: true,
      rowVersion: entity.rowVersion,
    );
    await sql.batch((batch) {
      batch.update(
        sql.individual,
        updated.companion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.delete(updated);
  }
}
