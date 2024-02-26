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
}
