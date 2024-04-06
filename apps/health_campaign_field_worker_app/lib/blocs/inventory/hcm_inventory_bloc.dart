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

// Bloc for handling inventory related operations
class HcmInventoryBloc extends InventoryListener {
  BuildContext? context;
  final String? userId;
  final String? individualId;
  final String? projectId;
  final LocalRepository<HcmStockModel, HcmStockSearchModel>?
      stockLocalRepository;
  final LocalRepository<HcmStockReconciliationModel,
      HcmStockReconciliationSearchModel>? stockReconLocalRepository;

  // Constructor for the HcmInventoryBloc
  HcmInventoryBloc({
    this.context,
    this.userId,
    this.individualId,
    this.projectId,
    this.stockLocalRepository,
    this.stockReconLocalRepository,
  });

  // Method to call the sync method
  @override
  void callSyncMethod() {
    context!.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  // Method to fetch facilities for a given project ID
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

  // Method to fetch product variants
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
        empty: () => true,
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
      empty: () {
        hcmProductVariantModel = [];
      },
      orElse: () {
        hcmProductVariantModel = [];
      },
    );

    return hcmProductVariantModel;
  }

  // Method to get additional data
  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }

  // Method to fetch stock reconciliation details
  @override
  Future<List<List<StockModel>>> fetchStockReconciliationDetails(
      {String? productVariantId, String? facilityId}) async {
    final user = await LocalSecureStore.instance.userRequestModel;

    final receivedStocks = (await stockLocalRepository!.search(
      HcmStockSearchModel(
        stock: StockSearchModel(
          productVariantId: productVariantId,
          receiverId: facilityId,
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
          productVariantId: productVariantId,
          senderId: facilityId,
        ),
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();

    var received = receivedStocks.map((e) => e.stock!).toList();
    var sent = sentStocks.map((e) => e.stock!).toList();

    return [received, sent];
  }

  // Method to save stock details
  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) async {
    try {
      await stockLocalRepository!.create(HcmStockModel(
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
      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to save stock reconciliation details
  @override
  Future<bool> saveStockReconciliationDetails(
    SaveStockReconciliationModel stockReconciliationModel,
  ) async {
    try {
      await stockReconLocalRepository!.create(
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

      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to fetch inventory reports
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {InventoryReportType? reportType,
      String? facilityId,
      String? productVariantId}) async {
    if (reportType == InventoryReportType.reconciliation) {
      throw AppException(
        'Invalid report type: $reportType',
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

    return groupedData.map((key, value) {
      return MapEntry(
        key,
        value.map((e) => e.stock!).toList(),
      );
    });
  }

  // Method to handle stock reconciliation report
  @override
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {String? facilityId, String? productVariantId}) async {
    final data = await stockReconLocalRepository!.search(
      HcmStockReconciliationSearchModel(
        stockReconciliationSearchModel: StockReconciliationSearchModel(
          tenantId: envConfig.variables.tenantId,
          facilityId: facilityId,
          productVariantId: productVariantId,
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

    final additionalData = data.map((e) => e.additionalFields).map((e) {
      return e!.fields;
    }).toList();

    // Convert additionalFields to Iterable<MapEntry<String, dynamic>>
    Iterable<MapEntry<String, dynamic>> additionalFields =
        additionalData.expand((e) {
      return e.map((field) {
        return MapEntry(field.key, field.value);
      });
    });

    return StockReconciliationReport(
      stockReconModel: groupedData,
      additionalData: additionalFields,
    );
  }
}
