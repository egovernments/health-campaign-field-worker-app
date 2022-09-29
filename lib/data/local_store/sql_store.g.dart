// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HouseholdRegistrationTableData extends DataClass
    implements Insertable<HouseholdRegistrationTableData> {
  final String? id;
  final String clientReferenceId;
  final String campaignId;
  final String tenantId;
  final int registeredAt;
  final String? beneficiaryType;
  final bool isSynced;
  final String syncFileId;
  HouseholdRegistrationTableData(
      {this.id,
      required this.clientReferenceId,
      required this.campaignId,
      required this.tenantId,
      required this.registeredAt,
      this.beneficiaryType,
      required this.isSynced,
      required this.syncFileId});
  factory HouseholdRegistrationTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HouseholdRegistrationTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      clientReferenceId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}client_reference_id'])!,
      campaignId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}campaign_id'])!,
      tenantId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id'])!,
      registeredAt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}registered_at'])!,
      beneficiaryType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}beneficiary_type']),
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      syncFileId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_file_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    map['campaign_id'] = Variable<String>(campaignId);
    map['tenant_id'] = Variable<String>(tenantId);
    map['registered_at'] = Variable<int>(registeredAt);
    if (!nullToAbsent || beneficiaryType != null) {
      map['beneficiary_type'] = Variable<String?>(beneficiaryType);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    map['sync_file_id'] = Variable<String>(syncFileId);
    return map;
  }

  HouseholdRegistrationTableCompanion toCompanion(bool nullToAbsent) {
    return HouseholdRegistrationTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      clientReferenceId: Value(clientReferenceId),
      campaignId: Value(campaignId),
      tenantId: Value(tenantId),
      registeredAt: Value(registeredAt),
      beneficiaryType: beneficiaryType == null && nullToAbsent
          ? const Value.absent()
          : Value(beneficiaryType),
      isSynced: Value(isSynced),
      syncFileId: Value(syncFileId),
    );
  }

  factory HouseholdRegistrationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseholdRegistrationTableData(
      id: serializer.fromJson<String?>(json['id']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      campaignId: serializer.fromJson<String>(json['campaignId']),
      tenantId: serializer.fromJson<String>(json['tenantId']),
      registeredAt: serializer.fromJson<int>(json['registeredAt']),
      beneficiaryType: serializer.fromJson<String?>(json['beneficiaryType']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      syncFileId: serializer.fromJson<String>(json['syncFileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'campaignId': serializer.toJson<String>(campaignId),
      'tenantId': serializer.toJson<String>(tenantId),
      'registeredAt': serializer.toJson<int>(registeredAt),
      'beneficiaryType': serializer.toJson<String?>(beneficiaryType),
      'isSynced': serializer.toJson<bool>(isSynced),
      'syncFileId': serializer.toJson<String>(syncFileId),
    };
  }

  HouseholdRegistrationTableData copyWith(
          {String? id,
          String? clientReferenceId,
          String? campaignId,
          String? tenantId,
          int? registeredAt,
          String? beneficiaryType,
          bool? isSynced,
          String? syncFileId}) =>
      HouseholdRegistrationTableData(
        id: id ?? this.id,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        campaignId: campaignId ?? this.campaignId,
        tenantId: tenantId ?? this.tenantId,
        registeredAt: registeredAt ?? this.registeredAt,
        beneficiaryType: beneficiaryType ?? this.beneficiaryType,
        isSynced: isSynced ?? this.isSynced,
        syncFileId: syncFileId ?? this.syncFileId,
      );
  @override
  String toString() {
    return (StringBuffer('HouseholdRegistrationTableData(')
          ..write('id: $id, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('campaignId: $campaignId, ')
          ..write('tenantId: $tenantId, ')
          ..write('registeredAt: $registeredAt, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileId: $syncFileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientReferenceId, campaignId, tenantId,
      registeredAt, beneficiaryType, isSynced, syncFileId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseholdRegistrationTableData &&
          other.id == this.id &&
          other.clientReferenceId == this.clientReferenceId &&
          other.campaignId == this.campaignId &&
          other.tenantId == this.tenantId &&
          other.registeredAt == this.registeredAt &&
          other.beneficiaryType == this.beneficiaryType &&
          other.isSynced == this.isSynced &&
          other.syncFileId == this.syncFileId);
}

class HouseholdRegistrationTableCompanion
    extends UpdateCompanion<HouseholdRegistrationTableData> {
  final Value<String?> id;
  final Value<String> clientReferenceId;
  final Value<String> campaignId;
  final Value<String> tenantId;
  final Value<int> registeredAt;
  final Value<String?> beneficiaryType;
  final Value<bool> isSynced;
  final Value<String> syncFileId;
  const HouseholdRegistrationTableCompanion({
    this.id = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.registeredAt = const Value.absent(),
    this.beneficiaryType = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.syncFileId = const Value.absent(),
  });
  HouseholdRegistrationTableCompanion.insert({
    this.id = const Value.absent(),
    required String clientReferenceId,
    required String campaignId,
    required String tenantId,
    required int registeredAt,
    this.beneficiaryType = const Value.absent(),
    required bool isSynced,
    required String syncFileId,
  })  : clientReferenceId = Value(clientReferenceId),
        campaignId = Value(campaignId),
        tenantId = Value(tenantId),
        registeredAt = Value(registeredAt),
        isSynced = Value(isSynced),
        syncFileId = Value(syncFileId);
  static Insertable<HouseholdRegistrationTableData> custom({
    Expression<String?>? id,
    Expression<String>? clientReferenceId,
    Expression<String>? campaignId,
    Expression<String>? tenantId,
    Expression<int>? registeredAt,
    Expression<String?>? beneficiaryType,
    Expression<bool>? isSynced,
    Expression<String>? syncFileId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (campaignId != null) 'campaign_id': campaignId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (registeredAt != null) 'registered_at': registeredAt,
      if (beneficiaryType != null) 'beneficiary_type': beneficiaryType,
      if (isSynced != null) 'is_synced': isSynced,
      if (syncFileId != null) 'sync_file_id': syncFileId,
    });
  }

  HouseholdRegistrationTableCompanion copyWith(
      {Value<String?>? id,
      Value<String>? clientReferenceId,
      Value<String>? campaignId,
      Value<String>? tenantId,
      Value<int>? registeredAt,
      Value<String?>? beneficiaryType,
      Value<bool>? isSynced,
      Value<String>? syncFileId}) {
    return HouseholdRegistrationTableCompanion(
      id: id ?? this.id,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      campaignId: campaignId ?? this.campaignId,
      tenantId: tenantId ?? this.tenantId,
      registeredAt: registeredAt ?? this.registeredAt,
      beneficiaryType: beneficiaryType ?? this.beneficiaryType,
      isSynced: isSynced ?? this.isSynced,
      syncFileId: syncFileId ?? this.syncFileId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (registeredAt.present) {
      map['registered_at'] = Variable<int>(registeredAt.value);
    }
    if (beneficiaryType.present) {
      map['beneficiary_type'] = Variable<String?>(beneficiaryType.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (syncFileId.present) {
      map['sync_file_id'] = Variable<String>(syncFileId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseholdRegistrationTableCompanion(')
          ..write('id: $id, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('campaignId: $campaignId, ')
          ..write('tenantId: $tenantId, ')
          ..write('registeredAt: $registeredAt, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('isSynced: $isSynced, ')
          ..write('syncFileId: $syncFileId')
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String?> clientReferenceId =
      GeneratedColumn<String?>('client_reference_id', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _campaignIdMeta = const VerificationMeta('campaignId');
  @override
  late final GeneratedColumn<String?> campaignId = GeneratedColumn<String?>(
      'campaign_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String?> tenantId = GeneratedColumn<String?>(
      'tenant_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _registeredAtMeta =
      const VerificationMeta('registeredAt');
  @override
  late final GeneratedColumn<int?> registeredAt = GeneratedColumn<int?>(
      'registered_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _beneficiaryTypeMeta =
      const VerificationMeta('beneficiaryType');
  @override
  late final GeneratedColumn<String?> beneficiaryType =
      GeneratedColumn<String?>('beneficiary_type', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))');
  final VerificationMeta _syncFileIdMeta = const VerificationMeta('syncFileId');
  @override
  late final GeneratedColumn<String?> syncFileId = GeneratedColumn<String?>(
      'sync_file_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        clientReferenceId,
        campaignId,
        tenantId,
        registeredAt,
        beneficiaryType,
        isSynced,
        syncFileId
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
          _campaignIdMeta,
          campaignId.isAcceptableOrUnknown(
              data['campaign_id']!, _campaignIdMeta));
    } else if (isInserting) {
      context.missing(_campaignIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('registered_at')) {
      context.handle(
          _registeredAtMeta,
          registeredAt.isAcceptableOrUnknown(
              data['registered_at']!, _registeredAtMeta));
    } else if (isInserting) {
      context.missing(_registeredAtMeta);
    }
    if (data.containsKey('beneficiary_type')) {
      context.handle(
          _beneficiaryTypeMeta,
          beneficiaryType.isAcceptableOrUnknown(
              data['beneficiary_type']!, _beneficiaryTypeMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    } else if (isInserting) {
      context.missing(_isSyncedMeta);
    }
    if (data.containsKey('sync_file_id')) {
      context.handle(
          _syncFileIdMeta,
          syncFileId.isAcceptableOrUnknown(
              data['sync_file_id']!, _syncFileIdMeta));
    } else if (isInserting) {
      context.missing(_syncFileIdMeta);
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

abstract class _$LocalSqlDataStore extends GeneratedDatabase {
  _$LocalSqlDataStore(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $HouseholdRegistrationTableTable householdRegistrationTable =
      $HouseholdRegistrationTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [householdRegistrationTable];
}
