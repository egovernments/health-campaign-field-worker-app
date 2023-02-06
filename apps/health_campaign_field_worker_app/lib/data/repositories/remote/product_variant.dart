// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductVariantRemoteRepository extends RemoteRepository<ProductVariantModel, ProductVariantSearchModel> {
  ProductVariantRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'ProductVariant',
  });

  @override
  DataModelType get type => DataModelType.productVariant;
}
