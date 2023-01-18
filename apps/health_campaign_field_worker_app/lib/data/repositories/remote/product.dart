// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductRepository extends RemoteRepository<ProductModel, ProductSearchModel> {
  ProductRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Product',
  });
}
