import 'package:flutter/cupertino.dart';

abstract class FakeDataStore<T> {
  List<T> getFakeDataList([int length = 10]) =>
      List.generate(length, (index) => fake);

  @protected
  T get fake;
}
