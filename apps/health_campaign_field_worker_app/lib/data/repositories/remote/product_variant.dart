// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductVariantRemoteRepository extends RemoteRepository<ProductVariantModel, ProductVariantSearchModel> {
  ProductVariantRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProductVariant',
  });

  @override
  DataModelType get type => DataModelType.productVariant;
}
