import 'package:closed_household/utils/utils.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:registration_delivery/registration_delivery.dart';
// Importing necessary packages and files
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../blocs/auth/auth.dart';
import '../../blocs/project/project.dart';
import '../../data/network_manager.dart';
import '../../models/auth/auth_model.dart';
import '../app_exception.dart';

// Importing the file 'context_utility.dart' with a 'part' directive.
part 'context_utility.dart';

// Extension to calculate age based on a DateTime object.
extension DateAgeExtension on DateTime {
  int get age {
    DateTime currentDate = DateTime.now();
    int ageInYears = currentDate.year - year;
    int ageInMonths = currentDate.month - month;

    if (currentDate.day < day) {
      ageInMonths--;
    }

    if (ageInMonths < 0) {
      ageInYears--;
      ageInMonths += 12;
    }

    return ageInYears;
  }
}

// Extension to format a DateTime object to a string.
extension DateTimeExtension on DateTime? {
  String? getFormattedDate([String format = 'dd-MM-yyyy']) {
    if (this == null) return null;

    return DateFormat(format).format(this!);
  }
}

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
