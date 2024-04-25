import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:registration_delivery/models/entities/downsync.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/individual.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/task.dart';

import '../data/data_repository.dart';
import '../models/entities/facility.dart';
// import '../models/entities/hcm_attendance_log_model.dart';
// import '../models/entities/hcm_attendance_model.dart';
import '../models/entities/hcm_hf_referral.dart';
import '../models/entities/product.dart';
import '../models/entities/product_variant.dart';
import '../models/entities/project.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/project_facility.dart';
import '../models/entities/project_product_variant.dart';
import '../models/entities/project_resource.dart';
import '../models/entities/project_staff.dart';
import '../models/entities/project_type.dart';
import '../models/entities/service.dart';
import '../models/entities/service_definition.dart';
import '../models/entities/user.dart';
import '../models/pgr_complaints/pgr_complaints.dart';

typedef FacilityDataRepository
    = DataRepository<FacilityModel, FacilitySearchModel>;
typedef AddressDataRepository
    = DataRepository<AddressModel, AddressSearchModel>;
typedef HouseholdDataRepository
    = DataRepository<HouseholdModel, HouseholdSearchModel>;
typedef HouseholdMemberDataRepository
    = DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>;
typedef IndividualDataRepository
    = DataRepository<IndividualModel, IndividualSearchModel>;
typedef ProductDataRepository
    = DataRepository<ProductModel, ProductSearchModel>;
typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;
typedef ProjectDataRepository
    = DataRepository<ProjectModel, ProjectSearchModel>;
typedef ProjectBeneficiaryDataRepository
    = DataRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>;
typedef ProjectFacilityDataRepository
    = DataRepository<ProjectFacilityModel, ProjectFacilitySearchModel>;
typedef ProjectProductVariantDataRepository = DataRepository<
    ProjectProductVariantModel, ProjectProductVariantSearchModel>;
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;
typedef ProjectStaffDataRepository
    = DataRepository<ProjectStaffModel, ProjectStaffSearchModel>;
typedef ProjectTypeDataRepository
    = DataRepository<ProjectTypeModel, ProjectTypeSearchModel>;
typedef TaskDataRepository = DataRepository<TaskModel, TaskSearchModel>;
typedef ServiceDefinitionDataRepository
    = DataRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>;
typedef ServiceDataRepository
    = DataRepository<ServiceModel, ServiceSearchModel>;
typedef PgrServiceDataRepository
    = DataRepository<PgrServiceModel, PgrServiceSearchModel>;

typedef UserDataRepository = DataRepository<UserModel, UserSearchModel>;
typedef SideEffectDataRepository
    = DataRepository<SideEffectModel, SideEffectSearchModel>;
typedef ReferralDataRepository
    = DataRepository<ReferralModel, ReferralSearchModel>;
typedef DownsyncDataRepository
    = DataRepository<DownsyncModel, DownsyncSearchModel>;
typedef HFReferralDataRepository
    = DataRepository<HcmHFReferralModel, HcmHFReferralSearchModel>;
// typedef AttendanceDataRepository
//     = DataRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>;
// typedef AttendanceLogDataRepository
//     = DataRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>;

typedef StockDataRepository
    = DataRepository<StockModel, StockSearchModel>;
typedef StockReconciliationDataRepository = DataRepository<
    StockReconciliationModel, StockReconciliationSearchModel>;
