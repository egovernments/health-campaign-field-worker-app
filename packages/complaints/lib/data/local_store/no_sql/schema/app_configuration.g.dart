// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configuration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppConfigurationCollection on Isar {
  IsarCollection<AppConfiguration> get appConfigurations => this.collection();
}

const AppConfigurationSchema = CollectionSchema(
  name: r'AppConfiguration',
  id: 7780200649169323909,
  properties: {
    r'BACKEND_INTERFACE': PropertySchema(
      id: 0,
      name: r'BACKEND_INTERFACE',
      type: IsarType.object,
      target: r'BackendInterface',
    ),
    r'BACKGROUND_SERVICE_CONFIG': PropertySchema(
      id: 1,
      name: r'BACKGROUND_SERVICE_CONFIG',
      type: IsarType.object,
      target: r'BackgroundServiceConfig',
    ),
    r'BANDWIDTH_BATCH_SIZE': PropertySchema(
      id: 2,
      name: r'BANDWIDTH_BATCH_SIZE',
      type: IsarType.objectList,
      target: r'BandwidthBatchSize',
    ),
    r'CALL_SUPPORT': PropertySchema(
      id: 3,
      name: r'CALL_SUPPORT',
      type: IsarType.objectList,
      target: r'CallSupportList',
    ),
    r'CHECKLIST_TYPES': PropertySchema(
      id: 4,
      name: r'CHECKLIST_TYPES',
      type: IsarType.objectList,
      target: r'ChecklistTypes',
    ),
    r'COMPLAINT_TYPES': PropertySchema(
      id: 5,
      name: r'COMPLAINT_TYPES',
      type: IsarType.objectList,
      target: r'ComplaintTypes',
    ),
    r'DELIVERY_COMMENT_OPTIONS_POPULATOR': PropertySchema(
      id: 6,
      name: r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
      type: IsarType.objectList,
      target: r'DeliveryCommentOptions',
    ),
    r'DOWNSYNC-BANDWIDTH_BATCH_SIZE': PropertySchema(
      id: 7,
      name: r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
      type: IsarType.objectList,
      target: r'BandwidthBatchSize',
    ),
    r'FIREBASE_CONFIG': PropertySchema(
      id: 8,
      name: r'FIREBASE_CONFIG',
      type: IsarType.object,
      target: r'FirebaseConfig',
    ),
    r'GENDER_OPTIONS_POPULATOR': PropertySchema(
      id: 9,
      name: r'GENDER_OPTIONS_POPULATOR',
      type: IsarType.objectList,
      target: r'GenderOptions',
    ),
    r'HOUSEHOLD_DELETION_REASON_OPTIONS': PropertySchema(
      id: 10,
      name: r'HOUSEHOLD_DELETION_REASON_OPTIONS',
      type: IsarType.objectList,
      target: r'HouseholdDeletionReasonOptions',
    ),
    r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS': PropertySchema(
      id: 11,
      name: r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
      type: IsarType.objectList,
      target: r'HouseholdMemberDeletionReasonOptions',
    ),
    r'ID_TYPE_OPTIONS_POPULATOR': PropertySchema(
      id: 12,
      name: r'ID_TYPE_OPTIONS_POPULATOR',
      type: IsarType.objectList,
      target: r'IdTypeOptions',
    ),
    r'LANGUAGES': PropertySchema(
      id: 13,
      name: r'LANGUAGES',
      type: IsarType.objectList,
      target: r'Languages',
    ),
    r'NETWORK_DETECTION': PropertySchema(
      id: 14,
      name: r'NETWORK_DETECTION',
      type: IsarType.string,
    ),
    r'PERSISTENCE_MODE': PropertySchema(
      id: 15,
      name: r'PERSISTENCE_MODE',
      type: IsarType.string,
    ),
    r'PROXIMITY_SEARCH_RANGE': PropertySchema(
      id: 16,
      name: r'PROXIMITY_SEARCH_RANGE',
      type: IsarType.double,
    ),
    r'SEARCH_HOUSEHOLD_FILTERS': PropertySchema(
      id: 17,
      name: r'SEARCH_HOUSEHOLD_FILTERS',
      type: IsarType.objectList,
      target: r'SearchHouseHoldFilters',
    ),
    r'SYNC_METHOD': PropertySchema(
      id: 18,
      name: r'SYNC_METHOD',
      type: IsarType.string,
    ),
    r'SYNC_TRIGGER': PropertySchema(
      id: 19,
      name: r'SYNC_TRIGGER',
      type: IsarType.string,
    ),
    r'TENANT_ID': PropertySchema(
      id: 20,
      name: r'TENANT_ID',
      type: IsarType.string,
    ),
    r'TRANSPORT_TYPES': PropertySchema(
      id: 21,
      name: r'TRANSPORT_TYPES',
      type: IsarType.objectList,
      target: r'TransportTypes',
    ),
    r'houseStructureTypes': PropertySchema(
      id: 22,
      name: r'houseStructureTypes',
      type: IsarType.objectList,
      target: r'HouseStructureTypes',
    ),
    r'referralReasons': PropertySchema(
      id: 23,
      name: r'referralReasons',
      type: IsarType.objectList,
      target: r'ReferralReasons',
    ),
    r'refusalReasons': PropertySchema(
      id: 24,
      name: r'refusalReasons',
      type: IsarType.objectList,
      target: r'RefusalReasons',
    ),
    r'symptomsTypes': PropertySchema(
      id: 25,
      name: r'symptomsTypes',
      type: IsarType.objectList,
      target: r'SymptomsTypes',
    )
  },
  estimateSize: _appConfigurationEstimateSize,
  serialize: _appConfigurationSerialize,
  deserialize: _appConfigurationDeserialize,
  deserializeProp: _appConfigurationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Languages': LanguagesSchema,
    r'BackendInterface': BackendInterfaceSchema,
    r'Interfaces': InterfacesSchema,
    r'Config': ConfigSchema,
    r'GenderOptions': GenderOptionsSchema,
    r'HouseholdDeletionReasonOptions': HouseholdDeletionReasonOptionsSchema,
    r'HouseholdMemberDeletionReasonOptions':
        HouseholdMemberDeletionReasonOptionsSchema,
    r'ChecklistTypes': ChecklistTypesSchema,
    r'BackgroundServiceConfig': BackgroundServiceConfigSchema,
    r'BandwidthBatchSize': BandwidthBatchSizeSchema,
    r'IdTypeOptions': IdTypeOptionsSchema,
    r'DeliveryCommentOptions': DeliveryCommentOptionsSchema,
    r'TransportTypes': TransportTypesSchema,
    r'ComplaintTypes': ComplaintTypesSchema,
    r'CallSupportList': CallSupportListSchema,
    r'FirebaseConfig': FirebaseConfigSchema,
    r'SymptomsTypes': SymptomsTypesSchema,
    r'SearchHouseHoldFilters': SearchHouseHoldFiltersSchema,
    r'ReferralReasons': ReferralReasonsSchema,
    r'HouseStructureTypes': HouseStructureTypesSchema,
    r'RefusalReasons': RefusalReasonsSchema
  },
  getId: _appConfigurationGetId,
  getLinks: _appConfigurationGetLinks,
  attach: _appConfigurationAttach,
  version: '3.1.0+1',
);

