// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class IndividualRemoteRepository extends RemoteRepository<IndividualModel, IndividualSearchModel> {
  IndividualRemoteRepository(
    super.dio, {
    required super.searchPath,
    required super.createPath,
    required super.updatePath,
    super.entityName = 'Individual',
  });

  @override
  DataModelType get type => DataModelType.individual;
}
