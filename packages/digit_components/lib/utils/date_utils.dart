import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DigitDateUtils {
  // Function to calculate age in years and months based on the selected date.
  static DigitDOBAge calculateAge(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    int ageInYears = currentDate.year - selectedDate.year;
    int ageInMonths = currentDate.month - selectedDate.month;

    if (currentDate.day < selectedDate.day) {
      ageInMonths--;
    }

    if (ageInMonths < 0) {
      ageInYears--;
      ageInMonths += 12;
    }

    return DigitDOBAge(ageInYears, ageInMonths);
  }

  // Function to get a formatted date string based on the provided date string and date format.
  static getFilteredDate(String date, {String? dateFormat}) {
    if (date.trim().isEmpty) return '';
    try {
      var dateTime = DateTime.parse(date).toLocal();
      return DateFormat(dateFormat ?? "dd/MM/yyyy").format(dateTime);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
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

  // Function to convert a date string to a timestamp in milliseconds.
  static int dateToTimeStamp(String dateTime) {
    try {
      return getFormattedDateToDateTime(dateTime)!
          .toUtc()
          .millisecondsSinceEpoch;
    } catch (e) {
      return 0;
    }
  }

  // Function to get the number of years or months between a provided date and the current date.
  static getYearsAndMonthsFromDateTime(
    DateTime dateTime, [
    bool getMonths = false,
  ]) {
    int days = DateTime.now().difference(dateTime).inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;

    return getMonths ? months : years;
  }

  // Function to convert a timestamp to a formatted date string based on the provided format.
  static String timeStampToDate(int? timeInMillis, {String? format}) {
    if (timeInMillis == null) return '';
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      return DateFormat(format ?? 'dd/MM/yyyy').format(date);
    } catch (e) {
      return e.toString();
    }
  }

  // Function to get the abbreviated month name from the provided date.
  static String getMonth(DateTime date) {
    try {
      return DateFormat.MMM().format(date);
    } catch (e) {
      return '';
    }
  }

  // Function to get the abbreviated day name from the provided timestamp in milliseconds.
  static String getDay(int timeInMillis) {
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      return DateFormat.E().format(date);
    } catch (e) {
      return '';
    }
  }
}

class DigitDOBAge {
  final int years;
  final int months;

  DigitDOBAge(this.years, this.months);
}
