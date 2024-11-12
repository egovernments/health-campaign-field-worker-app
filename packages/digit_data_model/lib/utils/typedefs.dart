// Importing necessary packages and files.
import '../data/data_repository.dart';
import '../models/entities/boundary.dart';
import '../models/entities/facility.dart';
import '../models/entities/individual.dart';
import '../models/entities/product_variant.dart';
import '../models/entities/project_facility.dart';
import '../models/entities/project_resource.dart';

/// `FacilityDataRepository` is a type alias for a `DataRepository` that works with `FacilityModel` and `FacilitySearchModel`.
typedef FacilityDataRepository
    = DataRepository<FacilityModel, FacilitySearchModel>;

/// `ProjectFacilityDataRepository` is a type alias for a `DataRepository` that works with `ProjectFacilityModel` and `ProjectFacilitySearchModel`.
typedef ProjectFacilityDataRepository
    = DataRepository<ProjectFacilityModel, ProjectFacilitySearchModel>;

/// `IndividualDataRepository` is a type alias for a `DataRepository` that works with `IndividualModel` and `IndividualSearchModel`.
typedef IndividualDataRepository
    = DataRepository<IndividualModel, IndividualSearchModel>;

/// `ProjectResourceDataRepository` is a type alias for a `DataRepository` that works with `ProjectResourceModel` and `ProjectResourceSearchModel`.
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;

/// `ProductVariantDataRepository` is a type alias for a `DataRepository` that works with `ProductVariantModel` and `ProductVariantSearchModel`.
typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;

/// `BoundaryDataRepository` is a type alias for a `DataRepository` that works with `BoundaryModel` and `BoundarySearchModel`.
typedef BoundaryDataRepository
    = DataRepository<BoundaryModel, BoundarySearchModel>;