int _appConfigurationEstimateSize(
  AppConfiguration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backendInterface;
    if (value != null) {
      bytesCount += 3 +
          BackendInterfaceSchema.estimateSize(
              value, allOffsets[BackendInterface]!, allOffsets);
    }
  }
  {
    final value = object.backgroundServiceConfig;
    if (value != null) {
      bytesCount += 3 +
          BackgroundServiceConfigSchema.estimateSize(
              value, allOffsets[BackgroundServiceConfig]!, allOffsets);
    }
  }
  {
    final list = object.bandwidthBatchSize;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[BandwidthBatchSize]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              BandwidthBatchSizeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.callSupportOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CallSupportList]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CallSupportListSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.checklistTypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ChecklistTypes]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ChecklistTypesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.complaintTypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ComplaintTypes]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ComplaintTypesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.deliveryCommentOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DeliveryCommentOptions]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += DeliveryCommentOptionsSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.downSyncBandwidthBatchSize;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[BandwidthBatchSize]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              BandwidthBatchSizeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.firebaseConfig;
    if (value != null) {
      bytesCount += 3 +
          FirebaseConfigSchema.estimateSize(
              value, allOffsets[FirebaseConfig]!, allOffsets);
    }
  }
  {
    final list = object.genderOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[GenderOptions]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              GenderOptionsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.householdDeletionReasonOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[HouseholdDeletionReasonOptions]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += HouseholdDeletionReasonOptionsSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.householdMemberDeletionReasonOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[HouseholdMemberDeletionReasonOptions]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += HouseholdMemberDeletionReasonOptionsSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.idTypeOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IdTypeOptions]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IdTypeOptionsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.languages;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Languages]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              LanguagesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.networkDetection;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.persistenceMode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.searchHouseHoldFilters;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SearchHouseHoldFilters]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += SearchHouseHoldFiltersSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.syncMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syncTrigger;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tenantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.transportTypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[TransportTypes]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              TransportTypesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.houseStructureTypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[HouseStructureTypes]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += HouseStructureTypesSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.referralReasons;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ReferralReasons]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ReferralReasonsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.refusalReasons;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[RefusalReasons]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              RefusalReasonsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.symptomsTypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SymptomsTypes]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SymptomsTypesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _appConfigurationSerialize(
  AppConfiguration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<BackendInterface>(
    offsets[0],
    allOffsets,
    BackendInterfaceSchema.serialize,
    object.backendInterface,
  );
  writer.writeObject<BackgroundServiceConfig>(
    offsets[1],
    allOffsets,
    BackgroundServiceConfigSchema.serialize,
    object.backgroundServiceConfig,
  );
  writer.writeObjectList<BandwidthBatchSize>(
    offsets[2],
    allOffsets,
    BandwidthBatchSizeSchema.serialize,
    object.bandwidthBatchSize,
  );
  writer.writeObjectList<CallSupportList>(
    offsets[3],
    allOffsets,
    CallSupportListSchema.serialize,
    object.callSupportOptions,
  );
  writer.writeObjectList<ChecklistTypes>(
    offsets[4],
    allOffsets,
    ChecklistTypesSchema.serialize,
    object.checklistTypes,
  );
  writer.writeObjectList<ComplaintTypes>(
    offsets[5],
    allOffsets,
    ComplaintTypesSchema.serialize,
    object.complaintTypes,
  );
  writer.writeObjectList<DeliveryCommentOptions>(
    offsets[6],
    allOffsets,
    DeliveryCommentOptionsSchema.serialize,
    object.deliveryCommentOptions,
  );
  writer.writeObjectList<BandwidthBatchSize>(
    offsets[7],
    allOffsets,
    BandwidthBatchSizeSchema.serialize,
    object.downSyncBandwidthBatchSize,
  );
  writer.writeObject<FirebaseConfig>(
    offsets[8],
    allOffsets,
    FirebaseConfigSchema.serialize,
    object.firebaseConfig,
  );
  writer.writeObjectList<GenderOptions>(
    offsets[9],
    allOffsets,
    GenderOptionsSchema.serialize,
    object.genderOptions,
  );
  writer.writeObjectList<HouseholdDeletionReasonOptions>(
    offsets[10],
    allOffsets,
    HouseholdDeletionReasonOptionsSchema.serialize,
    object.householdDeletionReasonOptions,
  );
  writer.writeObjectList<HouseholdMemberDeletionReasonOptions>(
    offsets[11],
    allOffsets,
    HouseholdMemberDeletionReasonOptionsSchema.serialize,
    object.householdMemberDeletionReasonOptions,
  );
  writer.writeObjectList<IdTypeOptions>(
    offsets[12],
    allOffsets,
    IdTypeOptionsSchema.serialize,
    object.idTypeOptions,
  );
  writer.writeObjectList<Languages>(
    offsets[13],
    allOffsets,
    LanguagesSchema.serialize,
    object.languages,
  );
  writer.writeString(offsets[14], object.networkDetection);
  writer.writeString(offsets[15], object.persistenceMode);
  writer.writeDouble(offsets[16], object.maxRadius);
  writer.writeObjectList<SearchHouseHoldFilters>(
    offsets[17],
    allOffsets,
    SearchHouseHoldFiltersSchema.serialize,
    object.searchHouseHoldFilters,
  );
  writer.writeString(offsets[18], object.syncMethod);
  writer.writeString(offsets[19], object.syncTrigger);
  writer.writeString(offsets[20], object.tenantId);
  writer.writeObjectList<TransportTypes>(
    offsets[21],
    allOffsets,
    TransportTypesSchema.serialize,
    object.transportTypes,
  );
  writer.writeObjectList<HouseStructureTypes>(
    offsets[22],
    allOffsets,
    HouseStructureTypesSchema.serialize,
    object.houseStructureTypes,
  );
  writer.writeObjectList<ReferralReasons>(
    offsets[23],
    allOffsets,
    ReferralReasonsSchema.serialize,
    object.referralReasons,
  );
  writer.writeObjectList<RefusalReasons>(
    offsets[24],
    allOffsets,
    RefusalReasonsSchema.serialize,
    object.refusalReasons,
  );
  writer.writeObjectList<SymptomsTypes>(
    offsets[25],
    allOffsets,
    SymptomsTypesSchema.serialize,
    object.symptomsTypes,
  );
}

