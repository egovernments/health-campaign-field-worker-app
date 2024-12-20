// Importing necessary packages and modules
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:formula_parser/formula_parser.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/models/entities/household.dart';

import '../models/entities/additional_fields_type.dart';
import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/status.dart';
import '../models/entities/task.dart';

/// This class contains custom validators for form controls.
class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(
    AbstractControl<dynamic> control,
  ) {
    return control.value == null ||
            control.value.toString().length >= 2 ||
            control.value.toString().trim().isEmpty
        ? null
        : {'required': true};
  }

  static Map<String, dynamic>? sizeLessThan2(AbstractControl<dynamic> control) {
    return control.value != null && control.value.toString().length <= 2
        ? {'sizeLessThan2': true}
        : null;
  }

  static Map<String, dynamic>? validMobileNumber(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return null;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    if (RegExp(pattern).hasMatch(control.value.toString())) return null;

    if (control.value.toString().length < 10) return {'mobileNumber': true};

    return {'mobileNumber': true};
  }

  static Map<String, dynamic>? minPhoneNumValidation(
    AbstractControl<dynamic> control,
  ) {
    if (control.value != null &&
        control.value.toString().isNotEmpty &&
        control.value.toString().length < 9) {
      return {'minLength': true};
    }
  }
}

bool checkStatus(List<TaskModel>? tasks, ProjectCycle? currentCycle) {
  if (currentCycle == null) {
    return false;
  }

  if (tasks == null || tasks.isEmpty) {
    return true;
  }

  final lastTask = tasks.last;
  final lastTaskCreatedTime = lastTask.clientAuditDetails?.createdTime;

  if (lastTaskCreatedTime == null) {
    return false;
  }

  final date = DateTime.fromMillisecondsSinceEpoch(lastTaskCreatedTime);
  final diff = DateTime.now().difference(date);
  final isLastCycleRunning = lastTaskCreatedTime >= currentCycle.startDate &&
      lastTaskCreatedTime <= currentCycle.endDate;

  if (isLastCycleRunning) {
    if (lastTask.status == Status.delivered.name) {
      return true;
    }
    return diff.inHours >= 24; // [TODO: Move gap between doses to config]
  }

  return true;
}

bool checkIfBeneficiaryRefused(
  List<TaskModel>? tasks,
) {
  final isBeneficiaryRefused = (tasks != null &&
      (tasks ?? []).isNotEmpty &&
      tasks.last.status == Status.beneficiaryRefused.toValue());

  return isBeneficiaryRefused;
}

