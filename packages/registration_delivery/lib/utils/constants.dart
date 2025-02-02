import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';

import '../registration_delivery.dart';

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

class ChildrenBeneficiaries {
  HouseholdModel? household;
  IndividualModel? individual;
  ProjectBeneficiaryModel? projectBeneficiary;
  List<TaskModel>? tasks;
  List<SideEffectModel>? sideEffects;
  List<ReferralModel>? referrals;
  ChildrenBeneficiaries({
    this.household,
    this.individual,
    this.projectBeneficiary,
    this.tasks,
    this.sideEffects,
    this.referrals,
  });
}

const String age = "age";
const String height = "height";
const String gender = "gender";

class StatusKeys {
  bool isNotEligible;
  bool isBeneficiaryRefused;
  bool isBeneficiaryReferred;
  bool isStatusReset;
  StatusKeys(this.isNotEligible, this.isBeneficiaryRefused,
      this.isBeneficiaryReferred, this.isStatusReset);
}

class TaskResourceInfo {
  String productName;
  String quantityDelivered;

  TaskResourceInfo(
    this.productName,
    this.quantityDelivered,
  );
}