AppConfiguration _appConfigurationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppConfiguration();
  object.backendInterface = reader.readObjectOrNull<BackendInterface>(
    offsets[0],
    BackendInterfaceSchema.deserialize,
    allOffsets,
  );
  object.backgroundServiceConfig =
      reader.readObjectOrNull<BackgroundServiceConfig>(
    offsets[1],
    BackgroundServiceConfigSchema.deserialize,
    allOffsets,
  );
  object.bandwidthBatchSize = reader.readObjectList<BandwidthBatchSize>(
    offsets[2],
    BandwidthBatchSizeSchema.deserialize,
    allOffsets,
    BandwidthBatchSize(),
  );
  object.callSupportOptions = reader.readObjectList<CallSupportList>(
    offsets[3],
    CallSupportListSchema.deserialize,
    allOffsets,
    CallSupportList(),
  );
  object.checklistTypes = reader.readObjectList<ChecklistTypes>(
    offsets[4],
    ChecklistTypesSchema.deserialize,
    allOffsets,
    ChecklistTypes(),
  );
  object.complaintTypes = reader.readObjectList<ComplaintTypes>(
    offsets[5],
    ComplaintTypesSchema.deserialize,
    allOffsets,
    ComplaintTypes(),
  );
  object.deliveryCommentOptions = reader.readObjectList<DeliveryCommentOptions>(
    offsets[6],
    DeliveryCommentOptionsSchema.deserialize,
    allOffsets,
    DeliveryCommentOptions(),
  );
  object.downSyncBandwidthBatchSize = reader.readObjectList<BandwidthBatchSize>(
    offsets[7],
    BandwidthBatchSizeSchema.deserialize,
    allOffsets,
    BandwidthBatchSize(),
  );
  object.firebaseConfig = reader.readObjectOrNull<FirebaseConfig>(
    offsets[8],
    FirebaseConfigSchema.deserialize,
    allOffsets,
  );
  object.genderOptions = reader.readObjectList<GenderOptions>(
    offsets[9],
    GenderOptionsSchema.deserialize,
    allOffsets,
    GenderOptions(),
  );
  object.householdDeletionReasonOptions =
      reader.readObjectList<HouseholdDeletionReasonOptions>(
    offsets[10],
    HouseholdDeletionReasonOptionsSchema.deserialize,
    allOffsets,
    HouseholdDeletionReasonOptions(),
  );
  object.householdMemberDeletionReasonOptions =
      reader.readObjectList<HouseholdMemberDeletionReasonOptions>(
    offsets[11],
    HouseholdMemberDeletionReasonOptionsSchema.deserialize,
    allOffsets,
    HouseholdMemberDeletionReasonOptions(),
  );
  object.idTypeOptions = reader.readObjectList<IdTypeOptions>(
    offsets[12],
    IdTypeOptionsSchema.deserialize,
    allOffsets,
    IdTypeOptions(),
  );
  object.languages = reader.readObjectList<Languages>(
    offsets[13],
    LanguagesSchema.deserialize,
    allOffsets,
    Languages(),
  );
  object.networkDetection = reader.readStringOrNull(offsets[14]);
  object.persistenceMode = reader.readStringOrNull(offsets[15]);
  object.maxRadius = reader.readDoubleOrNull(offsets[16]);
  object.searchHouseHoldFilters = reader.readObjectList<SearchHouseHoldFilters>(
    offsets[17],
    SearchHouseHoldFiltersSchema.deserialize,
    allOffsets,
    SearchHouseHoldFilters(),
  );
  object.syncMethod = reader.readStringOrNull(offsets[18]);
  object.syncTrigger = reader.readStringOrNull(offsets[19]);
  object.tenantId = reader.readStringOrNull(offsets[20]);
  object.transportTypes = reader.readObjectList<TransportTypes>(
    offsets[21],
    TransportTypesSchema.deserialize,
    allOffsets,
    TransportTypes(),
  );
  object.houseStructureTypes = reader.readObjectList<HouseStructureTypes>(
    offsets[22],
    HouseStructureTypesSchema.deserialize,
    allOffsets,
    HouseStructureTypes(),
  );
  object.id = id;
  object.referralReasons = reader.readObjectList<ReferralReasons>(
    offsets[23],
    ReferralReasonsSchema.deserialize,
    allOffsets,
    ReferralReasons(),
  );
  object.refusalReasons = reader.readObjectList<RefusalReasons>(
    offsets[24],
    RefusalReasonsSchema.deserialize,
    allOffsets,
    RefusalReasons(),
  );
  object.symptomsTypes = reader.readObjectList<SymptomsTypes>(
    offsets[25],
    SymptomsTypesSchema.deserialize,
    allOffsets,
    SymptomsTypes(),
  );
  return object;
}

