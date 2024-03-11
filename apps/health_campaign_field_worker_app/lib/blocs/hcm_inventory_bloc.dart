import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/models/entities/product_variant.dart'
    as invProdVar;
import '../data/data_repository.dart';
import '../models/data_model.dart';
import '../utils/environment_config.dart';
import '../utils/utils.dart';
import 'facility/facility.dart';
import 'product_variant/product_variant.dart';
import 'sync/sync.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';

class HcmInventoryBloc extends InventoryListener {
  BuildContext context;
  final String? userId;
  final String? individualId;
  final String? projectId;
  final LocalRepository<HcmStockModel, HcmStockSearchModel>
      stockLocalRepository;
  final RemoteRepository<HcmStockModel, HcmStockSearchModel>
      stockRemoteRepository;

  HcmInventoryBloc({
    required this.context,
    required this.userId,
    required this.individualId,
    required this.projectId,
    required this.stockLocalRepository,
    required this.stockRemoteRepository,
  });

  late Function(List<InventoryFacilityModel> facilities) _facilitiesLoaded;
  late Function(List<invProdVar.ProductVariantModel> productVariants)
      _productVariantsLoaded;

  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  @override
  void fetchFacilitiesForProjectId(
    Function(List<InventoryFacilityModel> facilitiesModel) facilities,
  ) {
    _facilitiesLoaded = facilities;

    return fetchFacilities();
  }

  @override
  void fetchProductVariants(
    Function(List<invProdVar.ProductVariantModel> productVariantsModel)
        productVariants,
  ) {
    _productVariantsLoaded = productVariants;

    return fetchProducts();
  }

  void fetchFacilities() async {
    final facilities = await context.read<FacilityBloc>()
      ..add(FacilityLoadForProjectEvent(projectId: projectId!));

    facilities.state.whenOrNull(
          fetched: (facilities, _) {
            _facilitiesLoaded(loadInventoryFacilities(facilities));
          },
        ) ??
        [];
  }

  loadInventoryFacilities(List<FacilityModel> facilities) {
    List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
    for (var element in facilities) {
      hcmInventoryFacilityModel.add(
        InventoryFacilityModel(
          id: element.id,
          isPermanent: element.isPermanent,
          nonRecoverableError: element.nonRecoverableError,
          rowVersion: element.rowVersion,
          storageCapacity: element.storageCapacity,
          tenantId: element.tenantId,
          usage: element.usage,
        ),
      );
    }

    return hcmInventoryFacilityModel;
  }

  void fetchProducts() async {
    final products = await context.read<ProductVariantBloc>()
      ..add(ProductVariantLoadEvent(
        query: ProjectResourceSearchModel(
          projectId: projectId!,
        ),
      ));

    products.state.whenOrNull(
          fetched: (productVariants) {
            _productVariantsLoaded(loadProductVariants(productVariants));
          },
        ) ??
        [];
  }

  List<invProdVar.ProductVariantModel> loadProductVariants(
    List<ProductVariantModel> productVariants,
  ) {
    List<invProdVar.ProductVariantModel> hcmProductVariantModel = [];

    for (var element in productVariants) {
      hcmProductVariantModel.add(
        invProdVar.ProductVariantModel(
          id: element.id,
          variation: element.variation,
          rowVersion: element.rowVersion,
          tenantId: element.tenantId,
          nonRecoverableError: element.nonRecoverableError,
          productId: element.productId,
          sku: element.sku,
        ),
      );
    }

    return hcmProductVariantModel;
  }

  @override
  void saveStockDetails(SaveStockDetails saveStockDetails) async {
    print('saveStockDetails $saveStockDetails');
    // context.read<RecordStockBloc>().add(
    //       RecordStockSaveStockDetailsEvent(
    //         stockModel: HcmStockModel(
    //           stock: saveStockDetails.stockModel,
    //           additionalFields: StockAdditionalFields(
    //             version: 1,
    //             fields: getAdditionalData(saveStockDetails.additionalData),
    //           ),
    //           auditDetails: AuditDetails(
    //             createdBy: context.loggedInUserUuid,
    //             createdTime: context.millisecondsSinceEpoch(),
    //           ),
    //           clientAuditDetails: ClientAuditDetails(
    //             createdBy: context.loggedInUserUuid,
    //             createdTime: context.millisecondsSinceEpoch(),
    //             lastModifiedBy: context.loggedInUserUuid,
    //             lastModifiedTime: context.millisecondsSinceEpoch(),
    //           ),
    //         ),
    //       ),
    //     );

    var response = await stockLocalRepository.create(HcmStockModel(
      stock: saveStockDetails.stockModel.copyWith(
        facilityId: saveStockDetails.stockModel.facilityId,
        rowVersion: 1,
        tenantId: envConfig.variables.tenantId,
      ),
      additionalFields: StockAdditionalFields(
        version: 1,
        fields: getAdditionalData(saveStockDetails.additionalData),
      ),
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    ));

    saveStockDetails.isStockSaved(true);
  }

  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }
}
