// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mdms_master_enums.dart';

class MasterEnumsMapper extends EnumMapper<MasterEnums> {
  MasterEnumsMapper._();

  static MasterEnumsMapper? _instance;
  static MasterEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MasterEnumsMapper._());
    }
    return _instance!;
  }

  static MasterEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MasterEnums decode(dynamic value) {
    switch (value) {
      case "APP_CONFIG":
        return MasterEnums.appConfig;
      case "SYMPTOM_TYPES":
        return MasterEnums.symptomTypes;
      case "REFERRAL_REASONS":
        return MasterEnums.referralReasons;
      case "HOUSE_STRUCTURE_TYPES":
        return MasterEnums.houseStructureTypes;
      case "REFUSAL_REASONS":
        return MasterEnums.refusalReasons;
      case "BANDWIDTH_BATCH_SIZE":
        return MasterEnums.bandWidthBatchSize;
      case "DOWNSYNC-BANDWIDTH_BATCH_SIZE":
        return MasterEnums.downSyncBandwidthBatchSize;
      case "HOUSEHOLD_DELETION_REASON_OPTIONS":
        return MasterEnums.hhDelReasons;
      case "HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS":
        return MasterEnums.hhMemberDelReasons;
      case "BACKGROUND_SERVICE_CONFIG":
        return MasterEnums.backgroundServiceConfig;
      case "CHECKLIST_TYPES":
        return MasterEnums.checklistTypes;
      case "ID_TYPE_OPTIONS_POPULATOR":
        return MasterEnums.idTypes;
      case "DELIVERY_COMMENT_OPTIONS_POPULATOR":
        return MasterEnums.deliveryComments;
      case "BACKEND_INTERFACE":
        return MasterEnums.backendInterface;
      case "CALL_SUPPORT":
        return MasterEnums.callSupport;
      case "TRANSPORT_TYPES":
        return MasterEnums.transportTypes;
      case "StateInfo":
        return MasterEnums.stateInfo;
      case "GenderType":
        return MasterEnums.genderType;
      case "ROW_VERSIONS":
        return MasterEnums.rowVersion;
      case "ServiceDefs":
        return MasterEnums.serviceDefinitions;
      case "FIREBASE_CONFIG":
        return MasterEnums.firebaseConfig;
      case "SEARCH_HOUSEHOLD_FILTERS":
        return MasterEnums.searchHouseHoldFilters;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MasterEnums self) {
    switch (self) {
      case MasterEnums.appConfig:
        return "APP_CONFIG";
      case MasterEnums.symptomTypes:
        return "SYMPTOM_TYPES";
      case MasterEnums.referralReasons:
        return "REFERRAL_REASONS";
      case MasterEnums.houseStructureTypes:
        return "HOUSE_STRUCTURE_TYPES";
      case MasterEnums.refusalReasons:
        return "REFUSAL_REASONS";
      case MasterEnums.bandWidthBatchSize:
        return "BANDWIDTH_BATCH_SIZE";
      case MasterEnums.downSyncBandwidthBatchSize:
        return "DOWNSYNC-BANDWIDTH_BATCH_SIZE";
      case MasterEnums.hhDelReasons:
        return "HOUSEHOLD_DELETION_REASON_OPTIONS";
      case MasterEnums.hhMemberDelReasons:
        return "HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS";
      case MasterEnums.backgroundServiceConfig:
        return "BACKGROUND_SERVICE_CONFIG";
      case MasterEnums.checklistTypes:
        return "CHECKLIST_TYPES";
      case MasterEnums.idTypes:
        return "ID_TYPE_OPTIONS_POPULATOR";
      case MasterEnums.deliveryComments:
        return "DELIVERY_COMMENT_OPTIONS_POPULATOR";
      case MasterEnums.backendInterface:
        return "BACKEND_INTERFACE";
      case MasterEnums.callSupport:
        return "CALL_SUPPORT";
      case MasterEnums.transportTypes:
        return "TRANSPORT_TYPES";
      case MasterEnums.stateInfo:
        return "StateInfo";
      case MasterEnums.genderType:
        return "GenderType";
      case MasterEnums.rowVersion:
        return "ROW_VERSIONS";
      case MasterEnums.serviceDefinitions:
        return "ServiceDefs";
      case MasterEnums.firebaseConfig:
        return "FIREBASE_CONFIG";
      case MasterEnums.searchHouseHoldFilters:
        return "SEARCH_HOUSEHOLD_FILTERS";
    }
  }
}

extension MasterEnumsMapperExtension on MasterEnums {
  dynamic toValue() {
    MasterEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MasterEnums>(this);
  }
}
