import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

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
    return retryLocalCallOperation<List<IndividualModel>>(() async {
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
            sql.identifier.clientReferenceId.equalsExp(
              sql.individual.clientReferenceId,
            ),
          ),
        ],
      );

      if (query.limit != null && query.offset != null) {
        selectQuery.limit(query.limit!, offset: query.offset);
      }

      final results = await (selectQuery
            ..where(
              buildAnd([
                if (query.clientReferenceId != null)
                  sql.individual.clientReferenceId.isIn(
                    query.clientReferenceId!,
                  ),
                if (query.id != null)
                  sql.individual.id.isIn(
                    query.id!,
                  ),
                if (query.tenantId != null)
                  sql.individual.tenantId.equals(
                    query.tenantId!,
                  ),
                if (query.userUuid != null)
                  sql.individual.userUuid.isIn(
                    query.userUuid!,
                  ),
                if (query.dateOfBirth != null)
                  sql.individual.dateOfBirth.equals(
                    query.dateOfBirth!,
                  ),
                if (query.gender != null)
                  sql.individual.gender.equals(
                    query.gender!.index,
                  ),
                if (query.name?.givenName != null)
                  buildOr([
                    sql.name.givenName.contains(
                      query.name!.givenName!,
                    ),
                  ]),
                if (query.name?.familyName != null)
                  sql.name.familyName.equals(
                    query.name!.familyName!,
                  ),
                if (query.name?.otherNames != null)
                  sql.name.otherNames.equals(
                    query.name!.otherNames!,
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
              individualId: individual.individualId,
              clientReferenceId: individual.clientReferenceId,
              dateOfBirth: individual.dateOfBirth,
              mobileNumber: individual.mobileNumber,
              userUuid: individual.userUuid,
              userId: individual.userUuid,
              isDeleted: individual.isDeleted,
              rowVersion: individual.rowVersion,
              clientAuditDetails: (individual.clientCreatedBy != null &&
                      individual.clientCreatedTime != null)
                  ? ClientAuditDetails(
                      createdBy: individual.clientCreatedBy!,
                      createdTime: individual.clientCreatedTime!,
                      lastModifiedBy: individual.clientModifiedBy,
                      lastModifiedTime: individual.clientModifiedTime,
                    )
                  : null,
              auditDetails: (individual.auditCreatedBy != null &&
                      individual.auditCreatedTime != null)
                  ? AuditDetails(
                      createdBy: individual.auditCreatedBy!,
                      createdTime: individual.auditCreatedTime!,
                      lastModifiedBy: individual.auditModifiedBy,
                      lastModifiedTime: individual.auditModifiedTime,
                    )
                  : null,
              name: name == null
                  ? null
                  : NameModel(
                      id: name.id,
                      individualClientReferenceId: individual.clientReferenceId,
                      familyName: name.familyName,
                      givenName: name.givenName,
                      otherNames: name.otherNames,
                      rowVersion: name.rowVersion,
                      tenantId: name.tenantId,
                      auditDetails: (name.auditCreatedBy != null &&
                              name.auditCreatedTime != null)
                          ? AuditDetails(
                              createdBy: name.auditCreatedBy!,
                              createdTime: name.auditCreatedTime!,
                              lastModifiedBy: name.auditModifiedBy,
                              lastModifiedTime: name.auditModifiedTime,
                            )
                          : null,
                      clientAuditDetails: (name.clientCreatedBy != null &&
                              name.clientCreatedTime != null)
                          ? ClientAuditDetails(
                              createdBy: name.clientCreatedBy!,
                              createdTime: name.clientCreatedTime!,
                              lastModifiedBy: name.clientModifiedBy,
                              lastModifiedTime: name.clientModifiedTime,
                            )
                          : null,
                    ),
              bloodGroup: individual.bloodGroup,
              address: [
                address == null
                    ? null
                    : AddressModel(
                        id: address.id,
                        relatedClientReferenceId: individual.clientReferenceId,
                        tenantId: address.tenantId,
                        doorNo: address.doorNo,
                        latitude: address.latitude,
                        longitude: address.longitude,
                        landmark: address.landmark,
                        locationAccuracy: address.locationAccuracy,
                        addressLine1: address.addressLine1,
                        addressLine2: address.addressLine2,
                        buildingName: address.buildingName,
                        city: address.city,
                        pincode: address.pincode,
                        type: address.type,
                        locality: address.localityBoundaryCode != null
                            ? LocalityModel(
                                code: address.localityBoundaryCode!,
                                name: address.localityBoundaryName,
                              )
                            : null,
                        rowVersion: address.rowVersion,
                        auditDetails: (address.auditCreatedBy != null &&
                                address.auditCreatedTime != null)
                            ? AuditDetails(
                                createdBy: address.auditCreatedBy!,
                                createdTime: address.auditCreatedTime!,
                                lastModifiedBy: address.auditModifiedBy,
                                lastModifiedTime: address.auditModifiedTime,
                              )
                            : null,
                        clientAuditDetails: (address.clientCreatedBy != null &&
                                address.clientCreatedTime != null)
                            ? ClientAuditDetails(
                                createdBy: address.clientCreatedBy!,
                                createdTime: address.clientCreatedTime!,
                                lastModifiedBy: address.clientModifiedBy,
                                lastModifiedTime: address.clientModifiedTime,
                              )
                            : null,
                      ),
              ].whereNotNull().toList(),
              gender: individual.gender,
              identifiers: [
                if (identifier != null)
                  IdentifierModel(
                    id: identifier.id,
                    clientReferenceId: individual.clientReferenceId,
                    identifierType: identifier.identifierType,
                    identifierId: identifier.identifierId,
                    rowVersion: identifier.rowVersion,
                    tenantId: identifier.tenantId,
                    auditDetails: AuditDetails(
                      createdBy: identifier.auditCreatedBy!,
                      createdTime: identifier.auditCreatedTime!,
                      lastModifiedBy: identifier.auditModifiedBy,
                      lastModifiedTime: identifier.auditModifiedTime,
                    ),
                  ),
              ],
            );
          })
          .where((element) => element.isDeleted != true)
          .toList();
    });
  }

  @override
  FutureOr<void> create(
    IndividualModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
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
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<IndividualModel> entities,{
        InsertMode mode = InsertMode.insertOrReplace, // Default to insertOrReplace
      }) async {
    return retryLocalCallOperation(() async {
      final individualCompanions = entities.map((e) => e.companion).toList();

      final identifiersList = entities
          .map((e) => e.identifiers?.map((a) {
                return a
                    .copyWith(
                      clientReferenceId: e.clientReferenceId,
                      clientAuditDetails: e.clientAuditDetails,
                      auditDetails: e.auditDetails,
                    )
                    .companion;
              }).toList())
          .toList();

      final identifierCompanions =
          identifiersList.expand((e) => [e?[0]]).toList();

      await sql.batch((batch) async {
        final addressList = entities
            .map((e) =>
                e.address?.map((a) {
                  return a
                      .copyWith(
                        relatedClientReferenceId: e.clientReferenceId,
                        clientAuditDetails: e.clientAuditDetails,
                        auditDetails: e.auditDetails,
                      )
                      .companion;
                }).toList() ??
                [])
            .toList();
        final addressCompanions = addressList.expand((e) => [e[0]]).toList();
        final nameCompanions = entities.map((e) {
          if (e.name != null) {
            return e.name!
                .copyWith(
                  individualClientReferenceId: e.clientReferenceId,
                  clientAuditDetails: e.clientAuditDetails,
                  auditDetails: e.auditDetails,
                )
                .companion;
          }
        }).toList();
        if (nameCompanions.isNotEmpty) {
          batch.insertAll(
            sql.name,
            nameCompanions.whereNotNull().toList(),
            mode: mode,
          );
        }

        batch.insertAll(
          sql.address,
          addressCompanions,
          mode: mode,
        );
        batch.insertAll(
          sql.identifier,
          identifierCompanions.whereNotNull().toList(),
          mode: mode,
        );
        batch.insertAll(
          sql.individual,
          individualCompanions,
          mode: mode,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    IndividualModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final individualCompanion = entity.companion;

      final nameCompanion = entity.name
          ?.copyWith(
            individualClientReferenceId: entity.clientReferenceId,
            auditDetails: entity.auditDetails,
            clientAuditDetails: entity.clientAuditDetails,
          )
          .companion;

      final addressCompanions = entity.address?.map((e) {
            return e
                .copyWith(
                  relatedClientReferenceId: entity.clientReferenceId,
                  clientAuditDetails: entity.clientAuditDetails,
                )
                .companion;
          }).toList() ??
          [];

      final identifierCompanions = entity.identifiers?.map((e) {
            return e
                .copyWith(clientAuditDetails: entity.clientAuditDetails)
                .companion;
          }).toList() ??
          [];

      await sql.batch((batch) async {
        if (nameCompanion != null) {
          batch.update(
            sql.name,
            nameCompanion,
            where: (table) => table.individualClientReferenceId.equals(
              nameCompanion.individualClientReferenceId.value!,
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

        batch.replaceAll(sql.address, addressCompanions);
        batch.replaceAll(sql.identifier, identifierCompanions);
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> delete(
    IndividualModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final updated = entity.copyWith(
        isDeleted: true,
        rowVersion: entity.rowVersion,
        clientAuditDetails: ClientAuditDetails(
          createdBy: entity.clientAuditDetails!.createdBy,
          createdTime: entity.clientAuditDetails!.createdTime,
          lastModifiedBy: entity.clientAuditDetails!.lastModifiedBy,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
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
    });
  }
}
