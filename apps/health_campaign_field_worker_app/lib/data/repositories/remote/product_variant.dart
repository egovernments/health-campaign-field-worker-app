import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductVariantRepository extends RemoteRepository<ProductVariantModel, ProductVariantRequestModel> {
  ProductVariantRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProductVariant',
  });
}
