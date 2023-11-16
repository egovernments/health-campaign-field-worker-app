import '../data/data_repository.dart';
import '../models/data_model.dart';

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
typedef StockDataRepository = DataRepository<StockModel, StockSearchModel>;
typedef StockReconciliationDataRepository
    = DataRepository<StockReconciliationModel, StockReconciliationSearchModel>;
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
