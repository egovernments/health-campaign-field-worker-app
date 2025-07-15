import 'package:digit_data_model/data_model.dart';

import '../service/crud_service.dart';

class CRUDBlocSingleton {
  // Singleton instance
  static final CRUDBlocSingleton _instance = CRUDBlocSingleton._internal();

  // Factory constructor that returns the singleton instance
  factory CRUDBlocSingleton() => _instance;

  // Private named constructor
  CRUDBlocSingleton._internal();

  // Getter for the singleton instance
  static CRUDBlocSingleton get instance => _instance;

  RegistrationService? _registrationService;

  void setData({
    required RegistrationService registrationService,
  }) {
    _registrationService = registrationService;
  }

  RegistrationService? get registrationService => _registrationService;
}

class DynamicEntityModelListener {
  EntityModel? dynamicEntityModelFromMap(
      String modelName, Map<String, dynamic> map) {
    return null;
  }
}
