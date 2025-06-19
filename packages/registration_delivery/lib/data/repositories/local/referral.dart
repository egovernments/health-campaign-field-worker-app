import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/models/entities/referral.dart';

class ReferralLocalRepository
    extends LocalRepository<ReferralModel, ReferralSearchModel> {
  ReferralLocalRepository(
    super.sql,
    super.opLogManager,
  );

  void listenToChanges({
    required ReferralSearchModel query,
    required void Function(List<ReferralModel> data) listener,
  }) async {
    return retryLocalCallOperation(() async {
      final select = sql.select(sql.referral).join([])
        ..where(
          buildOr([
            if (query.id != null)
              sql.referral.id.isIn(
                query.id!,
              ),
            if (query.projectBeneficiaryClientReferenceId != null)
              sql.referral.projectBeneficiaryClientReferenceId.isIn(
                query.projectBeneficiaryClientReferenceId!,
              ),
          ]),
        );

      select.watch().listen((results) {
        final data = results
            .map((e) {
              final referral = e.readTableOrNull(sql.referral);
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
    });
  }

  @override
  FutureOr<List<ReferralModel>> search(
    ReferralSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<ReferralModel>>(() async {
      final selectQuery = sql.select(sql.referral).join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              if (query.clientReferenceId != null)
                sql.referral.clientReferenceId.isIn(
                  query.clientReferenceId!,
                ),
              if (query.projectBeneficiaryClientReferenceId != null)
                sql.referral.projectBeneficiaryClientReferenceId.isIn(
                  query.projectBeneficiaryClientReferenceId!,
                ),
              if (userId != null)
                sql.referral.auditCreatedBy.equals(
                  userId,
                ),
            ])))
          .get();

      return results
          .map((e) {
            final referral = e.readTableOrNull(sql.referral);
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
    });
  }

  @override
  FutureOr<void> create(
    ReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion;
      await sql.batch((batch) async {
        batch.insert(sql.referral, referralCompanion);
        await super.create(entity);
      });
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<ReferralModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final referralCompanions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.referral,
          referralCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    ReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion;

      await sql.batch((batch) {
        batch.update(
          sql.referral,
          referralCompanion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      await super.update(entity,
          createOpLog: createOpLog, dataOperation: dataOperation);
    });
  }

  @override
  DataModelType get type => DataModelType.referral;
}
