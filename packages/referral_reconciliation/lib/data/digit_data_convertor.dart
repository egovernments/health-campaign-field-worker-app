import 'dart:convert';

import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';

class EntityModelJsonMapper extends DynamicEntityModelListener {
  @override
  Map<String, ModelFactory> get modelFactoryRegistry => {
        'IdentifierModel': (json) =>
            IdentifierModelMapper.fromJson(jsonEncode(json)),
        'FacilityModel': (json) =>
            FacilityModelMapper.fromJson(jsonEncode(json)),
        'ProjectTypeModel': (json) =>
            ProjectTypeModelMapper.fromJson(jsonEncode(json)),
        'HFReferralModel': (json) =>
            HFReferralModelMapper.fromJson(jsonEncode(json))
      };
}
