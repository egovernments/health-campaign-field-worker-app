import '../data/data_repository.dart';
import '../models/data_model.dart';

typedef FacilityDataRepository
    = DataRepository<FacilityModel, FacilitySearchModel>;
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
