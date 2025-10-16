import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

class DigitCrudService extends CrudService {
  final BuildContext context;

  DigitCrudService(
      {required super.relationshipMap,
      required super.nestedModelMappings,
      required super.searchEntityRepository,
      required this.context});

  @override
  DataRepository<EntityModel, EntitySearchModel> getRepositoryForEntity(
      EntityModel entity) {
    if (entity is HouseholdModel) {
      return context.repository<HouseholdModel, HouseholdSearchModel>(context);
    } else if (entity is IndividualModel) {
      return context
          .repository<IndividualModel, IndividualSearchModel>(context);
    } else if (entity is HouseholdMemberModel) {
      return context.repository<HouseholdMemberModel,
          HouseholdMemberSearchModel>(context);
    } else if (entity is ProjectBeneficiaryModel) {
      return context.repository<ProjectBeneficiaryModel,
          ProjectBeneficiarySearchModel>(context);
    } else if (entity is TaskModel) {
      return context.repository<TaskModel, TaskSearchModel>(context);
    } else if (entity is ReferralModel) {
      return context.repository<ReferralModel, ReferralSearchModel>(context);
    } else {
      return context.repository<HouseholdModel, HouseholdSearchModel>(context);
    }
    //// NOTE: please add all the required model type, as this is a fallback
    return context.repository<HouseholdModel, HouseholdSearchModel>(context);
  }
}

class EntityModelMapMapper extends DynamicEntityModelListener {
  @override
  EntityModel? dynamicEntityModelFromMap(
      String modelName, Map<String, dynamic> map) {
    final normalizedMap = normalizeKnownFlatFieldsRecursively(map);

    switch (modelName) {
      case 'individual':
        return IndividualModelMapper.fromMap(normalizedMap);
      case 'household':
        return HouseholdModelMapper.fromMap(normalizedMap);
      case 'projectBeneficiary':
        return ProjectBeneficiaryModelMapper.fromMap(normalizedMap);
      case 'householdMember':
        return HouseholdMemberModelMapper.fromMap(normalizedMap);
      case 'task':
        return TaskModelMapper.fromMap(normalizedMap);

      case 'referral':
        final reasonsValue = normalizedMap['reasons'];

        if (reasonsValue is String) {
          // Clean stringified array like "[SICK]" or "[A, B]"
          final cleaned = reasonsValue.trim();

          if (cleaned.startsWith('[') && cleaned.endsWith(']')) {
            // Remove brackets and split by comma
            final content = cleaned.substring(1, cleaned.length - 1);
            normalizedMap['reasons'] = content
                .split(',')
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList();
          } else {
            // Just wrap plain string into a list
            normalizedMap['reasons'] = [cleaned];
          }
        }
        return ReferralModelMapper.fromMap(normalizedMap);

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
    if (newMap.containsKey('clientCreatedBy')) {
      clientAuditDetails['createdBy'] = newMap['clientCreatedBy'];
    }
    if (newMap.containsKey('clientCreatedTime')) {
      clientAuditDetails['createdTime'] = newMap['clientCreatedTime'];
    }
    if (newMap.containsKey('clientModifiedBy')) {
      clientAuditDetails['lastModifiedBy'] = newMap['clientModifiedBy'];
    }
    if (newMap.containsKey('clientModifiedTime')) {
      clientAuditDetails['lastModifiedTime'] = newMap['clientModifiedTime'];
    }
    if (clientAuditDetails.isNotEmpty) {
      newMap['clientAuditDetails'] = clientAuditDetails;
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
