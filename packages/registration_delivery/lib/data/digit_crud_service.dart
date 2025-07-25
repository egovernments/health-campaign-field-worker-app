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
    final normalizedMap = normalizeAuditKeysRecursive(map);

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

      default:
        return EntityModelMapper.fromMap(normalizedMap);
    }
  }

  Map<String, dynamic> normalizeAuditKeysRecursive(Map<String, dynamic> map) {
    final newMap = <String, dynamic>{};

    // First, recursively normalize all values
    map.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        newMap[key] = normalizeAuditKeysRecursive(value);
      } else if (value is List) {
        newMap[key] = value
            .map((item) => item is Map<String, dynamic>
                ? normalizeAuditKeysRecursive(item)
                : item)
            .toList();
      } else {
        newMap[key] = value;
      }
    });

    // Now, build auditDetails and clientAuditDetails if flat keys exist at this level
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

    return newMap;
  }
}
