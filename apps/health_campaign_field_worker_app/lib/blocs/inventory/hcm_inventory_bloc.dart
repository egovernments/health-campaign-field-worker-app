import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/models/entities/product_variant.dart'
    as invProdVar;
import '../../data/local_store/secure_store/secure_store.dart';
import '../../models/entities/project_resource.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';
import '../facility/facility.dart';
import '../product_variant/product_variant.dart';
import '../sync/sync.dart';

// Bloc for handling inventory related operations
class HcmInventoryBloc extends InventoryListener {
  BuildContext? context;
  final String? userId;
  final String? individualId;
  final String? projectId;
  final LocalRepository<StockModel, StockSearchModel>? stockLocalRepository;
  final LocalRepository<StockReconciliationModel,
      StockReconciliationSearchModel>? stockReconLocalRepository;

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
  Future<List<FacilityModel>> fetchFacilitiesForProjectId() async {
    final facilitiesBloc = context!.read<FacilityBloc>();
    facilitiesBloc.add(FacilityLoadForProjectEvent(projectId: projectId!));

    final facilitiesState = await facilitiesBloc.stream.firstWhere(
      (state) => state.maybeWhen(
        fetched: (facilities, _) => true,
        orElse: () => false,
      ),
    );

    List<FacilityModel> hcmFacilityModel = [];
    facilitiesState.maybeWhen(
      fetched: (facilities, _) {
        for (var element in facilities) {
          hcmFacilityModel.add(
            FacilityModel(
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

    return hcmFacilityModel;
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
      {required String productVariantId, required String facilityId}) async {
    final user = await LocalSecureStore.instance.userRequestModel;

    final receivedStocks = (await stockLocalRepository!.search(
      StockSearchModel(
        productVariantId: productVariantId,
        receiverId: facilityId,
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();
    final sentStocks = (await stockLocalRepository!.search(
      StockSearchModel(
        productVariantId: productVariantId,
        senderId: facilityId,
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();

    var received = receivedStocks.map((e) => e).toList();
    var sent = sentStocks.map((e) => e).toList();

    return [received, sent];
  }

  // Method to save stock details
  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) async {
    try {
      await stockLocalRepository!.create(
          StockModel(
            clientReferenceId: saveStockDetails.stockModel.clientReferenceId,
            facilityId: saveStockDetails.stockModel.facilityId,
            id: saveStockDetails.stockModel.id,
            isDeleted: saveStockDetails.stockModel.isDeleted,
            nonRecoverableError:
                saveStockDetails.stockModel.nonRecoverableError,
            productVariantId: saveStockDetails.stockModel.productVariantId,
            quantity: saveStockDetails.stockModel.quantity,
            receiverId: saveStockDetails.stockModel.receiverId,
            receiverType: saveStockDetails.stockModel.receiverType,
            referenceId: saveStockDetails.stockModel.referenceId,
            referenceIdType: saveStockDetails.stockModel.referenceIdType,
            rowVersion: saveStockDetails.stockModel.rowVersion,
            senderId: saveStockDetails.stockModel.senderId,
            senderType: saveStockDetails.stockModel.senderType,
            tenantId: envConfig.variables.tenantId,
            transactingPartyId: saveStockDetails.stockModel.transactingPartyId,
            transactingPartyType:
                saveStockDetails.stockModel.transactingPartyType,
            transactionReason: saveStockDetails.stockModel.transactionReason,
            transactionType: saveStockDetails.stockModel.transactionType,
            waybillNumber: saveStockDetails.stockModel.waybillNumber,
            additionalFields: saveStockDetails.stockModel.additionalFields,
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
          createOpLog: true);
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
        StockReconciliationModel(
          clientReferenceId: stockReconciliationModel
              .stockReconciliationModel.clientReferenceId,
          facilityId:
              stockReconciliationModel.stockReconciliationModel.facilityId,
          id: stockReconciliationModel.stockReconciliationModel.id,
          isDeleted:
              stockReconciliationModel.stockReconciliationModel.isDeleted,
          nonRecoverableError: stockReconciliationModel
              .stockReconciliationModel.nonRecoverableError,
          productVariantId: stockReconciliationModel
              .stockReconciliationModel.productVariantId,
          referenceId:
              stockReconciliationModel.stockReconciliationModel.referenceId,
          referenceIdType:
              stockReconciliationModel.stockReconciliationModel.referenceIdType,
          rowVersion:
              stockReconciliationModel.stockReconciliationModel.rowVersion,
          tenantId: stockReconciliationModel.stockReconciliationModel.tenantId,
          calculatedCount:
              stockReconciliationModel.stockReconciliationModel.calculatedCount,
          commentsOnReconciliation: stockReconciliationModel
              .stockReconciliationModel.commentsOnReconciliation,
          physicalCount:
              stockReconciliationModel.stockReconciliationModel.physicalCount,
          dateOfReconciliation: stockReconciliationModel
              .stockReconciliationModel.dateOfReconciliation,
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
        createOpLog: true,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to fetch inventory reports
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {required InventoryReportType reportType,
      required String facilityId,
      required String productVariantId}) async {
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
                StockSearchModel(
                  transactionType: transactionType,
                  tenantId: envConfig.variables.tenantId,
                  receiverId: receiverId,
                  productVariantId: productVariantId,
                  transactionReason: transactionReason,
                ),
              )
            : await stockLocalRepository!.search(
                StockSearchModel(
                  transactionType: transactionType,
                  tenantId: envConfig.variables.tenantId,
                  senderId: senderId,
                  productVariantId: productVariantId,
                  transactionReason: transactionReason,
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
        value.map((e) => e).toList(),
      );
    });
  }

  // Method to handle stock reconciliation report
  @override
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {required String facilityId, required String productVariantId}) async {
    final data = await stockReconLocalRepository!.search(
      StockReconciliationSearchModel(
        tenantId: envConfig.variables.tenantId,
        facilityId: facilityId,
        productVariantId: productVariantId,
      ),
    );

    final groupedData = data
        .groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        element.dateOfReconciliationTime,
      ),
    )
        .map((key, value) {
      return MapEntry(key, value.map((e) => e).toList());
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
