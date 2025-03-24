import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

class DigitDateUtils {
  static String getDateString(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  // Function to parse the provided date string and return a DateTime object.
  static DateTime? getFormattedDateToDateTime(String date) {
    try {
      DateFormat inputFormat;
      inputFormat = date.contains('-')
          ? DateFormat('dd-MM-yyyy')
          : DateFormat('dd/MM/yyyy');
      DateTime inputDate = inputFormat.parse(date);

      return inputDate;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }

  // Function to get a formatted date string from the provided timestamp in milliseconds.
  static String getDateFromTimestamp(int timestamp, {String? dateFormat}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(dateFormat ?? "dd/MM/yyyy").format(date);
  }
}
