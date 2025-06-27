import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AttendanceDateTimeManagement {
  static int getMillisecondEpoch(
    DateTime k,
    dynamic sessionCode,
    String entryTime,
  ) {
    if (sessionCode == 0) {
      if (entryTime == "entryTime") {
        DateTime nineAM = DateTime(k.year, k.month, k.day, 9);

        int millisecondsSinceEpoch = nineAM.millisecondsSinceEpoch;

        return millisecondsSinceEpoch;
      } else {
        DateTime twelvePM = DateTime(k.year, k.month, k.day, 11, 58);

        int millisecondsSinceEpoch = twelvePM.millisecondsSinceEpoch;

        return millisecondsSinceEpoch;
      }
    } else {
      if (entryTime == "entryTime") {
        DateTime twelvePM = DateTime(k.year, k.month, k.day, 12, 5);

        int millisecondsSinceEpoch = twelvePM.millisecondsSinceEpoch;

        return millisecondsSinceEpoch;
      } else {
        DateTime sixPM = DateTime(k.year, k.month, k.day, 18);

        int millisecondsSinceEpoch = sixPM.millisecondsSinceEpoch;

        return millisecondsSinceEpoch;
      }
    }
  }

  static String getDateString(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  // Function to parse the provided date string and return a DateTime object.
  static DateTime? getFormattedDateToDateTime(String date) {
    try {
      DateFormat inputFormat;
      inputFormat = DateFormat('dd MMM yyyy');
      DateTime inputDate = inputFormat.parse(date);

      return inputDate;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }

  // Function to get a formatted date string based on the provided date string and date format.
  static getFilteredDate(String date, {String? dateFormat}) {
    if (date.trim().isEmpty) return '';
    try {
      var dateTime = DateTime.parse(date).toLocal();
      return DateFormat(dateFormat ?? "dd MMM yyyy").format(dateTime);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Function to get a formatted date string from the provided timestamp in milliseconds.
  static String getDateFromTimestamp(int timestamp, {String? dateFormat}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(dateFormat ?? "dd/MM/yyyy").format(date);
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }
}
