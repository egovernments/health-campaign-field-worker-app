import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductRepository extends RemoteRepository<ProductModel, ProductRequestModel> {
  ProductRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Product',
  });
}
