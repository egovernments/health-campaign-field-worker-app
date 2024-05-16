import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/inventory_management.dart';

typedef FacilityDataRepository
    = DataRepository<FacilityModel, FacilitySearchModel>;
typedef ProjectFacilityDataRepository
    = DataRepository<ProjectFacilityModel, ProjectFacilitySearchModel>;

typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;

typedef StockDataRepository = DataRepository<StockModel, StockSearchModel>;
typedef StockReconciliationDataRepository
    = DataRepository<StockReconciliationModel, StockReconciliationSearchModel>;