P _appConfigurationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<BackendInterface>(
        offset,
        BackendInterfaceSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<BackgroundServiceConfig>(
        offset,
        BackgroundServiceConfigSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectList<BandwidthBatchSize>(
        offset,
        BandwidthBatchSizeSchema.deserialize,
        allOffsets,
        BandwidthBatchSize(),
      )) as P;
    case 3:
      return (reader.readObjectList<CallSupportList>(
        offset,
        CallSupportListSchema.deserialize,
        allOffsets,
        CallSupportList(),
      )) as P;
    case 4:
      return (reader.readObjectList<ChecklistTypes>(
        offset,
        ChecklistTypesSchema.deserialize,
        allOffsets,
        ChecklistTypes(),
      )) as P;
    case 5:
      return (reader.readObjectList<ComplaintTypes>(
        offset,
        ComplaintTypesSchema.deserialize,
        allOffsets,
        ComplaintTypes(),
      )) as P;
    case 6:
      return (reader.readObjectList<DeliveryCommentOptions>(
        offset,
        DeliveryCommentOptionsSchema.deserialize,
        allOffsets,
        DeliveryCommentOptions(),
      )) as P;
    case 7:
      return (reader.readObjectList<BandwidthBatchSize>(
        offset,
        BandwidthBatchSizeSchema.deserialize,
        allOffsets,
        BandwidthBatchSize(),
      )) as P;
    case 8:
      return (reader.readObjectOrNull<FirebaseConfig>(
        offset,
        FirebaseConfigSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readObjectList<GenderOptions>(
        offset,
        GenderOptionsSchema.deserialize,
        allOffsets,
        GenderOptions(),
      )) as P;
    case 10:
      return (reader.readObjectList<HouseholdDeletionReasonOptions>(
        offset,
        HouseholdDeletionReasonOptionsSchema.deserialize,
        allOffsets,
        HouseholdDeletionReasonOptions(),
      )) as P;
    case 11:
      return (reader.readObjectList<HouseholdMemberDeletionReasonOptions>(
        offset,
        HouseholdMemberDeletionReasonOptionsSchema.deserialize,
        allOffsets,
        HouseholdMemberDeletionReasonOptions(),
      )) as P;
    case 12:
      return (reader.readObjectList<IdTypeOptions>(
        offset,
        IdTypeOptionsSchema.deserialize,
        allOffsets,
        IdTypeOptions(),
      )) as P;
    case 13:
      return (reader.readObjectList<Languages>(
        offset,
        LanguagesSchema.deserialize,
        allOffsets,
        Languages(),
      )) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readObjectList<SearchHouseHoldFilters>(
        offset,
        SearchHouseHoldFiltersSchema.deserialize,
        allOffsets,
        SearchHouseHoldFilters(),
      )) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readObjectList<TransportTypes>(
        offset,
        TransportTypesSchema.deserialize,
        allOffsets,
        TransportTypes(),
      )) as P;
    case 22:
      return (reader.readObjectList<HouseStructureTypes>(
        offset,
        HouseStructureTypesSchema.deserialize,
        allOffsets,
        HouseStructureTypes(),
      )) as P;
    case 23:
      return (reader.readObjectList<ReferralReasons>(
        offset,
        ReferralReasonsSchema.deserialize,
        allOffsets,
        ReferralReasons(),
      )) as P;
    case 24:
      return (reader.readObjectList<RefusalReasons>(
        offset,
        RefusalReasonsSchema.deserialize,
        allOffsets,
        RefusalReasons(),
      )) as P;
    case 25:
      return (reader.readObjectList<SymptomsTypes>(
        offset,
        SymptomsTypesSchema.deserialize,
        allOffsets,
        SymptomsTypes(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appConfigurationGetId(AppConfiguration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appConfigurationGetLinks(AppConfiguration object) {
  return [];
}

void _appConfigurationAttach(
    IsarCollection<dynamic> col, Id id, AppConfiguration object) {
  object.id = id;
}

extension AppConfigurationQueryWhereSort
    on QueryBuilder<AppConfiguration, AppConfiguration, QWhere> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppConfigurationQueryWhere
    on QueryBuilder<AppConfiguration, AppConfiguration, QWhereClause> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppConfigurationQueryFilter
    on QueryBuilder<AppConfiguration, AppConfiguration, QFilterCondition> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backendInterfaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'BACKEND_INTERFACE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backendInterfaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'BACKEND_INTERFACE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backgroundServiceConfigIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'BACKGROUND_SERVICE_CONFIG',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backgroundServiceConfigIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'BACKGROUND_SERVICE_CONFIG',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'BANDWIDTH_BATCH_SIZE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'BANDWIDTH_BATCH_SIZE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'BANDWIDTH_BATCH_SIZE',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'CALL_SUPPORT',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'CALL_SUPPORT',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CALL_SUPPORT',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'CHECKLIST_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'CHECKLIST_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'CHECKLIST_TYPES',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'COMPLAINT_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'COMPLAINT_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'COMPLAINT_TYPES',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DELIVERY_COMMENT_OPTIONS_POPULATOR',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'DOWNSYNC-BANDWIDTH_BATCH_SIZE',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      firebaseConfigIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'FIREBASE_CONFIG',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      firebaseConfigIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'FIREBASE_CONFIG',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'GENDER_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'GENDER_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'GENDER_OPTIONS_POPULATOR',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'HOUSEHOLD_DELETION_REASON_OPTIONS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'HOUSEHOLD_DELETION_REASON_OPTIONS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_DELETION_REASON_OPTIONS',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ID_TYPE_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ID_TYPE_OPTIONS_POPULATOR',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ID_TYPE_OPTIONS_POPULATOR',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'LANGUAGES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'LANGUAGES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'LANGUAGES',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'NETWORK_DETECTION',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'NETWORK_DETECTION',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'NETWORK_DETECTION',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'NETWORK_DETECTION',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'NETWORK_DETECTION',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NETWORK_DETECTION',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      networkDetectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'NETWORK_DETECTION',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PERSISTENCE_MODE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PERSISTENCE_MODE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PERSISTENCE_MODE',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PERSISTENCE_MODE',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PERSISTENCE_MODE',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PERSISTENCE_MODE',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      persistenceModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PERSISTENCE_MODE',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PROXIMITY_SEARCH_RANGE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PROXIMITY_SEARCH_RANGE',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PROXIMITY_SEARCH_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PROXIMITY_SEARCH_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PROXIMITY_SEARCH_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      maxRadiusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PROXIMITY_SEARCH_RANGE',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'SEARCH_HOUSEHOLD_FILTERS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'SEARCH_HOUSEHOLD_FILTERS',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'SEARCH_HOUSEHOLD_FILTERS',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'SYNC_METHOD',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'SYNC_METHOD',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'SYNC_METHOD',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'SYNC_METHOD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'SYNC_METHOD',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SYNC_METHOD',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'SYNC_METHOD',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'SYNC_TRIGGER',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'SYNC_TRIGGER',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'SYNC_TRIGGER',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'SYNC_TRIGGER',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'SYNC_TRIGGER',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SYNC_TRIGGER',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      syncTriggerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'SYNC_TRIGGER',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'TENANT_ID',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'TENANT_ID',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'TENANT_ID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'TENANT_ID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'TENANT_ID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'TENANT_ID',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'TENANT_ID',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'TRANSPORT_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'TRANSPORT_TYPES',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'TRANSPORT_TYPES',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'houseStructureTypes',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'houseStructureTypes',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'houseStructureTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referralReasons',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referralReasons',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'referralReasons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'refusalReasons',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'refusalReasons',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'refusalReasons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symptomsTypes',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symptomsTypes',
      ));
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptomsTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AppConfigurationQueryObject
    on QueryBuilder<AppConfiguration, AppConfiguration, QFilterCondition> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backendInterface(FilterQuery<BackendInterface> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'BACKEND_INTERFACE');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      backgroundServiceConfig(FilterQuery<BackgroundServiceConfig> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'BACKGROUND_SERVICE_CONFIG');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      bandwidthBatchSizeElement(FilterQuery<BandwidthBatchSize> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'BANDWIDTH_BATCH_SIZE');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      callSupportOptionsElement(FilterQuery<CallSupportList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'CALL_SUPPORT');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      checklistTypesElement(FilterQuery<ChecklistTypes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'CHECKLIST_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      complaintTypesElement(FilterQuery<ComplaintTypes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'COMPLAINT_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      deliveryCommentOptionsElement(FilterQuery<DeliveryCommentOptions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'DELIVERY_COMMENT_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      downSyncBandwidthBatchSizeElement(FilterQuery<BandwidthBatchSize> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'DOWNSYNC-BANDWIDTH_BATCH_SIZE');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      firebaseConfig(FilterQuery<FirebaseConfig> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'FIREBASE_CONFIG');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      genderOptionsElement(FilterQuery<GenderOptions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'GENDER_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdDeletionReasonOptionsElement(
          FilterQuery<HouseholdDeletionReasonOptions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'HOUSEHOLD_DELETION_REASON_OPTIONS');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      householdMemberDeletionReasonOptionsElement(
          FilterQuery<HouseholdMemberDeletionReasonOptions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      idTypeOptionsElement(FilterQuery<IdTypeOptions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ID_TYPE_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      languagesElement(FilterQuery<Languages> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'LANGUAGES');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      searchHouseHoldFiltersElement(FilterQuery<SearchHouseHoldFilters> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'SEARCH_HOUSEHOLD_FILTERS');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      transportTypesElement(FilterQuery<TransportTypes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'TRANSPORT_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      houseStructureTypesElement(FilterQuery<HouseStructureTypes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'houseStructureTypes');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      referralReasonsElement(FilterQuery<ReferralReasons> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'referralReasons');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      refusalReasonsElement(FilterQuery<RefusalReasons> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'refusalReasons');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterFilterCondition>
      symptomsTypesElement(FilterQuery<SymptomsTypes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'symptomsTypes');
    });
  }
}

extension AppConfigurationQueryLinks
    on QueryBuilder<AppConfiguration, AppConfiguration, QFilterCondition> {}

extension AppConfigurationQuerySortBy
    on QueryBuilder<AppConfiguration, AppConfiguration, QSortBy> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByNetworkDetection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NETWORK_DETECTION', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByNetworkDetectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NETWORK_DETECTION', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByPersistenceMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PERSISTENCE_MODE', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByPersistenceModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PERSISTENCE_MODE', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByMaxRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PROXIMITY_SEARCH_RANGE', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByMaxRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PROXIMITY_SEARCH_RANGE', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortBySyncMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_METHOD', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortBySyncMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_METHOD', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortBySyncTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_TRIGGER', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortBySyncTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_TRIGGER', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TENANT_ID', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TENANT_ID', Sort.desc);
    });
  }
}

extension AppConfigurationQuerySortThenBy
    on QueryBuilder<AppConfiguration, AppConfiguration, QSortThenBy> {
  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByNetworkDetection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NETWORK_DETECTION', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByNetworkDetectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NETWORK_DETECTION', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByPersistenceMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PERSISTENCE_MODE', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByPersistenceModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PERSISTENCE_MODE', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByMaxRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PROXIMITY_SEARCH_RANGE', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByMaxRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PROXIMITY_SEARCH_RANGE', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenBySyncMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_METHOD', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenBySyncMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_METHOD', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenBySyncTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_TRIGGER', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenBySyncTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SYNC_TRIGGER', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TENANT_ID', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TENANT_ID', Sort.desc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AppConfigurationQueryWhereDistinct
    on QueryBuilder<AppConfiguration, AppConfiguration, QDistinct> {
  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctByNetworkDetection({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'NETWORK_DETECTION',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctByPersistenceMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PERSISTENCE_MODE',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctByMaxRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PROXIMITY_SEARCH_RANGE');
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctBySyncMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'SYNC_METHOD', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctBySyncTrigger({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'SYNC_TRIGGER', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppConfiguration, AppConfiguration, QDistinct>
      distinctByTenantId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'TENANT_ID', caseSensitive: caseSensitive);
    });
  }
}

