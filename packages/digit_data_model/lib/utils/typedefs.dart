import '../data/data_repository.dart';
import '../models/entities/facility.dart';
import '../models/entities/individual.dart';
import '../models/entities/product_variant.dart';
import '../models/entities/project_facility.dart';
import '../models/entities/project_resource.dart';

typedef FacilityDataRepository
    = DataRepository<FacilityModel, FacilitySearchModel>;
typedef ProjectFacilityDataRepository
    = DataRepository<ProjectFacilityModel, ProjectFacilitySearchModel>;
typedef IndividualDataRepository
    = DataRepository<IndividualModel, IndividualSearchModel>;
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;
typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;
