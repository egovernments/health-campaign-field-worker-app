class TransitPostSingleton {
  static final TransitPostSingleton _singleton =
      TransitPostSingleton._internal();

  factory TransitPostSingleton() {
    return _singleton;
  }

  TransitPostSingleton._internal();
}
