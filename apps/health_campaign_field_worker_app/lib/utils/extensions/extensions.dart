import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth.dart';
import '../../blocs/project/project.dart';
import '../../data/data_repository.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';
import '../app_exception.dart';

part 'context_utility.dart';

extension DateAgeExtension on DateTime {
  int get age {
    return (DateTime.now().difference(this).inDays / 365).round();
  }
}

extension IntIncrementer on int? {
  int get increment {
    return _incrementBy(1);
  }

  int _incrementBy(int value) {
    return this == null ? value : (this! + value);
  }
}

extension UniqueListItem<E> on List<E> {
  void removeDuplicates<I>(I Function(E element) constraintMapper) {
    final distinctList = map(constraintMapper).toSet();

    retainWhere((element) => distinctList.remove(constraintMapper(element)));
  }
}
