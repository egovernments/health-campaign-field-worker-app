// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HouseholdRegistrationTableData extends DataClass
    implements Insertable<HouseholdRegistrationTableData> {
  final String? additionalFields;
  final String administrativeUnit;
  final String campaignId;
  final String clientReferenceId;
  final int dateOfRegistration;
  final String? householdId;
  final double? latitude;
  final double? longitude;
  final double? accuracy;
  final int numberOfIndividuals;
  final String tenantId;
  final bool isSynced;
  final String? syncFileName;
  HouseholdRegistrationTableData(
      {this.additionalFields,
      required this.administrativeUnit,
      required this.campaignId,
      required this.clientReferenceId,
      required this.dateOfRegistration,
      this.householdId,
      this.latitude,
      this.longitude,
      this.accuracy,
      required this.numberOfIndividuals,
      required this.tenantId,
      required this.isSynced,
      this.syncFileName});
  factory HouseholdRegistrationTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HouseholdRegistrationTableData(
      additionalFields: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additional_fields']),
      administrativeUnit: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}administrative_unit'])!,
      campaignId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}campaign_id'])!,
      clientReferenceId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}client_reference_id'])!,
      dateOfRegistration: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_of_registration'])!,
      householdId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}household_id']),
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      accuracy: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}accuracy']),
      numberOfIndividuals: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}number_of_individuals'])!,
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
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String?>(additionalFields);
    }
    map['administrative_unit'] = Variable<String>(administrativeUnit);
    map['campaign_id'] = Variable<String>(campaignId);
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    map['date_of_registration'] = Variable<int>(dateOfRegistration);
    if (!nullToAbsent || householdId != null) {
      map['household_id'] = Variable<String?>(householdId);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double?>(longitude);
    }
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double?>(accuracy);
    }
    map['number_of_individuals'] = Variable<int>(numberOfIndividuals);
    map['tenant_id'] = Variable<String>(tenantId);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || syncFileName != null) {
      map['sync_file_name'] = Variable<String?>(syncFileName);
    }
    return map;
  }

  HouseholdRegistrationTableCompanion toCompanion(bool nullToAbsent) {
    return HouseholdRegistrationTableCompanion(
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
      administrativeUnit: Value(administrativeUnit),
      campaignId: Value(campaignId),
      clientReferenceId: Value(clientReferenceId),
      dateOfRegistration: Value(dateOfRegistration),
      householdId: householdId == null && nullToAbsent
          ? const Value.absent()
          : Value(householdId),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      numberOfIndividuals: Value(numberOfIndividuals),
      tenantId: Value(tenantId),
      isSynced: Value(isSynced),
      syncFileName: syncFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(syncFileName),
    );
  }

  factory HouseholdRegistrationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseholdRegistrationTableData(
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
      administrativeUnit:
          serializer.fromJson<String>(json['administrativeUnit']),
      campaignId: serializer.fromJson<String>(json['campaignId']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      dateOfRegistration: serializer.fromJson<int>(json['dateOfRegistration']),
      householdId: serializer.fromJson<String?>(json['householdId']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      numberOfIndividuals:
          serializer.fromJson<int>(json['numberOfIndividuals']),
      tenantId: serializer.fromJson<String>(json['tenantId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      syncFileName: serializer.fromJson<String?>(json['syncFileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'additionalFields': serializer.toJson<String?>(additionalFields),
      'administrativeUnit': serializer.toJson<String>(administrativeUnit),
      'campaignId': serializer.toJson<String>(campaignId),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'dateOfRegistration': serializer.toJson<int>(dateOfRegistration),
      'householdId': serializer.toJson<String?>(householdId),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'accuracy': serializer.toJson<double?>(accuracy),
      'numberOfIndividuals': serializer.toJson<int>(numberOfIndividuals),
      'tenantId': serializer.toJson<String>(tenantId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'syncFileName': serializer.toJson<String?>(syncFileName),
    };
  }

  HouseholdRegistrationTableData copyWith(
          {String? additionalFields,
          String? administrativeUnit,
          String? campaignId,
          String? clientReferenceId,
          int? dateOfRegistration,
          String? householdId,
          double? latitude,
          double? longitude,
          double? accuracy,
          int? numberOfIndividuals,
          String? tenantId,
          bool? isSynced,
          String? syncFileName}) =>
      HouseholdRegistrationTableData(
        additionalFields: additionalFields ?? this.additionalFields,
        administrativeUnit: administrativeUnit ?? this.administrativeUnit,
        campaignId: campaignId ?? this.campaignId,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
        householdId: householdId ?? this.householdId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        accuracy: accuracy ?? this.accuracy,
        numberOfIndividuals: numberOfIndividuals ?? this.numberOfIndividuals,
        tenantId: tenantId ?? this.tenantId,
        isSynced: isSynced ?? this.isSynced,
        syncFileName: syncFileName ?? this.syncFileName,
      );
  @override
  String toString() {
    return (StringBuffer('HouseholdRegistrationTableData(')
          ..write('additionalFields: $additionalFields, ')
          ..write('administrativeUnit: $administrativeUnit, ')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('householdId: $householdId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('numberOfIndividuals: $numberOfIndividuals, ')
          ..write('tenantId: $tenantId, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileName: $syncFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      additionalFields,
      administrativeUnit,
      campaignId,
      clientReferenceId,
      dateOfRegistration,
      householdId,
      latitude,
      longitude,
      accuracy,
      numberOfIndividuals,
      tenantId,
      isSynced,
      syncFileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseholdRegistrationTableData &&
          other.additionalFields == this.additionalFields &&
          other.administrativeUnit == this.administrativeUnit &&
          other.campaignId == this.campaignId &&
          other.clientReferenceId == this.clientReferenceId &&
          other.dateOfRegistration == this.dateOfRegistration &&
          other.householdId == this.householdId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.accuracy == this.accuracy &&
          other.numberOfIndividuals == this.numberOfIndividuals &&
          other.tenantId == this.tenantId &&
          other.isSynced == this.isSynced &&
          other.syncFileName == this.syncFileName);
}

class HouseholdRegistrationTableCompanion
    extends UpdateCompanion<HouseholdRegistrationTableData> {
  final Value<String?> additionalFields;
  final Value<String> administrativeUnit;
  final Value<String> campaignId;
  final Value<String> clientReferenceId;
  final Value<int> dateOfRegistration;
  final Value<String?> householdId;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> accuracy;
  final Value<int> numberOfIndividuals;
  final Value<String> tenantId;
  final Value<bool> isSynced;
  final Value<String?> syncFileName;
  const HouseholdRegistrationTableCompanion({
    this.additionalFields = const Value.absent(),
    this.administrativeUnit = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.dateOfRegistration = const Value.absent(),
    this.householdId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.numberOfIndividuals = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.syncFileName = const Value.absent(),
  });
  HouseholdRegistrationTableCompanion.insert({
    this.additionalFields = const Value.absent(),
    required String administrativeUnit,
    required String campaignId,
    required String clientReferenceId,
    required int dateOfRegistration,
    this.householdId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    required int numberOfIndividuals,
    required String tenantId,
    this.isSynced = const Value.absent(),
    this.syncFileName = const Value.absent(),
  })  : administrativeUnit = Value(administrativeUnit),
        campaignId = Value(campaignId),
        clientReferenceId = Value(clientReferenceId),
        dateOfRegistration = Value(dateOfRegistration),
        numberOfIndividuals = Value(numberOfIndividuals),
        tenantId = Value(tenantId);
  static Insertable<HouseholdRegistrationTableData> custom({
    Expression<String?>? additionalFields,
    Expression<String>? administrativeUnit,
    Expression<String>? campaignId,
    Expression<String>? clientReferenceId,
    Expression<int>? dateOfRegistration,
    Expression<String?>? householdId,
    Expression<double?>? latitude,
    Expression<double?>? longitude,
    Expression<double?>? accuracy,
    Expression<int>? numberOfIndividuals,
    Expression<String>? tenantId,
    Expression<bool>? isSynced,
    Expression<String?>? syncFileName,
  }) {
    return RawValuesInsertable({
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (administrativeUnit != null) 'administrative_unit': administrativeUnit,
      if (campaignId != null) 'campaign_id': campaignId,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (dateOfRegistration != null)
        'date_of_registration': dateOfRegistration,
      if (householdId != null) 'household_id': householdId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (accuracy != null) 'accuracy': accuracy,
      if (numberOfIndividuals != null)
        'number_of_individuals': numberOfIndividuals,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isSynced != null) 'is_synced': isSynced,
      if (syncFileName != null) 'sync_file_name': syncFileName,
    });
  }

  HouseholdRegistrationTableCompanion copyWith(
      {Value<String?>? additionalFields,
      Value<String>? administrativeUnit,
      Value<String>? campaignId,
      Value<String>? clientReferenceId,
      Value<int>? dateOfRegistration,
      Value<String?>? householdId,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<double?>? accuracy,
      Value<int>? numberOfIndividuals,
      Value<String>? tenantId,
      Value<bool>? isSynced,
      Value<String?>? syncFileName}) {
    return HouseholdRegistrationTableCompanion(
      additionalFields: additionalFields ?? this.additionalFields,
      administrativeUnit: administrativeUnit ?? this.administrativeUnit,
      campaignId: campaignId ?? this.campaignId,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
      householdId: householdId ?? this.householdId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      accuracy: accuracy ?? this.accuracy,
      numberOfIndividuals: numberOfIndividuals ?? this.numberOfIndividuals,
      tenantId: tenantId ?? this.tenantId,
      isSynced: isSynced ?? this.isSynced,
      syncFileName: syncFileName ?? this.syncFileName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String?>(additionalFields.value);
    }
    if (administrativeUnit.present) {
      map['administrative_unit'] = Variable<String>(administrativeUnit.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (dateOfRegistration.present) {
      map['date_of_registration'] = Variable<int>(dateOfRegistration.value);
    }
    if (householdId.present) {
      map['household_id'] = Variable<String?>(householdId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double?>(longitude.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double?>(accuracy.value);
    }
    if (numberOfIndividuals.present) {
      map['number_of_individuals'] = Variable<int>(numberOfIndividuals.value);
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
    return (StringBuffer('HouseholdRegistrationTableCompanion(')
          ..write('additionalFields: $additionalFields, ')
          ..write('administrativeUnit: $administrativeUnit, ')
          ..write('campaignId: $campaignId, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('householdId: $householdId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('numberOfIndividuals: $numberOfIndividuals, ')
          ..write('tenantId: $tenantId, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileName: $syncFileName')
          ..write(')'))
        .toString();
  }
}

class $HouseholdRegistrationTableTable extends HouseholdRegistrationTable
    with
        TableInfo<$HouseholdRegistrationTableTable,
            HouseholdRegistrationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseholdRegistrationTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String?> additionalFields =
      GeneratedColumn<String?>('additional_fields', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _administrativeUnitMeta =
      const VerificationMeta('administrativeUnit');
  @override
  late final GeneratedColumn<String?> administrativeUnit =
      GeneratedColumn<String?>('administrative_unit', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
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
  final VerificationMeta _dateOfRegistrationMeta =
      const VerificationMeta('dateOfRegistration');
  @override
  late final GeneratedColumn<int?> dateOfRegistration = GeneratedColumn<int?>(
      'date_of_registration', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _householdIdMeta =
      const VerificationMeta('householdId');
  @override
  late final GeneratedColumn<String?> householdId = GeneratedColumn<String?>(
      'household_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _accuracyMeta = const VerificationMeta('accuracy');
  @override
  late final GeneratedColumn<double?> accuracy = GeneratedColumn<double?>(
      'accuracy', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _numberOfIndividualsMeta =
      const VerificationMeta('numberOfIndividuals');
  @override
  late final GeneratedColumn<int?> numberOfIndividuals = GeneratedColumn<int?>(
      'number_of_individuals', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
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
        additionalFields,
        administrativeUnit,
        campaignId,
        clientReferenceId,
        dateOfRegistration,
        householdId,
        latitude,
        longitude,
        accuracy,
        numberOfIndividuals,
        tenantId,
        isSynced,
        syncFileName
      ];
  @override
  String get aliasedName => _alias ?? 'household_registration_table';
  @override
  String get actualTableName => 'household_registration_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HouseholdRegistrationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    if (data.containsKey('administrative_unit')) {
      context.handle(
          _administrativeUnitMeta,
          administrativeUnit.isAcceptableOrUnknown(
              data['administrative_unit']!, _administrativeUnitMeta));
    } else if (isInserting) {
      context.missing(_administrativeUnitMeta);
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
    if (data.containsKey('date_of_registration')) {
      context.handle(
          _dateOfRegistrationMeta,
          dateOfRegistration.isAcceptableOrUnknown(
              data['date_of_registration']!, _dateOfRegistrationMeta));
    } else if (isInserting) {
      context.missing(_dateOfRegistrationMeta);
    }
    if (data.containsKey('household_id')) {
      context.handle(
          _householdIdMeta,
          householdId.isAcceptableOrUnknown(
              data['household_id']!, _householdIdMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    }
    if (data.containsKey('number_of_individuals')) {
      context.handle(
          _numberOfIndividualsMeta,
          numberOfIndividuals.isAcceptableOrUnknown(
              data['number_of_individuals']!, _numberOfIndividualsMeta));
    } else if (isInserting) {
      context.missing(_numberOfIndividualsMeta);
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
  HouseholdRegistrationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return HouseholdRegistrationTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HouseholdRegistrationTableTable createAlias(String alias) {
    return $HouseholdRegistrationTableTable(attachedDatabase, alias);
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
  final String givenName;
  final String? familyName;
  final String? additionalName;
  final bool isDeleted;
  IndividualTableData(
      {this.additionalFields,
      required this.id,
      required this.dateOfBirth,
      required this.gender,
      required this.householdId,
      required this.isHead,
      required this.givenName,
      this.familyName,
      this.additionalName,
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
      givenName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}given_name'])!,
      familyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}family_name']),
      additionalName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additional_name']),
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
    map['given_name'] = Variable<String>(givenName);
    if (!nullToAbsent || familyName != null) {
      map['family_name'] = Variable<String?>(familyName);
    }
    if (!nullToAbsent || additionalName != null) {
      map['additional_name'] = Variable<String?>(additionalName);
    }
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
      givenName: Value(givenName),
      familyName: familyName == null && nullToAbsent
          ? const Value.absent()
          : Value(familyName),
      additionalName: additionalName == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalName),
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
      givenName: serializer.fromJson<String>(json['givenName']),
      familyName: serializer.fromJson<String?>(json['familyName']),
      additionalName: serializer.fromJson<String?>(json['additionalName']),
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
      'givenName': serializer.toJson<String>(givenName),
      'familyName': serializer.toJson<String?>(familyName),
      'additionalName': serializer.toJson<String?>(additionalName),
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
          String? givenName,
          String? familyName,
          String? additionalName,
          bool? isDeleted}) =>
      IndividualTableData(
        additionalFields: additionalFields ?? this.additionalFields,
        id: id ?? this.id,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        householdId: householdId ?? this.householdId,
        isHead: isHead ?? this.isHead,
        givenName: givenName ?? this.givenName,
        familyName: familyName ?? this.familyName,
        additionalName: additionalName ?? this.additionalName,
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
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('additionalName: $additionalName, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(additionalFields, id, dateOfBirth, gender,
      householdId, isHead, givenName, familyName, additionalName, isDeleted);
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
          other.givenName == this.givenName &&
          other.familyName == this.familyName &&
          other.additionalName == this.additionalName &&
          other.isDeleted == this.isDeleted);
}

class IndividualTableCompanion extends UpdateCompanion<IndividualTableData> {
  final Value<String?> additionalFields;
  final Value<int> id;
  final Value<String> dateOfBirth;
  final Value<String> gender;
  final Value<int> householdId;
  final Value<bool> isHead;
  final Value<String> givenName;
  final Value<String?> familyName;
  final Value<String?> additionalName;
  final Value<bool> isDeleted;
  const IndividualTableCompanion({
    this.additionalFields = const Value.absent(),
    this.id = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.householdId = const Value.absent(),
    this.isHead = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.additionalName = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  IndividualTableCompanion.insert({
    this.additionalFields = const Value.absent(),
    this.id = const Value.absent(),
    required String dateOfBirth,
    required String gender,
    required int householdId,
    this.isHead = const Value.absent(),
    required String givenName,
    this.familyName = const Value.absent(),
    this.additionalName = const Value.absent(),
    required bool isDeleted,
  })  : dateOfBirth = Value(dateOfBirth),
        gender = Value(gender),
        householdId = Value(householdId),
        givenName = Value(givenName),
        isDeleted = Value(isDeleted);
  static Insertable<IndividualTableData> custom({
    Expression<String?>? additionalFields,
    Expression<int>? id,
    Expression<String>? dateOfBirth,
    Expression<String>? gender,
    Expression<int>? householdId,
    Expression<bool>? isHead,
    Expression<String>? givenName,
    Expression<String?>? familyName,
    Expression<String?>? additionalName,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (id != null) 'id': id,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (householdId != null) 'household_id': householdId,
      if (isHead != null) 'is_head': isHead,
      if (givenName != null) 'given_name': givenName,
      if (familyName != null) 'family_name': familyName,
      if (additionalName != null) 'additional_name': additionalName,
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
      Value<String>? givenName,
      Value<String?>? familyName,
      Value<String?>? additionalName,
      Value<bool>? isDeleted}) {
    return IndividualTableCompanion(
      additionalFields: additionalFields ?? this.additionalFields,
      id: id ?? this.id,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      householdId: householdId ?? this.householdId,
      isHead: isHead ?? this.isHead,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      additionalName: additionalName ?? this.additionalName,
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
    if (givenName.present) {
      map['given_name'] = Variable<String>(givenName.value);
    }
    if (familyName.present) {
      map['family_name'] = Variable<String?>(familyName.value);
    }
    if (additionalName.present) {
      map['additional_name'] = Variable<String?>(additionalName.value);
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
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('additionalName: $additionalName, ')
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
      defaultConstraints:
          'REFERENCES household_registration_table (client_reference_id)');
  final VerificationMeta _isHeadMeta = const VerificationMeta('isHead');
  @override
  late final GeneratedColumn<bool?> isHead = GeneratedColumn<bool?>(
      'is_head', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_head IN (0, 1))',
      defaultValue: const Constant(true));
  final VerificationMeta _givenNameMeta = const VerificationMeta('givenName');
  @override
  late final GeneratedColumn<String?> givenName = GeneratedColumn<String?>(
      'given_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _familyNameMeta = const VerificationMeta('familyName');
  @override
  late final GeneratedColumn<String?> familyName = GeneratedColumn<String?>(
      'family_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalNameMeta =
      const VerificationMeta('additionalName');
  @override
  late final GeneratedColumn<String?> additionalName = GeneratedColumn<String?>(
      'additional_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
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
        givenName,
        familyName,
        additionalName,
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
    if (data.containsKey('given_name')) {
      context.handle(_givenNameMeta,
          givenName.isAcceptableOrUnknown(data['given_name']!, _givenNameMeta));
    } else if (isInserting) {
      context.missing(_givenNameMeta);
    }
    if (data.containsKey('family_name')) {
      context.handle(
          _familyNameMeta,
          familyName.isAcceptableOrUnknown(
              data['family_name']!, _familyNameMeta));
    }
    if (data.containsKey('additional_name')) {
      context.handle(
          _additionalNameMeta,
          additionalName.isAcceptableOrUnknown(
              data['additional_name']!, _additionalNameMeta));
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
          'REFERENCES household_registration_table (client_reference_id)');
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
  late final $HouseholdRegistrationTableTable householdRegistrationTable =
      $HouseholdRegistrationTableTable(this);
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
        householdRegistrationTable,
        individualTable,
        individualIdentifierTable,
        deliveryTable,
        deliveryResourceTable
      ];
}
