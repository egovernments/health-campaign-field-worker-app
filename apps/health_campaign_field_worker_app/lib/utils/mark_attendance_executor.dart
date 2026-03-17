// In apps/health_campaign_field_worker_app/lib/pages/home.dart
// (add these imports at the top if not present)
import 'package:attendance_management/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/enum_values.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/action_handler.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/context_utility.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';

/// Stores individual attendance mark in widgetData.attendanceCollection,
/// replicating _onIndividualAttendanceMark toggle logic.
// class MarkAttendanceExecutor extends ActionExecutor {
//   @override
//   bool canHandle(String actionType) => actionType == 'MARK_ATTENDANCE';

//   @override
//   Future<Map<String, dynamic>> execute(
//     ActionConfig action,
//     BuildContext context,
//     Map<String, dynamic> contextData,
//   ) async {
//     // Resolve individualId and registerId from the data array using contextData
//     final Map<String, dynamic> resolved = {};
//     final extraData = action.properties['data'] as List<dynamic>?;
//     if (extraData != null) {
//       for (final entry in extraData) {
//         final key = entry['key'] as String;
//         final valuePath = entry['value'];
//         final resolvedValue = valuePath is String
//             ? resolveValue(valuePath, contextData)
//             : valuePath;
//         if (resolvedValue != null) resolved[key] = resolvedValue;
//       }
//     }

//     final individualId = resolved['individualId']?.toString();
//     final registerId = resolved['registerId']?.toString();
//     final status = (action.properties['status'] as num?)?.toDouble() ?? 1.0;
//     final signatureData = action.properties['signatureData'] as String?;

//     if (individualId == null || individualId.isEmpty) return contextData;

//     // Locate the screen's state in the registry
//     final instanceId = contextData['navigation']['_instanceId']?.toString();
//     // final screenKey = getEffectiveScreenKey(context, contextData);
//     final compositeKey = "markAttendance::$instanceId"
//         '';

//     final currentState = FlowCrudStateRegistry().get(compositeKey);
//     final widgetData =
//         Map<String, dynamic>.from(currentState?.widgetData ?? {});
//     final collection = Map<String, dynamic>.from(
//       widgetData['attendanceCollection'] as Map? ?? {},
//     );

//     // Toggle logic matching _onIndividualAttendanceMark
//     final existing = collection[individualId];
//     final currentStatus =
//         existing is Map ? (existing['status'] as num?)?.toDouble() : null;

//     final double finalStatus;
//     if (currentStatus == null || currentStatus == -1) {
//       finalStatus = status;
//     } else if (currentStatus == 1.0 && status == 1.0) {
//       finalStatus = 1.0; // already present, keep present
//     } else {
//       finalStatus = status;
//     }

//     collection[individualId] = {
//       'status': finalStatus,
//       'registerId': registerId,
//       'individualId': individualId,
//       'signatureData': signatureData,
//     };
//     widgetData['attendanceCollection'] = collection;

//     // Triggers ValueListenable rebuild → widget refreshes immediately
//     FlowCrudStateRegistry().update(
//       compositeKey,
//       (currentState ?? const FlowCrudState()).copyWith(widgetData: widgetData),
//     );
//     return contextData;
//   }
// }

