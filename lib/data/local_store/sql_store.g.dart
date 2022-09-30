// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CampaignRegistrationTableData extends DataClass
    implements Insertable<CampaignRegistrationTableData> {
  final String campaignId;
  final String clientReferenceId;
  final String beneficiaryType;
  final String boundaryId;
  final int dateOfRegistration;
  final int createOn;
  final int? modifiedOn;
  final String createdBy;
  final String? modifiedBy;
  final String? additionalFields;
  final String tenantId;
  final bool isSynced;
  final String? syncFileName;
  CampaignRegistrationTableData(
      {required this.campaignId,
      required this.clientReferenceId,
      required this.beneficiaryType,
      required this.boundaryId,
      required this.dateOfRegistration,
      required this.createOn,
      this.modifiedOn,
      required this.createdBy,
      this.modifiedBy,
      this.additionalFields,
      required this.tenantId,
      required this.isSynced,
      this.syncFileName});
  factory CampaignRegistrationTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CampaignRegistrationTableData(
      campaignId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}campaign_id'])!,
      clientReferenceId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}client_reference_id'])!,
      beneficiaryType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}beneficiary_type'])!,
      boundaryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}boundary_id'])!,
      dateOfRegistration: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_of_registration'])!,
      createOn: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_on'])!,
      modifiedOn: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_on']),
      createdBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by'])!,
      modifiedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_by']),
      additionalFields: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additional_fields']),
      tenantId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id'])!,
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      syncFileName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_file_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['campaign_id'] = Variable<String>(campaignId);
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    map['beneficiary_type'] = Variable<String>(beneficiaryType);
    map['boundary_id'] = Variable<String>(boundaryId);
    map['date_of_registration'] = Variable<int>(dateOfRegistration);
    map['create_on'] = Variable<int>(createOn);
    if (!nullToAbsent || modifiedOn != null) {
      map['modified_on'] = Variable<int?>(modifiedOn);
    }
    map['created_by'] = Variable<String>(createdBy);
    if (!nullToAbsent || modifiedBy != null) {
      map['modified_by'] = Variable<String?>(modifiedBy);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String?>(additionalFields);
    }
    map['tenant_id'] = Variable<String>(tenantId);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || syncFileName != null) {
      map['sync_file_name'] = Variable<String?>(syncFileName);
    }
    return map;
  }

  CampaignRegistrationTableCompanion toCompanion(bool nullToAbsent) {
    return CampaignRegistrationTableCompanion(
      campaignId: Value(campaignId),
      clientReferenceId: Value(clientReferenceId),
      beneficiaryType: Value(beneficiaryType),
      boundaryId: Value(boundaryId),
      dateOfRegistration: Value(dateOfRegistration),
      createOn: Value(createOn),
      modifiedOn: modifiedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedOn),
      createdBy: Value(createdBy),
      modifiedBy: modifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedBy),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
      tenantId: Value(tenantId),
      isSynced: Value(isSynced),
      syncFileName: syncFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(syncFileName),
    );
  }

  factory CampaignRegistrationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CampaignRegistrationTableData(
      campaignId: serializer.fromJson<String>(json['campaignId']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      beneficiaryType: serializer.fromJson<String>(json['beneficiaryType']),
      boundaryId: serializer.fromJson<String>(json['boundaryId']),
      dateOfRegistration: serializer.fromJson<int>(json['dateOfRegistration']),
      createOn: serializer.fromJson<int>(json['createOn']),
      modifiedOn: serializer.fromJson<int?>(json['modifiedOn']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      modifiedBy: serializer.fromJson<String?>(json['modifiedBy']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
      tenantId: serializer.fromJson<String>(json['tenantId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      syncFileName: serializer.fromJson<String?>(json['syncFileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'campaignId': serializer.toJson<String>(campaignId),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'beneficiaryType': serializer.toJson<String>(beneficiaryType),
      'boundaryId': serializer.toJson<String>(boundaryId),
      'dateOfRegistration': serializer.toJson<int>(dateOfRegistration),
      'createOn': serializer.toJson<int>(createOn),
      'modifiedOn': serializer.toJson<int?>(modifiedOn),
      'createdBy': serializer.toJson<String>(createdBy),
      'modifiedBy': serializer.toJson<String?>(modifiedBy),
      'additionalFields': serializer.toJson<String?>(additionalFields),
      'tenantId': serializer.toJson<String>(tenantId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'syncFileName': serializer.toJson<String?>(syncFileName),
    };
  }

  CampaignRegistrationTableData copyWith(
          {String? campaignId,
          String? clientReferenceId,
          String? beneficiaryType,
          String? boundaryId,
          int? dateOfRegistration,
          int? createOn,
          int? modifiedOn,
          String? createdBy,
          String? modifiedBy,
          String? additionalFields,
          String? tenantId,
          bool? isSynced,
          String? syncFileName}) =>
      CampaignRegistrationTableData(
        campaignId: campaignId ?? this.campaignId,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        beneficiaryType: beneficiaryType ?? this.beneficiaryType,
        boundaryId: boundaryId ?? this.boundaryId,
        dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
        createOn: createOn ?? this.createOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        createdBy: createdBy ?? this.createdBy,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        additionalFields: additionalFields ?? this.additionalFields,
        tenantId: tenantId ?? this.tenantId,
        isSynced: isSynced ?? this.isSynced,
        syncFileName: syncFileName ?? this.syncFileName,
      );
  @override
  String toString() {
    return (StringBuffer('CampaignRegistrationTableData(')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('boundaryId: $boundaryId, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('createOn: $createOn, ')
          ..write('modifiedOn: $modifiedOn, ')
          ..write('createdBy: $createdBy, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('tenantId: $tenantId, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileName: $syncFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      campaignId,
      clientReferenceId,
      beneficiaryType,
      boundaryId,
      dateOfRegistration,
      createOn,
      modifiedOn,
      createdBy,
      modifiedBy,
      additionalFields,
      tenantId,
      isSynced,
      syncFileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CampaignRegistrationTableData &&
          other.campaignId == this.campaignId &&
          other.clientReferenceId == this.clientReferenceId &&
          other.beneficiaryType == this.beneficiaryType &&
          other.boundaryId == this.boundaryId &&
          other.dateOfRegistration == this.dateOfRegistration &&
          other.createOn == this.createOn &&
          other.modifiedOn == this.modifiedOn &&
          other.createdBy == this.createdBy &&
          other.modifiedBy == this.modifiedBy &&
          other.additionalFields == this.additionalFields &&
          other.tenantId == this.tenantId &&
          other.isSynced == this.isSynced &&
          other.syncFileName == this.syncFileName);
}

class CampaignRegistrationTableCompanion
    extends UpdateCompanion<CampaignRegistrationTableData> {
  final Value<String> campaignId;
  final Value<String> clientReferenceId;
  final Value<String> beneficiaryType;
  final Value<String> boundaryId;
  final Value<int> dateOfRegistration;
  final Value<int> createOn;
  final Value<int?> modifiedOn;
  final Value<String> createdBy;
  final Value<String?> modifiedBy;
  final Value<String?> additionalFields;
  final Value<String> tenantId;
  final Value<bool> isSynced;
  final Value<String?> syncFileName;
  const CampaignRegistrationTableCompanion({
    this.campaignId = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.beneficiaryType = const Value.absent(),
    this.boundaryId = const Value.absent(),
    this.dateOfRegistration = const Value.absent(),
    this.createOn = const Value.absent(),
    this.modifiedOn = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.modifiedBy = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.syncFileName = const Value.absent(),
  });
  CampaignRegistrationTableCompanion.insert({
    required String campaignId,
    required String clientReferenceId,
    required String beneficiaryType,
    required String boundaryId,
    required int dateOfRegistration,
    required int createOn,
    this.modifiedOn = const Value.absent(),
    required String createdBy,
    this.modifiedBy = const Value.absent(),
    this.additionalFields = const Value.absent(),
    required String tenantId,
    this.isSynced = const Value.absent(),
    this.syncFileName = const Value.absent(),
  })  : campaignId = Value(campaignId),
        clientReferenceId = Value(clientReferenceId),
        beneficiaryType = Value(beneficiaryType),
        boundaryId = Value(boundaryId),
        dateOfRegistration = Value(dateOfRegistration),
        createOn = Value(createOn),
        createdBy = Value(createdBy),
        tenantId = Value(tenantId);
  static Insertable<CampaignRegistrationTableData> custom({
    Expression<String>? campaignId,
    Expression<String>? clientReferenceId,
    Expression<String>? beneficiaryType,
    Expression<String>? boundaryId,
    Expression<int>? dateOfRegistration,
    Expression<int>? createOn,
    Expression<int?>? modifiedOn,
    Expression<String>? createdBy,
    Expression<String?>? modifiedBy,
    Expression<String?>? additionalFields,
    Expression<String>? tenantId,
    Expression<bool>? isSynced,
    Expression<String?>? syncFileName,
  }) {
    return RawValuesInsertable({
      if (campaignId != null) 'campaign_id': campaignId,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (beneficiaryType != null) 'beneficiary_type': beneficiaryType,
      if (boundaryId != null) 'boundary_id': boundaryId,
      if (dateOfRegistration != null)
        'date_of_registration': dateOfRegistration,
      if (createOn != null) 'create_on': createOn,
      if (modifiedOn != null) 'modified_on': modifiedOn,
      if (createdBy != null) 'created_by': createdBy,
      if (modifiedBy != null) 'modified_by': modifiedBy,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isSynced != null) 'is_synced': isSynced,
      if (syncFileName != null) 'sync_file_name': syncFileName,
    });
  }

  CampaignRegistrationTableCompanion copyWith(
      {Value<String>? campaignId,
      Value<String>? clientReferenceId,
      Value<String>? beneficiaryType,
      Value<String>? boundaryId,
      Value<int>? dateOfRegistration,
      Value<int>? createOn,
      Value<int?>? modifiedOn,
      Value<String>? createdBy,
      Value<String?>? modifiedBy,
      Value<String?>? additionalFields,
      Value<String>? tenantId,
      Value<bool>? isSynced,
      Value<String?>? syncFileName}) {
    return CampaignRegistrationTableCompanion(
      campaignId: campaignId ?? this.campaignId,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      beneficiaryType: beneficiaryType ?? this.beneficiaryType,
      boundaryId: boundaryId ?? this.boundaryId,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
      createOn: createOn ?? this.createOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      additionalFields: additionalFields ?? this.additionalFields,
      tenantId: tenantId ?? this.tenantId,
      isSynced: isSynced ?? this.isSynced,
      syncFileName: syncFileName ?? this.syncFileName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (beneficiaryType.present) {
      map['beneficiary_type'] = Variable<String>(beneficiaryType.value);
    }
    if (boundaryId.present) {
      map['boundary_id'] = Variable<String>(boundaryId.value);
    }
    if (dateOfRegistration.present) {
      map['date_of_registration'] = Variable<int>(dateOfRegistration.value);
    }
    if (createOn.present) {
      map['create_on'] = Variable<int>(createOn.value);
    }
    if (modifiedOn.present) {
      map['modified_on'] = Variable<int?>(modifiedOn.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (modifiedBy.present) {
      map['modified_by'] = Variable<String?>(modifiedBy.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String?>(additionalFields.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (syncFileName.present) {
      map['sync_file_name'] = Variable<String?>(syncFileName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CampaignRegistrationTableCompanion(')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('boundaryId: $boundaryId, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('createOn: $createOn, ')
          ..write('modifiedOn: $modifiedOn, ')
          ..write('createdBy: $createdBy, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('tenantId: $tenantId, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileName: $syncFileName')
          ..write(')'))
        .toString();
  }
}

class $CampaignRegistrationTableTable extends CampaignRegistrationTable
    with
        TableInfo<$CampaignRegistrationTableTable,
            CampaignRegistrationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CampaignRegistrationTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _campaignIdMeta = const VerificationMeta('campaignId');
  @override
  late final GeneratedColumn<String?> campaignId = GeneratedColumn<String?>(
      'campaign_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String?> clientReferenceId =
      GeneratedColumn<String?>('client_reference_id', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _beneficiaryTypeMeta =
      const VerificationMeta('beneficiaryType');
  @override
  late final GeneratedColumn<String?> beneficiaryType =
      GeneratedColumn<String?>('beneficiary_type', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _boundaryIdMeta = const VerificationMeta('boundaryId');
  @override
  late final GeneratedColumn<String?> boundaryId = GeneratedColumn<String?>(
      'boundary_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateOfRegistrationMeta =
      const VerificationMeta('dateOfRegistration');
  @override
  late final GeneratedColumn<int?> dateOfRegistration = GeneratedColumn<int?>(
      'date_of_registration', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _createOnMeta = const VerificationMeta('createOn');
  @override
  late final GeneratedColumn<int?> createOn = GeneratedColumn<int?>(
      'create_on', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _modifiedOnMeta = const VerificationMeta('modifiedOn');
  @override
  late final GeneratedColumn<int?> modifiedOn = GeneratedColumn<int?>(
      'modified_on', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String?> createdBy = GeneratedColumn<String?>(
      'created_by', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _modifiedByMeta = const VerificationMeta('modifiedBy');
  @override
  late final GeneratedColumn<String?> modifiedBy = GeneratedColumn<String?>(
      'modified_by', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String?> additionalFields =
      GeneratedColumn<String?>('additional_fields', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String?> tenantId = GeneratedColumn<String?>(
      'tenant_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _syncFileNameMeta =
      const VerificationMeta('syncFileName');
  @override
  late final GeneratedColumn<String?> syncFileName = GeneratedColumn<String?>(
      'sync_file_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        campaignId,
        clientReferenceId,
        beneficiaryType,
        boundaryId,
        dateOfRegistration,
        createOn,
        modifiedOn,
        createdBy,
        modifiedBy,
        additionalFields,
        tenantId,
        isSynced,
        syncFileName
      ];
  @override
  String get aliasedName => _alias ?? 'campaign_registration_table';
  @override
  String get actualTableName => 'campaign_registration_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CampaignRegistrationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('campaign_id')) {
      context.handle(
          _campaignIdMeta,
          campaignId.isAcceptableOrUnknown(
              data['campaign_id']!, _campaignIdMeta));
    } else if (isInserting) {
      context.missing(_campaignIdMeta);
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('beneficiary_type')) {
      context.handle(
          _beneficiaryTypeMeta,
          beneficiaryType.isAcceptableOrUnknown(
              data['beneficiary_type']!, _beneficiaryTypeMeta));
    } else if (isInserting) {
      context.missing(_beneficiaryTypeMeta);
    }
    if (data.containsKey('boundary_id')) {
      context.handle(
          _boundaryIdMeta,
          boundaryId.isAcceptableOrUnknown(
              data['boundary_id']!, _boundaryIdMeta));
    } else if (isInserting) {
      context.missing(_boundaryIdMeta);
    }
    if (data.containsKey('date_of_registration')) {
      context.handle(
          _dateOfRegistrationMeta,
          dateOfRegistration.isAcceptableOrUnknown(
              data['date_of_registration']!, _dateOfRegistrationMeta));
    } else if (isInserting) {
      context.missing(_dateOfRegistrationMeta);
    }
    if (data.containsKey('create_on')) {
      context.handle(_createOnMeta,
          createOn.isAcceptableOrUnknown(data['create_on']!, _createOnMeta));
    } else if (isInserting) {
      context.missing(_createOnMeta);
    }
    if (data.containsKey('modified_on')) {
      context.handle(
          _modifiedOnMeta,
          modifiedOn.isAcceptableOrUnknown(
              data['modified_on']!, _modifiedOnMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('modified_by')) {
      context.handle(
          _modifiedByMeta,
          modifiedBy.isAcceptableOrUnknown(
              data['modified_by']!, _modifiedByMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('sync_file_name')) {
      context.handle(
          _syncFileNameMeta,
          syncFileName.isAcceptableOrUnknown(
              data['sync_file_name']!, _syncFileNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientReferenceId};
  @override
  CampaignRegistrationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return CampaignRegistrationTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CampaignRegistrationTableTable createAlias(String alias) {
    return $CampaignRegistrationTableTable(attachedDatabase, alias);
  }
}

class HouseholdTableData extends DataClass
    implements Insertable<HouseholdTableData> {
  final int id;
  final String registrationId;
  final int numberOfMembers;
  final String headOfHousehold;
  final bool isDeleted;
  HouseholdTableData(
      {required this.id,
      required this.registrationId,
      required this.numberOfMembers,
      required this.headOfHousehold,
      required this.isDeleted});
  factory HouseholdTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HouseholdTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      registrationId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}registration_id'])!,
      numberOfMembers: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}number_of_members'])!,
      headOfHousehold: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}head_of_household'])!,
      isDeleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['registration_id'] = Variable<String>(registrationId);
    map['number_of_members'] = Variable<int>(numberOfMembers);
    map['head_of_household'] = Variable<String>(headOfHousehold);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  HouseholdTableCompanion toCompanion(bool nullToAbsent) {
    return HouseholdTableCompanion(
      id: Value(id),
      registrationId: Value(registrationId),
      numberOfMembers: Value(numberOfMembers),
      headOfHousehold: Value(headOfHousehold),
      isDeleted: Value(isDeleted),
    );
  }

  factory HouseholdTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseholdTableData(
      id: serializer.fromJson<int>(json['id']),
      registrationId: serializer.fromJson<String>(json['registrationId']),
      numberOfMembers: serializer.fromJson<int>(json['numberOfMembers']),
      headOfHousehold: serializer.fromJson<String>(json['headOfHousehold']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'registrationId': serializer.toJson<String>(registrationId),
      'numberOfMembers': serializer.toJson<int>(numberOfMembers),
      'headOfHousehold': serializer.toJson<String>(headOfHousehold),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  HouseholdTableData copyWith(
          {int? id,
          String? registrationId,
          int? numberOfMembers,
          String? headOfHousehold,
          bool? isDeleted}) =>
      HouseholdTableData(
        id: id ?? this.id,
        registrationId: registrationId ?? this.registrationId,
        numberOfMembers: numberOfMembers ?? this.numberOfMembers,
        headOfHousehold: headOfHousehold ?? this.headOfHousehold,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('HouseholdTableData(')
          ..write('id: $id, ')
          ..write('registrationId: $registrationId, ')
          ..write('numberOfMembers: $numberOfMembers, ')
          ..write('headOfHousehold: $headOfHousehold, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, registrationId, numberOfMembers, headOfHousehold, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseholdTableData &&
          other.id == this.id &&
          other.registrationId == this.registrationId &&
          other.numberOfMembers == this.numberOfMembers &&
          other.headOfHousehold == this.headOfHousehold &&
          other.isDeleted == this.isDeleted);
}

class HouseholdTableCompanion extends UpdateCompanion<HouseholdTableData> {
  final Value<int> id;
  final Value<String> registrationId;
  final Value<int> numberOfMembers;
  final Value<String> headOfHousehold;
  final Value<bool> isDeleted;
  const HouseholdTableCompanion({
    this.id = const Value.absent(),
    this.registrationId = const Value.absent(),
    this.numberOfMembers = const Value.absent(),
    this.headOfHousehold = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  HouseholdTableCompanion.insert({
    this.id = const Value.absent(),
    required String registrationId,
    required int numberOfMembers,
    required String headOfHousehold,
    required bool isDeleted,
  })  : registrationId = Value(registrationId),
        numberOfMembers = Value(numberOfMembers),
        headOfHousehold = Value(headOfHousehold),
        isDeleted = Value(isDeleted);
  static Insertable<HouseholdTableData> custom({
    Expression<int>? id,
    Expression<String>? registrationId,
    Expression<int>? numberOfMembers,
    Expression<String>? headOfHousehold,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registrationId != null) 'registration_id': registrationId,
      if (numberOfMembers != null) 'number_of_members': numberOfMembers,
      if (headOfHousehold != null) 'head_of_household': headOfHousehold,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  HouseholdTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? registrationId,
      Value<int>? numberOfMembers,
      Value<String>? headOfHousehold,
      Value<bool>? isDeleted}) {
    return HouseholdTableCompanion(
      id: id ?? this.id,
      registrationId: registrationId ?? this.registrationId,
      numberOfMembers: numberOfMembers ?? this.numberOfMembers,
      headOfHousehold: headOfHousehold ?? this.headOfHousehold,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (registrationId.present) {
      map['registration_id'] = Variable<String>(registrationId.value);
    }
    if (numberOfMembers.present) {
      map['number_of_members'] = Variable<int>(numberOfMembers.value);
    }
    if (headOfHousehold.present) {
      map['head_of_household'] = Variable<String>(headOfHousehold.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseholdTableCompanion(')
          ..write('id: $id, ')
          ..write('registrationId: $registrationId, ')
          ..write('numberOfMembers: $numberOfMembers, ')
          ..write('headOfHousehold: $headOfHousehold, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $HouseholdTableTable extends HouseholdTable
    with TableInfo<$HouseholdTableTable, HouseholdTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseholdTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _registrationIdMeta =
      const VerificationMeta('registrationId');
  @override
  late final GeneratedColumn<String?> registrationId = GeneratedColumn<String?>(
      'registration_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints:
          'REFERENCES campaign_registration_table (client_reference_id)');
  final VerificationMeta _numberOfMembersMeta =
      const VerificationMeta('numberOfMembers');
  @override
  late final GeneratedColumn<int?> numberOfMembers = GeneratedColumn<int?>(
      'number_of_members', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _headOfHouseholdMeta =
      const VerificationMeta('headOfHousehold');
  @override
  late final GeneratedColumn<String?> headOfHousehold =
      GeneratedColumn<String?>('head_of_household', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES individual_table (id)');
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool?> isDeleted = GeneratedColumn<bool?>(
      'is_deleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_deleted IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, registrationId, numberOfMembers, headOfHousehold, isDeleted];
  @override
  String get aliasedName => _alias ?? 'household_table';
  @override
  String get actualTableName => 'household_table';
  @override
  VerificationContext validateIntegrity(Insertable<HouseholdTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('registration_id')) {
      context.handle(
          _registrationIdMeta,
          registrationId.isAcceptableOrUnknown(
              data['registration_id']!, _registrationIdMeta));
    } else if (isInserting) {
      context.missing(_registrationIdMeta);
    }
    if (data.containsKey('number_of_members')) {
      context.handle(
          _numberOfMembersMeta,
          numberOfMembers.isAcceptableOrUnknown(
              data['number_of_members']!, _numberOfMembersMeta));
    } else if (isInserting) {
      context.missing(_numberOfMembersMeta);
    }
    if (data.containsKey('head_of_household')) {
      context.handle(
          _headOfHouseholdMeta,
          headOfHousehold.isAcceptableOrUnknown(
              data['head_of_household']!, _headOfHouseholdMeta));
    } else if (isInserting) {
      context.missing(_headOfHouseholdMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HouseholdTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HouseholdTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HouseholdTableTable createAlias(String alias) {
    return $HouseholdTableTable(attachedDatabase, alias);
  }
}

class IndividualTableData extends DataClass
    implements Insertable<IndividualTableData> {
  final String? additionalFields;
  final int id;
  final String dateOfBirth;
  final String gender;
  final int householdId;
  final bool isHead;
  final String name;
  final bool isDeleted;
  IndividualTableData(
      {this.additionalFields,
      required this.id,
      required this.dateOfBirth,
      required this.gender,
      required this.householdId,
      required this.isHead,
      required this.name,
      required this.isDeleted});
  factory IndividualTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IndividualTableData(
      additionalFields: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additional_fields']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      dateOfBirth: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_of_birth'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      householdId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}household_id'])!,
      isHead: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_head'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isDeleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String?>(additionalFields);
    }
    map['id'] = Variable<int>(id);
    map['date_of_birth'] = Variable<String>(dateOfBirth);
    map['gender'] = Variable<String>(gender);
    map['household_id'] = Variable<int>(householdId);
    map['is_head'] = Variable<bool>(isHead);
    map['name'] = Variable<String>(name);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  IndividualTableCompanion toCompanion(bool nullToAbsent) {
    return IndividualTableCompanion(
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
      id: Value(id),
      dateOfBirth: Value(dateOfBirth),
      gender: Value(gender),
      householdId: Value(householdId),
      isHead: Value(isHead),
      name: Value(name),
      isDeleted: Value(isDeleted),
    );
  }

  factory IndividualTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IndividualTableData(
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
      id: serializer.fromJson<int>(json['id']),
      dateOfBirth: serializer.fromJson<String>(json['dateOfBirth']),
      gender: serializer.fromJson<String>(json['gender']),
      householdId: serializer.fromJson<int>(json['householdId']),
      isHead: serializer.fromJson<bool>(json['isHead']),
      name: serializer.fromJson<String>(json['name']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'additionalFields': serializer.toJson<String?>(additionalFields),
      'id': serializer.toJson<int>(id),
      'dateOfBirth': serializer.toJson<String>(dateOfBirth),
      'gender': serializer.toJson<String>(gender),
      'householdId': serializer.toJson<int>(householdId),
      'isHead': serializer.toJson<bool>(isHead),
      'name': serializer.toJson<String>(name),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  IndividualTableData copyWith(
          {String? additionalFields,
          int? id,
          String? dateOfBirth,
          String? gender,
          int? householdId,
          bool? isHead,
          String? name,
          bool? isDeleted}) =>
      IndividualTableData(
        additionalFields: additionalFields ?? this.additionalFields,
        id: id ?? this.id,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        householdId: householdId ?? this.householdId,
        isHead: isHead ?? this.isHead,
        name: name ?? this.name,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('IndividualTableData(')
          ..write('additionalFields: $additionalFields, ')
          ..write('id: $id, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('householdId: $householdId, ')
          ..write('isHead: $isHead, ')
          ..write('name: $name, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(additionalFields, id, dateOfBirth, gender,
      householdId, isHead, name, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IndividualTableData &&
          other.additionalFields == this.additionalFields &&
          other.id == this.id &&
          other.dateOfBirth == this.dateOfBirth &&
          other.gender == this.gender &&
          other.householdId == this.householdId &&
          other.isHead == this.isHead &&
          other.name == this.name &&
          other.isDeleted == this.isDeleted);
}

class IndividualTableCompanion extends UpdateCompanion<IndividualTableData> {
  final Value<String?> additionalFields;
  final Value<int> id;
  final Value<String> dateOfBirth;
  final Value<String> gender;
  final Value<int> householdId;
  final Value<bool> isHead;
  final Value<String> name;
  final Value<bool> isDeleted;
  const IndividualTableCompanion({
    this.additionalFields = const Value.absent(),
    this.id = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.householdId = const Value.absent(),
    this.isHead = const Value.absent(),
    this.name = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  IndividualTableCompanion.insert({
    this.additionalFields = const Value.absent(),
    this.id = const Value.absent(),
    required String dateOfBirth,
    required String gender,
    required int householdId,
    this.isHead = const Value.absent(),
    required String name,
    required bool isDeleted,
  })  : dateOfBirth = Value(dateOfBirth),
        gender = Value(gender),
        householdId = Value(householdId),
        name = Value(name),
        isDeleted = Value(isDeleted);
  static Insertable<IndividualTableData> custom({
    Expression<String?>? additionalFields,
    Expression<int>? id,
    Expression<String>? dateOfBirth,
    Expression<String>? gender,
    Expression<int>? householdId,
    Expression<bool>? isHead,
    Expression<String>? name,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (id != null) 'id': id,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (householdId != null) 'household_id': householdId,
      if (isHead != null) 'is_head': isHead,
      if (name != null) 'name': name,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  IndividualTableCompanion copyWith(
      {Value<String?>? additionalFields,
      Value<int>? id,
      Value<String>? dateOfBirth,
      Value<String>? gender,
      Value<int>? householdId,
      Value<bool>? isHead,
      Value<String>? name,
      Value<bool>? isDeleted}) {
    return IndividualTableCompanion(
      additionalFields: additionalFields ?? this.additionalFields,
      id: id ?? this.id,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      householdId: householdId ?? this.householdId,
      isHead: isHead ?? this.isHead,
      name: name ?? this.name,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String?>(additionalFields.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (householdId.present) {
      map['household_id'] = Variable<int>(householdId.value);
    }
    if (isHead.present) {
      map['is_head'] = Variable<bool>(isHead.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndividualTableCompanion(')
          ..write('additionalFields: $additionalFields, ')
          ..write('id: $id, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('householdId: $householdId, ')
          ..write('isHead: $isHead, ')
          ..write('name: $name, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $IndividualTableTable extends IndividualTable
    with TableInfo<$IndividualTableTable, IndividualTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndividualTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String?> additionalFields =
      GeneratedColumn<String?>('additional_fields', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String?> dateOfBirth = GeneratedColumn<String?>(
      'date_of_birth', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _householdIdMeta =
      const VerificationMeta('householdId');
  @override
  late final GeneratedColumn<int?> householdId = GeneratedColumn<int?>(
      'household_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES household_table (id)');
  final VerificationMeta _isHeadMeta = const VerificationMeta('isHead');
  @override
  late final GeneratedColumn<bool?> isHead = GeneratedColumn<bool?>(
      'is_head', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_head IN (0, 1))',
      defaultValue: const Constant(true));
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool?> isDeleted = GeneratedColumn<bool?>(
      'is_deleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_deleted IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        additionalFields,
        id,
        dateOfBirth,
        gender,
        householdId,
        isHead,
        name,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? 'individual_table';
  @override
  String get actualTableName => 'individual_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<IndividualTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('household_id')) {
      context.handle(
          _householdIdMeta,
          householdId.isAcceptableOrUnknown(
              data['household_id']!, _householdIdMeta));
    } else if (isInserting) {
      context.missing(_householdIdMeta);
    }
    if (data.containsKey('is_head')) {
      context.handle(_isHeadMeta,
          isHead.isAcceptableOrUnknown(data['is_head']!, _isHeadMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IndividualTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return IndividualTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IndividualTableTable createAlias(String alias) {
    return $IndividualTableTable(attachedDatabase, alias);
  }
}

class IndividualIdentifierTableData extends DataClass
    implements Insertable<IndividualIdentifierTableData> {
  final String identifierId;
  final String identifierType;
  final int individualId;
  IndividualIdentifierTableData(
      {required this.identifierId,
      required this.identifierType,
      required this.individualId});
  factory IndividualIdentifierTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IndividualIdentifierTableData(
      identifierId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identifier_id'])!,
      identifierType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identifier_type'])!,
      individualId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}individual_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['identifier_id'] = Variable<String>(identifierId);
    map['identifier_type'] = Variable<String>(identifierType);
    map['individual_id'] = Variable<int>(individualId);
    return map;
  }

  IndividualIdentifierTableCompanion toCompanion(bool nullToAbsent) {
    return IndividualIdentifierTableCompanion(
      identifierId: Value(identifierId),
      identifierType: Value(identifierType),
      individualId: Value(individualId),
    );
  }

  factory IndividualIdentifierTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IndividualIdentifierTableData(
      identifierId: serializer.fromJson<String>(json['identifierId']),
      identifierType: serializer.fromJson<String>(json['identifierType']),
      individualId: serializer.fromJson<int>(json['individualId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'identifierId': serializer.toJson<String>(identifierId),
      'identifierType': serializer.toJson<String>(identifierType),
      'individualId': serializer.toJson<int>(individualId),
    };
  }

  IndividualIdentifierTableData copyWith(
          {String? identifierId, String? identifierType, int? individualId}) =>
      IndividualIdentifierTableData(
        identifierId: identifierId ?? this.identifierId,
        identifierType: identifierType ?? this.identifierType,
        individualId: individualId ?? this.individualId,
      );
  @override
  String toString() {
    return (StringBuffer('IndividualIdentifierTableData(')
          ..write('identifierId: $identifierId, ')
          ..write('identifierType: $identifierType, ')
          ..write('individualId: $individualId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(identifierId, identifierType, individualId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IndividualIdentifierTableData &&
          other.identifierId == this.identifierId &&
          other.identifierType == this.identifierType &&
          other.individualId == this.individualId);
}

class IndividualIdentifierTableCompanion
    extends UpdateCompanion<IndividualIdentifierTableData> {
  final Value<String> identifierId;
  final Value<String> identifierType;
  final Value<int> individualId;
  const IndividualIdentifierTableCompanion({
    this.identifierId = const Value.absent(),
    this.identifierType = const Value.absent(),
    this.individualId = const Value.absent(),
  });
  IndividualIdentifierTableCompanion.insert({
    required String identifierId,
    required String identifierType,
    required int individualId,
  })  : identifierId = Value(identifierId),
        identifierType = Value(identifierType),
        individualId = Value(individualId);
  static Insertable<IndividualIdentifierTableData> custom({
    Expression<String>? identifierId,
    Expression<String>? identifierType,
    Expression<int>? individualId,
  }) {
    return RawValuesInsertable({
      if (identifierId != null) 'identifier_id': identifierId,
      if (identifierType != null) 'identifier_type': identifierType,
      if (individualId != null) 'individual_id': individualId,
    });
  }

  IndividualIdentifierTableCompanion copyWith(
      {Value<String>? identifierId,
      Value<String>? identifierType,
      Value<int>? individualId}) {
    return IndividualIdentifierTableCompanion(
      identifierId: identifierId ?? this.identifierId,
      identifierType: identifierType ?? this.identifierType,
      individualId: individualId ?? this.individualId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (identifierId.present) {
      map['identifier_id'] = Variable<String>(identifierId.value);
    }
    if (identifierType.present) {
      map['identifier_type'] = Variable<String>(identifierType.value);
    }
    if (individualId.present) {
      map['individual_id'] = Variable<int>(individualId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndividualIdentifierTableCompanion(')
          ..write('identifierId: $identifierId, ')
          ..write('identifierType: $identifierType, ')
          ..write('individualId: $individualId')
          ..write(')'))
        .toString();
  }
}

class $IndividualIdentifierTableTable extends IndividualIdentifierTable
    with
        TableInfo<$IndividualIdentifierTableTable,
            IndividualIdentifierTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndividualIdentifierTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _identifierIdMeta =
      const VerificationMeta('identifierId');
  @override
  late final GeneratedColumn<String?> identifierId = GeneratedColumn<String?>(
      'identifier_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _identifierTypeMeta =
      const VerificationMeta('identifierType');
  @override
  late final GeneratedColumn<String?> identifierType = GeneratedColumn<String?>(
      'identifier_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _individualIdMeta =
      const VerificationMeta('individualId');
  @override
  late final GeneratedColumn<int?> individualId = GeneratedColumn<int?>(
      'individual_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES individual_table (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [identifierId, identifierType, individualId];
  @override
  String get aliasedName => _alias ?? 'individual_identifier_table';
  @override
  String get actualTableName => 'individual_identifier_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<IndividualIdentifierTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('identifier_id')) {
      context.handle(
          _identifierIdMeta,
          identifierId.isAcceptableOrUnknown(
              data['identifier_id']!, _identifierIdMeta));
    } else if (isInserting) {
      context.missing(_identifierIdMeta);
    }
    if (data.containsKey('identifier_type')) {
      context.handle(
          _identifierTypeMeta,
          identifierType.isAcceptableOrUnknown(
              data['identifier_type']!, _identifierTypeMeta));
    } else if (isInserting) {
      context.missing(_identifierTypeMeta);
    }
    if (data.containsKey('individual_id')) {
      context.handle(
          _individualIdMeta,
          individualId.isAcceptableOrUnknown(
              data['individual_id']!, _individualIdMeta));
    } else if (isInserting) {
      context.missing(_individualIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {identifierId};
  @override
  IndividualIdentifierTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return IndividualIdentifierTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IndividualIdentifierTableTable createAlias(String alias) {
    return $IndividualIdentifierTableTable(attachedDatabase, alias);
  }
}

class DeliveryTableData extends DataClass
    implements Insertable<DeliveryTableData> {
  final String? additionalFields;
  final String campaignId;
  final String clientReferenceId;
  final int deliveryDate;
  final String deliveredBy;
  final String registrationId;
  final String status;
  final String tenantId;
  DeliveryTableData(
      {this.additionalFields,
      required this.campaignId,
      required this.clientReferenceId,
      required this.deliveryDate,
      required this.deliveredBy,
      required this.registrationId,
      required this.status,
      required this.tenantId});
  factory DeliveryTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeliveryTableData(
      additionalFields: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additional_fields']),
      campaignId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}campaign_id'])!,
      clientReferenceId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}client_reference_id'])!,
      deliveryDate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_date'])!,
      deliveredBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivered_by'])!,
      registrationId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}registration_id'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      tenantId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String?>(additionalFields);
    }
    map['campaign_id'] = Variable<String>(campaignId);
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    map['delivery_date'] = Variable<int>(deliveryDate);
    map['delivered_by'] = Variable<String>(deliveredBy);
    map['registration_id'] = Variable<String>(registrationId);
    map['status'] = Variable<String>(status);
    map['tenant_id'] = Variable<String>(tenantId);
    return map;
  }

  DeliveryTableCompanion toCompanion(bool nullToAbsent) {
    return DeliveryTableCompanion(
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
      campaignId: Value(campaignId),
      clientReferenceId: Value(clientReferenceId),
      deliveryDate: Value(deliveryDate),
      deliveredBy: Value(deliveredBy),
      registrationId: Value(registrationId),
      status: Value(status),
      tenantId: Value(tenantId),
    );
  }

  factory DeliveryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeliveryTableData(
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
      campaignId: serializer.fromJson<String>(json['campaignId']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      deliveryDate: serializer.fromJson<int>(json['deliveryDate']),
      deliveredBy: serializer.fromJson<String>(json['deliveredBy']),
      registrationId: serializer.fromJson<String>(json['registrationId']),
      status: serializer.fromJson<String>(json['status']),
      tenantId: serializer.fromJson<String>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'additionalFields': serializer.toJson<String?>(additionalFields),
      'campaignId': serializer.toJson<String>(campaignId),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'deliveryDate': serializer.toJson<int>(deliveryDate),
      'deliveredBy': serializer.toJson<String>(deliveredBy),
      'registrationId': serializer.toJson<String>(registrationId),
      'status': serializer.toJson<String>(status),
      'tenantId': serializer.toJson<String>(tenantId),
    };
  }

  DeliveryTableData copyWith(
          {String? additionalFields,
          String? campaignId,
          String? clientReferenceId,
          int? deliveryDate,
          String? deliveredBy,
          String? registrationId,
          String? status,
          String? tenantId}) =>
      DeliveryTableData(
        additionalFields: additionalFields ?? this.additionalFields,
        campaignId: campaignId ?? this.campaignId,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveredBy: deliveredBy ?? this.deliveredBy,
        registrationId: registrationId ?? this.registrationId,
        status: status ?? this.status,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('DeliveryTableData(')
          ..write('additionalFields: $additionalFields, ')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('deliveredBy: $deliveredBy, ')
          ..write('registrationId: $registrationId, ')
          ..write('status: $status, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      additionalFields,
      campaignId,
      clientReferenceId,
      deliveryDate,
      deliveredBy,
      registrationId,
      status,
      tenantId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryTableData &&
          other.additionalFields == this.additionalFields &&
          other.campaignId == this.campaignId &&
          other.clientReferenceId == this.clientReferenceId &&
          other.deliveryDate == this.deliveryDate &&
          other.deliveredBy == this.deliveredBy &&
          other.registrationId == this.registrationId &&
          other.status == this.status &&
          other.tenantId == this.tenantId);
}

class DeliveryTableCompanion extends UpdateCompanion<DeliveryTableData> {
  final Value<String?> additionalFields;
  final Value<String> campaignId;
  final Value<String> clientReferenceId;
  final Value<int> deliveryDate;
  final Value<String> deliveredBy;
  final Value<String> registrationId;
  final Value<String> status;
  final Value<String> tenantId;
  const DeliveryTableCompanion({
    this.additionalFields = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.deliveredBy = const Value.absent(),
    this.registrationId = const Value.absent(),
    this.status = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  DeliveryTableCompanion.insert({
    this.additionalFields = const Value.absent(),
    required String campaignId,
    required String clientReferenceId,
    required int deliveryDate,
    required String deliveredBy,
    required String registrationId,
    required String status,
    required String tenantId,
  })  : campaignId = Value(campaignId),
        clientReferenceId = Value(clientReferenceId),
        deliveryDate = Value(deliveryDate),
        deliveredBy = Value(deliveredBy),
        registrationId = Value(registrationId),
        status = Value(status),
        tenantId = Value(tenantId);
  static Insertable<DeliveryTableData> custom({
    Expression<String?>? additionalFields,
    Expression<String>? campaignId,
    Expression<String>? clientReferenceId,
    Expression<int>? deliveryDate,
    Expression<String>? deliveredBy,
    Expression<String>? registrationId,
    Expression<String>? status,
    Expression<String>? tenantId,
  }) {
    return RawValuesInsertable({
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (campaignId != null) 'campaign_id': campaignId,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (deliveredBy != null) 'delivered_by': deliveredBy,
      if (registrationId != null) 'registration_id': registrationId,
      if (status != null) 'status': status,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  DeliveryTableCompanion copyWith(
      {Value<String?>? additionalFields,
      Value<String>? campaignId,
      Value<String>? clientReferenceId,
      Value<int>? deliveryDate,
      Value<String>? deliveredBy,
      Value<String>? registrationId,
      Value<String>? status,
      Value<String>? tenantId}) {
    return DeliveryTableCompanion(
      additionalFields: additionalFields ?? this.additionalFields,
      campaignId: campaignId ?? this.campaignId,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveredBy: deliveredBy ?? this.deliveredBy,
      registrationId: registrationId ?? this.registrationId,
      status: status ?? this.status,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String?>(additionalFields.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<int>(deliveryDate.value);
    }
    if (deliveredBy.present) {
      map['delivered_by'] = Variable<String>(deliveredBy.value);
    }
    if (registrationId.present) {
      map['registration_id'] = Variable<String>(registrationId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryTableCompanion(')
          ..write('additionalFields: $additionalFields, ')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('deliveredBy: $deliveredBy, ')
          ..write('registrationId: $registrationId, ')
          ..write('status: $status, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $DeliveryTableTable extends DeliveryTable
    with TableInfo<$DeliveryTableTable, DeliveryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeliveryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String?> additionalFields =
      GeneratedColumn<String?>('additional_fields', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _campaignIdMeta = const VerificationMeta('campaignId');
  @override
  late final GeneratedColumn<String?> campaignId = GeneratedColumn<String?>(
      'campaign_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String?> clientReferenceId =
      GeneratedColumn<String?>('client_reference_id', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  @override
  late final GeneratedColumn<int?> deliveryDate = GeneratedColumn<int?>(
      'delivery_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _deliveredByMeta =
      const VerificationMeta('deliveredBy');
  @override
  late final GeneratedColumn<String?> deliveredBy = GeneratedColumn<String?>(
      'delivered_by', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _registrationIdMeta =
      const VerificationMeta('registrationId');
  @override
  late final GeneratedColumn<String?> registrationId = GeneratedColumn<String?>(
      'registration_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints:
          'REFERENCES campaign_registration_table (client_reference_id)');
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String?> tenantId = GeneratedColumn<String?>(
      'tenant_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        additionalFields,
        campaignId,
        clientReferenceId,
        deliveryDate,
        deliveredBy,
        registrationId,
        status,
        tenantId
      ];
  @override
  String get aliasedName => _alias ?? 'delivery_table';
  @override
  String get actualTableName => 'delivery_table';
  @override
  VerificationContext validateIntegrity(Insertable<DeliveryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
          _campaignIdMeta,
          campaignId.isAcceptableOrUnknown(
              data['campaign_id']!, _campaignIdMeta));
    } else if (isInserting) {
      context.missing(_campaignIdMeta);
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date']!, _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('delivered_by')) {
      context.handle(
          _deliveredByMeta,
          deliveredBy.isAcceptableOrUnknown(
              data['delivered_by']!, _deliveredByMeta));
    } else if (isInserting) {
      context.missing(_deliveredByMeta);
    }
    if (data.containsKey('registration_id')) {
      context.handle(
          _registrationIdMeta,
          registrationId.isAcceptableOrUnknown(
              data['registration_id']!, _registrationIdMeta));
    } else if (isInserting) {
      context.missing(_registrationIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientReferenceId};
  @override
  DeliveryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DeliveryTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DeliveryTableTable createAlias(String alias) {
    return $DeliveryTableTable(attachedDatabase, alias);
  }
}

class DeliveryResourceTableData extends DataClass
    implements Insertable<DeliveryResourceTableData> {
  final int id;
  final String resourceId;
  final int quantityToBeDelivered;
  final int quantityDelivered;
  final String? reasonIfNotDelivered;
  DeliveryResourceTableData(
      {required this.id,
      required this.resourceId,
      required this.quantityToBeDelivered,
      required this.quantityDelivered,
      this.reasonIfNotDelivered});
  factory DeliveryResourceTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeliveryResourceTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      resourceId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}resource_id'])!,
      quantityToBeDelivered: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}quantity_to_be_delivered'])!,
      quantityDelivered: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}quantity_delivered'])!,
      reasonIfNotDelivered: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}reason_if_not_delivered']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['resource_id'] = Variable<String>(resourceId);
    map['quantity_to_be_delivered'] = Variable<int>(quantityToBeDelivered);
    map['quantity_delivered'] = Variable<int>(quantityDelivered);
    if (!nullToAbsent || reasonIfNotDelivered != null) {
      map['reason_if_not_delivered'] = Variable<String?>(reasonIfNotDelivered);
    }
    return map;
  }

  DeliveryResourceTableCompanion toCompanion(bool nullToAbsent) {
    return DeliveryResourceTableCompanion(
      id: Value(id),
      resourceId: Value(resourceId),
      quantityToBeDelivered: Value(quantityToBeDelivered),
      quantityDelivered: Value(quantityDelivered),
      reasonIfNotDelivered: reasonIfNotDelivered == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonIfNotDelivered),
    );
  }

  factory DeliveryResourceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeliveryResourceTableData(
      id: serializer.fromJson<int>(json['id']),
      resourceId: serializer.fromJson<String>(json['resourceId']),
      quantityToBeDelivered:
          serializer.fromJson<int>(json['quantityToBeDelivered']),
      quantityDelivered: serializer.fromJson<int>(json['quantityDelivered']),
      reasonIfNotDelivered:
          serializer.fromJson<String?>(json['reasonIfNotDelivered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'resourceId': serializer.toJson<String>(resourceId),
      'quantityToBeDelivered': serializer.toJson<int>(quantityToBeDelivered),
      'quantityDelivered': serializer.toJson<int>(quantityDelivered),
      'reasonIfNotDelivered': serializer.toJson<String?>(reasonIfNotDelivered),
    };
  }

  DeliveryResourceTableData copyWith(
          {int? id,
          String? resourceId,
          int? quantityToBeDelivered,
          int? quantityDelivered,
          String? reasonIfNotDelivered}) =>
      DeliveryResourceTableData(
        id: id ?? this.id,
        resourceId: resourceId ?? this.resourceId,
        quantityToBeDelivered:
            quantityToBeDelivered ?? this.quantityToBeDelivered,
        quantityDelivered: quantityDelivered ?? this.quantityDelivered,
        reasonIfNotDelivered: reasonIfNotDelivered ?? this.reasonIfNotDelivered,
      );
  @override
  String toString() {
    return (StringBuffer('DeliveryResourceTableData(')
          ..write('id: $id, ')
          ..write('resourceId: $resourceId, ')
          ..write('quantityToBeDelivered: $quantityToBeDelivered, ')
          ..write('quantityDelivered: $quantityDelivered, ')
          ..write('reasonIfNotDelivered: $reasonIfNotDelivered')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, resourceId, quantityToBeDelivered,
      quantityDelivered, reasonIfNotDelivered);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryResourceTableData &&
          other.id == this.id &&
          other.resourceId == this.resourceId &&
          other.quantityToBeDelivered == this.quantityToBeDelivered &&
          other.quantityDelivered == this.quantityDelivered &&
          other.reasonIfNotDelivered == this.reasonIfNotDelivered);
}

class DeliveryResourceTableCompanion
    extends UpdateCompanion<DeliveryResourceTableData> {
  final Value<int> id;
  final Value<String> resourceId;
  final Value<int> quantityToBeDelivered;
  final Value<int> quantityDelivered;
  final Value<String?> reasonIfNotDelivered;
  const DeliveryResourceTableCompanion({
    this.id = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.quantityToBeDelivered = const Value.absent(),
    this.quantityDelivered = const Value.absent(),
    this.reasonIfNotDelivered = const Value.absent(),
  });
  DeliveryResourceTableCompanion.insert({
    this.id = const Value.absent(),
    required String resourceId,
    required int quantityToBeDelivered,
    required int quantityDelivered,
    this.reasonIfNotDelivered = const Value.absent(),
  })  : resourceId = Value(resourceId),
        quantityToBeDelivered = Value(quantityToBeDelivered),
        quantityDelivered = Value(quantityDelivered);
  static Insertable<DeliveryResourceTableData> custom({
    Expression<int>? id,
    Expression<String>? resourceId,
    Expression<int>? quantityToBeDelivered,
    Expression<int>? quantityDelivered,
    Expression<String?>? reasonIfNotDelivered,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (resourceId != null) 'resource_id': resourceId,
      if (quantityToBeDelivered != null)
        'quantity_to_be_delivered': quantityToBeDelivered,
      if (quantityDelivered != null) 'quantity_delivered': quantityDelivered,
      if (reasonIfNotDelivered != null)
        'reason_if_not_delivered': reasonIfNotDelivered,
    });
  }

  DeliveryResourceTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? resourceId,
      Value<int>? quantityToBeDelivered,
      Value<int>? quantityDelivered,
      Value<String?>? reasonIfNotDelivered}) {
    return DeliveryResourceTableCompanion(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      quantityToBeDelivered:
          quantityToBeDelivered ?? this.quantityToBeDelivered,
      quantityDelivered: quantityDelivered ?? this.quantityDelivered,
      reasonIfNotDelivered: reasonIfNotDelivered ?? this.reasonIfNotDelivered,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (quantityToBeDelivered.present) {
      map['quantity_to_be_delivered'] =
          Variable<int>(quantityToBeDelivered.value);
    }
    if (quantityDelivered.present) {
      map['quantity_delivered'] = Variable<int>(quantityDelivered.value);
    }
    if (reasonIfNotDelivered.present) {
      map['reason_if_not_delivered'] =
          Variable<String?>(reasonIfNotDelivered.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryResourceTableCompanion(')
          ..write('id: $id, ')
          ..write('resourceId: $resourceId, ')
          ..write('quantityToBeDelivered: $quantityToBeDelivered, ')
          ..write('quantityDelivered: $quantityDelivered, ')
          ..write('reasonIfNotDelivered: $reasonIfNotDelivered')
          ..write(')'))
        .toString();
  }
}

class $DeliveryResourceTableTable extends DeliveryResourceTable
    with TableInfo<$DeliveryResourceTableTable, DeliveryResourceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeliveryResourceTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _resourceIdMeta = const VerificationMeta('resourceId');
  @override
  late final GeneratedColumn<String?> resourceId = GeneratedColumn<String?>(
      'resource_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _quantityToBeDeliveredMeta =
      const VerificationMeta('quantityToBeDelivered');
  @override
  late final GeneratedColumn<int?> quantityToBeDelivered =
      GeneratedColumn<int?>('quantity_to_be_delivered', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantityDeliveredMeta =
      const VerificationMeta('quantityDelivered');
  @override
  late final GeneratedColumn<int?> quantityDelivered = GeneratedColumn<int?>(
      'quantity_delivered', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _reasonIfNotDeliveredMeta =
      const VerificationMeta('reasonIfNotDelivered');
  @override
  late final GeneratedColumn<String?> reasonIfNotDelivered =
      GeneratedColumn<String?>('reason_if_not_delivered', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        resourceId,
        quantityToBeDelivered,
        quantityDelivered,
        reasonIfNotDelivered
      ];
  @override
  String get aliasedName => _alias ?? 'delivery_resource_table';
  @override
  String get actualTableName => 'delivery_resource_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DeliveryResourceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('resource_id')) {
      context.handle(
          _resourceIdMeta,
          resourceId.isAcceptableOrUnknown(
              data['resource_id']!, _resourceIdMeta));
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    if (data.containsKey('quantity_to_be_delivered')) {
      context.handle(
          _quantityToBeDeliveredMeta,
          quantityToBeDelivered.isAcceptableOrUnknown(
              data['quantity_to_be_delivered']!, _quantityToBeDeliveredMeta));
    } else if (isInserting) {
      context.missing(_quantityToBeDeliveredMeta);
    }
    if (data.containsKey('quantity_delivered')) {
      context.handle(
          _quantityDeliveredMeta,
          quantityDelivered.isAcceptableOrUnknown(
              data['quantity_delivered']!, _quantityDeliveredMeta));
    } else if (isInserting) {
      context.missing(_quantityDeliveredMeta);
    }
    if (data.containsKey('reason_if_not_delivered')) {
      context.handle(
          _reasonIfNotDeliveredMeta,
          reasonIfNotDelivered.isAcceptableOrUnknown(
              data['reason_if_not_delivered']!, _reasonIfNotDeliveredMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeliveryResourceTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return DeliveryResourceTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DeliveryResourceTableTable createAlias(String alias) {
    return $DeliveryResourceTableTable(attachedDatabase, alias);
  }
}

abstract class _$LocalSqlDataStore extends GeneratedDatabase {
  _$LocalSqlDataStore(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $CampaignRegistrationTableTable campaignRegistrationTable =
      $CampaignRegistrationTableTable(this);
  late final $HouseholdTableTable householdTable = $HouseholdTableTable(this);
  late final $IndividualTableTable individualTable =
      $IndividualTableTable(this);
  late final $IndividualIdentifierTableTable individualIdentifierTable =
      $IndividualIdentifierTableTable(this);
  late final $DeliveryTableTable deliveryTable = $DeliveryTableTable(this);
  late final $DeliveryResourceTableTable deliveryResourceTable =
      $DeliveryResourceTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        campaignRegistrationTable,
        householdTable,
        individualTable,
        individualIdentifierTable,
        deliveryTable,
        deliveryResourceTable
      ];
}
