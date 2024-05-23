// Importing necessary packages and files
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils.dart';

part 'context_utility.dart';

// Extension to increment an integer by a specific value.
extension IntIncrementer on int? {
  int get increment {
    return _incrementBy(1);
  }

  int _incrementBy(int value) {
    return this == null ? value : (this! + value);
  }
}

// Extension to remove duplicates from a list based on a provided constraint.
extension UniqueListItem<E> on List<E> {
  void removeDuplicates<I>(I Function(E element) constraintMapper) {
    final distinctList = map(constraintMapper).toSet();

    retainWhere((element) => distinctList.remove(constraintMapper(element)));
  }
}

// Extension to convert an integer (epoch) to a DateTime object.
extension EpochToDateTime on int? {
  DateTime? get toDateTime {
    return this == null ? null : DateTime.fromMillisecondsSinceEpoch(this!);
  }
}
