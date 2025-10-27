import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/utils/context_utility.dart';
import 'package:flutter/material.dart';

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
    } else if (entity is ProjectFacilityModel) {
      return context.repository<ProjectFacilityModel,
          ProjectFacilitySearchModel>(context);
    } else if (entity is ProductVariantModel) {
      return context
          .repository<ProductVariantModel, ProductVariantSearchModel>(context);
    } else if (entity is StockModel) {
      return context.repository<StockModel, StockSearchModel>(context);
    } else {
      return context.repository<EntityModel, EntitySearchModel>(context);
    }
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
      case 'projectFacility':
        return ProjectFacilityModelMapper.fromMap(normalizedMap);
      case 'facility':
        return FacilityModelMapper.fromMap(normalizedMap);
      case 'projectResource':
        return ProjectResourceModelMapper.fromMap(normalizedMap);
      case 'productVariant':
        return ProductVariantModelMapper.fromMap(normalizedMap);
      case 'projectProductVariant':
        return ProjectProductVariantModelMapper.fromMap(normalizedMap);
      case 'address':
        return AddressModelMapper.fromMap(normalizedMap);
      case 'stock':
        return StockModelMapper.fromMap(normalizedMap);
      case 'stockRecon':
        return StockReconciliationModelMapper.fromMap(normalizedMap);
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
