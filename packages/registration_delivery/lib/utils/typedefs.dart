import 'package:digit_data_model/data_model.dart';
import 'package:survey_form/models/entities/service.dart';
import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/task.dart';

typedef HouseholdDataRepository
    = DataRepository<HouseholdModel, HouseholdSearchModel>;
typedef HouseholdMemberDataRepository
    = DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>;
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
typedef ServiceDataRepository = DataRepository<ServiceModel, ServiceSearchModel>;
