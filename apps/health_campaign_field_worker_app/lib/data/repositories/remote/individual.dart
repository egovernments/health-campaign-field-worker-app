// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class IndividualRepository extends RemoteRepository<IndividualModel, IndividualSearchModel> {
  IndividualRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Individual',
  });
}
