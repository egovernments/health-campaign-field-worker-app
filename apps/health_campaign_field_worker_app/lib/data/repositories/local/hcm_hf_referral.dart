import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/oplog/oplog_entry.dart';
import 'package:drift/drift.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

import '../../../models/entities/additional_fields_type.dart';
import '../../../models/entities/hcm_hf_referral.dart';
import '../../../utils/utils.dart';

class HFReferralLocalRepository
    extends LocalRepository<HcmHFReferralModel, HcmHFReferralSearchModel> {
  HFReferralLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HcmHFReferralModel>> search(
    HcmHFReferralSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.hFReferral).join([]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.hFReferral?.clientReferenceId != null)
              sql.hFReferral.clientReferenceId.isIn(
                query.hFReferral!.clientReferenceId!,
              ),
            if (query.hFReferral?.name != null)
              sql.hFReferral.name.contains(
                query.hFReferral!.name!,
              ),
            if (query.hFReferral?.beneficiaryId != null)
              sql.hFReferral.beneficiaryId.equals(
                query.hFReferral!.beneficiaryId!,
              ),
            if (query.hFReferral?.projectId != null)
              sql.hFReferral.projectId.contains(
                query.hFReferral!.projectId!,
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
                    AdditionalFieldsType.gender.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.gender.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.gender.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.hFCoordinator.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.hFCoordinator.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.hFCoordinator.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.referredBy.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.referredBy.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.referredBy.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.dateOfEvaluation.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.dateOfEvaluation.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.dateOfEvaluation.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.nameOfReferral.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.nameOfReferral.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.nameOfReferral.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.age.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.age.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.age.toValue(),
                  ),
                ),
              if (getValueByKey(
                    data,
                    AdditionalFieldsType.cycle.toValue(),
                  ) !=
                  null)
                AdditionalField(
                  AdditionalFieldsType.cycle.toValue(),
                  getValueByKey(
                    data,
                    AdditionalFieldsType.cycle.toValue(),
                  ),
                ),
            ],
          );

          return HcmHFReferralModel(
            hFReferral: HFReferralModel(
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
            ),
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
  }

  @override
  FutureOr<void> create(
    HcmHFReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final referralCompanion = entity.companion;
    await sql.batch((batch) async {
      batch.insert(sql.hFReferral, referralCompanion);
      await super.create(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HcmHFReferralModel> entities,
  ) async {
    final referralCompanions = entities
        .map((e) => e.companion.copyWith(
              name: e.additionalFields?.fields
                  .where((h) =>
                      h.key == AdditionalFieldsType.nameOfReferral.toValue())
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
  }

  @override
  FutureOr<void> update(
    HcmHFReferralModel entity, {
    bool createOpLog = true,
  }) async {
    final referralCompanion = entity.companion.copyWith(
      name: Value(entity.additionalFields?.fields
          .where(
            (h) => h.key == AdditionalFieldsType.nameOfReferral.toValue(),
          )
          .first
          .value),
    );

    await sql.batch((batch) {
      batch.update(
        sql.hFReferral,
        referralCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.hFReferral!.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}
