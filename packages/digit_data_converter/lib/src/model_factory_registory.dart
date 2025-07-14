import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/task.dart';

typedef ModelFactory = EntityModel Function(Map<String, dynamic> json);

final modelFactoryRegistry = <String, ModelFactory>{
  'IndividualModel': (json) => IndividualModelMapper.fromJson(jsonEncode(json)),
  'IdentifierModel': (json) => IdentifierModelMapper.fromJson(jsonEncode(json)),
  'AddressModel': (json) => AddressModelMapper.fromJson(jsonEncode(json)),
  'HouseholdModel': (json) => HouseholdModelMapper.fromJson(jsonEncode(json)),
  'HouseholdMemberModel': (json) =>
      HouseholdMemberModelMapper.fromJson(jsonEncode(json)),
  'ProjectBeneficiaryModel': (json) =>
      ProjectBeneficiaryModelMapper.fromJson(jsonEncode(json)),
  'TaskModel': (json) => TaskModelMapper.fromJson(jsonEncode(json)),
  'SideEffectModel': (json) => SideEffectModelMapper.fromJson(jsonEncode(json)),
  'ReferralModel': (json) => ReferralModelMapper.fromJson(jsonEncode(json)),
  'FacilityModel': (json) => FacilityModelMapper.fromJson(jsonEncode(json)),
  'ProjectTypeModel': (json) => ProjectTypeModelMapper.fromJson(jsonEncode(json)),
};
