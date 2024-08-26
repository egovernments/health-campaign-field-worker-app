import 'package:isar/isar.dart';

part 'app_configuration.g.dart';

@Collection()
class AppConfiguration {
  Id id = Isar.autoIncrement;

  @Name("NETWORK_DETECTION")
  late String? networkDetection;

  @Name("PERSISTENCE_MODE")
  late String? persistenceMode;

  @Name("SYNC_METHOD")
  late String? syncMethod;

  @Name("PROXIMITY_SEARCH_RANGE")
  late double? maxRadius;

  @Name("SYNC_TRIGGER")
  late String? syncTrigger;

  @Name("LANGUAGES")
  late List<Languages>? languages;

  @Name("BACKEND_INTERFACE")
  late BackendInterface? backendInterface;

  @Name('GENDER_OPTIONS_POPULATOR')
  late List<GenderOptions>? genderOptions;

  @Name('HOUSEHOLD_DELETION_REASON_OPTIONS')
  late List<HouseholdDeletionReasonOptions>? householdDeletionReasonOptions;

  @Name('HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  late List<HouseholdMemberDeletionReasonOptions>?
      householdMemberDeletionReasonOptions;

  @Name('CHECKLIST_TYPES')
  late List<ChecklistTypes>? checklistTypes;

  @Name('BACKGROUND_SERVICE_CONFIG')
  late BackgroundServiceConfig? backgroundServiceConfig;

  @Name('BANDWIDTH_BATCH_SIZE')
  late List<BandwidthBatchSize>? bandwidthBatchSize;

  @Name('DOWNSYNC-BANDWIDTH_BATCH_SIZE')
  late List<BandwidthBatchSize>? downSyncBandwidthBatchSize;

  @Name('ID_TYPE_OPTIONS_POPULATOR')
  late List<IdTypeOptions>? idTypeOptions;

  @Name('DELIVERY_COMMENT_OPTIONS_POPULATOR')
  late List<DeliveryCommentOptions>? deliveryCommentOptions;

  @Name('TRANSPORT_TYPES')
  late List<TransportTypes>? transportTypes;

  @Name('COMPLAINT_TYPES')
  late List<ComplaintTypes>? complaintTypes;

  @Name('CALL_SUPPORT')
  late List<CallSupportList>? callSupportOptions;

  @Name("TENANT_ID")
  late String? tenantId;

  @Name('FIREBASE_CONFIG')
  FirebaseConfig? firebaseConfig;

  late List<SymptomsTypes>? symptomsTypes;

  @Name('SEARCH_HOUSEHOLD_FILTERS')
  late List<SearchHouseHoldFilters>? searchHouseHoldFilters;

  late List<ReferralReasons>? referralReasons;
  late List<HouseStructureTypes>? houseStructureTypes;
  late List<RefusalReasons>? refusalReasons;
}

@embedded
class Languages {
  late String label;
  late String value;
}

@embedded
class BackendInterface {
  @Name("interfaces")
  late List<Interfaces> interfaces;
}

@embedded
class GenderOptions {
  late String name;
  late String code;
}

@embedded
class IdTypeOptions {
  late String name;
  late String code;
}

@embedded
class DeliveryCommentOptions {
  late String name;
  late String code;
}

@embedded
class BandwidthBatchSize {
  @Name("MAX_RANGE")
  late double maxRange;
  @Name("MIN_RANGE")
  late double minRange;
  @Name("BATCH_SIZE")
  late int batchSize;
}

@embedded
class Interfaces {
  late String type;
  late String name;
  late Config confg;
}

@embedded
class Config {
  late int localStoreTTL;
}

@embedded
class ChecklistTypes {
  late String name;
  late String code;
}

@embedded
class TransportTypes {
  late String name;
  late String code;
}

@embedded
class ComplaintTypes {
  late String name;
  late String code;
}

@embedded
class BackgroundServiceConfig {
  @Name("BATTERY_PERCENT_CUT_OFF")
  late int? batteryPercentCutOff;

  @Name("SERVICE_INTERVAL")
  late int? serviceInterval;

  @Name("API_CONCURRENCY")
  late int? apiConcurrency;
}

@embedded
class HouseholdDeletionReasonOptions {
  late String name;
  late String code;
}

@embedded
class SearchHouseHoldFilters {
  late String name;
  late String code;
  late bool active;
}

@embedded
class HouseholdMemberDeletionReasonOptions {
  late String name;
  late String code;
}

@embedded
class CallSupportList {
  late String name;
  late String code;
}

@embedded
class FirebaseConfig {
  @Name("enableCrashlytics")
  late bool? enableCrashlytics;

  @Name("enableAnalytics")
  late bool? enableAnalytics;
}

@embedded
class SymptomsTypes {
  late String code;
  late String name;
  late bool active;
}

@embedded
class ReferralReasons {
  late String code;
  late String name;
  late bool active;
}

@embedded
class HouseStructureTypes {
  late String code;
  late String name;
  late bool active;
}

@embedded
class RefusalReasons {
  late String code;
  late String name;
  late bool active;
}
