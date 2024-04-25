import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/product.dart';

abstract class ProductLocalBaseRepository
    extends LocalRepository<ProductModel, ProductSearchModel> {
  const ProductLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.product;

  @override
  TableInfo get table => sql.product;
}
