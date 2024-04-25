import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/oplog/oplog_entry.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/models/entities/referral.dart';

import '../../../utils/utils.dart';
import '../../local_store/sql_store.dart';

class ReferralLocalRepository
    extends LocalRepository<ReferralModel, ReferralSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;
  ReferralLocalRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  void listenToChanges({
    required ReferralSearchModel query,
    required void Function(List<ReferralModel> data) listener,
  }) {
    final select = sql.select(registrationLocalSqlDataStore.referral).join([])
      ..where(
        buildOr([
          if (query.id != null)
            registrationLocalSqlDataStore.referral.id.equals(
              query.id!,
            ),
          if (query.projectBeneficiaryClientReferenceId != null)
            registrationLocalSqlDataStore
                .referral.projectBeneficiaryClientReferenceId
                .isIn(
              query.projectBeneficiaryClientReferenceId!,
            ),
        ]),
      );

    select.watch().listen((results) {
      final data = results
          .map((e) {
            final referral =
                e.readTableOrNull(registrationLocalSqlDataStore.referral);
            if (referral == null) return null;

            return ReferralModel(
              id: referral.id,
              clientReferenceId: referral.clientReferenceId,
              projectBeneficiaryClientReferenceId:
                  referral.projectBeneficiaryClientReferenceId,
              rowVersion: referral.rowVersion,
              tenantId: referral.tenantId,
              isDeleted: referral.isDeleted,
            );
          })
          .whereNotNull()
          .where((element) => element.isDeleted != true)
          .toList();

      listener(data);
    });
  }

  @override
  FutureOr<List<ReferralModel>> search(
    ReferralSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery =
        sql.select(registrationLocalSqlDataStore.referral).join([]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.clientReferenceId != null)
              registrationLocalSqlDataStore.referral.clientReferenceId.isIn(
                query.clientReferenceId!,
              ),
            if (query.projectBeneficiaryClientReferenceId != null)
              registrationLocalSqlDataStore
                  .referral.projectBeneficiaryClientReferenceId
                  .isIn(
                query.projectBeneficiaryClientReferenceId!,
              ),
            if (userId != null)
              registrationLocalSqlDataStore.referral.auditCreatedBy.equals(
                userId,
              ),
          ])))
        .get();

    return results
        .map((e) {
          final referral =
              e.readTableOrNull(registrationLocalSqlDataStore.referral);
          if (referral == null) return null;

          return ReferralModel(
            id: referral.id,
            clientReferenceId: referral.clientReferenceId,
            rowVersion: referral.rowVersion,
            tenantId: referral.tenantId,
            isDeleted: referral.isDeleted,
            projectBeneficiaryClientReferenceId:
                referral.projectBeneficiaryClientReferenceId,
            auditDetails: AuditDetails(
              createdBy: referral.auditCreatedBy!,
              createdTime: referral.auditCreatedTime!,
              lastModifiedBy: referral.auditModifiedBy,
              lastModifiedTime: referral.auditModifiedTime,
            ),
            clientAuditDetails: referral.clientCreatedTime == null ||
                    referral.clientCreatedBy == null
                ? null
                : ClientAuditDetails(
                    createdTime: referral.clientCreatedTime!,
                    createdBy: referral.clientCreatedBy!,
                    lastModifiedBy: referral.clientModifiedBy,
                    lastModifiedTime: referral.clientModifiedTime,
                  ),
          );
        })
        .whereNotNull()
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    ReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final referralCompanion = entity.companion;
    await sql.batch((batch) async {
      batch.insert(registrationLocalSqlDataStore.referral, referralCompanion);
      await super.create(entity);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<ReferralModel> entities,
  ) async {
    final referralCompanions = entities.map((e) => e.companion).toList();

    await sql.batch((batch) async {
      batch.insertAll(
        registrationLocalSqlDataStore.referral,
        referralCompanions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  FutureOr<void> update(
    ReferralModel entity, {
    bool createOpLog = true,
  }) async {
    final referralCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        registrationLocalSqlDataStore.referral,
        referralCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.referral;
}
