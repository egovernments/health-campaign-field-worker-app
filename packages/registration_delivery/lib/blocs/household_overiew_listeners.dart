import 'package:digit_data_model/models/entities/individual.dart';

import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/task.dart';

abstract class IndividualDataRepository {
  Future<IndividualModel> delete(IndividualModel model);
  Future<List<IndividualModel>> search(IndividualSearchModel searchModel);
  Future<IndividualModel> update(IndividualModel model);
  Future<IndividualModel> create(IndividualModel model);
}

abstract class HouseholdDataRepository {
  Future<HouseholdModel> delete(HouseholdModel model);
  Future<List<HouseholdModel>> search(HouseholdSearchModel searchModel);
  Future<HouseholdModel> update(HouseholdModel model);
  Future<HouseholdModel> create(HouseholdModel model);
}

abstract class HouseholdMemberDataRepository {
  Future<HouseholdMemberModel> delete(HouseholdMemberModel model);
  Future<List<HouseholdMemberModel>> search(
      HouseholdMemberSearchModel searchModel);
  Future<HouseholdMemberModel> update(HouseholdMemberModel model);
  Future<HouseholdMemberModel> create(HouseholdMemberModel model);
}

abstract class ProjectBeneficiaryDataRepository {
  Future<ProjectBeneficiaryModel> delete(ProjectBeneficiaryModel model);
  Future<List<ProjectBeneficiaryModel>> search(
      ProjectBeneficiarySearchModel searchModel);
  Future<ProjectBeneficiaryModel> update(ProjectBeneficiaryModel model);
  Future<ProjectBeneficiaryModel> create(ProjectBeneficiaryModel model);
}

abstract class TaskDataRepository {
  Future<List<TaskModel>> search(TaskSearchModel searchModel);
}

abstract class SideEffectDataRepository {
  Future<List<SideEffectModel>> search(SideEffectSearchModel searchModel);
}

abstract class ReferralDataRepository {
  Future<List<ReferralModel>> search(ReferralSearchModel searchModel);
}