/// Reads widgetData.attendanceCollection and builds AttendanceLogModel entities
/// (ENTRY + EXIT per individual), mirroring _onSaveAsDraft / submitAttendanceDetails logic.
/// Searches for existing logs to reuse clientReferenceId (dedup on re-submit).
/// Puts entities in contextData['entities'] for the next CREATE_EVENT action.
class SubmitAttendanceExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'SUBMIT_ATTENDANCE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // final screenKey = getEffectiveScreenKey(context, contextData);
    // final compositeKey = contextData['_compositeKey']?.toString() ??
    //     getCompositeKey(context, screenKey: screenKey) ??
    //     screenKey ??
    //     '';

    // Locate the screen's state in the registry
    final instanceId = contextData['navigation']['_instanceId']?.toString();
    final compositeKey = "markAttendance::$instanceId"
        '';

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData = currentState?.widgetData ?? {};

    final attendanceCollection = widgetData['attendanceCollection'] as Map?;
    if (attendanceCollection == null || attendanceCollection.isEmpty) {
      return contextData;
    }

    final comment = widgetData['COMMENT'] as String?;

    final selectedDate = widgetData['selectedAttendanceDate'] as Map?;
    final entryTime = (selectedDate?['entryTime'] as num?)?.toInt() ?? 0;
    final exitTime = (selectedDate?['exitTime'] as num?)?.toInt() ?? 0;

    // registerId comes from navigation params set by NAVIGATION action
    final navParams =
        FlowCrudStateRegistry().getNavigationParams(compositeKey) ?? {};
    final registerId = navParams['registerId']?.toString() ?? '';
    final tenantId = FlowBuilderSingleton().selectedProject?.tenantId ?? '';
    final boundaryCode = AttendanceSingleton().boundary?.code ?? '';
    final userUuid = FlowBuilderSingleton().loggedInUser?.uuid ?? '';
    final now = DateTime.now().millisecondsSinceEpoch;

    // Search existing logs for this register to reuse clientReferenceId (dedup)
    // Mirrors submitAttendanceDetails logic from AttendanceIndividualBloc
    List<AttendanceLogModel> existingLogs = [];
    if (registerId.isNotEmpty) {
      try {
        final repo = context
            .repository<AttendanceLogModel, AttendanceLogSearchModel>(context);
        existingLogs = await repo.search(
          AttendanceLogSearchModel(registerId: registerId),
        );
      } catch (_) {
        // If repository lookup fails, proceed without dedup
      }
    }

    final List<EntityModel> entities = [];

    for (final entry in attendanceCollection.entries) {
      final individualId = entry.key.toString();
      final data = entry.value as Map?;
      if (data == null) continue;

      final markStatus = (data['status'] as num?)?.toDouble() ?? -1;
      if (markStatus == -1) continue; // skip unmarked

      final isPresent = markStatus >= 1.0;
      final signatureData = data['signatureData'] as String?;
      final logStatus = isPresent
          ? EnumValues.active.toValue()
          : EnumValues.inactive.toValue();

      // Build additionalDetails matching _onSaveAsDraft
      final additionalDetails = <String, dynamic>{
        if (boundaryCode.isNotEmpty)
          EnumValues.boundaryCode.toValue(): boundaryCode,
        if (signatureData != null) 'signatureData': signatureData,
        if (comment != null && comment.isNotEmpty) 'comment': comment,
      };

      final clientAudit = ClientAuditDetails(
        createdBy: userUuid,
        createdTime: now,
        lastModifiedBy: userUuid,
        lastModifiedTime: now,
      );
      final audit = AuditDetails(
        createdBy: userUuid,
        createdTime: now,
        lastModifiedBy: userUuid,
        lastModifiedTime: now,
      );

      // Reuse clientReferenceId from existing log if present (dedup)
      // Mirrors submitAttendanceDetails: match on individualId + registerId + type + time
      final existingEntryLog = existingLogs
          .where((l) =>
              l.individualId == individualId &&
              l.registerId == registerId &&
              l.type == EnumValues.entry.toValue() &&
              l.time == entryTime &&
              l.clientReferenceId != null)
          .toList();

      final existingExitLog = existingLogs
          .where((l) =>
              l.individualId == individualId &&
              l.registerId == registerId &&
              l.type == EnumValues.exit.toValue() &&
              l.time == exitTime &&
              l.clientReferenceId != null)
          .toList();

      // ENTRY log
      entities.add(AttendanceLogModel(
        clientReferenceId: existingEntryLog.isNotEmpty
            ? existingEntryLog.last.clientReferenceId!
            : IdGen.i.identifier,
        individualId: individualId,
        registerId: registerId,
        tenantId: tenantId,
        type: EnumValues.entry.toValue(),
        status: logStatus,
        time: entryTime,
        uploadToServer: true,
        rowVersion: 1,
        additionalDetails: additionalDetails,
        clientAuditDetails: clientAudit,
        auditDetails: audit,
      ));

      // EXIT log
      entities.add(AttendanceLogModel(
        clientReferenceId: existingExitLog.isNotEmpty
            ? existingExitLog.last.clientReferenceId!
            : IdGen.i.identifier,
        individualId: individualId,
        registerId: registerId,
        tenantId: tenantId,
        type: EnumValues.exit.toValue(),
        status: logStatus,
        time: exitTime,
        uploadToServer: true,
        rowVersion: 1,
        additionalDetails: additionalDetails,
        clientAuditDetails: clientAudit,
        auditDetails: audit,
      ));
    }

    return {...contextData, 'entities': entities};
  }
}
