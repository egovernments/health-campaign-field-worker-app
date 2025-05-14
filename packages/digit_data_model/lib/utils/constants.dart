import 'package:digit_data_model/data_model.dart';

/// The `EntityPlurals` class provides a utility method to get the plural form of an entity name.
/// This can be useful when working with collections of entities, for example when naming database tables or generating URLs.
class EntityPlurals {
  /// Returns the plural form of the given entity name.
  ///
  /// The [entity] parameter is the name of the entity in singular form.
  ///
  /// This method handles a predefined list of special cases where the plural form does not simply involve appending an 's' to the singular form.
  /// For all other entity names, this method returns the entity name with an 's' appended.
  static String getPluralForEntityName(String entity) {
    switch (entity) {
      case 'Beneficiary':
        return 'Beneficiaries';
      case 'ProjectBeneficiary':
        return 'ProjectBeneficiaries';
      case 'Address':
        return 'Addresses';
      case 'Facility':
        return 'Facilities';
      case 'ProjectFacility':
        return 'ProjectFacilities';
      case 'Project':
        return 'Projects';
      case 'Stock':
        return 'Stock';
      case 'StockReconciliation':
        return 'StockReconciliation';
      case 'User':
        return 'user';
      case 'AttendanceRegister':
        return 'attendanceRegister';
      case 'Attendance':
        return 'attendance';
      default:
        return '${entity}s';
    }
  }
}

class DataModels {
  static DataModelType getDataModelForEntityName(String entity) {
    switch (entity) {
      case 'Households':
        return DataModelType.household;
      case 'HouseholdMembers':
        return DataModelType.householdMember;
      case 'Individuals':
        return DataModelType.individual;
      case 'ProjectBeneficiaries':
        return DataModelType.projectBeneficiary;
      case 'Tasks':
        return DataModelType.task;
      case 'SideEffects':
        return DataModelType.sideEffect;
      case 'Referrals':
        return DataModelType.referral;
      case 'HFReferrals':
        return DataModelType.hFReferral;
      case 'Services':
        return DataModelType.service;
      default:
        return DataModelType.householdMember;
    }
  }
}
