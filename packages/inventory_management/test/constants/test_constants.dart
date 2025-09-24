import 'package:digit_data_model/data_model.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/record_stock.dart';

class InventoryReportConstants {
  static const String facilityId = 'FAC_1';
  static const String productVariantId = '1891de8-02a2-4844-80ff-a080b7b40b70';
  static const String projectId = '11891de8-02a2-4844-80ff-a080b7b40b70';

  static final StockModel stockModel = StockModel(
    id: '1891de8-02a2-4844-80ff-b7b40b70123', // replace with a meaningful id
    clientReferenceId:
        '11891de8-02a2-5422-80ff-a080b7b40b65', // replace with a meaningful clientReferenceId
  );
  static final StockReconciliationModel stockReconciliationModel =
      StockReconciliationModel(
    id: '1dcs341-02a2-4844-80ff-b7b40b70123',
    // replace with a meaningful id
    clientReferenceId: '11891de8-02a2-5422-80ff-a080b7b40b65',
    // replace with a meaningful clientReferenceId
    dateOfReconciliation: DateTime(2024, 1, 1).millisecondsSinceEpoch,
  );

  static final ProjectResourceModel projectResourceModel = ProjectResourceModel(
    resource: ProjectProductVariantModel(
      productVariantId:
          '1891de8-02a2-4844-80ff-a080b7b40b70', // replace with a meaningful id
    ),
  );

  static final ProductVariantModel productVariantModel = ProductVariantModel(
    id: '12fe24-02a2-4844-80ff-a080b7b40b70', // replace with a meaningful id
  );

  static final ProjectProductVariantModel projectProductVariantModel =
      ProjectProductVariantModel(
    productVariantId:
        '1891de8-02a2-4844-80ff-a080b7b40b70', // replace with a meaningful id
  );

  static final String dateFormat =
      DateFormat('dd MMM yyyy').format(DateTime(2024, 1, 1));

  static final DateTime dateOfRecord = DateTime(2024, 1, 1);

  static const entryType = StockRecordEntryType.receipt;
}
