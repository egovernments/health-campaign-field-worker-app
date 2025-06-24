import 'package:digit_data_model/models/entities/individual.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities/household.dart';
import 'entities/project_beneficiary.dart';
import 'entities/referral.dart';
import 'entities/side_effect.dart';
import 'entities/task.dart';

part 'household_wrapper.freezed.dart';

@freezed
class HouseholdWrapper with _$HouseholdWrapper {
  const factory HouseholdWrapper({
    HouseholdModel? household,
    IndividualModel? headOfHousehold,
    List<IndividualModel>? members,
    List<ProjectBeneficiaryModel>? projectBeneficiaries,
    double? distance,
    List<TaskModel>? tasks,
    List<SideEffectModel>? sideEffects,
    List<ReferralModel>? referrals,
  }) = _HouseholdWrapper;

}
