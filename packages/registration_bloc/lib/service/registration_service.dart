// lib/src/services/household_registration_service.dart

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';

import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/task.dart';
import '../models/global_search_params.dart';
import '../repositories/local/household_global_search.dart';
import '../repositories/local/individual_global_search.dart';
import '../utils/typedefs.dart';

class RegistrationService {
  final IndividualDataRepository individualRepository;

  final HouseholdDataRepository householdRepository;

  final HouseholdMemberDataRepository householdMemberRepository;

  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;

  final TaskDataRepository taskDataRepository;

  final BeneficiaryType beneficiaryType;

  final IndividualGlobalSearchRepository individualGlobalSearchRepository;

  final HouseHoldGlobalSearchRepository householdGlobalSearchRepository;

  RegistrationService(
    this.individualRepository,
    this.householdRepository,
    this.householdMemberRepository,
    this.projectBeneficiaryRepository,
    this.taskDataRepository,
    this.beneficiaryType,
    this.householdGlobalSearchRepository,
    this.individualGlobalSearchRepository,
  );


  Future<void> registerEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.create(entity);
    }
  }

  Future<void> updateEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.update(entity);
    }
  }

  Future<void> deleteEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.delete(entity);
    }
  }

  Future<FutureOr<List<EntityModel>>> searchHouseholds(
      {GlobalSearchParameters? query}) async {
    if (beneficiaryType == BeneficiaryType.individual) {
      return individualGlobalSearchRepository
          .individualGlobalSearch(query ?? const GlobalSearchParameters());
    } else {
      return householdGlobalSearchRepository.houseHoldGlobalSearch(query ?? const GlobalSearchParameters());
    }
  }

  DataRepository getRepositoryForEntity(EntityModel entity) {
    if (entity is HouseholdModel) {
      return householdRepository;
    } else if (entity is IndividualModel) {
      return individualRepository;
    } else if (entity is HouseholdMemberModel) {
      return householdMemberRepository;
    } else if (entity is ProjectBeneficiaryModel) {
      return projectBeneficiaryRepository;
    } else if (entity is TaskModel) {
      return taskDataRepository;
    } else {
      throw Exception(
          'No repository found for entity type: ${entity.runtimeType}');
    }
  }
}
