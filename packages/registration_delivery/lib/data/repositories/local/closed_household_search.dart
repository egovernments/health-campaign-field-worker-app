import 'dart:async';
import 'dart:math' as math;
import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:closed_household/closed_household.dart' as closed_status
    show Status, StatusMapperExtension;

import '../../../utils/global_search_parameters.dart';

class ClosedHouseholdHoldSearchLocalRepository {
  FutureOr<List<UserActionModel>> performClosedHouseholdSearch(
      GlobalSearchParameters params, LocalSqlDataStore sql) async {
    return retryLocalCallOperation<List<UserActionModel>>(() async {
      var selectQuery = sql.select(sql.userAction).join([]);

      if (params.isProximityEnabled) {
        await performProximitySearch(selectQuery, params, sql);
      } else {
        selectQuery = selectQuery
          ..where(sql.userAction.status
              .equals(closed_status.Status.closeHousehold.toValue()));
      }

      selectQuery.limit(params.limit ?? 50, offset: params.offset ?? 0);

      final results = await selectQuery.get();

      return results
          .map((e) {
            final userAction = e.readTableOrNull(sql.userAction);

            return UserActionModel(
                id: userAction?.id,
                tenantId: userAction?.tenantId,
                action: userAction?.action,
                clientReferenceId: userAction!.clientReferenceId,
                rowVersion: userAction.rowVersion,
                auditDetails: (userAction.auditCreatedBy != null &&
                        userAction.auditCreatedTime != null)
                    ? AuditDetails(
                        createdBy: userAction.auditCreatedBy!,
                        createdTime: userAction.auditCreatedTime!,
                        lastModifiedBy: userAction.auditModifiedBy,
                        lastModifiedTime: userAction.auditModifiedTime,
                      )
                    : null,
                clientAuditDetails: (userAction.clientCreatedBy != null &&
                        userAction.clientCreatedTime != null)
                    ? ClientAuditDetails(
                        createdBy: userAction.clientCreatedBy!,
                        createdTime: userAction.clientCreatedTime!,
                        lastModifiedBy: userAction.clientModifiedBy,
                        lastModifiedTime: userAction.clientModifiedTime,
                      )
                    : null,
                beneficiaryTag: userAction.beneficiaryTag != null &&
                        userAction.beneficiaryTag!.isNotEmpty
                    ? userAction.beneficiaryTag
                    : null,
                boundaryCode: userAction.boundaryCode,
                isDeleted: userAction.isDeleted,
                latitude: userAction.latitude,
                longitude: userAction.longitude,
                locationAccuracy: userAction.locationAccuracy,
                nonRecoverableError: userAction.nonRecoverableError,
                projectId: userAction.projectId,
                resourceTag: userAction.resourceTag,
                status: userAction.status,
                additionalFields: userAction.additionalFields != null &&
                        userAction.additionalFields!.isNotEmpty
                    ? UserActionAdditionalFieldsMapper.fromJson(
                        userAction.additionalFields.toString())
                    : null);
          })
          .where((element) => element.isDeleted != true)
          .toList();
    });
  }

  performProximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) async {
    return await (selectQuery
          ..where(buildAnd([
            if (params.latitude != null &&
                params.longitude != null &&
                params.maxRadius != null)
              CustomExpression<bool>('''
              (6371393 * acos(
                  cos(${params.latitude! * math.pi / 180.0}) * cos((user_action.latitude * ${math.pi / 180.0}))
                  * cos((user_action.longitude * ${math.pi / 180.0}) - ${params.longitude! * math.pi / 180.0})
                  + sin(${params.latitude! * math.pi / 180.0}) * sin((user_action.latitude * ${math.pi / 180.0}))
              )) <= ${params.maxRadius!}
            '''),
            if (params.latitude != null &&
                params.longitude != null &&
                params.maxRadius != null)
              sql.userAction.longitude.isNotNull(),
            sql.userAction.latitude.isNotNull(),
          ])))
        .orderBy([
      if (params.latitude != null &&
          params.longitude != null &&
          params.maxRadius != null)
        OrderingTerm(
          expression: CustomExpression<double>('''
                (6371393 * acos(
                    cos(${params.latitude! * math.pi / 180.0}) * cos((user_action.latitude * ${math.pi / 180.0}))
                    * cos((user_action.longitude * ${math.pi / 180.0}) - ${params.longitude! * math.pi / 180.0})
                    + sin(${params.latitude! * math.pi / 180.0}) * sin((user_action.latitude * ${math.pi / 180.0}))
                ))
              '''),
          mode: OrderingMode.asc,
        ),
    ]);
  }
}
