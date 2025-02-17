// Singleton class for managing least level boundary Localization

class LeastLevelBoundarySingleton {
  static final LeastLevelBoundarySingleton _singleton =
      LeastLevelBoundarySingleton._internal();

  factory LeastLevelBoundarySingleton() {
    return _singleton;
  }

  LeastLevelBoundarySingleton._internal();

  List<String>? _boundaries;

  void setBoundary({required List<String> boundaries}) {
    _boundaries = boundaries;
  }

  List<String>? get boundary => _boundaries;
}
