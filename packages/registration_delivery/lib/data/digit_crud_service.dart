import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

class DigitCrudService extends RegistrationService {
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
    switch (modelName) {
      case 'individual':
        return IndividualModelMapper.fromMap(map);
      case 'household':
        return HouseholdModelMapper.fromMap(map);
      case 'projectBeneficiary':
        return ProjectBeneficiaryModelMapper.fromMap(map);
      case 'householdMember':
        return HouseholdMemberModelMapper.fromMap(map);
      case 'task':
        return TaskModelMapper.fromMap(map);

      default:
        return EntityModelMapper.fromMap(map);
    }
  }
}
