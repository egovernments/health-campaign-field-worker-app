import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProductVariantLocalBaseRepository
    extends LocalRepository<ProductVariantModel, ProductVariantSearchModel> {
  const ProductVariantLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.productVariant;

  @override
  TableInfo get table => sql.productVariant;
}