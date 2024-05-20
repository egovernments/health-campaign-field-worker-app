import 'package:drift/drift.dart';

import '../../../../data_model.dart';

abstract class ProductLocalBaseRepository
    extends LocalRepository<ProductModel, ProductSearchModel> {
  const ProductLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.product;

  TableInfo get table => sql.product;
}
