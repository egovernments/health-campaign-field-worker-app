// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/product.dart';

class ProductRemoteRepository extends RemoteRepository<ProductModel, ProductSearchModel> {
  ProductRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Product',
  });

  @override
  DataModelType get type => DataModelType.product;
}
