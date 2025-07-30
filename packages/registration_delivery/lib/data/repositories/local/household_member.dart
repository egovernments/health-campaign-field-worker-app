import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

class HouseholdMemberLocalRepository
    extends LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> {
  HouseholdMemberLocalRepository(
    super.sql,
    super.opLogManager,
  );

  @override
  FutureOr<List<HouseholdMemberModel>> search(
    HouseholdMemberSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<HouseholdMemberModel>>(() async {
      final selectQuery = sql.select(sql.householdMember).join([]);
      if (query.limit != null && query.offset != null) {
        selectQuery.limit(query.limit!, offset: query.offset);
      }
      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.householdClientReferenceIds != null)
                    sql.householdMember.householdClientReferenceId.isIn(
                      query.householdClientReferenceIds!,
                    ),
                  if (query.individualClientReferenceIds != null)
                    sql.householdMember.individualClientReferenceId.isIn(
                      query.individualClientReferenceIds!,
                    ),
                  if (query.householdClientReferenceId != null)
                    sql.householdMember.householdClientReferenceId.isIn(
                      query.householdClientReferenceId!,
                    ),
                  if (query.individualClientReferenceId != null)
                    sql.householdMember.individualClientReferenceId.isIn(
                      query.individualClientReferenceId!,
                    ),
                  if (query.householdId != null)
                    sql.householdMember.householdId.isIn(
                      query.householdId!,
                    ),
                  if (query.individualId != null)
                    sql.householdMember.individualId.isIn(
                      query.individualId!,
                    ),
                  if (query.isHeadOfHousehold != null)
                    sql.householdMember.isHeadOfHousehold.equals(
                      query.isHeadOfHousehold!,
                    ),
                  if (userId != null)
                    sql.householdMember.auditCreatedBy.equals(
                      userId,
                    ),
                ],
              ),
            ))
          .get();

      final List<HouseholdMemberModel> householdMembers = [];

      for (final e in results) {
        final householdMember = e.readTable(sql.householdMember);

        // Fetch relationships based on clientReferenceId
        final val = await (sql.select(sql.householdMemberRelationShip)
              ..where(
                (tbl) => tbl.selfClientReferenceId.equals(
                  householdMember.clientReferenceId ?? '',
                ),
              ))
            .get();

        final res = val
            .map((relation) {
              return HouseholdMemberRelationShipModel(
                selfClientReferenceId: relation.selfClientReferenceId,
                relationshipType: relation.relationshipType,
                relativeClientReferenceId: relation.relativeClientReferenceId,
                tenantId: relation.tenantId,
                isDeleted: relation.isDeleted,
                rowVersion: relation.rowVersion,
                clientReferenceId: relation.clientReferenceId,
                clientAuditDetails: (relation.clientCreatedBy != null &&
                        relation.clientCreatedTime != null)
                    ? ClientAuditDetails(
                        createdBy: relation.clientCreatedBy!,
                        createdTime: relation.clientCreatedTime!,
                        lastModifiedBy: relation.clientModifiedBy,
                        lastModifiedTime: relation.clientModifiedTime,
                      )
                    : null,
                auditDetails: (relation.auditCreatedBy != null &&
                        relation.auditCreatedTime != null)
                    ? AuditDetails(
                        createdBy: relation.auditCreatedBy!,
                        createdTime: relation.auditCreatedTime!,
                        lastModifiedBy: relation.auditModifiedBy,
                        lastModifiedTime: relation.auditModifiedTime,
                      )
                    : null,
                additionalFields: relation.additionalFields != null
                    ? HouseholdMemberRelationShipAdditionalFieldsMapper
                        .fromJson(relation.additionalFields!)
                    : null,
              );
              return null;
            })
            .whereType<HouseholdMemberRelationShipModel>()
            .toList();

        householdMembers.add(
          HouseholdMemberModel(
            id: householdMember.id,
            householdId: householdMember.householdId,
            householdClientReferenceId:
                householdMember.householdClientReferenceId,
            individualId: householdMember.individualId,
            individualClientReferenceId:
                householdMember.individualClientReferenceId,
            isHeadOfHousehold: householdMember.isHeadOfHousehold,
            isDeleted: householdMember.isDeleted,
            tenantId: householdMember.tenantId,
            rowVersion: householdMember.rowVersion,
            auditDetails: (householdMember.auditCreatedBy != null &&
                    householdMember.auditCreatedTime != null)
                ? AuditDetails(
                    createdBy: householdMember.auditCreatedBy!,
                    createdTime: householdMember.auditCreatedTime!,
                    lastModifiedBy: householdMember.auditModifiedBy,
                    lastModifiedTime: householdMember.auditModifiedTime,
                  )
                : null,
            clientAuditDetails: (householdMember.clientCreatedBy != null &&
                    householdMember.clientCreatedTime != null)
                ? ClientAuditDetails(
                    createdBy: householdMember.clientCreatedBy!,
                    createdTime: householdMember.clientCreatedTime!,
                    lastModifiedBy: householdMember.clientModifiedBy,
                    lastModifiedTime: householdMember.clientModifiedTime,
                  )
                : null,
            clientReferenceId: householdMember.clientReferenceId,
            memberRelationships: res,
          ),
        );
      }

      return householdMembers
          .where((element) => element.isDeleted != true)
          .toList();
    });
  }

  @override
  FutureOr<void> create(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final householdMemberCompanion = entity.companion;
      final relationshipCompanions =
          entity.memberRelationships?.map((e) => e.companion).toList();

      await sql.batch((batch) {
        batch.insert(sql.householdMember, householdMemberCompanion);
        if (relationshipCompanions != null &&
            relationshipCompanions.isNotEmpty) {
          batch.insertAll(
            sql.householdMemberRelationShip,
            relationshipCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }
      });

      await super.create(entity);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HouseholdMemberModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final householdMemberCompanions =
          entities.map((e) => e.companion).toList();

      // Collect all relationship companions from all entities
      final List<HouseholdMemberRelationShipCompanion> relationshipCompanions =
          [];

      for (final entity in entities) {
        if (entity.memberRelationships != null) {
          for (final relationship in entity.memberRelationships!) {
            relationshipCompanions.add(relationship.companion);
          }
        }
      }

      await sql.batch((batch) async {
        batch.insertAll(
          sql.householdMember,
          householdMemberCompanions,
          mode: InsertMode.insertOrReplace,
        );

        if (relationshipCompanions.isNotEmpty) {
          batch.insertAll(
            sql.householdMemberRelationShip,
            relationshipCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  @override
  FutureOr<void> update(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      final householdMemberCompanion = entity.companion;
      final relationships = entity.memberRelationships;

      await sql.batch((batch) {
        batch.update(
          sql.householdMember,
          householdMemberCompanion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );

        // Update each relationship individually with correct where clause
        if (relationships != null && relationships.isNotEmpty) {
          for (final relationship in relationships) {
            batch.update(
              sql.householdMemberRelationShip,
              relationship.companion,
              where: (table) => table.clientReferenceId.equals(
                relationship.clientReferenceId,
              ),
            );
          }
        }
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> delete(
    HouseholdMemberModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final updated = entity.copyWith(
        isDeleted: true,
        clientAuditDetails: (entity.clientAuditDetails?.createdBy != null &&
                entity.clientAuditDetails?.createdTime != null)
            ? ClientAuditDetails(
                createdBy: entity.clientAuditDetails!.createdBy,
                createdTime: entity.clientAuditDetails!.createdTime,
                lastModifiedBy: entity.clientAuditDetails!.lastModifiedBy,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
              )
            : null,
        rowVersion: entity.rowVersion?.increment,
        memberRelationships: entity.memberRelationships
            ?.map((e) => e.copyWith(
                  isDeleted: true,
                  clientAuditDetails: (e.clientAuditDetails?.createdBy !=
                              null &&
                          e.clientAuditDetails?.createdTime != null)
                      ? ClientAuditDetails(
                          createdBy: e.clientAuditDetails!.createdBy,
                          createdTime: e.clientAuditDetails!.createdTime,
                          lastModifiedBy: e.clientAuditDetails!.lastModifiedBy,
                          lastModifiedTime:
                              DateTime.now().millisecondsSinceEpoch,
                        )
                      : null,
                  rowVersion: e.rowVersion?.increment,
                ))
            .toList(),
      );
      final relationships = entity.memberRelationships;

      if (relationships != null && relationships.isNotEmpty) {
        for (final relationship in relationships) {
          final updatedRetionship = relationship.copyWith(
            isDeleted: true,
            clientAuditDetails: (relationship.clientAuditDetails?.createdBy !=
                        null &&
                    relationship.clientAuditDetails?.createdTime != null)
                ? ClientAuditDetails(
                    createdBy: relationship.clientAuditDetails!.createdBy,
                    createdTime: relationship.clientAuditDetails!.createdTime,
                    lastModifiedBy:
                        relationship.clientAuditDetails!.lastModifiedBy,
                    lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                  )
                : null,
            rowVersion: relationship.rowVersion?.increment,
          );
          await sql.batch((batch) {
            batch.update(
              sql.householdMemberRelationShip,
              updatedRetionship.companion,
              where: (table) => table.clientReferenceId.equals(
                updatedRetionship.clientReferenceId,
              ),
            );
          });
        }
      }
      await sql.batch((batch) {
        batch.update(
          sql.householdMember,
          updated.companion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      return super.delete(updated);
    });
  }

  @override
  DataModelType get type => DataModelType.householdMember;
}
