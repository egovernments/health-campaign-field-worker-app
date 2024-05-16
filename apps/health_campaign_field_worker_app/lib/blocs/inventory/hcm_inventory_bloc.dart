import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/inventory_management.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';
import '../sync/sync.dart';

// Bloc for handling inventory related operations
class HcmInventoryBloc extends InventoryListener {
  BuildContext? context;
  final String? userId;
  final String? projectId;
  // Constructor for the HcmInventoryBloc
  HcmInventoryBloc({
    this.context,
    this.userId,
    this.projectId,
  });

  // Method to call the sync method
  @override
  void callSyncMethod() {
    context!.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  // Method to fetch facilities for a given project ID
  @override
  Future<List<FacilityModel>> fetchFacilitiesForProjectId() async {
    throw UnimplementedError();
  }

  // Method to fetch product variants
  @override
  Future<List<ProductVariantModel>> fetchProductVariants() async {
    throw UnimplementedError();
  }

  // Method to fetch stock reconciliation details
  @override
  Future<List<List<StockModel>>> fetchStockReconciliationDetails(
      {required String productVariantId, required String facilityId}) async {
    throw UnimplementedError();
  }

  // Method to save stock details
  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) async {
    throw UnimplementedError();
  }

  // Method to save stock reconciliation details
  @override
  Future<bool> saveStockReconciliationDetails(
    SaveStockReconciliationModel stockReconciliationModel,
  ) async {
    throw UnimplementedError();
  }

  // Method to fetch inventory reports
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {required InventoryReportType reportType,
      required String facilityId,
      required String productVariantId}) async {
    throw UnimplementedError();
  }

  // Method to handle stock reconciliation report
  @override
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {required String facilityId, required String productVariantId}) async {
    throw UnimplementedError();
  }
}
