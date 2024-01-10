import 'package:flutter/material.dart';

String formatTime(TimeOfDay time) {
  // Format the time as hh:mm am/pm
  int hour = time.hourOfPeriod;
  int minute = time.minute;
  String period = time.period == DayPeriod.am ? 'AM' : 'PM';

  String hourString = (hour % 12).toString().padLeft(2, '0');
  String minuteString = minute.toString().padLeft(2, '0');

  return '$hourString:$minuteString $period';
}