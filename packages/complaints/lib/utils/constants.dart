class Constants {
  static String noResultSvg = 'assets/icons/svg/no_result.svg';
  static RegExp mobileNumberRegExp =
      RegExp(r'^(?=.{10}$)[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
}

const complaintKeys = ComplaintKeys();

class ComplaintKeys {
  const ComplaintKeys();
  String get complaintForm => 'COMPLAINTFLOW';
  String get primaryButtonKey => 'PrimaryButton';
  String get title => 'title';
  String get searchComplaints => 'searchComplaints';
  String get filterComplaints => 'filter';
  String get sortComplaints => 'sortComplaints';
  String get acknowledgementTitle => 'AcknowledgementTitle';
  String get acknowledgementDescription => 'AcknowledgementDescription';
  String get secondaryActionLabel => 'SecondaryButton';
}

enum ComplaintsInboxDialogType { search, filter, sort }
