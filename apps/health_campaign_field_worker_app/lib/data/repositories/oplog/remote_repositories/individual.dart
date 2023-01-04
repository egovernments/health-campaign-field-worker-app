import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

class IndividualRepository extends RemoteRepository<IndividualModel, IndividualRequestModel> {
  IndividualRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Individual',
  });
}
