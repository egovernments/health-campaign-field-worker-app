import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/models/entities/product_variant.dart'
    as invProdVar;
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import '../../data/data_repository.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';
import '../facility/facility.dart';
import '../product_variant/product_variant.dart';
import '../sync/sync.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';

class HcmInventoryBloc extends InventoryListener {
  BuildContext? context;
  final String? userId;
  final String? individualId;
  final String? projectId;
  final LocalRepository<HcmStockModel, HcmStockSearchModel>?
      stockLocalRepository;
  final LocalRepository<HcmStockReconciliationModel,
      HcmStockReconciliationSearchModel>? stockReconLocalRepository;
  late Function(bool) _onTriggerDetected = (bool) {};

  HcmInventoryBloc({
    this.context,
    this.userId,
    this.individualId,
    this.projectId,
    this.stockLocalRepository,
    this.stockReconLocalRepository,
  });

  late Function(List<InventoryFacilityModel> facilities) _facilitiesLoaded;
  late Function(List<invProdVar.ProductVariantModel> productVariants)
      _productVariantsLoaded;
  late Function(
    Map<String, List<StockModel>> groupedData,
  ) _stockModelsLoaded;

  @override
  void callSyncMethod() {
    context!.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  @override
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId() async {
    final facilitiesBloc = context!.read<FacilityBloc>();
    facilitiesBloc.add(FacilityLoadForProjectEvent(projectId: projectId!));

    final facilitiesState = await facilitiesBloc.stream.firstWhere(
      (state) => state.maybeWhen(
        fetched: (facilities, _) => true,
        orElse: () => false,
      ),
    );

    List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
    facilitiesState.maybeWhen(
      fetched: (facilities, _) {
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
      },
      orElse: () {},
    );

    return hcmInventoryFacilityModel;
  }

  @override
  Future<List<invProdVar.ProductVariantModel>> fetchProductVariants() async {
    final productsBloc = context!.read<ProductVariantBloc>();
    productsBloc.add(ProductVariantLoadEvent(
      query: ProjectResourceSearchModel(
        projectId: projectId!,
      ),
    ));

    final productVariantsState = await productsBloc.stream.firstWhere(
      (state) => state.maybeWhen(
        fetched: (productVariants) => true,
        orElse: () => false,
      ),
    );

    List<invProdVar.ProductVariantModel> hcmProductVariantModel = [];
    productVariantsState.maybeWhen(
      fetched: (productVariants) {
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
      },
      orElse: () {},
    );

    return hcmProductVariantModel;
  }

  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }

