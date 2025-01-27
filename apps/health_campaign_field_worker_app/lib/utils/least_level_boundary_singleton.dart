// Singleton class for managing least level boundary Localization
import 'package:digit_data_model/data_model.dart';

class LeastLevelBoundarySingleton {
  static final LeastLevelBoundarySingleton _singleton = LeastLevelBoundarySingleton._internal();

  factory LeastLevelBoundarySingleton() {
    return _singleton;
  }

  LeastLevelBoundarySingleton._internal();

  List<String>? _boundaries;

  void setBoundary({required List<String> boundaries}) {
    _boundaries = boundary;
  }

  List<String>? get boundary => _boundaries;

}