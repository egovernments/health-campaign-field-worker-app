import 'package:digit_data_model/data_model.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

class InventoryReportConstants {
  static const String facilityId = '1v30vrv4';
  static const String productVariantId = '1v30vrvewfe4';
  static const String projectId = '1fe2fv4';

  static final StockModel stockModel = StockModel(
    id: 'stockModel1', // replace with a meaningful id
    clientReferenceId:
        'clientRef123', // replace with a meaningful clientReferenceId
  );
  static final StockReconciliationModel stockReconciliationModel =
      StockReconciliationModel(
    id: 'stockReconciliation1', // replace with a meaningful id
    clientReferenceId:
        'clientRef456', // replace with a meaningful clientReferenceId
    dateOfReconciliation: DateTime(2021, 1, 1).millisecondsSinceEpoch,
  );

  static final ProjectResourceModel projectResourceModel = ProjectResourceModel(
    resource: ProjectProductVariantModel(
      productVariantId: '1dd231', // replace with a meaningful id
    ),
  );

  static final ProductVariantModel productVariantModel = ProductVariantModel(
    id: '1dd13e1231', // replace with a meaningful id
  );

  static final ProjectProductVariantModel projectProductVariantModel =
      ProjectProductVariantModel(
    productVariantId: '1dd13e12', // replace with a meaningful id
  );

  static final String stockReconciliationDate =
      DateFormat('dd MMM yyyy').format(DateTime(2021, 1, 1));

  static final DateTime dateOfRecord = DateTime(2021, 1, 1);

  static const entryType = StockRecordEntryType.receipt;
}
