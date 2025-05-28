// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration/registration.dart';

class ProjectBeneficiaryRemoteDeliveryRepository extends RemoteRepository<
    ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> {
  ProjectBeneficiaryRemoteDeliveryRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectBeneficiary',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.projectBeneficiary;
}
