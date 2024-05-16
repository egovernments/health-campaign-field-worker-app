// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class ProductVariantRemoteRepository extends RemoteRepository<ProductVariantModel, ProductVariantSearchModel> {
  ProductVariantRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProductVariant',
  });

  @override
  DataModelType get type => DataModelType.productVariant;
}