  @override
  Future<void> fetchStockReconciliationDetails(
    FetchStockReconDetails fetchStockReconDetails,
  ) async {
    final user = await LocalSecureStore.instance.userRequestModel;

    final receivedStocks = (await stockLocalRepository!.search(
      HcmStockSearchModel(
        stock: StockSearchModel(
          productVariantId: fetchStockReconDetails.productVariantId,
          receiverId: fetchStockReconDetails.facilityId,
        ),
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();
    final sentStocks = (await stockLocalRepository!.search(
      HcmStockSearchModel(
        stock: StockSearchModel(
          productVariantId: fetchStockReconDetails.productVariantId,
          senderId: fetchStockReconDetails.facilityId,
        ),
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();

    var received = receivedStocks.map((e) => e.stock!).toList();
    var sent = sentStocks.map((e) => e.stock!).toList();

    await fetchStockReconDetails.stockReconDetails(
      received,
      sent,
    );
  }

  @override
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    var response = await stockLocalRepository!.create(HcmStockModel(
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
        createdBy: context!.loggedInUserUuid,
        createdTime: context!.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context!.loggedInUserUuid,
        createdTime: context!.millisecondsSinceEpoch(),
        lastModifiedBy: context!.loggedInUserUuid,
        lastModifiedTime: context!.millisecondsSinceEpoch(),
      ),
    ));

    saveStockDetails.isStockSaved(true);
  }

  @override
  Future<void> saveStockReconciliationDetails(
    SaveStockReconciliationModel stockReconciliationModel,
  ) async {
    var response = await stockReconLocalRepository!.create(
      HcmStockReconciliationModel(
        stockReconciliation:
            stockReconciliationModel.stockReconciliationModel.copyWith(
          tenantId: envConfig.variables.tenantId,
          referenceId: projectId,
          referenceIdType: 'PROJECT',
        ),
        additionalFields: StockReconciliationAdditionalFields(
          version: 1,
          fields: getAdditionalData(stockReconciliationModel.additionalData),
        ),
        auditDetails: AuditDetails(
          createdBy: context!.loggedInUserUuid,
          createdTime: context!.millisecondsSinceEpoch(),
        ),
        clientAuditDetails: ClientAuditDetails(
          createdBy: context!.loggedInUserUuid,
          createdTime: context!.millisecondsSinceEpoch(),
          lastModifiedBy: context!.loggedInUserUuid,
          lastModifiedTime: context!.millisecondsSinceEpoch(),
        ),
      ),
    );

    stockReconciliationModel.isStockReconciliationSaved(true);
  }

  @override
  Future<void> fetchInventoryReports(
    FetchInventoryReports fetchInventoryReports,
  ) async {
    _stockModelsLoaded = fetchInventoryReports.stocks;

    final reportType = fetchInventoryReports.reportType;
    final facilityId = fetchInventoryReports.facilityId;
    final productVariantId = fetchInventoryReports.productVariantId;

    if (reportType == InventoryReportType.reconciliation) {
      throw AppException(
        'Invalid report type: ${fetchInventoryReports.reportType}',
      );
    }

    List<TransactionReason>? transactionReason;
    List<TransactionType>? transactionType;
    String? senderId;
    String? receiverId;

    if (reportType == InventoryReportType.receipt) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.received];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.dispatch) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.returned) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.returned];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.damage) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.damagedInStorage,
        TransactionReason.damagedInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.loss) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.lostInStorage,
        TransactionReason.lostInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    }
    final user = await LocalSecureStore.instance.userRequestModel;

    final data = (receiverId != null
            ? await stockLocalRepository!.search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                    transactionType: transactionType,
                    tenantId: envConfig.variables.tenantId,
                    receiverId: receiverId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                ),
              )
            : await stockLocalRepository!.search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                    transactionType: transactionType,
                    tenantId: envConfig.variables.tenantId,
                    senderId: senderId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                ),
              ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid);

    final groupedData = data.groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
          element.auditDetails!.createdTime,
        ),
      ),
    );

    _stockModelsLoaded(groupedData.map((key, value) {
      return MapEntry(key, value.map((e) => e.stock!).toList());
    }));
  }

  @override
  Future<void> handleStockReconciliationReport(
    StockReconciliationReport stockReconciliationReport,
  ) async {
    final data = await stockReconLocalRepository!.search(
      HcmStockReconciliationSearchModel(
        stockReconciliationSearchModel: StockReconciliationSearchModel(
          tenantId: envConfig.variables.tenantId,
          facilityId: stockReconciliationReport.facilityId,
          productVariantId: stockReconciliationReport.productVariantId,
        ),
      ),
    );

    final groupedData = data
        .groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        element.stockReconciliation!.dateOfReconciliationTime,
      ),
    )
        .map((key, value) {
      return MapEntry(key, value.map((e) => e.stockReconciliation!).toList());
    });

    final additionalData = data.map((e) => e.additionalFields).toList();
    var moreDetails = additionalData.map((e) => e?.fields).toList();
    var additionalFields = moreDetails.map((e) => e!.map((e) {
          return MapEntry(e.key, e.value);
        }));
    stockReconciliationReport.stockReconciliationReport(groupedData, additionalFields);
  }

  @override
  void listenToDispose(Function(bool isDisposePackage) disposePackage) {
    _onTriggerDetected = disposePackage;
  }

  void onSideMenuTriggered() {
    _onTriggerDetected(true);
  }
}