extension AppConfigurationQueryProperty
    on QueryBuilder<AppConfiguration, AppConfiguration, QQueryProperty> {
  QueryBuilder<AppConfiguration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppConfiguration, BackendInterface?, QQueryOperations>
      backendInterfaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'BACKEND_INTERFACE');
    });
  }

  QueryBuilder<AppConfiguration, BackgroundServiceConfig?, QQueryOperations>
      backgroundServiceConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'BACKGROUND_SERVICE_CONFIG');
    });
  }

  QueryBuilder<AppConfiguration, List<BandwidthBatchSize>?, QQueryOperations>
      bandwidthBatchSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'BANDWIDTH_BATCH_SIZE');
    });
  }

  QueryBuilder<AppConfiguration, List<CallSupportList>?, QQueryOperations>
      callSupportOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'CALL_SUPPORT');
    });
  }

  QueryBuilder<AppConfiguration, List<ChecklistTypes>?, QQueryOperations>
      checklistTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'CHECKLIST_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, List<ComplaintTypes>?, QQueryOperations>
      complaintTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'COMPLAINT_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, List<DeliveryCommentOptions>?,
      QQueryOperations> deliveryCommentOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'DELIVERY_COMMENT_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, List<BandwidthBatchSize>?, QQueryOperations>
      downSyncBandwidthBatchSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'DOWNSYNC-BANDWIDTH_BATCH_SIZE');
    });
  }

  QueryBuilder<AppConfiguration, FirebaseConfig?, QQueryOperations>
      firebaseConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'FIREBASE_CONFIG');
    });
  }

  QueryBuilder<AppConfiguration, List<GenderOptions>?, QQueryOperations>
      genderOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'GENDER_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, List<HouseholdDeletionReasonOptions>?,
      QQueryOperations> householdDeletionReasonOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'HOUSEHOLD_DELETION_REASON_OPTIONS');
    });
  }

  QueryBuilder<AppConfiguration, List<HouseholdMemberDeletionReasonOptions>?,
      QQueryOperations> householdMemberDeletionReasonOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS');
    });
  }

  QueryBuilder<AppConfiguration, List<IdTypeOptions>?, QQueryOperations>
      idTypeOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ID_TYPE_OPTIONS_POPULATOR');
    });
  }

  QueryBuilder<AppConfiguration, List<Languages>?, QQueryOperations>
      languagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'LANGUAGES');
    });
  }

  QueryBuilder<AppConfiguration, String?, QQueryOperations>
      networkDetectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'NETWORK_DETECTION');
    });
  }

  QueryBuilder<AppConfiguration, String?, QQueryOperations>
      persistenceModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PERSISTENCE_MODE');
    });
  }

  QueryBuilder<AppConfiguration, double?, QQueryOperations>
      maxRadiusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PROXIMITY_SEARCH_RANGE');
    });
  }

  QueryBuilder<AppConfiguration, List<SearchHouseHoldFilters>?,
      QQueryOperations> searchHouseHoldFiltersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'SEARCH_HOUSEHOLD_FILTERS');
    });
  }

  QueryBuilder<AppConfiguration, String?, QQueryOperations>
      syncMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'SYNC_METHOD');
    });
  }

  QueryBuilder<AppConfiguration, String?, QQueryOperations>
      syncTriggerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'SYNC_TRIGGER');
    });
  }

  QueryBuilder<AppConfiguration, String?, QQueryOperations> tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'TENANT_ID');
    });
  }

  QueryBuilder<AppConfiguration, List<TransportTypes>?, QQueryOperations>
      transportTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'TRANSPORT_TYPES');
    });
  }

  QueryBuilder<AppConfiguration, List<HouseStructureTypes>?, QQueryOperations>
      houseStructureTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'houseStructureTypes');
    });
  }

  QueryBuilder<AppConfiguration, List<ReferralReasons>?, QQueryOperations>
      referralReasonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referralReasons');
    });
  }

  QueryBuilder<AppConfiguration, List<RefusalReasons>?, QQueryOperations>
      refusalReasonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refusalReasons');
    });
  }

  QueryBuilder<AppConfiguration, List<SymptomsTypes>?, QQueryOperations>
      symptomsTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symptomsTypes');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LanguagesSchema = Schema(
  name: r'Languages',
  id: -1188574120358875103,
  properties: {
    r'label': PropertySchema(
      id: 0,
      name: r'label',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _languagesEstimateSize,
  serialize: _languagesSerialize,
  deserialize: _languagesDeserialize,
  deserializeProp: _languagesDeserializeProp,
);

int _languagesEstimateSize(
  Languages object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.label.length * 3;
  bytesCount += 3 + object.value.length * 3;
  return bytesCount;
}

void _languagesSerialize(
  Languages object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.label);
  writer.writeString(offsets[1], object.value);
}

Languages _languagesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Languages();
  object.label = reader.readString(offsets[0]);
  object.value = reader.readString(offsets[1]);
  return object;
}

