import 'package:uuid/uuid.dart';

const String noResultSvg = 'assets/icons/svg/no_result.svg';

class KeyValue {
  String label;
  dynamic key;
  KeyValue(this.label, this.key);
}

class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  String get identifier => uuid.v1();
}
