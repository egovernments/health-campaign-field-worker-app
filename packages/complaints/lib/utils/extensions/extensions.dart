import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '/utils/utils.dart';

part 'context_utility.dart';

// Extension to convert an integer (epoch) to a DateTime object.
extension EpochToDateTime on int? {
  DateTime? get toDateTime {
    return this == null ? null : DateTime.fromMillisecondsSinceEpoch(this!);
  }
}

extension DateTimeExtension on DateTime? {
  String? getFormattedDate([String format = 'dd-MM-yyyy']) {
    if (this == null) return null;

    return DateFormat(format).format(this!);
  }
}
