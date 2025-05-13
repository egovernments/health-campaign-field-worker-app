class Constants {
  static List<KeyValue> yesNo = [
    KeyValue('CORE_COMMON_YES', true),
    KeyValue('CORE_COMMON_NO', false),
  ];

  static RegExp mobileNumberRegExp =
      RegExp(r'^(?=.{10}$)[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  final String dateFormat = 'dd/MM/yyyy';
  final String communityHealthWorker = 'Community Health Worker';
  final String deliveryTeam = 'Delivery Team';
  final String notAvailable = 'N/A';
  final String dateTimeExtFormat = 'dd-MM-yyyy';
  final String dateMonthYearFormat = 'dd MMM yyyy';
  static const String checklistViewDateFormat = 'dd/MM/yyyy hh:mm a';
}

class KeyValue {
  String label;
  dynamic key;
  KeyValue(this.label, this.key);
}

const String age = "age";
const String height = "height";
const String gender = "gender";

