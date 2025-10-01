import 'dart:convert';

import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';

class EntityModelJsonMapper extends DynamicEntityModelListener {
  @override
  Map<String, ModelFactory> get modelFactoryRegistry => {
        'IndividualModel': (json) =>
            IndividualModelMapper.fromJson(jsonEncode(json)),
        'IdentifierModel': (json) =>
            IdentifierModelMapper.fromJson(jsonEncode(json)),
        'AddressModel': (json) => AddressModelMapper.fromJson(jsonEncode(json)),
        'HouseholdModel': (json) =>
            HouseholdModelMapper.fromJson(jsonEncode(json)),
        'HouseholdMemberModel': (json) =>
            HouseholdMemberModelMapper.fromJson(jsonEncode(json)),
        'ProjectBeneficiaryModel': (json) =>
            ProjectBeneficiaryModelMapper.fromJson(jsonEncode(json)),
        'TaskModel': (json) => TaskModelMapper.fromJson(jsonEncode(json)),
        'SideEffectModel': (json) =>
            SideEffectModelMapper.fromJson(jsonEncode(json)),
        'ReferralModel': (json) =>
            ReferralModelMapper.fromJson(jsonEncode(json)),
        'FacilityModel': (json) =>
            FacilityModelMapper.fromJson(jsonEncode(json)),
        'ProjectFacilityModel': (json) =>
            ProjectFacilityModelMapper.fromJson(jsonEncode(json)),
        'ProjectTypeModel': (json) =>
            ProjectTypeModelMapper.fromJson(jsonEncode(json)),
        'StockModel': (json) => StockModelMapper.fromJson(jsonEncode(json)),
        'StockReconciliationModel': (json) =>
            StockReconciliationModelMapper.fromJson(jsonEncode(json)),
      };
}
