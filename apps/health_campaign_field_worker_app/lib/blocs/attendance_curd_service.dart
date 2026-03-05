import 'package:attendance_management/attendance_management.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/package_tables/attendee.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/utils/context_utility.dart';
import 'package:flutter/material.dart';

class AttendanceCurdService extends CrudService {
  final BuildContext context;

  AttendanceCurdService(
      {required super.relationshipMap,
      required super.nestedModelMappings,
      required super.searchEntityRepository,
      required this.context});

  @override
  DataRepository<EntityModel, EntitySearchModel> getRepositoryForEntity(
      EntityModel entity) {
    if (entity is AttendanceRegisterModel) {
      return context.repository<AttendanceRegisterModel,
          AttendanceRegisterSearchModel>(context);
    }
    if (entity is AttendeeModel) {
      return context.repository<AttendeeModel, AttendeeSearchModel>(context);
    } else {
      return context.repository<EntityModel, EntitySearchModel>(context);
    }
  }
}

class AttendanceEntityModelMapMapper extends DynamicEntityModelListener {
  @override
  EntityModel? dynamicEntityModelFromMap(
      String modelName, Map<String, dynamic> map) {
    final normalizedMap = normalizeKnownFlatFieldsRecursively(map);
    switch (modelName) {
      case 'attendanceRegister':
        return AttendanceRegisterModelMapper.fromMap(map);
      case 'attendee':
        return AttendeeModelMapper.fromMap(normalizedMap);
      default:
        return EntityModelMapper.fromMap(normalizedMap);
    }
  }

  /// Temporary normalization function to transform known flat keys
  /// (like audit fields and locality info) into nested objects.
  ///
  /// NOTE: This is a quick fix for current needs. Should be generalized
  /// later to support dynamic mapping via config or schema.

  Map<String, dynamic> normalizeKnownFlatFieldsRecursively(
      Map<String, dynamic> map) {
    final newMap = <String, dynamic>{};

    // Recursively normalize all values
    map.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        newMap[key] = normalizeKnownFlatFieldsRecursively(value);
      } else if (value is List) {
        newMap[key] = value
            .map((item) => item is Map<String, dynamic>
                ? normalizeKnownFlatFieldsRecursively(item)
                : item)
            .toList();
      } else if (value is String) {
        // ---------- NEW FIX HERE ----------
        // Convert stringified list → actual List<String>
        final trimmed = value.trim();
        if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
          try {
            // Safely decode JSON-like string
            final decoded = trimmed
                .substring(1, trimmed.length - 1)
                .split(',')
                .map((e) => e.trim().replaceAll('"', '').replaceAll("'", ""))
                .where((e) => e.isNotEmpty)
                .toList();

            newMap[key] = decoded;
            return;
          } catch (_) {
            // fallback keep original string
          }
        }
        // ---------- END FIX ----------
        newMap[key] = value;
      } else {
        newMap[key] = value;
      }
    });

    // Flattened audit -> nested auditDetails
    final auditDetails = <String, dynamic>{};
    if (newMap.containsKey('auditCreatedBy')) {
      auditDetails['createdBy'] = newMap['auditCreatedBy'];
    }
    if (newMap.containsKey('auditCreatedTime')) {
      auditDetails['createdTime'] = newMap['auditCreatedTime'];
    }
    if (newMap.containsKey('auditModifiedBy')) {
      auditDetails['lastModifiedBy'] = newMap['auditModifiedBy'];
    }
    if (newMap.containsKey('auditModifiedTime')) {
      auditDetails['lastModifiedTime'] = newMap['auditModifiedTime'];
    }
    if (auditDetails.isNotEmpty) {
      newMap['auditDetails'] = auditDetails;
    }

    // Flattened client audit -> nested clientAuditDetails
    final clientAuditDetails = <String, dynamic>{};
    if (newMap.containsKey('clientCreatedBy') &&
        newMap['clientCreatedBy'] != null) {
      clientAuditDetails['createdBy'] = newMap['clientCreatedBy'];
    }
    if (newMap.containsKey('clientCreatedTime') &&
        newMap['clientCreatedTime'] != null) {
      clientAuditDetails['createdTime'] = newMap['clientCreatedTime'];
    }
    if (newMap.containsKey('clientModifiedBy') &&
        newMap['clientModifiedBy'] != null) {
      clientAuditDetails['lastModifiedBy'] = newMap['clientModifiedBy'];
    }
    if (newMap.containsKey('clientModifiedTime') &&
        newMap['clientModifiedTime'] != null) {
      clientAuditDetails['lastModifiedTime'] = newMap['clientModifiedTime'];
    }
    if (clientAuditDetails.isNotEmpty) {
      newMap['clientAuditDetails'] = clientAuditDetails;
    }

    // final additionalDetails = newMap['additionalField'];
    // newMap['additionalDetails'] = additionalDetails;

    if (newMap.containsKey('additionalField') &&
        newMap['additionalField'] != null) {
      newMap['additionalDetails'] = newMap['additionalField'];
    }

    // Flattened locality -> LocalityModel-like map
    if (newMap['localityBoundaryCode'] != null) {
      newMap['locality'] = {
        'code': newMap['localityBoundaryCode'],
        'name': newMap['localityBoundaryName'],
      };
    }

    return newMap;
  }
}
