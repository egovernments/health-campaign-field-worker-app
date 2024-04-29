import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_data_model/models/entities/service.dart';
import 'package:digit_data_model/models/entities/service_definition.dart';

import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/product_variant.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/project_resource.dart';
import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/task.dart';

typedef HouseholdDataRepository
    = DataRepository<HouseholdModel, HouseholdSearchModel>;
typedef HouseholdMemberDataRepository
    = DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>;
typedef IndividualDataRepository
    = DataRepository<IndividualModel, IndividualSearchModel>;
typedef ProjectBeneficiaryDataRepository
    = DataRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>;
typedef TaskDataRepository = DataRepository<TaskModel, TaskSearchModel>;
typedef SideEffectDataRepository
    = DataRepository<SideEffectModel, SideEffectSearchModel>;
typedef ReferralDataRepository
    = DataRepository<ReferralModel, ReferralSearchModel>;
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;
typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;

typedef ProjectFacilityDataRepository
    = DataRepository<ProjectFacilityModel, ProjectFacilitySearchModel>;
typedef ServiceDataRepository
    = DataRepository<ServiceModel, ServiceSearchModel>;
typedef ServiceDefinitionDataRepository
    = DataRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>;
