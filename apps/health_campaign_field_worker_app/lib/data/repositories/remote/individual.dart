// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/individual.dart';

class IndividualRemoteRepository extends RemoteRepository<IndividualModel, IndividualSearchModel> {
  IndividualRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Individual',
  });

  @override
  DataModelType get type => DataModelType.individual;
}
