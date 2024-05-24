import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateConversions {
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

  static String getDateFromTimestamp(int timestamp, {String? dateFormat}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return DateFormat(dateFormat ?? "dd/MM/yyyy").format(date);
  }

  static int dateToTimeStamp(String dateTime) {
    try {
      return getFormattedDateToDateTime(dateTime)!
          .toUtc()
          .millisecondsSinceEpoch;
    } catch (e) {
      return 0;
    }
  }

  static getYearsAndMonthsFromDateTime(DateTime dateTime,
      [bool getMonths = false,]) {
    int days = DateTime.now().difference(dateTime).inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;

    return getMonths ? months : years;
  }

  static String timeStampToDate(int? timeInMillis, {String? format}) {
    if (timeInMillis == null) return '';
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);

      return DateFormat(format ?? 'dd/MM/yyyy').format(date);
    } catch (e) {
      return e.toString();
    }
  }

  static String getMonth(DateTime date) {
    //Returns Month Abbreviation For eg. March will be returned as Mar
    try {
      return DateFormat.MMM().format(date);
    } catch (e) {
      return '';
    }
  }

  static String getDay(int timeInMillis) {
    //Returns Day Abbreviation For eg. Sunday will be returned as Sun
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);

      return DateFormat.E().format(date);
    } catch (e) {
      return '';
    }
  }
}
