import 'package:digit_data_model/data_model.dart';

class DataConverterSingleton {
  static final DataConverterSingleton _instance =
      DataConverterSingleton._internal();

  factory DataConverterSingleton() => _instance;

  DataConverterSingleton._internal();

  static DataConverterSingleton get instance => _instance;

  DynamicEntityModelListener? _dynamicEntityModelListener;

  void setData({
    required DynamicEntityModelListener dynamicEntityModelListener,
  }) {
    _dynamicEntityModelListener = dynamicEntityModelListener;
  }

  DynamicEntityModelListener? get dynamicEntityModelListener =>
      _dynamicEntityModelListener;
}

typedef ModelFactory = EntityModel Function(Map<String, dynamic> json);

class DynamicEntityModelListener {
  /// Override or extend this method in a subclass
  Map<String, ModelFactory> get modelFactoryRegistry => {};

  /// Returns a model using the factory map
  EntityModel? dynamicEntityModelFromJson(
      String modelName, Map<String, dynamic> map) {
    final factory = modelFactoryRegistry[modelName];
    if (factory == null) return null;

    return factory(map);
  }
}
