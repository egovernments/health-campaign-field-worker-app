import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';

import '../../../models/entities/hf_additional_fields.dart';
import '../../../utils/utils.dart';

class HFReferralLocalRepository
    extends LocalRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HFReferralModel>> search(
    HFReferralSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation(() async {
      final selectQuery = sql.select(sql.hFReferral).join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              if (query.clientReferenceId != null)
                sql.hFReferral.clientReferenceId.isIn(
                  query.clientReferenceId!,
                ),
              if (query.name != null)
                sql.hFReferral.name.contains(
                  query.name!,
                ),
              if (query.beneficiaryId != null)
                sql.hFReferral.beneficiaryId.isIn(
                  query.beneficiaryId!,
                ),
              if (query.projectId != null)
                sql.hFReferral.projectId.isIn(
                  query.projectId!,
                ),
              if (userId != null)
                sql.hFReferral.auditCreatedBy.equals(
                  userId,
                ),
            ])))
          .get();

      return results
          .map((e) {
            final referral = e.readTableOrNull(sql.hFReferral);
            if (referral == null) return null;
            final additionalData = referral.additionalFields != null
                ? jsonDecode(referral.additionalFields!)
                : null;
            List<Map<String, dynamic>> data =
                List<Map<String, dynamic>>.from(additionalData['fields']);
            final HFReferralAdditionalFields additionalFields =
                HFReferralAdditionalFields(
              version: 1,
              fields: [
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.gender.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.gender.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.gender.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.hFCoordinator.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.hFCoordinator.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.hFCoordinator.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.referredBy.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.referredBy.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.referredBy.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.dateOfEvaluation.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.dateOfEvaluation.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.dateOfEvaluation.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.nameOfReferral.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.nameOfReferral.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.nameOfReferral.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.age.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.age.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.age.toValue(),
                    ),
                  ),
                if (getValueByKey(
                      data,
                      ReferralReconAdditionalFields.cycle.toValue(),
                    ) !=
                    null)
                  AdditionalField(
                    ReferralReconAdditionalFields.cycle.toValue(),
                    getValueByKey(
                      data,
                      ReferralReconAdditionalFields.cycle.toValue(),
                    ),
                  ),
              ],
            );

            return HFReferralModel(
              id: referral.id,
              clientReferenceId: referral.clientReferenceId,
              rowVersion: referral.rowVersion,
              tenantId: referral.tenantId,
              name: referral.name,
              projectId: referral.projectId,
              projectFacilityId: referral.projectFacilityId,
              symptom: referral.symptom,
              symptomSurveyId: referral.symptomSurveyId,
              beneficiaryId: referral.beneficiaryId,
              referralCode: referral.referralCode,
              nationalLevelId: referral.nationalLevelId,
              isDeleted: referral.isDeleted,
              additionalFields: additionalFields,
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
    HFReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion;
      await sql.batch((batch) async {
        batch.insert(sql.hFReferral, referralCompanion);
        await super.create(entity, createOpLog: createOpLog);
      });
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HFReferralModel> entities,{
        InsertMode mode = InsertMode.insertOrReplace,
      }) async {
    return retryLocalCallOperation(() async {
      final referralCompanions = entities
          .map((e) => e.companion.copyWith(
                name: e.additionalFields?.fields
                    .where((h) =>
                        h.key ==
                        ReferralReconAdditionalFields.nameOfReferral.toValue())
                    .first
                    .value,
              ))
          .toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.hFReferral,
          referralCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    HFReferralModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion.copyWith(
        name: Value(entity.additionalFields?.fields
            .where(
              (h) =>
                  h.key ==
                  ReferralReconAdditionalFields.nameOfReferral.toValue(),
            )
            .first
            .value),
      );

      await sql.batch((batch) {
        batch.update(
          sql.hFReferral,
          referralCompanion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}
