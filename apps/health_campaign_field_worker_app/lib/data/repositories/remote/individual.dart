// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class IndividualRemoteRepository extends RemoteRepository<IndividualModel, IndividualSearchModel> {
  IndividualRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Individual',
  });

  @override
  DataModelType get type => DataModelType.individual;
}
