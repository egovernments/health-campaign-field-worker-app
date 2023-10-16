import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ProductLocalBaseRepository
    extends LocalRepository<ProductModel, ProductSearchModel> {
  const ProductLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.product;

  @override
  TableInfo get table => sql.product;
}