const attendance = Attendance();
const acknowledgementSuccess = AcknowledgementSuccess();

class AcknowledgementSuccess {
  const AcknowledgementSuccess();

  String get actionLabelText => 'ACKNOWLEDGEMENT_SUCCESS_ACTION_LABEL_TEXT';

  String get acknowledgementDescriptionText =>
      'ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT';

  String get acknowledgementLabelText => 'ACKNOWLEDGEMENT_SUCCESS_LABEL_TEXT';

  String get goToHome => 'GO_TO_HOME_SCREEN';
  String get downloadmoredata => 'DOWNLOAD_MORE_DATA';
  String get dataDownloadedSuccessLabel => 'DATA_DOWNLOADED_SUCCESS_LABEL';
}


class Attendance {
  const Attendance();

  String get viewAttendanceLabel => 'HOME_VIEW_ATTENDANCE_LABEL';

  String get selectSession => 'SESSION_SELECTION_HEADER';

  String get dateOfSession => 'SESSION_DATE_OF_SESSION';

  String get sessionDescForRadio => 'SESSION_RADIO_INFO';

  String get missedAttendanceInfo => 'MISSED_ATTENDANCE_INFO';

  String get missedAttendanceDesc => 'MISSED_ATTENDANCE_DESC';

  String get viewAttendance => 'BUTTON_VIEW_ATTENDANCE';

  String get markAttendance => 'BUTTON_MARK_ATTENDANCE';

  String get tableHeaderName => 'TABLE_HEADER_NAME';

  String get tableHeaderAttendance => 'TABLE_HEADER_ATTENDANCE';

  String get tableHeaderUserId => 'TABLE_HEADER_USERID';

  String get markAttendanceLabel => "LABEL_MARK_ATTENDANCE";

  String get closeButton => "CLOSE_BUTTON";

  String get retryButton => "RETRY_BUTTON";

  String get proceed => "PROCEED_BUTTON";

  String get confirmationLabel => "CONFIRMATION_LABEL";

  String get confirmationDesc => "CONFIRMATION_DESCRIPTION";

  String get confirmationDescNote => "CONFIRMATION_DESCRIPTION_NOTE";

  String get goBackButton => "GO_BACK_BUTTON";

  String get checkAttendanceMark => "CHECK_ATTENDANCE_MARK";

  String get backToAttendanceManager => "BACK_TO_ATTENDANCE_MANAGER";

  String get attendanceRegistarLabel => "ATTENDANCE_REGISTAR_LABEL";

  String get somethingWentWrong => "SOMETHING_WENT_WRONG";

  String get pleaseTryAgain => "PLEASE_TRY_AGAIN";

  String get retry => "CORE_COMMON_NULL";
}