P _languagesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LanguagesQueryFilter
    on QueryBuilder<Languages, Languages, QFilterCondition> {
  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<Languages, Languages, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension LanguagesQueryObject
    on QueryBuilder<Languages, Languages, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BackendInterfaceSchema = Schema(
  name: r'BackendInterface',
  id: -3069631770182488706,
  properties: {
    r'interfaces': PropertySchema(
      id: 0,
      name: r'interfaces',
      type: IsarType.objectList,
      target: r'Interfaces',
    )
  },
  estimateSize: _backendInterfaceEstimateSize,
  serialize: _backendInterfaceSerialize,
  deserialize: _backendInterfaceDeserialize,
  deserializeProp: _backendInterfaceDeserializeProp,
);

int _backendInterfaceEstimateSize(
  BackendInterface object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.interfaces.length * 3;
  {
    final offsets = allOffsets[Interfaces]!;
    for (var i = 0; i < object.interfaces.length; i++) {
      final value = object.interfaces[i];
      bytesCount += InterfacesSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _backendInterfaceSerialize(
  BackendInterface object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Interfaces>(
    offsets[0],
    allOffsets,
    InterfacesSchema.serialize,
    object.interfaces,
  );
}

BackendInterface _backendInterfaceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BackendInterface();
  object.interfaces = reader.readObjectList<Interfaces>(
        offsets[0],
        InterfacesSchema.deserialize,
        allOffsets,
        Interfaces(),
      ) ??
      [];
  return object;
}

P _backendInterfaceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Interfaces>(
            offset,
            InterfacesSchema.deserialize,
            allOffsets,
            Interfaces(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BackendInterfaceQueryFilter
    on QueryBuilder<BackendInterface, BackendInterface, QFilterCondition> {
  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'interfaces',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BackendInterfaceQueryObject
    on QueryBuilder<BackendInterface, BackendInterface, QFilterCondition> {
  QueryBuilder<BackendInterface, BackendInterface, QAfterFilterCondition>
      interfacesElement(FilterQuery<Interfaces> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'interfaces');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GenderOptionsSchema = Schema(
  name: r'GenderOptions',
  id: -185691183366252196,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _genderOptionsEstimateSize,
  serialize: _genderOptionsSerialize,
  deserialize: _genderOptionsDeserialize,
  deserializeProp: _genderOptionsDeserializeProp,
);

int _genderOptionsEstimateSize(
  GenderOptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _genderOptionsSerialize(
  GenderOptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

GenderOptions _genderOptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GenderOptions();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _genderOptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GenderOptionsQueryFilter
    on QueryBuilder<GenderOptions, GenderOptions, QFilterCondition> {
  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GenderOptions, GenderOptions, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension GenderOptionsQueryObject
    on QueryBuilder<GenderOptions, GenderOptions, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IdTypeOptionsSchema = Schema(
  name: r'IdTypeOptions',
  id: 2434793535088198550,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _idTypeOptionsEstimateSize,
  serialize: _idTypeOptionsSerialize,
  deserialize: _idTypeOptionsDeserialize,
  deserializeProp: _idTypeOptionsDeserializeProp,
);

int _idTypeOptionsEstimateSize(
  IdTypeOptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _idTypeOptionsSerialize(
  IdTypeOptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

IdTypeOptions _idTypeOptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IdTypeOptions();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _idTypeOptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IdTypeOptionsQueryFilter
    on QueryBuilder<IdTypeOptions, IdTypeOptions, QFilterCondition> {
  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IdTypeOptions, IdTypeOptions, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension IdTypeOptionsQueryObject
    on QueryBuilder<IdTypeOptions, IdTypeOptions, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DeliveryCommentOptionsSchema = Schema(
  name: r'DeliveryCommentOptions',
  id: 1568875780460320706,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _deliveryCommentOptionsEstimateSize,
  serialize: _deliveryCommentOptionsSerialize,
  deserialize: _deliveryCommentOptionsDeserialize,
  deserializeProp: _deliveryCommentOptionsDeserializeProp,
);

int _deliveryCommentOptionsEstimateSize(
  DeliveryCommentOptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _deliveryCommentOptionsSerialize(
  DeliveryCommentOptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

DeliveryCommentOptions _deliveryCommentOptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeliveryCommentOptions();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _deliveryCommentOptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DeliveryCommentOptionsQueryFilter on QueryBuilder<
    DeliveryCommentOptions, DeliveryCommentOptions, QFilterCondition> {
  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DeliveryCommentOptions, DeliveryCommentOptions,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DeliveryCommentOptionsQueryObject on QueryBuilder<
    DeliveryCommentOptions, DeliveryCommentOptions, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BandwidthBatchSizeSchema = Schema(
  name: r'BandwidthBatchSize',
  id: 2371716893182025373,
  properties: {
    r'BATCH_SIZE': PropertySchema(
      id: 0,
      name: r'BATCH_SIZE',
      type: IsarType.long,
    ),
    r'MAX_RANGE': PropertySchema(
      id: 1,
      name: r'MAX_RANGE',
      type: IsarType.double,
    ),
    r'MIN_RANGE': PropertySchema(
      id: 2,
      name: r'MIN_RANGE',
      type: IsarType.double,
    )
  },
  estimateSize: _bandwidthBatchSizeEstimateSize,
  serialize: _bandwidthBatchSizeSerialize,
  deserialize: _bandwidthBatchSizeDeserialize,
  deserializeProp: _bandwidthBatchSizeDeserializeProp,
);

int _bandwidthBatchSizeEstimateSize(
  BandwidthBatchSize object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bandwidthBatchSizeSerialize(
  BandwidthBatchSize object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.batchSize);
  writer.writeDouble(offsets[1], object.maxRange);
  writer.writeDouble(offsets[2], object.minRange);
}

BandwidthBatchSize _bandwidthBatchSizeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BandwidthBatchSize();
  object.batchSize = reader.readLong(offsets[0]);
  object.maxRange = reader.readDouble(offsets[1]);
  object.minRange = reader.readDouble(offsets[2]);
  return object;
}

P _bandwidthBatchSizeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BandwidthBatchSizeQueryFilter
    on QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QFilterCondition> {
  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      batchSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'BATCH_SIZE',
        value: value,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      batchSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'BATCH_SIZE',
        value: value,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      batchSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'BATCH_SIZE',
        value: value,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      batchSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'BATCH_SIZE',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      maxRangeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'MAX_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      maxRangeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'MAX_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      maxRangeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'MAX_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      maxRangeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'MAX_RANGE',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      minRangeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'MIN_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      minRangeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'MIN_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      minRangeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'MIN_RANGE',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QAfterFilterCondition>
      minRangeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'MIN_RANGE',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BandwidthBatchSizeQueryObject
    on QueryBuilder<BandwidthBatchSize, BandwidthBatchSize, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const InterfacesSchema = Schema(
  name: r'Interfaces',
  id: -2649961598896689542,
  properties: {
    r'confg': PropertySchema(
      id: 0,
      name: r'confg',
      type: IsarType.object,
      target: r'Config',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _interfacesEstimateSize,
  serialize: _interfacesSerialize,
  deserialize: _interfacesDeserialize,
  deserializeProp: _interfacesDeserializeProp,
);

int _interfacesEstimateSize(
  Interfaces object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      ConfigSchema.estimateSize(object.confg, allOffsets[Config]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _interfacesSerialize(
  Interfaces object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Config>(
    offsets[0],
    allOffsets,
    ConfigSchema.serialize,
    object.confg,
  );
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.type);
}

Interfaces _interfacesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Interfaces();
  object.confg = reader.readObjectOrNull<Config>(
        offsets[0],
        ConfigSchema.deserialize,
        allOffsets,
      ) ??
      Config();
  object.name = reader.readString(offsets[1]);
  object.type = reader.readString(offsets[2]);
  return object;
}

P _interfacesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Config>(
            offset,
            ConfigSchema.deserialize,
            allOffsets,
          ) ??
          Config()) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension InterfacesQueryFilter
    on QueryBuilder<Interfaces, Interfaces, QFilterCondition> {
  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension InterfacesQueryObject
    on QueryBuilder<Interfaces, Interfaces, QFilterCondition> {
  QueryBuilder<Interfaces, Interfaces, QAfterFilterCondition> confg(
      FilterQuery<Config> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'confg');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ConfigSchema = Schema(
  name: r'Config',
  id: -3644000870443854999,
  properties: {
    r'localStoreTTL': PropertySchema(
      id: 0,
      name: r'localStoreTTL',
      type: IsarType.long,
    )
  },
  estimateSize: _configEstimateSize,
  serialize: _configSerialize,
  deserialize: _configDeserialize,
  deserializeProp: _configDeserializeProp,
);

int _configEstimateSize(
  Config object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _configSerialize(
  Config object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.localStoreTTL);
}

Config _configDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Config();
  object.localStoreTTL = reader.readLong(offsets[0]);
  return object;
}

P _configDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ConfigQueryFilter on QueryBuilder<Config, Config, QFilterCondition> {
  QueryBuilder<Config, Config, QAfterFilterCondition> localStoreTTLEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localStoreTTL',
        value: value,
      ));
    });
  }

  QueryBuilder<Config, Config, QAfterFilterCondition> localStoreTTLGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localStoreTTL',
        value: value,
      ));
    });
  }

  QueryBuilder<Config, Config, QAfterFilterCondition> localStoreTTLLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localStoreTTL',
        value: value,
      ));
    });
  }

  QueryBuilder<Config, Config, QAfterFilterCondition> localStoreTTLBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localStoreTTL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigQueryObject on QueryBuilder<Config, Config, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ChecklistTypesSchema = Schema(
  name: r'ChecklistTypes',
  id: 3410823524277751841,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _checklistTypesEstimateSize,
  serialize: _checklistTypesSerialize,
  deserialize: _checklistTypesDeserialize,
  deserializeProp: _checklistTypesDeserializeProp,
);

int _checklistTypesEstimateSize(
  ChecklistTypes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _checklistTypesSerialize(
  ChecklistTypes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

ChecklistTypes _checklistTypesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChecklistTypes();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _checklistTypesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ChecklistTypesQueryFilter
    on QueryBuilder<ChecklistTypes, ChecklistTypes, QFilterCondition> {
  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChecklistTypes, ChecklistTypes, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ChecklistTypesQueryObject
    on QueryBuilder<ChecklistTypes, ChecklistTypes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TransportTypesSchema = Schema(
  name: r'TransportTypes',
  id: 7179073202657716051,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _transportTypesEstimateSize,
  serialize: _transportTypesSerialize,
  deserialize: _transportTypesDeserialize,
  deserializeProp: _transportTypesDeserializeProp,
);

int _transportTypesEstimateSize(
  TransportTypes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _transportTypesSerialize(
  TransportTypes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

TransportTypes _transportTypesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransportTypes();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _transportTypesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TransportTypesQueryFilter
    on QueryBuilder<TransportTypes, TransportTypes, QFilterCondition> {
  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TransportTypes, TransportTypes, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension TransportTypesQueryObject
    on QueryBuilder<TransportTypes, TransportTypes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ComplaintTypesSchema = Schema(
  name: r'ComplaintTypes',
  id: -6821985523873394494,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _complaintTypesEstimateSize,
  serialize: _complaintTypesSerialize,
  deserialize: _complaintTypesDeserialize,
  deserializeProp: _complaintTypesDeserializeProp,
);

int _complaintTypesEstimateSize(
  ComplaintTypes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _complaintTypesSerialize(
  ComplaintTypes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

ComplaintTypes _complaintTypesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ComplaintTypes();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _complaintTypesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ComplaintTypesQueryFilter
    on QueryBuilder<ComplaintTypes, ComplaintTypes, QFilterCondition> {
  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ComplaintTypes, ComplaintTypes, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ComplaintTypesQueryObject
    on QueryBuilder<ComplaintTypes, ComplaintTypes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BackgroundServiceConfigSchema = Schema(
  name: r'BackgroundServiceConfig',
  id: -4588382602375483726,
  properties: {
    r'API_CONCURRENCY': PropertySchema(
      id: 0,
      name: r'API_CONCURRENCY',
      type: IsarType.long,
    ),
    r'BATTERY_PERCENT_CUT_OFF': PropertySchema(
      id: 1,
      name: r'BATTERY_PERCENT_CUT_OFF',
      type: IsarType.long,
    ),
    r'SERVICE_INTERVAL': PropertySchema(
      id: 2,
      name: r'SERVICE_INTERVAL',
      type: IsarType.long,
    )
  },
  estimateSize: _backgroundServiceConfigEstimateSize,
  serialize: _backgroundServiceConfigSerialize,
  deserialize: _backgroundServiceConfigDeserialize,
  deserializeProp: _backgroundServiceConfigDeserializeProp,
);

int _backgroundServiceConfigEstimateSize(
  BackgroundServiceConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _backgroundServiceConfigSerialize(
  BackgroundServiceConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.apiConcurrency);
  writer.writeLong(offsets[1], object.batteryPercentCutOff);
  writer.writeLong(offsets[2], object.serviceInterval);
}

BackgroundServiceConfig _backgroundServiceConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BackgroundServiceConfig();
  object.apiConcurrency = reader.readLongOrNull(offsets[0]);
  object.batteryPercentCutOff = reader.readLongOrNull(offsets[1]);
  object.serviceInterval = reader.readLongOrNull(offsets[2]);
  return object;
}

P _backgroundServiceConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BackgroundServiceConfigQueryFilter on QueryBuilder<
    BackgroundServiceConfig, BackgroundServiceConfig, QFilterCondition> {
  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'API_CONCURRENCY',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'API_CONCURRENCY',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'API_CONCURRENCY',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'API_CONCURRENCY',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'API_CONCURRENCY',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> apiConcurrencyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'API_CONCURRENCY',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'BATTERY_PERCENT_CUT_OFF',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'BATTERY_PERCENT_CUT_OFF',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'BATTERY_PERCENT_CUT_OFF',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'BATTERY_PERCENT_CUT_OFF',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'BATTERY_PERCENT_CUT_OFF',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> batteryPercentCutOffBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'BATTERY_PERCENT_CUT_OFF',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'SERVICE_INTERVAL',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'SERVICE_INTERVAL',
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SERVICE_INTERVAL',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'SERVICE_INTERVAL',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'SERVICE_INTERVAL',
        value: value,
      ));
    });
  }

  QueryBuilder<BackgroundServiceConfig, BackgroundServiceConfig,
      QAfterFilterCondition> serviceIntervalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'SERVICE_INTERVAL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BackgroundServiceConfigQueryObject on QueryBuilder<
    BackgroundServiceConfig, BackgroundServiceConfig, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HouseholdDeletionReasonOptionsSchema = Schema(
  name: r'HouseholdDeletionReasonOptions',
  id: -8271848898283406561,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _householdDeletionReasonOptionsEstimateSize,
  serialize: _householdDeletionReasonOptionsSerialize,
  deserialize: _householdDeletionReasonOptionsDeserialize,
  deserializeProp: _householdDeletionReasonOptionsDeserializeProp,
);

int _householdDeletionReasonOptionsEstimateSize(
  HouseholdDeletionReasonOptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _householdDeletionReasonOptionsSerialize(
  HouseholdDeletionReasonOptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

HouseholdDeletionReasonOptions _householdDeletionReasonOptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HouseholdDeletionReasonOptions();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _householdDeletionReasonOptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HouseholdDeletionReasonOptionsQueryFilter on QueryBuilder<
    HouseholdDeletionReasonOptions,
    HouseholdDeletionReasonOptions,
    QFilterCondition> {
  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseholdDeletionReasonOptions, HouseholdDeletionReasonOptions,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension HouseholdDeletionReasonOptionsQueryObject on QueryBuilder<
    HouseholdDeletionReasonOptions,
    HouseholdDeletionReasonOptions,
    QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SearchHouseHoldFiltersSchema = Schema(
  name: r'SearchHouseHoldFilters',
  id: -6619823232754786758,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _searchHouseHoldFiltersEstimateSize,
  serialize: _searchHouseHoldFiltersSerialize,
  deserialize: _searchHouseHoldFiltersDeserialize,
  deserializeProp: _searchHouseHoldFiltersDeserializeProp,
);

int _searchHouseHoldFiltersEstimateSize(
  SearchHouseHoldFilters object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _searchHouseHoldFiltersSerialize(
  SearchHouseHoldFilters object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.name);
}

SearchHouseHoldFilters _searchHouseHoldFiltersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchHouseHoldFilters();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _searchHouseHoldFiltersDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SearchHouseHoldFiltersQueryFilter on QueryBuilder<
    SearchHouseHoldFilters, SearchHouseHoldFilters, QFilterCondition> {
  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHouseHoldFilters, SearchHouseHoldFilters,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension SearchHouseHoldFiltersQueryObject on QueryBuilder<
    SearchHouseHoldFilters, SearchHouseHoldFilters, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HouseholdMemberDeletionReasonOptionsSchema = Schema(
  name: r'HouseholdMemberDeletionReasonOptions',
  id: 752674668946516871,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _householdMemberDeletionReasonOptionsEstimateSize,
  serialize: _householdMemberDeletionReasonOptionsSerialize,
  deserialize: _householdMemberDeletionReasonOptionsDeserialize,
  deserializeProp: _householdMemberDeletionReasonOptionsDeserializeProp,
);

int _householdMemberDeletionReasonOptionsEstimateSize(
  HouseholdMemberDeletionReasonOptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _householdMemberDeletionReasonOptionsSerialize(
  HouseholdMemberDeletionReasonOptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

HouseholdMemberDeletionReasonOptions
    _householdMemberDeletionReasonOptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HouseholdMemberDeletionReasonOptions();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _householdMemberDeletionReasonOptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HouseholdMemberDeletionReasonOptionsQueryFilter on QueryBuilder<
    HouseholdMemberDeletionReasonOptions,
    HouseholdMemberDeletionReasonOptions,
    QFilterCondition> {
  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
          HouseholdMemberDeletionReasonOptions, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
          HouseholdMemberDeletionReasonOptions, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
          HouseholdMemberDeletionReasonOptions, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseholdMemberDeletionReasonOptions,
          HouseholdMemberDeletionReasonOptions, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<
      HouseholdMemberDeletionReasonOptions,
      HouseholdMemberDeletionReasonOptions,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension HouseholdMemberDeletionReasonOptionsQueryObject on QueryBuilder<
    HouseholdMemberDeletionReasonOptions,
    HouseholdMemberDeletionReasonOptions,
    QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CallSupportListSchema = Schema(
  name: r'CallSupportList',
  id: 5777143171447971980,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _callSupportListEstimateSize,
  serialize: _callSupportListSerialize,
  deserialize: _callSupportListDeserialize,
  deserializeProp: _callSupportListDeserializeProp,
);

int _callSupportListEstimateSize(
  CallSupportList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _callSupportListSerialize(
  CallSupportList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.name);
}

CallSupportList _callSupportListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CallSupportList();
  object.code = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _callSupportListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CallSupportListQueryFilter
    on QueryBuilder<CallSupportList, CallSupportList, QFilterCondition> {
  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CallSupportList, CallSupportList, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension CallSupportListQueryObject
    on QueryBuilder<CallSupportList, CallSupportList, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FirebaseConfigSchema = Schema(
  name: r'FirebaseConfig',
  id: -2852964328238474241,
  properties: {
    r'enableAnalytics': PropertySchema(
      id: 0,
      name: r'enableAnalytics',
      type: IsarType.bool,
    ),
    r'enableCrashlytics': PropertySchema(
      id: 1,
      name: r'enableCrashlytics',
      type: IsarType.bool,
    )
  },
  estimateSize: _firebaseConfigEstimateSize,
  serialize: _firebaseConfigSerialize,
  deserialize: _firebaseConfigDeserialize,
  deserializeProp: _firebaseConfigDeserializeProp,
);

int _firebaseConfigEstimateSize(
  FirebaseConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _firebaseConfigSerialize(
  FirebaseConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.enableAnalytics);
  writer.writeBool(offsets[1], object.enableCrashlytics);
}

FirebaseConfig _firebaseConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FirebaseConfig();
  object.enableAnalytics = reader.readBoolOrNull(offsets[0]);
  object.enableCrashlytics = reader.readBoolOrNull(offsets[1]);
  return object;
}

P _firebaseConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FirebaseConfigQueryFilter
    on QueryBuilder<FirebaseConfig, FirebaseConfig, QFilterCondition> {
  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableAnalyticsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enableAnalytics',
      ));
    });
  }

  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableAnalyticsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enableAnalytics',
      ));
    });
  }

  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableAnalyticsEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableAnalytics',
        value: value,
      ));
    });
  }

  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableCrashlyticsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enableCrashlytics',
      ));
    });
  }

  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableCrashlyticsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enableCrashlytics',
      ));
    });
  }

  QueryBuilder<FirebaseConfig, FirebaseConfig, QAfterFilterCondition>
      enableCrashlyticsEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableCrashlytics',
        value: value,
      ));
    });
  }
}

