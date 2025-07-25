/// Utility classes and singletons for CRUD BLoC package.

import 'package:digit_data_model/data_model.dart';

import '../service/crud_service.dart';

/// Singleton for sharing CrudService and dynamic entity model listener.
class CrudBlocSingleton {
  static final CrudBlocSingleton _instance = CrudBlocSingleton._internal();
  factory CrudBlocSingleton() => _instance;
  CrudBlocSingleton._internal();
  static CrudBlocSingleton get instance => _instance;

  CrudService? _crudService;
  DynamicEntityModelListener? _dynamicEntityModelListener;

  /// Sets the required CrudService and DynamicEntityModelListener for the singleton.
  void setData({
    required CrudService crudService,
    required DynamicEntityModelListener dynamicEntityModelListener,
  }) {
    _crudService = crudService;
    _dynamicEntityModelListener = dynamicEntityModelListener;
  }

  CrudService get crudService {
    if (_crudService == null) {
      throw StateError('CrudService has not been set. Call setData first.');
    }
    return _crudService!;
  }

  DynamicEntityModelListener get dynamicEntityModelListener {
    if (_dynamicEntityModelListener == null) {
      throw StateError(
          'DynamicEntityModelListener has not been set. Call setData first.');
    }
    return _dynamicEntityModelListener!;
  }
}

/// Listener for converting raw maps to dynamic entity models.
class DynamicEntityModelListener {
  EntityModel? dynamicEntityModelFromMap(
      String modelName, Map<String, dynamic> map) {
    return null;
  }
}
