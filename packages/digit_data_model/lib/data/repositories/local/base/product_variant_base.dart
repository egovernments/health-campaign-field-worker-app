import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class ProductVariantLocalBaseRepository
    extends LocalRepository<ProductVariantModel, ProductVariantSearchModel> {
  const ProductVariantLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.productVariant;

  TableInfo get table => sql.productVariant;
}