// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductRemoteRepository extends RemoteRepository<ProductModel, ProductSearchModel> {
  ProductRemoteRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Product',
  });

  @override
  DataModelType get type => DataModelType.product;
}