extension FirebaseConfigQueryObject
    on QueryBuilder<FirebaseConfig, FirebaseConfig, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SymptomsTypesSchema = Schema(
  name: r'SymptomsTypes',
  id: 1335382729654316565,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _symptomsTypesEstimateSize,
  serialize: _symptomsTypesSerialize,
  deserialize: _symptomsTypesDeserialize,
  deserializeProp: _symptomsTypesDeserializeProp,
);

int _symptomsTypesEstimateSize(
  SymptomsTypes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _symptomsTypesSerialize(
  SymptomsTypes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.name);
}

SymptomsTypes _symptomsTypesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SymptomsTypes();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _symptomsTypesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SymptomsTypesQueryFilter
    on QueryBuilder<SymptomsTypes, SymptomsTypes, QFilterCondition> {
  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomsTypes, SymptomsTypes, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension SymptomsTypesQueryObject
    on QueryBuilder<SymptomsTypes, SymptomsTypes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ReferralReasonsSchema = Schema(
  name: r'ReferralReasons',
  id: 3398817133439165056,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _referralReasonsEstimateSize,
  serialize: _referralReasonsSerialize,
  deserialize: _referralReasonsDeserialize,
  deserializeProp: _referralReasonsDeserializeProp,
);

int _referralReasonsEstimateSize(
  ReferralReasons object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _referralReasonsSerialize(
  ReferralReasons object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.name);
}

ReferralReasons _referralReasonsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReferralReasons();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _referralReasonsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ReferralReasonsQueryFilter
    on QueryBuilder<ReferralReasons, ReferralReasons, QFilterCondition> {
  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReferralReasons, ReferralReasons, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ReferralReasonsQueryObject
    on QueryBuilder<ReferralReasons, ReferralReasons, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HouseStructureTypesSchema = Schema(
  name: r'HouseStructureTypes',
  id: 7578394145153864404,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _houseStructureTypesEstimateSize,
  serialize: _houseStructureTypesSerialize,
  deserialize: _houseStructureTypesDeserialize,
  deserializeProp: _houseStructureTypesDeserializeProp,
);

int _houseStructureTypesEstimateSize(
  HouseStructureTypes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _houseStructureTypesSerialize(
  HouseStructureTypes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.name);
}

HouseStructureTypes _houseStructureTypesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HouseStructureTypes();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _houseStructureTypesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HouseStructureTypesQueryFilter on QueryBuilder<HouseStructureTypes,
    HouseStructureTypes, QFilterCondition> {
  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<HouseStructureTypes, HouseStructureTypes, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension HouseStructureTypesQueryObject on QueryBuilder<HouseStructureTypes,
    HouseStructureTypes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RefusalReasonsSchema = Schema(
  name: r'RefusalReasons',
  id: 1547295305086494581,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _refusalReasonsEstimateSize,
  serialize: _refusalReasonsSerialize,
  deserialize: _refusalReasonsDeserialize,
  deserializeProp: _refusalReasonsDeserializeProp,
);

int _refusalReasonsEstimateSize(
  RefusalReasons object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _refusalReasonsSerialize(
  RefusalReasons object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.name);
}

RefusalReasons _refusalReasonsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RefusalReasons();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _refusalReasonsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RefusalReasonsQueryFilter
    on QueryBuilder<RefusalReasons, RefusalReasons, QFilterCondition> {
  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RefusalReasons, RefusalReasons, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension RefusalReasonsQueryObject
    on QueryBuilder<RefusalReasons, RefusalReasons, QFilterCondition> {}
