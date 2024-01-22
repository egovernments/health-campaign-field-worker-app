import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class HFReferralLocalRepository
    extends LocalRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HFReferralModel>> search(
    HFReferralSearchModel query, [
    String? userId,
  ]) async {
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
              sql.hFReferral.beneficiaryId.equals(
                query.beneficiaryId!,
              ),
            if (query.projectId != null)
              sql.hFReferral.projectId.contains(
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

          return HFReferralModel(
            id: referral.id,
            clientReferenceId: referral.clientReferenceId,
            rowVersion: referral.rowVersion,
            tenantId: referral.tenantId,
            isDeleted: referral.isDeleted,
            name: referral.name,
            projectId: referral.projectId,
            projectFacilityId: referral.projectFacilityId,
            symptom: referral.symptom,
            symptomSurveyId: referral.symptomSurveyId,
            beneficiaryId: referral.beneficiaryId,
            referralCode: referral.referralCode,
            nationalLevelId: referral.nationalLevelId,
            auditDetails: AuditDetails(
              createdBy: referral.auditCreatedBy!,
              createdTime: referral.auditCreatedTime!,
              lastModifiedBy: referral.auditModifiedBy,
              lastModifiedTime: referral.auditModifiedTime,
            ),
            additionalFields: additionalFields,
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
    HFReferralModel entity, {
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
    List<HFReferralModel> entities,
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
    HFReferralModel entity, {
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
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}