///  * Returns [true] if the individual is in the same cycle and is eligible for the next dose,
bool checkEligibilityForAgeAndSideEffect(
  DigitDOBAgeConvertor age,
  ProjectTypeModel? projectType,
  TaskModel? tasks,
  List<SideEffectModel>? sideEffects,
) {
  int totalAgeMonths = age.years * 12 + age.months;
  final currentCycle = projectType?.cycles?.firstWhereOrNull(
    (e) =>
        (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
        (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
    // Return null when no matching cycle is found
  );
  if (currentCycle != null &&
      currentCycle.startDate != null &&
      currentCycle.endDate != null) {
    bool recordedSideEffect = false;
    if ((tasks != null) && sideEffects != null && sideEffects.isNotEmpty) {
      final lastTaskTime =
          tasks.clientReferenceId == sideEffects.last.taskClientReferenceId
              ? tasks.clientAuditDetails?.createdTime
              : null;
      recordedSideEffect = lastTaskTime != null &&
          (lastTaskTime >= currentCycle.startDate! &&
              lastTaskTime <= currentCycle.endDate!);

      return projectType?.validMinAge != null &&
              projectType?.validMaxAge != null
          ? totalAgeMonths >= projectType!.validMinAge! &&
                  totalAgeMonths <= projectType.validMaxAge!
              ? recordedSideEffect && !checkStatus([tasks], currentCycle)
                  ? false
                  : true
              : false
          : false;
    } else {
      if (projectType?.validMaxAge != null &&
          projectType?.validMinAge != null) {
        return totalAgeMonths >= projectType!.validMinAge! &&
                totalAgeMonths <= projectType.validMaxAge!
            ? true
            : false;
      }
      return false;
    }
  }

  return false;
}

bool recordedSideEffect(
  ProjectCycle? selectedCycle,
  TaskModel? task,
  List<SideEffectModel>? sideEffects,
) {
  if (selectedCycle != null &&
      selectedCycle.startDate != null &&
      selectedCycle.endDate != null) {
    if ((task != null) && (sideEffects ?? []).isNotEmpty) {
      final lastTaskCreatedTime =
          task.clientReferenceId == sideEffects?.last.taskClientReferenceId
              ? task.clientAuditDetails?.createdTime
              : null;

      return lastTaskCreatedTime != null &&
          lastTaskCreatedTime >= selectedCycle.startDate &&
          lastTaskCreatedTime <= selectedCycle.endDate;
    }
  }

  return false;
}

bool checkIfBeneficiaryReferred(
  List<ReferralModel>? referrals,
  ProjectCycle? currentCycle,
) {
  if (currentCycle?.startDate != null && currentCycle?.endDate != null) {
    final isBeneficiaryReferred = (referrals != null &&
        (referrals ?? []).isNotEmpty &&
        referrals.last.clientAuditDetails!.createdTime >=
            currentCycle!.startDate &&
        referrals.last.clientAuditDetails!.createdTime <= currentCycle.endDate);

    return isBeneficiaryReferred;
  } else {
    return false;
  }
}

DeliveryDoseCriteria? fetchProductVariant(ProjectCycleDelivery? currentDelivery,
    IndividualModel? individualModel, HouseholdModel? householdModel) {
  if (currentDelivery != null) {
    var individualAgeInMonths = 0;
    var gender;
    var roomCount;
    var memberCount;

    if (individualModel != null) {
      final individualAge = DigitDateUtils.calculateAge(
        DigitDateUtils.getFormattedDateToDateTime(
              individualModel.dateOfBirth!,
            ) ??
            DateTime.now(),
      );
      individualAgeInMonths = individualAge.years * 12 + individualAge.months;

      gender = individualModel.gender?.index;
    }
    if (householdModel != null && householdModel.additionalFields != null) {
      memberCount = householdModel.memberCount;
      roomCount = int.tryParse(householdModel.additionalFields?.fields
              .where((h) => h.key == AdditionalFieldsType.noOfRooms.toValue())
              .firstOrNull
              ?.value
              .toString() ??
          '1')!;
    }

    final filteredCriteria = currentDelivery.doseCriteria?.where((criteria) {
      final condition = criteria.condition;
      if (condition != null) {
        final conditions = condition.split('and');

        List expressionParser = [];
        for (var element in conditions) {
          final expression = FormulaParser(
            element,
            {
              'age': individualAgeInMonths,
              if (gender != null) 'gender': gender,
              if (memberCount != null) 'memberCount': memberCount,
              if (roomCount != null) 'roomCount': roomCount
            },
          );
          final error = expression.parse;
          expressionParser.add(error["value"]);
        }

        return expressionParser.where((element) => element == true).length ==
            conditions.length;
      }

      return false;
    }).toList();

    return (filteredCriteria ?? []).isNotEmpty ? filteredCriteria?.first : null;
  }

  return null;
}

String maskString(String input) {
  // Define the character to use for masking (e.g., "*")
  const maskingChar = '*';

  // Create a new string with the same length as the input string
  final maskedString =
      List<String>.generate(input.length, (index) => maskingChar).join();

  return maskedString;
}

class Coordinate {
  final double? latitude;
  final double? longitude;

  Coordinate(this.latitude, this.longitude);
}

double? calculateDistance(Coordinate? start, Coordinate? end) {
  const double earthRadius = 6371.0; // Earth's radius in kilometers

  double toRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  if (start?.latitude != null &&
      start?.longitude != null &&
      end?.latitude != null &&
      end?.longitude != null) {
    double lat1Rad = toRadians(start!.latitude!);
    double lon1Rad = toRadians(start.longitude!);
    double lat2Rad = toRadians(end!.latitude!);
    double lon2Rad = toRadians(end.longitude!);

    double dLat = lat2Rad - lat1Rad;
    double dLon = lon2Rad - lon1Rad;

    double a = pow(sin(dLat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance;
  }

  return null;
}

// create a singleton class for RegistrationDelivery package where set data and get data methods are defined

class RegistrationDeliverySingleton {
  static final RegistrationDeliverySingleton _singleton =
      RegistrationDeliverySingleton._internal();

  factory RegistrationDeliverySingleton() {
    return _singleton;
  }

  RegistrationDeliverySingleton._internal();

  String? _tenantId;
  String? _loggedInUserUuid;
  UserModel? _loggedInUser;
  double? _maxRadius;
  String? _projectId;
  BeneficiaryType? _beneficiaryType;
  ProjectTypeModel? _projectType;
  ProjectModel? _selectedProject;
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration
  List<String>? _genderOptions;
  List<String>? _idTypeOptions;
  List<String>? _householdDeletionReasonOptions;
  List<String>? _householdMemberDeletionReasonOptions;
  List<String>? _deliveryCommentOptions;
  List<String>? _symptomsTypes;
  List<String>? _searchHouseHoldFilter;
  List<String>? _referralReasons;
  List<String>? _houseStructureTypes;
  List<String>? _refusalReasons;
  HouseholdType? _householdType;

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(
      {required PersistenceConfiguration persistenceConfiguration}) {
    _persistenceConfiguration = persistenceConfiguration;
  }

  void setInitialData({
    required String loggedInUserUuid,
    required double maxRadius,
    required String projectId,
    required BeneficiaryType selectedBeneficiaryType,
    required ProjectTypeModel? projectType,
    required ProjectModel selectedProject,
    required List<String>? genderOptions,
    required List<String>? idTypeOptions,
    required List<String>? householdDeletionReasonOptions,
    required List<String>? householdMemberDeletionReasonOptions,
    required List<String>? deliveryCommentOptions,
    required List<String>? symptomsTypes,
    required List<String>? searchHouseHoldFilter,
    required List<String>? referralReasons,
    required List<String>? houseStructureTypes,
    required List<String>? refusalReasons,
    required UserModel? loggedInUser,
  }) {
    _loggedInUserUuid = loggedInUserUuid;
    _maxRadius = maxRadius;
    _projectId = projectId;
    _beneficiaryType = selectedBeneficiaryType;
    _projectType = projectType;
    _selectedProject = selectedProject;
    _genderOptions = genderOptions;
    _idTypeOptions = idTypeOptions;
    _householdDeletionReasonOptions = householdDeletionReasonOptions;
    _householdMemberDeletionReasonOptions =
        householdMemberDeletionReasonOptions;
    _deliveryCommentOptions = deliveryCommentOptions;
    _symptomsTypes = symptomsTypes;
    _searchHouseHoldFilter = searchHouseHoldFilter;
    _referralReasons = referralReasons;
    _houseStructureTypes = houseStructureTypes;
    _refusalReasons = refusalReasons;
    _loggedInUser = loggedInUser;
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setHouseholdType(HouseholdType? householdType) {
    _householdType = householdType;
  }

  String? get tenantId => _tenantId;
  String? get loggedInUserUuid => _loggedInUserUuid;
  double? get maxRadius => _maxRadius;
  String? get projectId => _projectId;
  BeneficiaryType? get beneficiaryType => _beneficiaryType;
  ProjectTypeModel? get projectType => _projectType;
  ProjectModel? get selectedProject => _selectedProject;
  BoundaryModel? get boundary => _boundaryModel;
  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;
  List<String>? get genderOptions => _genderOptions;
  List<String>? get idTypeOptions => _idTypeOptions;
  List<String>? get householdDeletionReasonOptions =>
      _householdDeletionReasonOptions;
  List<String>? get householdMemberDeletionReasonOptions =>
      _householdMemberDeletionReasonOptions;
  List<String>? get deliveryCommentOptions => _deliveryCommentOptions;
  List<String>? get symptomsTypes => _symptomsTypes;
  List<String>? get searchHouseHoldFilter => _searchHouseHoldFilter;
  List<String>? get referralReasons => _referralReasons;
  List<String>? get houseStructureTypes => _houseStructureTypes;
  List<String>? get refusalReasons => _refusalReasons;
  UserModel? get loggedInUser => _loggedInUser;
  HouseholdType? get householdType => _householdType;
}

bool allDosesDelivered(
  List<TaskModel>? tasks,
  ProjectCycle? selectedCycle,
  List<SideEffectModel>? sideEffects,
  IndividualModel? individualModel,
) {
  if (selectedCycle == null ||
      selectedCycle.id == 0 ||
      (selectedCycle.deliveries ?? []).isEmpty) {
    return true;
  } else {
    if ((tasks ?? []).isNotEmpty) {
      final lastCycle = int.tryParse(tasks?.last.additionalFields?.fields
              .where(
                (e) => e.key == AdditionalFieldsType.cycleIndex.name,
              )
              .firstOrNull
              ?.value ??
          '');
      final lastDose = int.tryParse(tasks?.last.additionalFields?.fields
              .where(
                (e) => e.key == AdditionalFieldsType.doseIndex.name,
              )
              .firstOrNull
              ?.value ??
          '');
      if (lastDose != null &&
          lastDose == selectedCycle.deliveries?.length &&
          lastCycle != null &&
          lastCycle == selectedCycle.id &&
          tasks?.last.status != Status.delivered.name) {
        return true;
      } else if (selectedCycle.id == lastCycle &&
          tasks?.last.status == Status.delivered.name) {
        return false;
      } else if ((sideEffects ?? []).isNotEmpty) {
        return recordedSideEffect(selectedCycle, tasks?.last, sideEffects);
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

Status getTaskStatus(Iterable<TaskModel> tasks) {
  final statusMap = {
    Status.delivered.toValue(): Status.delivered,
    Status.notAdministered.toValue(): Status.notAdministered,
    Status.visited.toValue(): Status.visited,
    Status.notVisited.toValue(): Status.notVisited,
    Status.beneficiaryRefused.toValue(): Status.beneficiaryRefused,
    Status.beneficiaryReferred.toValue(): Status.beneficiaryReferred,
    Status.administeredSuccess.toValue(): Status.administeredSuccess,
    Status.administeredFailed.toValue(): Status.administeredFailed,
    Status.inComplete.toValue(): Status.inComplete,
    Status.toAdminister.toValue(): Status.toAdminister,
    Status.closeHousehold.toValue(): Status.closeHousehold,
  };

  if (tasks.isEmpty) {
    return Status.registered.toValue();
  } else {
    final mappedStatus =
        statusMap[tasks.lastOrNull!.status ?? Status.registered];
    if (mappedStatus != null) {
      return mappedStatus;
    }
  }

  return Status.registered.toValue();
}
