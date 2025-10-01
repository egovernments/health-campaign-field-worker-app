import 'dart:convert';

import 'package:complaints/complaints.dart';
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
    'PgrServiceModel': (json) =>
        PgrServiceModelMapper.fromJson(jsonEncode(json)),
    'PgrComplaintModel': (json) =>
        PgrComplaintModelMapper.fromJson(jsonEncode(json)),
    'PgrAddressModel': (json) =>
        PgrAddressModelMapper.fromJson(jsonEncode(json)),
  };
}