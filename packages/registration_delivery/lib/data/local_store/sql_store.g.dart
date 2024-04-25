// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_store.dart';

// ignore_for_file: type=lint
class $HouseholdTable extends Household
    with TableInfo<$HouseholdTable, HouseholdData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseholdTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _memberCountMeta =
      const VerificationMeta('memberCount');
  @override
  late final GeneratedColumn<int> memberCount = GeneratedColumn<int>(
      'member_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberCount,
        latitude,
        longitude,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'household';
  @override
  VerificationContext validateIntegrity(Insertable<HouseholdData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('member_count')) {
      context.handle(
          _memberCountMeta,
          memberCount.isAcceptableOrUnknown(
              data['member_count']!, _memberCountMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  HouseholdData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HouseholdData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      memberCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member_count']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $HouseholdTable createAlias(String alias) {
    return $HouseholdTable(attachedDatabase, alias);
  }
}

class HouseholdData extends DataClass implements Insertable<HouseholdData> {
  final String? id;
  final int? memberCount;
  final double? latitude;
  final double? longitude;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const HouseholdData(
      {this.id,
      this.memberCount,
      this.latitude,
      this.longitude,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || memberCount != null) {
      map['member_count'] = Variable<int>(memberCount);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  HouseholdCompanion toCompanion(bool nullToAbsent) {
    return HouseholdCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      memberCount: memberCount == null && nullToAbsent
          ? const Value.absent()
          : Value(memberCount),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory HouseholdData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseholdData(
      id: serializer.fromJson<String?>(json['id']),
      memberCount: serializer.fromJson<int?>(json['memberCount']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'memberCount': serializer.toJson<int?>(memberCount),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  HouseholdData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<int?> memberCount = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      HouseholdData(
        id: id.present ? id.value : this.id,
        memberCount: memberCount.present ? memberCount.value : this.memberCount,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('HouseholdData(')
          ..write('id: $id, ')
          ..write('memberCount: $memberCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      memberCount,
      latitude,
      longitude,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      clientReferenceId,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseholdData &&
          other.id == this.id &&
          other.memberCount == this.memberCount &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class HouseholdCompanion extends UpdateCompanion<HouseholdData> {
  final Value<String?> id;
  final Value<int?> memberCount;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const HouseholdCompanion({
    this.id = const Value.absent(),
    this.memberCount = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HouseholdCompanion.insert({
    this.id = const Value.absent(),
    this.memberCount = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<HouseholdData> custom({
    Expression<String>? id,
    Expression<int>? memberCount,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberCount != null) 'member_count': memberCount,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HouseholdCompanion copyWith(
      {Value<String?>? id,
      Value<int?>? memberCount,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return HouseholdCompanion(
      id: id ?? this.id,
      memberCount: memberCount ?? this.memberCount,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memberCount.present) {
      map['member_count'] = Variable<int>(memberCount.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseholdCompanion(')
          ..write('id: $id, ')
          ..write('memberCount: $memberCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HouseholdMemberTable extends HouseholdMember
    with TableInfo<$HouseholdMemberTable, HouseholdMemberData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseholdMemberTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _householdIdMeta =
      const VerificationMeta('householdId');
  @override
  late final GeneratedColumn<String> householdId = GeneratedColumn<String>(
      'household_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _householdClientReferenceIdMeta =
      const VerificationMeta('householdClientReferenceId');
  @override
  late final GeneratedColumn<String> householdClientReferenceId =
      GeneratedColumn<String>(
          'household_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _individualIdMeta =
      const VerificationMeta('individualId');
  @override
  late final GeneratedColumn<String> individualId = GeneratedColumn<String>(
      'individual_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _individualClientReferenceIdMeta =
      const VerificationMeta('individualClientReferenceId');
  @override
  late final GeneratedColumn<String> individualClientReferenceId =
      GeneratedColumn<String>(
          'individual_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isHeadOfHouseholdMeta =
      const VerificationMeta('isHeadOfHousehold');
  @override
  late final GeneratedColumn<bool> isHeadOfHousehold = GeneratedColumn<bool>(
      'is_head_of_household', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_head_of_household" IN (0, 1))'));
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        householdId,
        householdClientReferenceId,
        individualId,
        individualClientReferenceId,
        isHeadOfHousehold,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'household_member';
  @override
  VerificationContext validateIntegrity(
      Insertable<HouseholdMemberData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('household_id')) {
      context.handle(
          _householdIdMeta,
          householdId.isAcceptableOrUnknown(
              data['household_id']!, _householdIdMeta));
    }
    if (data.containsKey('household_client_reference_id')) {
      context.handle(
          _householdClientReferenceIdMeta,
          householdClientReferenceId.isAcceptableOrUnknown(
              data['household_client_reference_id']!,
              _householdClientReferenceIdMeta));
    }
    if (data.containsKey('individual_id')) {
      context.handle(
          _individualIdMeta,
          individualId.isAcceptableOrUnknown(
              data['individual_id']!, _individualIdMeta));
    }
    if (data.containsKey('individual_client_reference_id')) {
      context.handle(
          _individualClientReferenceIdMeta,
          individualClientReferenceId.isAcceptableOrUnknown(
              data['individual_client_reference_id']!,
              _individualClientReferenceIdMeta));
    }
    if (data.containsKey('is_head_of_household')) {
      context.handle(
          _isHeadOfHouseholdMeta,
          isHeadOfHousehold.isAcceptableOrUnknown(
              data['is_head_of_household']!, _isHeadOfHouseholdMeta));
    } else if (isInserting) {
      context.missing(_isHeadOfHouseholdMeta);
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  HouseholdMemberData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HouseholdMemberData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      householdId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}household_id']),
      householdClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}household_client_reference_id']),
      individualId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}individual_id']),
      individualClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}individual_client_reference_id']),
      isHeadOfHousehold: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_head_of_household'])!,
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $HouseholdMemberTable createAlias(String alias) {
    return $HouseholdMemberTable(attachedDatabase, alias);
  }
}

class HouseholdMemberData extends DataClass
    implements Insertable<HouseholdMemberData> {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool isHeadOfHousehold;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const HouseholdMemberData(
      {this.id,
      this.householdId,
      this.householdClientReferenceId,
      this.individualId,
      this.individualClientReferenceId,
      required this.isHeadOfHousehold,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || householdId != null) {
      map['household_id'] = Variable<String>(householdId);
    }
    if (!nullToAbsent || householdClientReferenceId != null) {
      map['household_client_reference_id'] =
          Variable<String>(householdClientReferenceId);
    }
    if (!nullToAbsent || individualId != null) {
      map['individual_id'] = Variable<String>(individualId);
    }
    if (!nullToAbsent || individualClientReferenceId != null) {
      map['individual_client_reference_id'] =
          Variable<String>(individualClientReferenceId);
    }
    map['is_head_of_household'] = Variable<bool>(isHeadOfHousehold);
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  HouseholdMemberCompanion toCompanion(bool nullToAbsent) {
    return HouseholdMemberCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      householdId: householdId == null && nullToAbsent
          ? const Value.absent()
          : Value(householdId),
      householdClientReferenceId:
          householdClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(householdClientReferenceId),
      individualId: individualId == null && nullToAbsent
          ? const Value.absent()
          : Value(individualId),
      individualClientReferenceId:
          individualClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(individualClientReferenceId),
      isHeadOfHousehold: Value(isHeadOfHousehold),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory HouseholdMemberData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseholdMemberData(
      id: serializer.fromJson<String?>(json['id']),
      householdId: serializer.fromJson<String?>(json['householdId']),
      householdClientReferenceId:
          serializer.fromJson<String?>(json['householdClientReferenceId']),
      individualId: serializer.fromJson<String?>(json['individualId']),
      individualClientReferenceId:
          serializer.fromJson<String?>(json['individualClientReferenceId']),
      isHeadOfHousehold: serializer.fromJson<bool>(json['isHeadOfHousehold']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'householdId': serializer.toJson<String?>(householdId),
      'householdClientReferenceId':
          serializer.toJson<String?>(householdClientReferenceId),
      'individualId': serializer.toJson<String?>(individualId),
      'individualClientReferenceId':
          serializer.toJson<String?>(individualClientReferenceId),
      'isHeadOfHousehold': serializer.toJson<bool>(isHeadOfHousehold),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  HouseholdMemberData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> householdId = const Value.absent(),
          Value<String?> householdClientReferenceId = const Value.absent(),
          Value<String?> individualId = const Value.absent(),
          Value<String?> individualClientReferenceId = const Value.absent(),
          bool? isHeadOfHousehold,
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      HouseholdMemberData(
        id: id.present ? id.value : this.id,
        householdId: householdId.present ? householdId.value : this.householdId,
        householdClientReferenceId: householdClientReferenceId.present
            ? householdClientReferenceId.value
            : this.householdClientReferenceId,
        individualId:
            individualId.present ? individualId.value : this.individualId,
        individualClientReferenceId: individualClientReferenceId.present
            ? individualClientReferenceId.value
            : this.individualClientReferenceId,
        isHeadOfHousehold: isHeadOfHousehold ?? this.isHeadOfHousehold,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('HouseholdMemberData(')
          ..write('id: $id, ')
          ..write('householdId: $householdId, ')
          ..write('householdClientReferenceId: $householdClientReferenceId, ')
          ..write('individualId: $individualId, ')
          ..write('individualClientReferenceId: $individualClientReferenceId, ')
          ..write('isHeadOfHousehold: $isHeadOfHousehold, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      householdId,
      householdClientReferenceId,
      individualId,
      individualClientReferenceId,
      isHeadOfHousehold,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      clientReferenceId,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseholdMemberData &&
          other.id == this.id &&
          other.householdId == this.householdId &&
          other.householdClientReferenceId == this.householdClientReferenceId &&
          other.individualId == this.individualId &&
          other.individualClientReferenceId ==
              this.individualClientReferenceId &&
          other.isHeadOfHousehold == this.isHeadOfHousehold &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class HouseholdMemberCompanion extends UpdateCompanion<HouseholdMemberData> {
  final Value<String?> id;
  final Value<String?> householdId;
  final Value<String?> householdClientReferenceId;
  final Value<String?> individualId;
  final Value<String?> individualClientReferenceId;
  final Value<bool> isHeadOfHousehold;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const HouseholdMemberCompanion({
    this.id = const Value.absent(),
    this.householdId = const Value.absent(),
    this.householdClientReferenceId = const Value.absent(),
    this.individualId = const Value.absent(),
    this.individualClientReferenceId = const Value.absent(),
    this.isHeadOfHousehold = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HouseholdMemberCompanion.insert({
    this.id = const Value.absent(),
    this.householdId = const Value.absent(),
    this.householdClientReferenceId = const Value.absent(),
    this.individualId = const Value.absent(),
    this.individualClientReferenceId = const Value.absent(),
    required bool isHeadOfHousehold,
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : isHeadOfHousehold = Value(isHeadOfHousehold),
        clientReferenceId = Value(clientReferenceId);
  static Insertable<HouseholdMemberData> custom({
    Expression<String>? id,
    Expression<String>? householdId,
    Expression<String>? householdClientReferenceId,
    Expression<String>? individualId,
    Expression<String>? individualClientReferenceId,
    Expression<bool>? isHeadOfHousehold,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (householdId != null) 'household_id': householdId,
      if (householdClientReferenceId != null)
        'household_client_reference_id': householdClientReferenceId,
      if (individualId != null) 'individual_id': individualId,
      if (individualClientReferenceId != null)
        'individual_client_reference_id': individualClientReferenceId,
      if (isHeadOfHousehold != null) 'is_head_of_household': isHeadOfHousehold,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HouseholdMemberCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? householdId,
      Value<String?>? householdClientReferenceId,
      Value<String?>? individualId,
      Value<String?>? individualClientReferenceId,
      Value<bool>? isHeadOfHousehold,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return HouseholdMemberCompanion(
      id: id ?? this.id,
      householdId: householdId ?? this.householdId,
      householdClientReferenceId:
          householdClientReferenceId ?? this.householdClientReferenceId,
      individualId: individualId ?? this.individualId,
      individualClientReferenceId:
          individualClientReferenceId ?? this.individualClientReferenceId,
      isHeadOfHousehold: isHeadOfHousehold ?? this.isHeadOfHousehold,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (householdId.present) {
      map['household_id'] = Variable<String>(householdId.value);
    }
    if (householdClientReferenceId.present) {
      map['household_client_reference_id'] =
          Variable<String>(householdClientReferenceId.value);
    }
    if (individualId.present) {
      map['individual_id'] = Variable<String>(individualId.value);
    }
    if (individualClientReferenceId.present) {
      map['individual_client_reference_id'] =
          Variable<String>(individualClientReferenceId.value);
    }
    if (isHeadOfHousehold.present) {
      map['is_head_of_household'] = Variable<bool>(isHeadOfHousehold.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseholdMemberCompanion(')
          ..write('id: $id, ')
          ..write('householdId: $householdId, ')
          ..write('householdClientReferenceId: $householdClientReferenceId, ')
          ..write('individualId: $individualId, ')
          ..write('individualClientReferenceId: $individualClientReferenceId, ')
          ..write('isHeadOfHousehold: $isHeadOfHousehold, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IdentifierTable extends Identifier
    with TableInfo<$IdentifierTable, IdentifierData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IdentifierTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _identifierTypeMeta =
      const VerificationMeta('identifierType');
  @override
  late final GeneratedColumn<String> identifierType = GeneratedColumn<String>(
      'identifier_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _identifierIdMeta =
      const VerificationMeta('identifierId');
  @override
  late final GeneratedColumn<String> identifierId = GeneratedColumn<String>(
      'identifier_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        identifierType,
        identifierId,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'identifier';
  @override
  VerificationContext validateIntegrity(Insertable<IdentifierData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('identifier_type')) {
      context.handle(
          _identifierTypeMeta,
          identifierType.isAcceptableOrUnknown(
              data['identifier_type']!, _identifierTypeMeta));
    }
    if (data.containsKey('identifier_id')) {
      context.handle(
          _identifierIdMeta,
          identifierId.isAcceptableOrUnknown(
              data['identifier_id']!, _identifierIdMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  IdentifierData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IdentifierData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      identifierType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identifier_type']),
      identifierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identifier_id']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $IdentifierTable createAlias(String alias) {
    return $IdentifierTable(attachedDatabase, alias);
  }
}

class IdentifierData extends DataClass implements Insertable<IdentifierData> {
  final String? id;
  final String? identifierType;
  final String? identifierId;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const IdentifierData(
      {this.id,
      this.identifierType,
      this.identifierId,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || identifierType != null) {
      map['identifier_type'] = Variable<String>(identifierType);
    }
    if (!nullToAbsent || identifierId != null) {
      map['identifier_id'] = Variable<String>(identifierId);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  IdentifierCompanion toCompanion(bool nullToAbsent) {
    return IdentifierCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      identifierType: identifierType == null && nullToAbsent
          ? const Value.absent()
          : Value(identifierType),
      identifierId: identifierId == null && nullToAbsent
          ? const Value.absent()
          : Value(identifierId),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory IdentifierData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IdentifierData(
      id: serializer.fromJson<String?>(json['id']),
      identifierType: serializer.fromJson<String?>(json['identifierType']),
      identifierId: serializer.fromJson<String?>(json['identifierId']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'identifierType': serializer.toJson<String?>(identifierType),
      'identifierId': serializer.toJson<String?>(identifierId),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  IdentifierData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> identifierType = const Value.absent(),
          Value<String?> identifierId = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      IdentifierData(
        id: id.present ? id.value : this.id,
        identifierType:
            identifierType.present ? identifierType.value : this.identifierType,
        identifierId:
            identifierId.present ? identifierId.value : this.identifierId,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('IdentifierData(')
          ..write('id: $id, ')
          ..write('identifierType: $identifierType, ')
          ..write('identifierId: $identifierId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      identifierType,
      identifierId,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      clientReferenceId,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IdentifierData &&
          other.id == this.id &&
          other.identifierType == this.identifierType &&
          other.identifierId == this.identifierId &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class IdentifierCompanion extends UpdateCompanion<IdentifierData> {
  final Value<String?> id;
  final Value<String?> identifierType;
  final Value<String?> identifierId;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const IdentifierCompanion({
    this.id = const Value.absent(),
    this.identifierType = const Value.absent(),
    this.identifierId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IdentifierCompanion.insert({
    this.id = const Value.absent(),
    this.identifierType = const Value.absent(),
    this.identifierId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<IdentifierData> custom({
    Expression<String>? id,
    Expression<String>? identifierType,
    Expression<String>? identifierId,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (identifierType != null) 'identifier_type': identifierType,
      if (identifierId != null) 'identifier_id': identifierId,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IdentifierCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? identifierType,
      Value<String?>? identifierId,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return IdentifierCompanion(
      id: id ?? this.id,
      identifierType: identifierType ?? this.identifierType,
      identifierId: identifierId ?? this.identifierId,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (identifierType.present) {
      map['identifier_type'] = Variable<String>(identifierType.value);
    }
    if (identifierId.present) {
      map['identifier_id'] = Variable<String>(identifierId.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdentifierCompanion(')
          ..write('id: $id, ')
          ..write('identifierType: $identifierType, ')
          ..write('identifierId: $identifierId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NameTable extends Name with TableInfo<$NameTable, NameData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NameTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _individualClientReferenceIdMeta =
      const VerificationMeta('individualClientReferenceId');
  @override
  late final GeneratedColumn<String> individualClientReferenceId =
      GeneratedColumn<String>(
          'individual_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _givenNameMeta =
      const VerificationMeta('givenName');
  @override
  late final GeneratedColumn<String> givenName = GeneratedColumn<String>(
      'given_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _familyNameMeta =
      const VerificationMeta('familyName');
  @override
  late final GeneratedColumn<String> familyName = GeneratedColumn<String>(
      'family_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _otherNamesMeta =
      const VerificationMeta('otherNames');
  @override
  late final GeneratedColumn<String> otherNames = GeneratedColumn<String>(
      'other_names', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        individualClientReferenceId,
        givenName,
        familyName,
        otherNames,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'name';
  @override
  VerificationContext validateIntegrity(Insertable<NameData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('individual_client_reference_id')) {
      context.handle(
          _individualClientReferenceIdMeta,
          individualClientReferenceId.isAcceptableOrUnknown(
              data['individual_client_reference_id']!,
              _individualClientReferenceIdMeta));
    }
    if (data.containsKey('given_name')) {
      context.handle(_givenNameMeta,
          givenName.isAcceptableOrUnknown(data['given_name']!, _givenNameMeta));
    }
    if (data.containsKey('family_name')) {
      context.handle(
          _familyNameMeta,
          familyName.isAcceptableOrUnknown(
              data['family_name']!, _familyNameMeta));
    }
    if (data.containsKey('other_names')) {
      context.handle(
          _otherNamesMeta,
          otherNames.isAcceptableOrUnknown(
              data['other_names']!, _otherNamesMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {individualClientReferenceId, auditCreatedBy};
  @override
  NameData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NameData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      individualClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}individual_client_reference_id']),
      givenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}given_name']),
      familyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_name']),
      otherNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other_names']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $NameTable createAlias(String alias) {
    return $NameTable(attachedDatabase, alias);
  }
}

class NameData extends DataClass implements Insertable<NameData> {
  final String? id;
  final String? individualClientReferenceId;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const NameData(
      {this.id,
      this.individualClientReferenceId,
      this.givenName,
      this.familyName,
      this.otherNames,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || individualClientReferenceId != null) {
      map['individual_client_reference_id'] =
          Variable<String>(individualClientReferenceId);
    }
    if (!nullToAbsent || givenName != null) {
      map['given_name'] = Variable<String>(givenName);
    }
    if (!nullToAbsent || familyName != null) {
      map['family_name'] = Variable<String>(familyName);
    }
    if (!nullToAbsent || otherNames != null) {
      map['other_names'] = Variable<String>(otherNames);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  NameCompanion toCompanion(bool nullToAbsent) {
    return NameCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      individualClientReferenceId:
          individualClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(individualClientReferenceId),
      givenName: givenName == null && nullToAbsent
          ? const Value.absent()
          : Value(givenName),
      familyName: familyName == null && nullToAbsent
          ? const Value.absent()
          : Value(familyName),
      otherNames: otherNames == null && nullToAbsent
          ? const Value.absent()
          : Value(otherNames),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory NameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NameData(
      id: serializer.fromJson<String?>(json['id']),
      individualClientReferenceId:
          serializer.fromJson<String?>(json['individualClientReferenceId']),
      givenName: serializer.fromJson<String?>(json['givenName']),
      familyName: serializer.fromJson<String?>(json['familyName']),
      otherNames: serializer.fromJson<String?>(json['otherNames']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'individualClientReferenceId':
          serializer.toJson<String?>(individualClientReferenceId),
      'givenName': serializer.toJson<String?>(givenName),
      'familyName': serializer.toJson<String?>(familyName),
      'otherNames': serializer.toJson<String?>(otherNames),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  NameData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> individualClientReferenceId = const Value.absent(),
          Value<String?> givenName = const Value.absent(),
          Value<String?> familyName = const Value.absent(),
          Value<String?> otherNames = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      NameData(
        id: id.present ? id.value : this.id,
        individualClientReferenceId: individualClientReferenceId.present
            ? individualClientReferenceId.value
            : this.individualClientReferenceId,
        givenName: givenName.present ? givenName.value : this.givenName,
        familyName: familyName.present ? familyName.value : this.familyName,
        otherNames: otherNames.present ? otherNames.value : this.otherNames,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('NameData(')
          ..write('id: $id, ')
          ..write('individualClientReferenceId: $individualClientReferenceId, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('otherNames: $otherNames, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      individualClientReferenceId,
      givenName,
      familyName,
      otherNames,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameData &&
          other.id == this.id &&
          other.individualClientReferenceId ==
              this.individualClientReferenceId &&
          other.givenName == this.givenName &&
          other.familyName == this.familyName &&
          other.otherNames == this.otherNames &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class NameCompanion extends UpdateCompanion<NameData> {
  final Value<String?> id;
  final Value<String?> individualClientReferenceId;
  final Value<String?> givenName;
  final Value<String?> familyName;
  final Value<String?> otherNames;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const NameCompanion({
    this.id = const Value.absent(),
    this.individualClientReferenceId = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.otherNames = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NameCompanion.insert({
    this.id = const Value.absent(),
    this.individualClientReferenceId = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.otherNames = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<NameData> custom({
    Expression<String>? id,
    Expression<String>? individualClientReferenceId,
    Expression<String>? givenName,
    Expression<String>? familyName,
    Expression<String>? otherNames,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (individualClientReferenceId != null)
        'individual_client_reference_id': individualClientReferenceId,
      if (givenName != null) 'given_name': givenName,
      if (familyName != null) 'family_name': familyName,
      if (otherNames != null) 'other_names': otherNames,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NameCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? individualClientReferenceId,
      Value<String?>? givenName,
      Value<String?>? familyName,
      Value<String?>? otherNames,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return NameCompanion(
      id: id ?? this.id,
      individualClientReferenceId:
          individualClientReferenceId ?? this.individualClientReferenceId,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      otherNames: otherNames ?? this.otherNames,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (individualClientReferenceId.present) {
      map['individual_client_reference_id'] =
          Variable<String>(individualClientReferenceId.value);
    }
    if (givenName.present) {
      map['given_name'] = Variable<String>(givenName.value);
    }
    if (familyName.present) {
      map['family_name'] = Variable<String>(familyName.value);
    }
    if (otherNames.present) {
      map['other_names'] = Variable<String>(otherNames.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NameCompanion(')
          ..write('id: $id, ')
          ..write('individualClientReferenceId: $individualClientReferenceId, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('otherNames: $otherNames, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskTable extends Task with TableInfo<$TaskTable, TaskData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectBeneficiaryIdMeta =
      const VerificationMeta('projectBeneficiaryId');
  @override
  late final GeneratedColumn<String> projectBeneficiaryId =
      GeneratedColumn<String>('project_beneficiary_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectBeneficiaryClientReferenceIdMeta =
      const VerificationMeta('projectBeneficiaryClientReferenceId');
  @override
  late final GeneratedColumn<String> projectBeneficiaryClientReferenceId =
      GeneratedColumn<String>(
          'project_beneficiary_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _plannedStartDateMeta =
      const VerificationMeta('plannedStartDate');
  @override
  late final GeneratedColumn<int> plannedStartDate = GeneratedColumn<int>(
      'planned_start_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _plannedEndDateMeta =
      const VerificationMeta('plannedEndDate');
  @override
  late final GeneratedColumn<int> plannedEndDate = GeneratedColumn<int>(
      'planned_end_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _actualStartDateMeta =
      const VerificationMeta('actualStartDate');
  @override
  late final GeneratedColumn<int> actualStartDate = GeneratedColumn<int>(
      'actual_start_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _actualEndDateMeta =
      const VerificationMeta('actualEndDate');
  @override
  late final GeneratedColumn<int> actualEndDate = GeneratedColumn<int>(
      'actual_end_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<int> createdDate = GeneratedColumn<int>(
      'created_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        projectBeneficiaryId,
        projectBeneficiaryClientReferenceId,
        createdBy,
        status,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        plannedStartDate,
        plannedEndDate,
        actualStartDate,
        actualEndDate,
        createdDate,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task';
  @override
  VerificationContext validateIntegrity(Insertable<TaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('project_beneficiary_id')) {
      context.handle(
          _projectBeneficiaryIdMeta,
          projectBeneficiaryId.isAcceptableOrUnknown(
              data['project_beneficiary_id']!, _projectBeneficiaryIdMeta));
    }
    if (data.containsKey('project_beneficiary_client_reference_id')) {
      context.handle(
          _projectBeneficiaryClientReferenceIdMeta,
          projectBeneficiaryClientReferenceId.isAcceptableOrUnknown(
              data['project_beneficiary_client_reference_id']!,
              _projectBeneficiaryClientReferenceIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('planned_start_date')) {
      context.handle(
          _plannedStartDateMeta,
          plannedStartDate.isAcceptableOrUnknown(
              data['planned_start_date']!, _plannedStartDateMeta));
    }
    if (data.containsKey('planned_end_date')) {
      context.handle(
          _plannedEndDateMeta,
          plannedEndDate.isAcceptableOrUnknown(
              data['planned_end_date']!, _plannedEndDateMeta));
    }
    if (data.containsKey('actual_start_date')) {
      context.handle(
          _actualStartDateMeta,
          actualStartDate.isAcceptableOrUnknown(
              data['actual_start_date']!, _actualStartDateMeta));
    }
    if (data.containsKey('actual_end_date')) {
      context.handle(
          _actualEndDateMeta,
          actualEndDate.isAcceptableOrUnknown(
              data['actual_end_date']!, _actualEndDateMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  TaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      projectBeneficiaryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}project_beneficiary_id']),
      projectBeneficiaryClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}project_beneficiary_client_reference_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      plannedStartDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_start_date']),
      plannedEndDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_end_date']),
      actualStartDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_start_date']),
      actualEndDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_end_date']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_date']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $TaskTable createAlias(String alias) {
    return $TaskTable(attachedDatabase, alias);
  }
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final String? id;
  final String? projectId;
  final String? projectBeneficiaryId;
  final String? projectBeneficiaryClientReferenceId;
  final String? createdBy;
  final String? status;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final int? plannedStartDate;
  final int? plannedEndDate;
  final int? actualStartDate;
  final int? actualEndDate;
  final int? createdDate;
  final String? additionalFields;
  const TaskData(
      {this.id,
      this.projectId,
      this.projectBeneficiaryId,
      this.projectBeneficiaryClientReferenceId,
      this.createdBy,
      this.status,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.plannedStartDate,
      this.plannedEndDate,
      this.actualStartDate,
      this.actualEndDate,
      this.createdDate,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || projectBeneficiaryId != null) {
      map['project_beneficiary_id'] = Variable<String>(projectBeneficiaryId);
    }
    if (!nullToAbsent || projectBeneficiaryClientReferenceId != null) {
      map['project_beneficiary_client_reference_id'] =
          Variable<String>(projectBeneficiaryClientReferenceId);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || plannedStartDate != null) {
      map['planned_start_date'] = Variable<int>(plannedStartDate);
    }
    if (!nullToAbsent || plannedEndDate != null) {
      map['planned_end_date'] = Variable<int>(plannedEndDate);
    }
    if (!nullToAbsent || actualStartDate != null) {
      map['actual_start_date'] = Variable<int>(actualStartDate);
    }
    if (!nullToAbsent || actualEndDate != null) {
      map['actual_end_date'] = Variable<int>(actualEndDate);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<int>(createdDate);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  TaskCompanion toCompanion(bool nullToAbsent) {
    return TaskCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      projectBeneficiaryId: projectBeneficiaryId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectBeneficiaryId),
      projectBeneficiaryClientReferenceId:
          projectBeneficiaryClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(projectBeneficiaryClientReferenceId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      plannedStartDate: plannedStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedStartDate),
      plannedEndDate: plannedEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedEndDate),
      actualStartDate: actualStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(actualStartDate),
      actualEndDate: actualEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(actualEndDate),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<String?>(json['id']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      projectBeneficiaryId:
          serializer.fromJson<String?>(json['projectBeneficiaryId']),
      projectBeneficiaryClientReferenceId: serializer
          .fromJson<String?>(json['projectBeneficiaryClientReferenceId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      status: serializer.fromJson<String?>(json['status']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      plannedStartDate: serializer.fromJson<int?>(json['plannedStartDate']),
      plannedEndDate: serializer.fromJson<int?>(json['plannedEndDate']),
      actualStartDate: serializer.fromJson<int?>(json['actualStartDate']),
      actualEndDate: serializer.fromJson<int?>(json['actualEndDate']),
      createdDate: serializer.fromJson<int?>(json['createdDate']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'projectId': serializer.toJson<String?>(projectId),
      'projectBeneficiaryId': serializer.toJson<String?>(projectBeneficiaryId),
      'projectBeneficiaryClientReferenceId':
          serializer.toJson<String?>(projectBeneficiaryClientReferenceId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'status': serializer.toJson<String?>(status),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'plannedStartDate': serializer.toJson<int?>(plannedStartDate),
      'plannedEndDate': serializer.toJson<int?>(plannedEndDate),
      'actualStartDate': serializer.toJson<int?>(actualStartDate),
      'actualEndDate': serializer.toJson<int?>(actualEndDate),
      'createdDate': serializer.toJson<int?>(createdDate),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  TaskData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> projectBeneficiaryId = const Value.absent(),
          Value<String?> projectBeneficiaryClientReferenceId =
              const Value.absent(),
          Value<String?> createdBy = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<int?> plannedStartDate = const Value.absent(),
          Value<int?> plannedEndDate = const Value.absent(),
          Value<int?> actualStartDate = const Value.absent(),
          Value<int?> actualEndDate = const Value.absent(),
          Value<int?> createdDate = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      TaskData(
        id: id.present ? id.value : this.id,
        projectId: projectId.present ? projectId.value : this.projectId,
        projectBeneficiaryId: projectBeneficiaryId.present
            ? projectBeneficiaryId.value
            : this.projectBeneficiaryId,
        projectBeneficiaryClientReferenceId:
            projectBeneficiaryClientReferenceId.present
                ? projectBeneficiaryClientReferenceId.value
                : this.projectBeneficiaryClientReferenceId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        status: status.present ? status.value : this.status,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        plannedStartDate: plannedStartDate.present
            ? plannedStartDate.value
            : this.plannedStartDate,
        plannedEndDate:
            plannedEndDate.present ? plannedEndDate.value : this.plannedEndDate,
        actualStartDate: actualStartDate.present
            ? actualStartDate.value
            : this.actualStartDate,
        actualEndDate:
            actualEndDate.present ? actualEndDate.value : this.actualEndDate,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectBeneficiaryId: $projectBeneficiaryId, ')
          ..write(
              'projectBeneficiaryClientReferenceId: $projectBeneficiaryClientReferenceId, ')
          ..write('createdBy: $createdBy, ')
          ..write('status: $status, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('plannedStartDate: $plannedStartDate, ')
          ..write('plannedEndDate: $plannedEndDate, ')
          ..write('actualStartDate: $actualStartDate, ')
          ..write('actualEndDate: $actualEndDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        projectId,
        projectBeneficiaryId,
        projectBeneficiaryClientReferenceId,
        createdBy,
        status,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        plannedStartDate,
        plannedEndDate,
        actualStartDate,
        actualEndDate,
        createdDate,
        additionalFields
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.projectBeneficiaryId == this.projectBeneficiaryId &&
          other.projectBeneficiaryClientReferenceId ==
              this.projectBeneficiaryClientReferenceId &&
          other.createdBy == this.createdBy &&
          other.status == this.status &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.plannedStartDate == this.plannedStartDate &&
          other.plannedEndDate == this.plannedEndDate &&
          other.actualStartDate == this.actualStartDate &&
          other.actualEndDate == this.actualEndDate &&
          other.createdDate == this.createdDate &&
          other.additionalFields == this.additionalFields);
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<String?> id;
  final Value<String?> projectId;
  final Value<String?> projectBeneficiaryId;
  final Value<String?> projectBeneficiaryClientReferenceId;
  final Value<String?> createdBy;
  final Value<String?> status;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<int?> plannedStartDate;
  final Value<int?> plannedEndDate;
  final Value<int?> actualStartDate;
  final Value<int?> actualEndDate;
  final Value<int?> createdDate;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const TaskCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectBeneficiaryId = const Value.absent(),
    this.projectBeneficiaryClientReferenceId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.status = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.plannedStartDate = const Value.absent(),
    this.plannedEndDate = const Value.absent(),
    this.actualStartDate = const Value.absent(),
    this.actualEndDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskCompanion.insert({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectBeneficiaryId = const Value.absent(),
    this.projectBeneficiaryClientReferenceId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.status = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.plannedStartDate = const Value.absent(),
    this.plannedEndDate = const Value.absent(),
    this.actualStartDate = const Value.absent(),
    this.actualEndDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<TaskData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? projectBeneficiaryId,
    Expression<String>? projectBeneficiaryClientReferenceId,
    Expression<String>? createdBy,
    Expression<String>? status,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<int>? plannedStartDate,
    Expression<int>? plannedEndDate,
    Expression<int>? actualStartDate,
    Expression<int>? actualEndDate,
    Expression<int>? createdDate,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (projectBeneficiaryId != null)
        'project_beneficiary_id': projectBeneficiaryId,
      if (projectBeneficiaryClientReferenceId != null)
        'project_beneficiary_client_reference_id':
            projectBeneficiaryClientReferenceId,
      if (createdBy != null) 'created_by': createdBy,
      if (status != null) 'status': status,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (plannedStartDate != null) 'planned_start_date': plannedStartDate,
      if (plannedEndDate != null) 'planned_end_date': plannedEndDate,
      if (actualStartDate != null) 'actual_start_date': actualStartDate,
      if (actualEndDate != null) 'actual_end_date': actualEndDate,
      if (createdDate != null) 'created_date': createdDate,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? projectId,
      Value<String?>? projectBeneficiaryId,
      Value<String?>? projectBeneficiaryClientReferenceId,
      Value<String?>? createdBy,
      Value<String?>? status,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<int?>? plannedStartDate,
      Value<int?>? plannedEndDate,
      Value<int?>? actualStartDate,
      Value<int?>? actualEndDate,
      Value<int?>? createdDate,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return TaskCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      projectBeneficiaryId: projectBeneficiaryId ?? this.projectBeneficiaryId,
      projectBeneficiaryClientReferenceId:
          projectBeneficiaryClientReferenceId ??
              this.projectBeneficiaryClientReferenceId,
      createdBy: createdBy ?? this.createdBy,
      status: status ?? this.status,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      plannedStartDate: plannedStartDate ?? this.plannedStartDate,
      plannedEndDate: plannedEndDate ?? this.plannedEndDate,
      actualStartDate: actualStartDate ?? this.actualStartDate,
      actualEndDate: actualEndDate ?? this.actualEndDate,
      createdDate: createdDate ?? this.createdDate,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (projectBeneficiaryId.present) {
      map['project_beneficiary_id'] =
          Variable<String>(projectBeneficiaryId.value);
    }
    if (projectBeneficiaryClientReferenceId.present) {
      map['project_beneficiary_client_reference_id'] =
          Variable<String>(projectBeneficiaryClientReferenceId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (plannedStartDate.present) {
      map['planned_start_date'] = Variable<int>(plannedStartDate.value);
    }
    if (plannedEndDate.present) {
      map['planned_end_date'] = Variable<int>(plannedEndDate.value);
    }
    if (actualStartDate.present) {
      map['actual_start_date'] = Variable<int>(actualStartDate.value);
    }
    if (actualEndDate.present) {
      map['actual_end_date'] = Variable<int>(actualEndDate.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<int>(createdDate.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectBeneficiaryId: $projectBeneficiaryId, ')
          ..write(
              'projectBeneficiaryClientReferenceId: $projectBeneficiaryClientReferenceId, ')
          ..write('createdBy: $createdBy, ')
          ..write('status: $status, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('plannedStartDate: $plannedStartDate, ')
          ..write('plannedEndDate: $plannedEndDate, ')
          ..write('actualStartDate: $actualStartDate, ')
          ..write('actualEndDate: $actualEndDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskResourceTable extends TaskResource
    with TableInfo<$TaskResourceTable, TaskResourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskResourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskclientReferenceIdMeta =
      const VerificationMeta('taskclientReferenceId');
  @override
  late final GeneratedColumn<String> taskclientReferenceId =
      GeneratedColumn<String>('taskclient_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productVariantIdMeta =
      const VerificationMeta('productVariantId');
  @override
  late final GeneratedColumn<String> productVariantId = GeneratedColumn<String>(
      'product_variant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
      'quantity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeliveredMeta =
      const VerificationMeta('isDelivered');
  @override
  late final GeneratedColumn<bool> isDelivered = GeneratedColumn<bool>(
      'is_delivered', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_delivered" IN (0, 1))'));
  static const VerificationMeta _deliveryCommentMeta =
      const VerificationMeta('deliveryComment');
  @override
  late final GeneratedColumn<String> deliveryComment = GeneratedColumn<String>(
      'delivery_comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        clientReferenceId,
        taskclientReferenceId,
        taskId,
        id,
        productVariantId,
        quantity,
        isDelivered,
        deliveryComment,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_resource';
  @override
  VerificationContext validateIntegrity(Insertable<TaskResourceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('taskclient_reference_id')) {
      context.handle(
          _taskclientReferenceIdMeta,
          taskclientReferenceId.isAcceptableOrUnknown(
              data['taskclient_reference_id']!, _taskclientReferenceIdMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_variant_id')) {
      context.handle(
          _productVariantIdMeta,
          productVariantId.isAcceptableOrUnknown(
              data['product_variant_id']!, _productVariantIdMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('is_delivered')) {
      context.handle(
          _isDeliveredMeta,
          isDelivered.isAcceptableOrUnknown(
              data['is_delivered']!, _isDeliveredMeta));
    }
    if (data.containsKey('delivery_comment')) {
      context.handle(
          _deliveryCommentMeta,
          deliveryComment.isAcceptableOrUnknown(
              data['delivery_comment']!, _deliveryCommentMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientReferenceId, auditCreatedBy};
  @override
  TaskResourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskResourceData(
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      taskclientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}taskclient_reference_id']),
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      productVariantId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_variant_id']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity']),
      isDelivered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_delivered']),
      deliveryComment: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}delivery_comment']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $TaskResourceTable createAlias(String alias) {
    return $TaskResourceTable(attachedDatabase, alias);
  }
}

class TaskResourceData extends DataClass
    implements Insertable<TaskResourceData> {
  final String clientReferenceId;
  final String? taskclientReferenceId;
  final String? taskId;
  final String? id;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const TaskResourceData(
      {required this.clientReferenceId,
      this.taskclientReferenceId,
      this.taskId,
      this.id,
      this.productVariantId,
      this.quantity,
      this.isDelivered,
      this.deliveryComment,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || taskclientReferenceId != null) {
      map['taskclient_reference_id'] = Variable<String>(taskclientReferenceId);
    }
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || productVariantId != null) {
      map['product_variant_id'] = Variable<String>(productVariantId);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<String>(quantity);
    }
    if (!nullToAbsent || isDelivered != null) {
      map['is_delivered'] = Variable<bool>(isDelivered);
    }
    if (!nullToAbsent || deliveryComment != null) {
      map['delivery_comment'] = Variable<String>(deliveryComment);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  TaskResourceCompanion toCompanion(bool nullToAbsent) {
    return TaskResourceCompanion(
      clientReferenceId: Value(clientReferenceId),
      taskclientReferenceId: taskclientReferenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(taskclientReferenceId),
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      productVariantId: productVariantId == null && nullToAbsent
          ? const Value.absent()
          : Value(productVariantId),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      isDelivered: isDelivered == null && nullToAbsent
          ? const Value.absent()
          : Value(isDelivered),
      deliveryComment: deliveryComment == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryComment),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory TaskResourceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskResourceData(
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      taskclientReferenceId:
          serializer.fromJson<String?>(json['taskclientReferenceId']),
      taskId: serializer.fromJson<String?>(json['taskId']),
      id: serializer.fromJson<String?>(json['id']),
      productVariantId: serializer.fromJson<String?>(json['productVariantId']),
      quantity: serializer.fromJson<String?>(json['quantity']),
      isDelivered: serializer.fromJson<bool?>(json['isDelivered']),
      deliveryComment: serializer.fromJson<String?>(json['deliveryComment']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'taskclientReferenceId':
          serializer.toJson<String?>(taskclientReferenceId),
      'taskId': serializer.toJson<String?>(taskId),
      'id': serializer.toJson<String?>(id),
      'productVariantId': serializer.toJson<String?>(productVariantId),
      'quantity': serializer.toJson<String?>(quantity),
      'isDelivered': serializer.toJson<bool?>(isDelivered),
      'deliveryComment': serializer.toJson<String?>(deliveryComment),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  TaskResourceData copyWith(
          {String? clientReferenceId,
          Value<String?> taskclientReferenceId = const Value.absent(),
          Value<String?> taskId = const Value.absent(),
          Value<String?> id = const Value.absent(),
          Value<String?> productVariantId = const Value.absent(),
          Value<String?> quantity = const Value.absent(),
          Value<bool?> isDelivered = const Value.absent(),
          Value<String?> deliveryComment = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      TaskResourceData(
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        taskclientReferenceId: taskclientReferenceId.present
            ? taskclientReferenceId.value
            : this.taskclientReferenceId,
        taskId: taskId.present ? taskId.value : this.taskId,
        id: id.present ? id.value : this.id,
        productVariantId: productVariantId.present
            ? productVariantId.value
            : this.productVariantId,
        quantity: quantity.present ? quantity.value : this.quantity,
        isDelivered: isDelivered.present ? isDelivered.value : this.isDelivered,
        deliveryComment: deliveryComment.present
            ? deliveryComment.value
            : this.deliveryComment,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('TaskResourceData(')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('taskclientReferenceId: $taskclientReferenceId, ')
          ..write('taskId: $taskId, ')
          ..write('id: $id, ')
          ..write('productVariantId: $productVariantId, ')
          ..write('quantity: $quantity, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('deliveryComment: $deliveryComment, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        clientReferenceId,
        taskclientReferenceId,
        taskId,
        id,
        productVariantId,
        quantity,
        isDelivered,
        deliveryComment,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskResourceData &&
          other.clientReferenceId == this.clientReferenceId &&
          other.taskclientReferenceId == this.taskclientReferenceId &&
          other.taskId == this.taskId &&
          other.id == this.id &&
          other.productVariantId == this.productVariantId &&
          other.quantity == this.quantity &&
          other.isDelivered == this.isDelivered &&
          other.deliveryComment == this.deliveryComment &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class TaskResourceCompanion extends UpdateCompanion<TaskResourceData> {
  final Value<String> clientReferenceId;
  final Value<String?> taskclientReferenceId;
  final Value<String?> taskId;
  final Value<String?> id;
  final Value<String?> productVariantId;
  final Value<String?> quantity;
  final Value<bool?> isDelivered;
  final Value<String?> deliveryComment;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const TaskResourceCompanion({
    this.clientReferenceId = const Value.absent(),
    this.taskclientReferenceId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.id = const Value.absent(),
    this.productVariantId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.isDelivered = const Value.absent(),
    this.deliveryComment = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskResourceCompanion.insert({
    required String clientReferenceId,
    this.taskclientReferenceId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.id = const Value.absent(),
    this.productVariantId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.isDelivered = const Value.absent(),
    this.deliveryComment = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<TaskResourceData> custom({
    Expression<String>? clientReferenceId,
    Expression<String>? taskclientReferenceId,
    Expression<String>? taskId,
    Expression<String>? id,
    Expression<String>? productVariantId,
    Expression<String>? quantity,
    Expression<bool>? isDelivered,
    Expression<String>? deliveryComment,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (taskclientReferenceId != null)
        'taskclient_reference_id': taskclientReferenceId,
      if (taskId != null) 'task_id': taskId,
      if (id != null) 'id': id,
      if (productVariantId != null) 'product_variant_id': productVariantId,
      if (quantity != null) 'quantity': quantity,
      if (isDelivered != null) 'is_delivered': isDelivered,
      if (deliveryComment != null) 'delivery_comment': deliveryComment,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskResourceCompanion copyWith(
      {Value<String>? clientReferenceId,
      Value<String?>? taskclientReferenceId,
      Value<String?>? taskId,
      Value<String?>? id,
      Value<String?>? productVariantId,
      Value<String?>? quantity,
      Value<bool?>? isDelivered,
      Value<String?>? deliveryComment,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return TaskResourceCompanion(
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      taskclientReferenceId:
          taskclientReferenceId ?? this.taskclientReferenceId,
      taskId: taskId ?? this.taskId,
      id: id ?? this.id,
      productVariantId: productVariantId ?? this.productVariantId,
      quantity: quantity ?? this.quantity,
      isDelivered: isDelivered ?? this.isDelivered,
      deliveryComment: deliveryComment ?? this.deliveryComment,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (taskclientReferenceId.present) {
      map['taskclient_reference_id'] =
          Variable<String>(taskclientReferenceId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productVariantId.present) {
      map['product_variant_id'] = Variable<String>(productVariantId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (isDelivered.present) {
      map['is_delivered'] = Variable<bool>(isDelivered.value);
    }
    if (deliveryComment.present) {
      map['delivery_comment'] = Variable<String>(deliveryComment.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskResourceCompanion(')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('taskclientReferenceId: $taskclientReferenceId, ')
          ..write('taskId: $taskId, ')
          ..write('id: $id, ')
          ..write('productVariantId: $productVariantId, ')
          ..write('quantity: $quantity, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('deliveryComment: $deliveryComment, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SideEffectTable extends SideEffect
    with TableInfo<$SideEffectTable, SideEffectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SideEffectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskClientReferenceIdMeta =
      const VerificationMeta('taskClientReferenceId');
  @override
  late final GeneratedColumn<String> taskClientReferenceId =
      GeneratedColumn<String>('task_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reAttemptsMeta =
      const VerificationMeta('reAttempts');
  @override
  late final GeneratedColumn<int> reAttempts = GeneratedColumn<int>(
      're_attempts', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _symptomsMeta =
      const VerificationMeta('symptoms');
  @override
  late final GeneratedColumn<String> symptoms = GeneratedColumn<String>(
      'symptoms', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        taskClientReferenceId,
        reAttempts,
        symptoms,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'side_effect';
  @override
  VerificationContext validateIntegrity(Insertable<SideEffectData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('task_client_reference_id')) {
      context.handle(
          _taskClientReferenceIdMeta,
          taskClientReferenceId.isAcceptableOrUnknown(
              data['task_client_reference_id']!, _taskClientReferenceIdMeta));
    }
    if (data.containsKey('re_attempts')) {
      context.handle(
          _reAttemptsMeta,
          reAttempts.isAcceptableOrUnknown(
              data['re_attempts']!, _reAttemptsMeta));
    }
    if (data.containsKey('symptoms')) {
      context.handle(_symptomsMeta,
          symptoms.isAcceptableOrUnknown(data['symptoms']!, _symptomsMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  SideEffectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SideEffectData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      taskClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}task_client_reference_id']),
      reAttempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}re_attempts']),
      symptoms: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symptoms']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $SideEffectTable createAlias(String alias) {
    return $SideEffectTable(attachedDatabase, alias);
  }
}

class SideEffectData extends DataClass implements Insertable<SideEffectData> {
  final String? id;
  final String? projectId;
  final String? taskClientReferenceId;
  final int? reAttempts;
  final String? symptoms;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const SideEffectData(
      {this.id,
      this.projectId,
      this.taskClientReferenceId,
      this.reAttempts,
      this.symptoms,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || taskClientReferenceId != null) {
      map['task_client_reference_id'] = Variable<String>(taskClientReferenceId);
    }
    if (!nullToAbsent || reAttempts != null) {
      map['re_attempts'] = Variable<int>(reAttempts);
    }
    if (!nullToAbsent || symptoms != null) {
      map['symptoms'] = Variable<String>(symptoms);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  SideEffectCompanion toCompanion(bool nullToAbsent) {
    return SideEffectCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      taskClientReferenceId: taskClientReferenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(taskClientReferenceId),
      reAttempts: reAttempts == null && nullToAbsent
          ? const Value.absent()
          : Value(reAttempts),
      symptoms: symptoms == null && nullToAbsent
          ? const Value.absent()
          : Value(symptoms),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory SideEffectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SideEffectData(
      id: serializer.fromJson<String?>(json['id']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      taskClientReferenceId:
          serializer.fromJson<String?>(json['taskClientReferenceId']),
      reAttempts: serializer.fromJson<int?>(json['reAttempts']),
      symptoms: serializer.fromJson<String?>(json['symptoms']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'projectId': serializer.toJson<String?>(projectId),
      'taskClientReferenceId':
          serializer.toJson<String?>(taskClientReferenceId),
      'reAttempts': serializer.toJson<int?>(reAttempts),
      'symptoms': serializer.toJson<String?>(symptoms),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  SideEffectData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> taskClientReferenceId = const Value.absent(),
          Value<int?> reAttempts = const Value.absent(),
          Value<String?> symptoms = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      SideEffectData(
        id: id.present ? id.value : this.id,
        projectId: projectId.present ? projectId.value : this.projectId,
        taskClientReferenceId: taskClientReferenceId.present
            ? taskClientReferenceId.value
            : this.taskClientReferenceId,
        reAttempts: reAttempts.present ? reAttempts.value : this.reAttempts,
        symptoms: symptoms.present ? symptoms.value : this.symptoms,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('SideEffectData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('taskClientReferenceId: $taskClientReferenceId, ')
          ..write('reAttempts: $reAttempts, ')
          ..write('symptoms: $symptoms, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      projectId,
      taskClientReferenceId,
      reAttempts,
      symptoms,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      clientReferenceId,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SideEffectData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.taskClientReferenceId == this.taskClientReferenceId &&
          other.reAttempts == this.reAttempts &&
          other.symptoms == this.symptoms &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class SideEffectCompanion extends UpdateCompanion<SideEffectData> {
  final Value<String?> id;
  final Value<String?> projectId;
  final Value<String?> taskClientReferenceId;
  final Value<int?> reAttempts;
  final Value<String?> symptoms;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const SideEffectCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.taskClientReferenceId = const Value.absent(),
    this.reAttempts = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SideEffectCompanion.insert({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.taskClientReferenceId = const Value.absent(),
    this.reAttempts = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<SideEffectData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? taskClientReferenceId,
    Expression<int>? reAttempts,
    Expression<String>? symptoms,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (taskClientReferenceId != null)
        'task_client_reference_id': taskClientReferenceId,
      if (reAttempts != null) 're_attempts': reAttempts,
      if (symptoms != null) 'symptoms': symptoms,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SideEffectCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? projectId,
      Value<String?>? taskClientReferenceId,
      Value<int?>? reAttempts,
      Value<String?>? symptoms,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return SideEffectCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      taskClientReferenceId:
          taskClientReferenceId ?? this.taskClientReferenceId,
      reAttempts: reAttempts ?? this.reAttempts,
      symptoms: symptoms ?? this.symptoms,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (taskClientReferenceId.present) {
      map['task_client_reference_id'] =
          Variable<String>(taskClientReferenceId.value);
    }
    if (reAttempts.present) {
      map['re_attempts'] = Variable<int>(reAttempts.value);
    }
    if (symptoms.present) {
      map['symptoms'] = Variable<String>(symptoms.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SideEffectCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('taskClientReferenceId: $taskClientReferenceId, ')
          ..write('reAttempts: $reAttempts, ')
          ..write('symptoms: $symptoms, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductVariantTable extends ProductVariant
    with TableInfo<$ProductVariantTable, ProductVariantData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _variationMeta =
      const VerificationMeta('variation');
  @override
  late final GeneratedColumn<String> variation = GeneratedColumn<String>(
      'variation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        sku,
        variation,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variant';
  @override
  VerificationContext validateIntegrity(Insertable<ProductVariantData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('variation')) {
      context.handle(_variationMeta,
          variation.isAcceptableOrUnknown(data['variation']!, _variationMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, auditCreatedBy};
  @override
  ProductVariantData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductVariantData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      variation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variation']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ProductVariantTable createAlias(String alias) {
    return $ProductVariantTable(attachedDatabase, alias);
  }
}

class ProductVariantData extends DataClass
    implements Insertable<ProductVariantData> {
  final String id;
  final String? productId;
  final String? sku;
  final String? variation;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const ProductVariantData(
      {required this.id,
      this.productId,
      this.sku,
      this.variation,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || variation != null) {
      map['variation'] = Variable<String>(variation);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ProductVariantCompanion toCompanion(bool nullToAbsent) {
    return ProductVariantCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      variation: variation == null && nullToAbsent
          ? const Value.absent()
          : Value(variation),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ProductVariantData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductVariantData(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      sku: serializer.fromJson<String?>(json['sku']),
      variation: serializer.fromJson<String?>(json['variation']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String?>(productId),
      'sku': serializer.toJson<String?>(sku),
      'variation': serializer.toJson<String?>(variation),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ProductVariantData copyWith(
          {String? id,
          Value<String?> productId = const Value.absent(),
          Value<String?> sku = const Value.absent(),
          Value<String?> variation = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      ProductVariantData(
        id: id ?? this.id,
        productId: productId.present ? productId.value : this.productId,
        sku: sku.present ? sku.value : this.sku,
        variation: variation.present ? variation.value : this.variation,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ProductVariantData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('sku: $sku, ')
          ..write('variation: $variation, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      productId,
      sku,
      variation,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariantData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.sku == this.sku &&
          other.variation == this.variation &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class ProductVariantCompanion extends UpdateCompanion<ProductVariantData> {
  final Value<String> id;
  final Value<String?> productId;
  final Value<String?> sku;
  final Value<String?> variation;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ProductVariantCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.sku = const Value.absent(),
    this.variation = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductVariantCompanion.insert({
    required String id,
    this.productId = const Value.absent(),
    this.sku = const Value.absent(),
    this.variation = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<ProductVariantData> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? sku,
    Expression<String>? variation,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (sku != null) 'sku': sku,
      if (variation != null) 'variation': variation,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductVariantCompanion copyWith(
      {Value<String>? id,
      Value<String?>? productId,
      Value<String?>? sku,
      Value<String?>? variation,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ProductVariantCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      sku: sku ?? this.sku,
      variation: variation ?? this.variation,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (variation.present) {
      map['variation'] = Variable<String>(variation.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('sku: $sku, ')
          ..write('variation: $variation, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectBeneficiaryTable extends ProjectBeneficiary
    with TableInfo<$ProjectBeneficiaryTable, ProjectBeneficiaryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectBeneficiaryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _beneficiaryIdMeta =
      const VerificationMeta('beneficiaryId');
  @override
  late final GeneratedColumn<String> beneficiaryId = GeneratedColumn<String>(
      'beneficiary_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _beneficiaryClientReferenceIdMeta =
      const VerificationMeta('beneficiaryClientReferenceId');
  @override
  late final GeneratedColumn<String> beneficiaryClientReferenceId =
      GeneratedColumn<String>(
          'beneficiary_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateOfRegistrationMeta =
      const VerificationMeta('dateOfRegistration');
  @override
  late final GeneratedColumn<int> dateOfRegistration = GeneratedColumn<int>(
      'date_of_registration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        beneficiaryId,
        tag,
        beneficiaryClientReferenceId,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        dateOfRegistration,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_beneficiary';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProjectBeneficiaryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('beneficiary_id')) {
      context.handle(
          _beneficiaryIdMeta,
          beneficiaryId.isAcceptableOrUnknown(
              data['beneficiary_id']!, _beneficiaryIdMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    }
    if (data.containsKey('beneficiary_client_reference_id')) {
      context.handle(
          _beneficiaryClientReferenceIdMeta,
          beneficiaryClientReferenceId.isAcceptableOrUnknown(
              data['beneficiary_client_reference_id']!,
              _beneficiaryClientReferenceIdMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('date_of_registration')) {
      context.handle(
          _dateOfRegistrationMeta,
          dateOfRegistration.isAcceptableOrUnknown(
              data['date_of_registration']!, _dateOfRegistrationMeta));
    } else if (isInserting) {
      context.missing(_dateOfRegistrationMeta);
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  ProjectBeneficiaryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectBeneficiaryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      beneficiaryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}beneficiary_id']),
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag']),
      beneficiaryClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}beneficiary_client_reference_id']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      dateOfRegistration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}date_of_registration'])!,
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ProjectBeneficiaryTable createAlias(String alias) {
    return $ProjectBeneficiaryTable(attachedDatabase, alias);
  }
}

class ProjectBeneficiaryData extends DataClass
    implements Insertable<ProjectBeneficiaryData> {
  final String? id;
  final String? projectId;
  final String? beneficiaryId;
  final String? tag;
  final String? beneficiaryClientReferenceId;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final int dateOfRegistration;
  final String? additionalFields;
  const ProjectBeneficiaryData(
      {this.id,
      this.projectId,
      this.beneficiaryId,
      this.tag,
      this.beneficiaryClientReferenceId,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      required this.dateOfRegistration,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || beneficiaryId != null) {
      map['beneficiary_id'] = Variable<String>(beneficiaryId);
    }
    if (!nullToAbsent || tag != null) {
      map['tag'] = Variable<String>(tag);
    }
    if (!nullToAbsent || beneficiaryClientReferenceId != null) {
      map['beneficiary_client_reference_id'] =
          Variable<String>(beneficiaryClientReferenceId);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    map['date_of_registration'] = Variable<int>(dateOfRegistration);
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ProjectBeneficiaryCompanion toCompanion(bool nullToAbsent) {
    return ProjectBeneficiaryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      beneficiaryId: beneficiaryId == null && nullToAbsent
          ? const Value.absent()
          : Value(beneficiaryId),
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
      beneficiaryClientReferenceId:
          beneficiaryClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(beneficiaryClientReferenceId),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      dateOfRegistration: Value(dateOfRegistration),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ProjectBeneficiaryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectBeneficiaryData(
      id: serializer.fromJson<String?>(json['id']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      beneficiaryId: serializer.fromJson<String?>(json['beneficiaryId']),
      tag: serializer.fromJson<String?>(json['tag']),
      beneficiaryClientReferenceId:
          serializer.fromJson<String?>(json['beneficiaryClientReferenceId']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      dateOfRegistration: serializer.fromJson<int>(json['dateOfRegistration']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'projectId': serializer.toJson<String?>(projectId),
      'beneficiaryId': serializer.toJson<String?>(beneficiaryId),
      'tag': serializer.toJson<String?>(tag),
      'beneficiaryClientReferenceId':
          serializer.toJson<String?>(beneficiaryClientReferenceId),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'dateOfRegistration': serializer.toJson<int>(dateOfRegistration),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ProjectBeneficiaryData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> beneficiaryId = const Value.absent(),
          Value<String?> tag = const Value.absent(),
          Value<String?> beneficiaryClientReferenceId = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          int? dateOfRegistration,
          Value<String?> additionalFields = const Value.absent()}) =>
      ProjectBeneficiaryData(
        id: id.present ? id.value : this.id,
        projectId: projectId.present ? projectId.value : this.projectId,
        beneficiaryId:
            beneficiaryId.present ? beneficiaryId.value : this.beneficiaryId,
        tag: tag.present ? tag.value : this.tag,
        beneficiaryClientReferenceId: beneficiaryClientReferenceId.present
            ? beneficiaryClientReferenceId.value
            : this.beneficiaryClientReferenceId,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ProjectBeneficiaryData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('beneficiaryId: $beneficiaryId, ')
          ..write('tag: $tag, ')
          ..write(
              'beneficiaryClientReferenceId: $beneficiaryClientReferenceId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      projectId,
      beneficiaryId,
      tag,
      beneficiaryClientReferenceId,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      clientReferenceId,
      tenantId,
      isDeleted,
      rowVersion,
      dateOfRegistration,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectBeneficiaryData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.beneficiaryId == this.beneficiaryId &&
          other.tag == this.tag &&
          other.beneficiaryClientReferenceId ==
              this.beneficiaryClientReferenceId &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.dateOfRegistration == this.dateOfRegistration &&
          other.additionalFields == this.additionalFields);
}

class ProjectBeneficiaryCompanion
    extends UpdateCompanion<ProjectBeneficiaryData> {
  final Value<String?> id;
  final Value<String?> projectId;
  final Value<String?> beneficiaryId;
  final Value<String?> tag;
  final Value<String?> beneficiaryClientReferenceId;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<int> dateOfRegistration;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ProjectBeneficiaryCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.beneficiaryId = const Value.absent(),
    this.tag = const Value.absent(),
    this.beneficiaryClientReferenceId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.dateOfRegistration = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectBeneficiaryCompanion.insert({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.beneficiaryId = const Value.absent(),
    this.tag = const Value.absent(),
    this.beneficiaryClientReferenceId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    required int dateOfRegistration,
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : clientReferenceId = Value(clientReferenceId),
        dateOfRegistration = Value(dateOfRegistration);
  static Insertable<ProjectBeneficiaryData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? beneficiaryId,
    Expression<String>? tag,
    Expression<String>? beneficiaryClientReferenceId,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<int>? dateOfRegistration,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (beneficiaryId != null) 'beneficiary_id': beneficiaryId,
      if (tag != null) 'tag': tag,
      if (beneficiaryClientReferenceId != null)
        'beneficiary_client_reference_id': beneficiaryClientReferenceId,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (dateOfRegistration != null)
        'date_of_registration': dateOfRegistration,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectBeneficiaryCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? projectId,
      Value<String?>? beneficiaryId,
      Value<String?>? tag,
      Value<String?>? beneficiaryClientReferenceId,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<int>? dateOfRegistration,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ProjectBeneficiaryCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      beneficiaryId: beneficiaryId ?? this.beneficiaryId,
      tag: tag ?? this.tag,
      beneficiaryClientReferenceId:
          beneficiaryClientReferenceId ?? this.beneficiaryClientReferenceId,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (beneficiaryId.present) {
      map['beneficiary_id'] = Variable<String>(beneficiaryId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (beneficiaryClientReferenceId.present) {
      map['beneficiary_client_reference_id'] =
          Variable<String>(beneficiaryClientReferenceId.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (dateOfRegistration.present) {
      map['date_of_registration'] = Variable<int>(dateOfRegistration.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectBeneficiaryCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('beneficiaryId: $beneficiaryId, ')
          ..write('tag: $tag, ')
          ..write(
              'beneficiaryClientReferenceId: $beneficiaryClientReferenceId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('dateOfRegistration: $dateOfRegistration, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectProductVariantTable extends ProjectProductVariant
    with TableInfo<$ProjectProductVariantTable, ProjectProductVariantData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectProductVariantTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productVariantIdMeta =
      const VerificationMeta('productVariantId');
  @override
  late final GeneratedColumn<String> productVariantId = GeneratedColumn<String>(
      'product_variant_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isBaseUnitVariantMeta =
      const VerificationMeta('isBaseUnitVariant');
  @override
  late final GeneratedColumn<bool> isBaseUnitVariant = GeneratedColumn<bool>(
      'is_base_unit_variant', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_base_unit_variant" IN (0, 1))'));
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        productVariantId,
        type,
        isBaseUnitVariant,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_product_variant';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProjectProductVariantData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_variant_id')) {
      context.handle(
          _productVariantIdMeta,
          productVariantId.isAcceptableOrUnknown(
              data['product_variant_id']!, _productVariantIdMeta));
    } else if (isInserting) {
      context.missing(_productVariantIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('is_base_unit_variant')) {
      context.handle(
          _isBaseUnitVariantMeta,
          isBaseUnitVariant.isAcceptableOrUnknown(
              data['is_base_unit_variant']!, _isBaseUnitVariantMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productVariantId, auditCreatedBy};
  @override
  ProjectProductVariantData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectProductVariantData(
      productVariantId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_variant_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      isBaseUnitVariant: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_base_unit_variant']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ProjectProductVariantTable createAlias(String alias) {
    return $ProjectProductVariantTable(attachedDatabase, alias);
  }
}

class ProjectProductVariantData extends DataClass
    implements Insertable<ProjectProductVariantData> {
  final String productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const ProjectProductVariantData(
      {required this.productVariantId,
      this.type,
      this.isBaseUnitVariant,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_variant_id'] = Variable<String>(productVariantId);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || isBaseUnitVariant != null) {
      map['is_base_unit_variant'] = Variable<bool>(isBaseUnitVariant);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ProjectProductVariantCompanion toCompanion(bool nullToAbsent) {
    return ProjectProductVariantCompanion(
      productVariantId: Value(productVariantId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isBaseUnitVariant: isBaseUnitVariant == null && nullToAbsent
          ? const Value.absent()
          : Value(isBaseUnitVariant),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ProjectProductVariantData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectProductVariantData(
      productVariantId: serializer.fromJson<String>(json['productVariantId']),
      type: serializer.fromJson<String?>(json['type']),
      isBaseUnitVariant: serializer.fromJson<bool?>(json['isBaseUnitVariant']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productVariantId': serializer.toJson<String>(productVariantId),
      'type': serializer.toJson<String?>(type),
      'isBaseUnitVariant': serializer.toJson<bool?>(isBaseUnitVariant),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ProjectProductVariantData copyWith(
          {String? productVariantId,
          Value<String?> type = const Value.absent(),
          Value<bool?> isBaseUnitVariant = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      ProjectProductVariantData(
        productVariantId: productVariantId ?? this.productVariantId,
        type: type.present ? type.value : this.type,
        isBaseUnitVariant: isBaseUnitVariant.present
            ? isBaseUnitVariant.value
            : this.isBaseUnitVariant,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ProjectProductVariantData(')
          ..write('productVariantId: $productVariantId, ')
          ..write('type: $type, ')
          ..write('isBaseUnitVariant: $isBaseUnitVariant, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      productVariantId,
      type,
      isBaseUnitVariant,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      tenantId,
      isDeleted,
      rowVersion,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectProductVariantData &&
          other.productVariantId == this.productVariantId &&
          other.type == this.type &&
          other.isBaseUnitVariant == this.isBaseUnitVariant &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class ProjectProductVariantCompanion
    extends UpdateCompanion<ProjectProductVariantData> {
  final Value<String> productVariantId;
  final Value<String?> type;
  final Value<bool?> isBaseUnitVariant;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ProjectProductVariantCompanion({
    this.productVariantId = const Value.absent(),
    this.type = const Value.absent(),
    this.isBaseUnitVariant = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectProductVariantCompanion.insert({
    required String productVariantId,
    this.type = const Value.absent(),
    this.isBaseUnitVariant = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : productVariantId = Value(productVariantId);
  static Insertable<ProjectProductVariantData> custom({
    Expression<String>? productVariantId,
    Expression<String>? type,
    Expression<bool>? isBaseUnitVariant,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productVariantId != null) 'product_variant_id': productVariantId,
      if (type != null) 'type': type,
      if (isBaseUnitVariant != null) 'is_base_unit_variant': isBaseUnitVariant,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectProductVariantCompanion copyWith(
      {Value<String>? productVariantId,
      Value<String?>? type,
      Value<bool?>? isBaseUnitVariant,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ProjectProductVariantCompanion(
      productVariantId: productVariantId ?? this.productVariantId,
      type: type ?? this.type,
      isBaseUnitVariant: isBaseUnitVariant ?? this.isBaseUnitVariant,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productVariantId.present) {
      map['product_variant_id'] = Variable<String>(productVariantId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isBaseUnitVariant.present) {
      map['is_base_unit_variant'] = Variable<bool>(isBaseUnitVariant.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectProductVariantCompanion(')
          ..write('productVariantId: $productVariantId, ')
          ..write('type: $type, ')
          ..write('isBaseUnitVariant: $isBaseUnitVariant, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectResourceTable extends ProjectResource
    with TableInfo<$ProjectResourceTable, ProjectResourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectResourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _resourceMeta =
      const VerificationMeta('resource');
  @override
  late final GeneratedColumn<String> resource = GeneratedColumn<String>(
      'resource', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES project_product_variant (product_variant_id)'));
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        tenantId,
        isDeleted,
        rowVersion,
        resource,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_resource';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProjectResourceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('resource')) {
      context.handle(_resourceMeta,
          resource.isAcceptableOrUnknown(data['resource']!, _resourceMeta));
    } else if (isInserting) {
      context.missing(_resourceMeta);
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, auditCreatedBy};
  @override
  ProjectResourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectResourceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      resource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource'])!,
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ProjectResourceTable createAlias(String alias) {
    return $ProjectResourceTable(attachedDatabase, alias);
  }
}

class ProjectResourceData extends DataClass
    implements Insertable<ProjectResourceData> {
  final String? id;
  final String? projectId;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String resource;
  final String? additionalFields;
  const ProjectResourceData(
      {this.id,
      this.projectId,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      required this.resource,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    map['resource'] = Variable<String>(resource);
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ProjectResourceCompanion toCompanion(bool nullToAbsent) {
    return ProjectResourceCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      resource: Value(resource),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ProjectResourceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectResourceData(
      id: serializer.fromJson<String?>(json['id']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      resource: serializer.fromJson<String>(json['resource']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'projectId': serializer.toJson<String?>(projectId),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'resource': serializer.toJson<String>(resource),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ProjectResourceData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          String? resource,
          Value<String?> additionalFields = const Value.absent()}) =>
      ProjectResourceData(
        id: id.present ? id.value : this.id,
        projectId: projectId.present ? projectId.value : this.projectId,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        resource: resource ?? this.resource,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ProjectResourceData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('resource: $resource, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      projectId,
      auditCreatedBy,
      nonRecoverableError,
      auditCreatedTime,
      clientCreatedTime,
      clientModifiedBy,
      clientCreatedBy,
      clientModifiedTime,
      auditModifiedBy,
      auditModifiedTime,
      tenantId,
      isDeleted,
      rowVersion,
      resource,
      additionalFields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectResourceData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.resource == this.resource &&
          other.additionalFields == this.additionalFields);
}

class ProjectResourceCompanion extends UpdateCompanion<ProjectResourceData> {
  final Value<String?> id;
  final Value<String?> projectId;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String> resource;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ProjectResourceCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.resource = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectResourceCompanion.insert({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    required String resource,
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : resource = Value(resource);
  static Insertable<ProjectResourceData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? resource,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (resource != null) 'resource': resource,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectResourceCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? projectId,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String>? resource,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ProjectResourceCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      resource: resource ?? this.resource,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (resource.present) {
      map['resource'] = Variable<String>(resource.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectResourceCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('resource: $resource, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectTypeTable extends ProjectType
    with TableInfo<$ProjectTypeTable, ProjectTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
      'group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _beneficiaryTypeMeta =
      const VerificationMeta('beneficiaryType');
  @override
  late final GeneratedColumn<String> beneficiaryType = GeneratedColumn<String>(
      'beneficiary_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _eligibilityCriteriaMeta =
      const VerificationMeta('eligibilityCriteria');
  @override
  late final GeneratedColumn<String> eligibilityCriteria =
      GeneratedColumn<String>('eligibility_criteria', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskProcedureMeta =
      const VerificationMeta('taskProcedure');
  @override
  late final GeneratedColumn<String> taskProcedure = GeneratedColumn<String>(
      'task_procedure', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        code,
        group,
        beneficiaryType,
        eligibilityCriteria,
        taskProcedure,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_type';
  @override
  VerificationContext validateIntegrity(Insertable<ProjectTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    }
    if (data.containsKey('beneficiary_type')) {
      context.handle(
          _beneficiaryTypeMeta,
          beneficiaryType.isAcceptableOrUnknown(
              data['beneficiary_type']!, _beneficiaryTypeMeta));
    }
    if (data.containsKey('eligibility_criteria')) {
      context.handle(
          _eligibilityCriteriaMeta,
          eligibilityCriteria.isAcceptableOrUnknown(
              data['eligibility_criteria']!, _eligibilityCriteriaMeta));
    }
    if (data.containsKey('task_procedure')) {
      context.handle(
          _taskProcedureMeta,
          taskProcedure.isAcceptableOrUnknown(
              data['task_procedure']!, _taskProcedureMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  ProjectTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTypeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group']),
      beneficiaryType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}beneficiary_type']),
      eligibilityCriteria: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}eligibility_criteria']),
      taskProcedure: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_procedure']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ProjectTypeTable createAlias(String alias) {
    return $ProjectTypeTable(attachedDatabase, alias);
  }
}

class ProjectTypeData extends DataClass implements Insertable<ProjectTypeData> {
  final String? id;
  final String? name;
  final String? code;
  final String? group;
  final String? beneficiaryType;
  final String? eligibilityCriteria;
  final String? taskProcedure;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const ProjectTypeData(
      {this.id,
      this.name,
      this.code,
      this.group,
      this.beneficiaryType,
      this.eligibilityCriteria,
      this.taskProcedure,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || group != null) {
      map['group'] = Variable<String>(group);
    }
    if (!nullToAbsent || beneficiaryType != null) {
      map['beneficiary_type'] = Variable<String>(beneficiaryType);
    }
    if (!nullToAbsent || eligibilityCriteria != null) {
      map['eligibility_criteria'] = Variable<String>(eligibilityCriteria);
    }
    if (!nullToAbsent || taskProcedure != null) {
      map['task_procedure'] = Variable<String>(taskProcedure);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ProjectTypeCompanion toCompanion(bool nullToAbsent) {
    return ProjectTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      group:
          group == null && nullToAbsent ? const Value.absent() : Value(group),
      beneficiaryType: beneficiaryType == null && nullToAbsent
          ? const Value.absent()
          : Value(beneficiaryType),
      eligibilityCriteria: eligibilityCriteria == null && nullToAbsent
          ? const Value.absent()
          : Value(eligibilityCriteria),
      taskProcedure: taskProcedure == null && nullToAbsent
          ? const Value.absent()
          : Value(taskProcedure),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ProjectTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTypeData(
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      group: serializer.fromJson<String?>(json['group']),
      beneficiaryType: serializer.fromJson<String?>(json['beneficiaryType']),
      eligibilityCriteria:
          serializer.fromJson<String?>(json['eligibilityCriteria']),
      taskProcedure: serializer.fromJson<String?>(json['taskProcedure']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String?>(name),
      'code': serializer.toJson<String?>(code),
      'group': serializer.toJson<String?>(group),
      'beneficiaryType': serializer.toJson<String?>(beneficiaryType),
      'eligibilityCriteria': serializer.toJson<String?>(eligibilityCriteria),
      'taskProcedure': serializer.toJson<String?>(taskProcedure),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ProjectTypeData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> code = const Value.absent(),
          Value<String?> group = const Value.absent(),
          Value<String?> beneficiaryType = const Value.absent(),
          Value<String?> eligibilityCriteria = const Value.absent(),
          Value<String?> taskProcedure = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      ProjectTypeData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        code: code.present ? code.value : this.code,
        group: group.present ? group.value : this.group,
        beneficiaryType: beneficiaryType.present
            ? beneficiaryType.value
            : this.beneficiaryType,
        eligibilityCriteria: eligibilityCriteria.present
            ? eligibilityCriteria.value
            : this.eligibilityCriteria,
        taskProcedure:
            taskProcedure.present ? taskProcedure.value : this.taskProcedure,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ProjectTypeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('group: $group, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('eligibilityCriteria: $eligibilityCriteria, ')
          ..write('taskProcedure: $taskProcedure, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        code,
        group,
        beneficiaryType,
        eligibilityCriteria,
        taskProcedure,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTypeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.group == this.group &&
          other.beneficiaryType == this.beneficiaryType &&
          other.eligibilityCriteria == this.eligibilityCriteria &&
          other.taskProcedure == this.taskProcedure &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class ProjectTypeCompanion extends UpdateCompanion<ProjectTypeData> {
  final Value<String?> id;
  final Value<String?> name;
  final Value<String?> code;
  final Value<String?> group;
  final Value<String?> beneficiaryType;
  final Value<String?> eligibilityCriteria;
  final Value<String?> taskProcedure;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ProjectTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.group = const Value.absent(),
    this.beneficiaryType = const Value.absent(),
    this.eligibilityCriteria = const Value.absent(),
    this.taskProcedure = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectTypeCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.group = const Value.absent(),
    this.beneficiaryType = const Value.absent(),
    this.eligibilityCriteria = const Value.absent(),
    this.taskProcedure = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<ProjectTypeData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? group,
    Expression<String>? beneficiaryType,
    Expression<String>? eligibilityCriteria,
    Expression<String>? taskProcedure,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (group != null) 'group': group,
      if (beneficiaryType != null) 'beneficiary_type': beneficiaryType,
      if (eligibilityCriteria != null)
        'eligibility_criteria': eligibilityCriteria,
      if (taskProcedure != null) 'task_procedure': taskProcedure,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectTypeCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? name,
      Value<String?>? code,
      Value<String?>? group,
      Value<String?>? beneficiaryType,
      Value<String?>? eligibilityCriteria,
      Value<String?>? taskProcedure,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ProjectTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      group: group ?? this.group,
      beneficiaryType: beneficiaryType ?? this.beneficiaryType,
      eligibilityCriteria: eligibilityCriteria ?? this.eligibilityCriteria,
      taskProcedure: taskProcedure ?? this.taskProcedure,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (beneficiaryType.present) {
      map['beneficiary_type'] = Variable<String>(beneficiaryType.value);
    }
    if (eligibilityCriteria.present) {
      map['eligibility_criteria'] = Variable<String>(eligibilityCriteria.value);
    }
    if (taskProcedure.present) {
      map['task_procedure'] = Variable<String>(taskProcedure.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('group: $group, ')
          ..write('beneficiaryType: $beneficiaryType, ')
          ..write('eligibilityCriteria: $eligibilityCriteria, ')
          ..write('taskProcedure: $taskProcedure, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReferralTable extends Referral
    with TableInfo<$ReferralTable, ReferralData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferralTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectBeneficiaryClientReferenceIdMeta =
      const VerificationMeta('projectBeneficiaryClientReferenceId');
  @override
  late final GeneratedColumn<String> projectBeneficiaryClientReferenceId =
      GeneratedColumn<String>(
          'project_beneficiary_client_reference_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _referrerIdMeta =
      const VerificationMeta('referrerId');
  @override
  late final GeneratedColumn<String> referrerId = GeneratedColumn<String>(
      'referrer_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recipientTypeMeta =
      const VerificationMeta('recipientType');
  @override
  late final GeneratedColumn<String> recipientType = GeneratedColumn<String>(
      'recipient_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recipientIdMeta =
      const VerificationMeta('recipientId');
  @override
  late final GeneratedColumn<String> recipientId = GeneratedColumn<String>(
      'recipient_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reasonsMeta =
      const VerificationMeta('reasons');
  @override
  late final GeneratedColumn<String> reasons = GeneratedColumn<String>(
      'reasons', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditCreatedByMeta =
      const VerificationMeta('auditCreatedBy');
  @override
  late final GeneratedColumn<String> auditCreatedBy = GeneratedColumn<String>(
      'audit_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nonRecoverableErrorMeta =
      const VerificationMeta('nonRecoverableError');
  @override
  late final GeneratedColumn<bool> nonRecoverableError = GeneratedColumn<bool>(
      'non_recoverable_error', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("non_recoverable_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditCreatedTimeMeta =
      const VerificationMeta('auditCreatedTime');
  @override
  late final GeneratedColumn<int> auditCreatedTime = GeneratedColumn<int>(
      'audit_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedTimeMeta =
      const VerificationMeta('clientCreatedTime');
  @override
  late final GeneratedColumn<int> clientCreatedTime = GeneratedColumn<int>(
      'client_created_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedByMeta =
      const VerificationMeta('clientModifiedBy');
  @override
  late final GeneratedColumn<String> clientModifiedBy = GeneratedColumn<String>(
      'client_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientCreatedByMeta =
      const VerificationMeta('clientCreatedBy');
  @override
  late final GeneratedColumn<String> clientCreatedBy = GeneratedColumn<String>(
      'client_created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clientModifiedTimeMeta =
      const VerificationMeta('clientModifiedTime');
  @override
  late final GeneratedColumn<int> clientModifiedTime = GeneratedColumn<int>(
      'client_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedByMeta =
      const VerificationMeta('auditModifiedBy');
  @override
  late final GeneratedColumn<String> auditModifiedBy = GeneratedColumn<String>(
      'audit_modified_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _auditModifiedTimeMeta =
      const VerificationMeta('auditModifiedTime');
  @override
  late final GeneratedColumn<int> auditModifiedTime = GeneratedColumn<int>(
      'audit_modified_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientReferenceIdMeta =
      const VerificationMeta('clientReferenceId');
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>('client_reference_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        projectBeneficiaryClientReferenceId,
        referrerId,
        recipientType,
        recipientId,
        reasons,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'referral';
  @override
  VerificationContext validateIntegrity(Insertable<ReferralData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('project_beneficiary_client_reference_id')) {
      context.handle(
          _projectBeneficiaryClientReferenceIdMeta,
          projectBeneficiaryClientReferenceId.isAcceptableOrUnknown(
              data['project_beneficiary_client_reference_id']!,
              _projectBeneficiaryClientReferenceIdMeta));
    }
    if (data.containsKey('referrer_id')) {
      context.handle(
          _referrerIdMeta,
          referrerId.isAcceptableOrUnknown(
              data['referrer_id']!, _referrerIdMeta));
    }
    if (data.containsKey('recipient_type')) {
      context.handle(
          _recipientTypeMeta,
          recipientType.isAcceptableOrUnknown(
              data['recipient_type']!, _recipientTypeMeta));
    }
    if (data.containsKey('recipient_id')) {
      context.handle(
          _recipientIdMeta,
          recipientId.isAcceptableOrUnknown(
              data['recipient_id']!, _recipientIdMeta));
    }
    if (data.containsKey('reasons')) {
      context.handle(_reasonsMeta,
          reasons.isAcceptableOrUnknown(data['reasons']!, _reasonsMeta));
    }
    if (data.containsKey('audit_created_by')) {
      context.handle(
          _auditCreatedByMeta,
          auditCreatedBy.isAcceptableOrUnknown(
              data['audit_created_by']!, _auditCreatedByMeta));
    }
    if (data.containsKey('non_recoverable_error')) {
      context.handle(
          _nonRecoverableErrorMeta,
          nonRecoverableError.isAcceptableOrUnknown(
              data['non_recoverable_error']!, _nonRecoverableErrorMeta));
    }
    if (data.containsKey('audit_created_time')) {
      context.handle(
          _auditCreatedTimeMeta,
          auditCreatedTime.isAcceptableOrUnknown(
              data['audit_created_time']!, _auditCreatedTimeMeta));
    }
    if (data.containsKey('client_created_time')) {
      context.handle(
          _clientCreatedTimeMeta,
          clientCreatedTime.isAcceptableOrUnknown(
              data['client_created_time']!, _clientCreatedTimeMeta));
    }
    if (data.containsKey('client_modified_by')) {
      context.handle(
          _clientModifiedByMeta,
          clientModifiedBy.isAcceptableOrUnknown(
              data['client_modified_by']!, _clientModifiedByMeta));
    }
    if (data.containsKey('client_created_by')) {
      context.handle(
          _clientCreatedByMeta,
          clientCreatedBy.isAcceptableOrUnknown(
              data['client_created_by']!, _clientCreatedByMeta));
    }
    if (data.containsKey('client_modified_time')) {
      context.handle(
          _clientModifiedTimeMeta,
          clientModifiedTime.isAcceptableOrUnknown(
              data['client_modified_time']!, _clientModifiedTimeMeta));
    }
    if (data.containsKey('audit_modified_by')) {
      context.handle(
          _auditModifiedByMeta,
          auditModifiedBy.isAcceptableOrUnknown(
              data['audit_modified_by']!, _auditModifiedByMeta));
    }
    if (data.containsKey('audit_modified_time')) {
      context.handle(
          _auditModifiedTimeMeta,
          auditModifiedTime.isAcceptableOrUnknown(
              data['audit_modified_time']!, _auditModifiedTimeMeta));
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
          _clientReferenceIdMeta,
          clientReferenceId.isAcceptableOrUnknown(
              data['client_reference_id']!, _clientReferenceIdMeta));
    } else if (isInserting) {
      context.missing(_clientReferenceIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('additional_fields')) {
      context.handle(
          _additionalFieldsMeta,
          additionalFields.isAcceptableOrUnknown(
              data['additional_fields']!, _additionalFieldsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditCreatedBy, clientReferenceId};
  @override
  ReferralData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferralData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      projectBeneficiaryClientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}project_beneficiary_client_reference_id']),
      referrerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}referrer_id']),
      recipientType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipient_type']),
      recipientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipient_id']),
      reasons: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reasons']),
      auditCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_created_by']),
      nonRecoverableError: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}non_recoverable_error']),
      auditCreatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audit_created_time']),
      clientCreatedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_created_time']),
      clientModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_modified_by']),
      clientCreatedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_created_by']),
      clientModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}client_modified_time']),
      auditModifiedBy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_modified_by']),
      auditModifiedTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_modified_time']),
      clientReferenceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}client_reference_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version']),
      additionalFields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}additional_fields']),
    );
  }

  @override
  $ReferralTable createAlias(String alias) {
    return $ReferralTable(attachedDatabase, alias);
  }
}

class ReferralData extends DataClass implements Insertable<ReferralData> {
  final String? id;
  final String? projectId;
  final String? projectBeneficiaryClientReferenceId;
  final String? referrerId;
  final String? recipientType;
  final String? recipientId;
  final String? reasons;
  final String? auditCreatedBy;
  final bool? nonRecoverableError;
  final int? auditCreatedTime;
  final int? clientCreatedTime;
  final String? clientModifiedBy;
  final String? clientCreatedBy;
  final int? clientModifiedTime;
  final String? auditModifiedBy;
  final int? auditModifiedTime;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final String? additionalFields;
  const ReferralData(
      {this.id,
      this.projectId,
      this.projectBeneficiaryClientReferenceId,
      this.referrerId,
      this.recipientType,
      this.recipientId,
      this.reasons,
      this.auditCreatedBy,
      this.nonRecoverableError,
      this.auditCreatedTime,
      this.clientCreatedTime,
      this.clientModifiedBy,
      this.clientCreatedBy,
      this.clientModifiedTime,
      this.auditModifiedBy,
      this.auditModifiedTime,
      required this.clientReferenceId,
      this.tenantId,
      this.isDeleted,
      this.rowVersion,
      this.additionalFields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || projectBeneficiaryClientReferenceId != null) {
      map['project_beneficiary_client_reference_id'] =
          Variable<String>(projectBeneficiaryClientReferenceId);
    }
    if (!nullToAbsent || referrerId != null) {
      map['referrer_id'] = Variable<String>(referrerId);
    }
    if (!nullToAbsent || recipientType != null) {
      map['recipient_type'] = Variable<String>(recipientType);
    }
    if (!nullToAbsent || recipientId != null) {
      map['recipient_id'] = Variable<String>(recipientId);
    }
    if (!nullToAbsent || reasons != null) {
      map['reasons'] = Variable<String>(reasons);
    }
    if (!nullToAbsent || auditCreatedBy != null) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy);
    }
    if (!nullToAbsent || nonRecoverableError != null) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError);
    }
    if (!nullToAbsent || auditCreatedTime != null) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime);
    }
    if (!nullToAbsent || clientCreatedTime != null) {
      map['client_created_time'] = Variable<int>(clientCreatedTime);
    }
    if (!nullToAbsent || clientModifiedBy != null) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy);
    }
    if (!nullToAbsent || clientCreatedBy != null) {
      map['client_created_by'] = Variable<String>(clientCreatedBy);
    }
    if (!nullToAbsent || clientModifiedTime != null) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime);
    }
    if (!nullToAbsent || auditModifiedBy != null) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy);
    }
    if (!nullToAbsent || auditModifiedTime != null) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime);
    }
    map['client_reference_id'] = Variable<String>(clientReferenceId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || rowVersion != null) {
      map['row_version'] = Variable<int>(rowVersion);
    }
    if (!nullToAbsent || additionalFields != null) {
      map['additional_fields'] = Variable<String>(additionalFields);
    }
    return map;
  }

  ReferralCompanion toCompanion(bool nullToAbsent) {
    return ReferralCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      projectBeneficiaryClientReferenceId:
          projectBeneficiaryClientReferenceId == null && nullToAbsent
              ? const Value.absent()
              : Value(projectBeneficiaryClientReferenceId),
      referrerId: referrerId == null && nullToAbsent
          ? const Value.absent()
          : Value(referrerId),
      recipientType: recipientType == null && nullToAbsent
          ? const Value.absent()
          : Value(recipientType),
      recipientId: recipientId == null && nullToAbsent
          ? const Value.absent()
          : Value(recipientId),
      reasons: reasons == null && nullToAbsent
          ? const Value.absent()
          : Value(reasons),
      auditCreatedBy: auditCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedBy),
      nonRecoverableError: nonRecoverableError == null && nullToAbsent
          ? const Value.absent()
          : Value(nonRecoverableError),
      auditCreatedTime: auditCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditCreatedTime),
      clientCreatedTime: clientCreatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedTime),
      clientModifiedBy: clientModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedBy),
      clientCreatedBy: clientCreatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCreatedBy),
      clientModifiedTime: clientModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(clientModifiedTime),
      auditModifiedBy: auditModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedBy),
      auditModifiedTime: auditModifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(auditModifiedTime),
      clientReferenceId: Value(clientReferenceId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      rowVersion: rowVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(rowVersion),
      additionalFields: additionalFields == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalFields),
    );
  }

  factory ReferralData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferralData(
      id: serializer.fromJson<String?>(json['id']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      projectBeneficiaryClientReferenceId: serializer
          .fromJson<String?>(json['projectBeneficiaryClientReferenceId']),
      referrerId: serializer.fromJson<String?>(json['referrerId']),
      recipientType: serializer.fromJson<String?>(json['recipientType']),
      recipientId: serializer.fromJson<String?>(json['recipientId']),
      reasons: serializer.fromJson<String?>(json['reasons']),
      auditCreatedBy: serializer.fromJson<String?>(json['auditCreatedBy']),
      nonRecoverableError:
          serializer.fromJson<bool?>(json['nonRecoverableError']),
      auditCreatedTime: serializer.fromJson<int?>(json['auditCreatedTime']),
      clientCreatedTime: serializer.fromJson<int?>(json['clientCreatedTime']),
      clientModifiedBy: serializer.fromJson<String?>(json['clientModifiedBy']),
      clientCreatedBy: serializer.fromJson<String?>(json['clientCreatedBy']),
      clientModifiedTime: serializer.fromJson<int?>(json['clientModifiedTime']),
      auditModifiedBy: serializer.fromJson<String?>(json['auditModifiedBy']),
      auditModifiedTime: serializer.fromJson<int?>(json['auditModifiedTime']),
      clientReferenceId: serializer.fromJson<String>(json['clientReferenceId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      rowVersion: serializer.fromJson<int?>(json['rowVersion']),
      additionalFields: serializer.fromJson<String?>(json['additionalFields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'projectId': serializer.toJson<String?>(projectId),
      'projectBeneficiaryClientReferenceId':
          serializer.toJson<String?>(projectBeneficiaryClientReferenceId),
      'referrerId': serializer.toJson<String?>(referrerId),
      'recipientType': serializer.toJson<String?>(recipientType),
      'recipientId': serializer.toJson<String?>(recipientId),
      'reasons': serializer.toJson<String?>(reasons),
      'auditCreatedBy': serializer.toJson<String?>(auditCreatedBy),
      'nonRecoverableError': serializer.toJson<bool?>(nonRecoverableError),
      'auditCreatedTime': serializer.toJson<int?>(auditCreatedTime),
      'clientCreatedTime': serializer.toJson<int?>(clientCreatedTime),
      'clientModifiedBy': serializer.toJson<String?>(clientModifiedBy),
      'clientCreatedBy': serializer.toJson<String?>(clientCreatedBy),
      'clientModifiedTime': serializer.toJson<int?>(clientModifiedTime),
      'auditModifiedBy': serializer.toJson<String?>(auditModifiedBy),
      'auditModifiedTime': serializer.toJson<int?>(auditModifiedTime),
      'clientReferenceId': serializer.toJson<String>(clientReferenceId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'rowVersion': serializer.toJson<int?>(rowVersion),
      'additionalFields': serializer.toJson<String?>(additionalFields),
    };
  }

  ReferralData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> projectBeneficiaryClientReferenceId =
              const Value.absent(),
          Value<String?> referrerId = const Value.absent(),
          Value<String?> recipientType = const Value.absent(),
          Value<String?> recipientId = const Value.absent(),
          Value<String?> reasons = const Value.absent(),
          Value<String?> auditCreatedBy = const Value.absent(),
          Value<bool?> nonRecoverableError = const Value.absent(),
          Value<int?> auditCreatedTime = const Value.absent(),
          Value<int?> clientCreatedTime = const Value.absent(),
          Value<String?> clientModifiedBy = const Value.absent(),
          Value<String?> clientCreatedBy = const Value.absent(),
          Value<int?> clientModifiedTime = const Value.absent(),
          Value<String?> auditModifiedBy = const Value.absent(),
          Value<int?> auditModifiedTime = const Value.absent(),
          String? clientReferenceId,
          Value<String?> tenantId = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent(),
          Value<int?> rowVersion = const Value.absent(),
          Value<String?> additionalFields = const Value.absent()}) =>
      ReferralData(
        id: id.present ? id.value : this.id,
        projectId: projectId.present ? projectId.value : this.projectId,
        projectBeneficiaryClientReferenceId:
            projectBeneficiaryClientReferenceId.present
                ? projectBeneficiaryClientReferenceId.value
                : this.projectBeneficiaryClientReferenceId,
        referrerId: referrerId.present ? referrerId.value : this.referrerId,
        recipientType:
            recipientType.present ? recipientType.value : this.recipientType,
        recipientId: recipientId.present ? recipientId.value : this.recipientId,
        reasons: reasons.present ? reasons.value : this.reasons,
        auditCreatedBy:
            auditCreatedBy.present ? auditCreatedBy.value : this.auditCreatedBy,
        nonRecoverableError: nonRecoverableError.present
            ? nonRecoverableError.value
            : this.nonRecoverableError,
        auditCreatedTime: auditCreatedTime.present
            ? auditCreatedTime.value
            : this.auditCreatedTime,
        clientCreatedTime: clientCreatedTime.present
            ? clientCreatedTime.value
            : this.clientCreatedTime,
        clientModifiedBy: clientModifiedBy.present
            ? clientModifiedBy.value
            : this.clientModifiedBy,
        clientCreatedBy: clientCreatedBy.present
            ? clientCreatedBy.value
            : this.clientCreatedBy,
        clientModifiedTime: clientModifiedTime.present
            ? clientModifiedTime.value
            : this.clientModifiedTime,
        auditModifiedBy: auditModifiedBy.present
            ? auditModifiedBy.value
            : this.auditModifiedBy,
        auditModifiedTime: auditModifiedTime.present
            ? auditModifiedTime.value
            : this.auditModifiedTime,
        clientReferenceId: clientReferenceId ?? this.clientReferenceId,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
        rowVersion: rowVersion.present ? rowVersion.value : this.rowVersion,
        additionalFields: additionalFields.present
            ? additionalFields.value
            : this.additionalFields,
      );
  @override
  String toString() {
    return (StringBuffer('ReferralData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write(
              'projectBeneficiaryClientReferenceId: $projectBeneficiaryClientReferenceId, ')
          ..write('referrerId: $referrerId, ')
          ..write('recipientType: $recipientType, ')
          ..write('recipientId: $recipientId, ')
          ..write('reasons: $reasons, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        projectId,
        projectBeneficiaryClientReferenceId,
        referrerId,
        recipientType,
        recipientId,
        reasons,
        auditCreatedBy,
        nonRecoverableError,
        auditCreatedTime,
        clientCreatedTime,
        clientModifiedBy,
        clientCreatedBy,
        clientModifiedTime,
        auditModifiedBy,
        auditModifiedTime,
        clientReferenceId,
        tenantId,
        isDeleted,
        rowVersion,
        additionalFields
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferralData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.projectBeneficiaryClientReferenceId ==
              this.projectBeneficiaryClientReferenceId &&
          other.referrerId == this.referrerId &&
          other.recipientType == this.recipientType &&
          other.recipientId == this.recipientId &&
          other.reasons == this.reasons &&
          other.auditCreatedBy == this.auditCreatedBy &&
          other.nonRecoverableError == this.nonRecoverableError &&
          other.auditCreatedTime == this.auditCreatedTime &&
          other.clientCreatedTime == this.clientCreatedTime &&
          other.clientModifiedBy == this.clientModifiedBy &&
          other.clientCreatedBy == this.clientCreatedBy &&
          other.clientModifiedTime == this.clientModifiedTime &&
          other.auditModifiedBy == this.auditModifiedBy &&
          other.auditModifiedTime == this.auditModifiedTime &&
          other.clientReferenceId == this.clientReferenceId &&
          other.tenantId == this.tenantId &&
          other.isDeleted == this.isDeleted &&
          other.rowVersion == this.rowVersion &&
          other.additionalFields == this.additionalFields);
}

class ReferralCompanion extends UpdateCompanion<ReferralData> {
  final Value<String?> id;
  final Value<String?> projectId;
  final Value<String?> projectBeneficiaryClientReferenceId;
  final Value<String?> referrerId;
  final Value<String?> recipientType;
  final Value<String?> recipientId;
  final Value<String?> reasons;
  final Value<String?> auditCreatedBy;
  final Value<bool?> nonRecoverableError;
  final Value<int?> auditCreatedTime;
  final Value<int?> clientCreatedTime;
  final Value<String?> clientModifiedBy;
  final Value<String?> clientCreatedBy;
  final Value<int?> clientModifiedTime;
  final Value<String?> auditModifiedBy;
  final Value<int?> auditModifiedTime;
  final Value<String> clientReferenceId;
  final Value<String?> tenantId;
  final Value<bool?> isDeleted;
  final Value<int?> rowVersion;
  final Value<String?> additionalFields;
  final Value<int> rowid;
  const ReferralCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectBeneficiaryClientReferenceId = const Value.absent(),
    this.referrerId = const Value.absent(),
    this.recipientType = const Value.absent(),
    this.recipientId = const Value.absent(),
    this.reasons = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReferralCompanion.insert({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectBeneficiaryClientReferenceId = const Value.absent(),
    this.referrerId = const Value.absent(),
    this.recipientType = const Value.absent(),
    this.recipientId = const Value.absent(),
    this.reasons = const Value.absent(),
    this.auditCreatedBy = const Value.absent(),
    this.nonRecoverableError = const Value.absent(),
    this.auditCreatedTime = const Value.absent(),
    this.clientCreatedTime = const Value.absent(),
    this.clientModifiedBy = const Value.absent(),
    this.clientCreatedBy = const Value.absent(),
    this.clientModifiedTime = const Value.absent(),
    this.auditModifiedBy = const Value.absent(),
    this.auditModifiedTime = const Value.absent(),
    required String clientReferenceId,
    this.tenantId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.additionalFields = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReferenceId = Value(clientReferenceId);
  static Insertable<ReferralData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? projectBeneficiaryClientReferenceId,
    Expression<String>? referrerId,
    Expression<String>? recipientType,
    Expression<String>? recipientId,
    Expression<String>? reasons,
    Expression<String>? auditCreatedBy,
    Expression<bool>? nonRecoverableError,
    Expression<int>? auditCreatedTime,
    Expression<int>? clientCreatedTime,
    Expression<String>? clientModifiedBy,
    Expression<String>? clientCreatedBy,
    Expression<int>? clientModifiedTime,
    Expression<String>? auditModifiedBy,
    Expression<int>? auditModifiedTime,
    Expression<String>? clientReferenceId,
    Expression<String>? tenantId,
    Expression<bool>? isDeleted,
    Expression<int>? rowVersion,
    Expression<String>? additionalFields,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (projectBeneficiaryClientReferenceId != null)
        'project_beneficiary_client_reference_id':
            projectBeneficiaryClientReferenceId,
      if (referrerId != null) 'referrer_id': referrerId,
      if (recipientType != null) 'recipient_type': recipientType,
      if (recipientId != null) 'recipient_id': recipientId,
      if (reasons != null) 'reasons': reasons,
      if (auditCreatedBy != null) 'audit_created_by': auditCreatedBy,
      if (nonRecoverableError != null)
        'non_recoverable_error': nonRecoverableError,
      if (auditCreatedTime != null) 'audit_created_time': auditCreatedTime,
      if (clientCreatedTime != null) 'client_created_time': clientCreatedTime,
      if (clientModifiedBy != null) 'client_modified_by': clientModifiedBy,
      if (clientCreatedBy != null) 'client_created_by': clientCreatedBy,
      if (clientModifiedTime != null)
        'client_modified_time': clientModifiedTime,
      if (auditModifiedBy != null) 'audit_modified_by': auditModifiedBy,
      if (auditModifiedTime != null) 'audit_modified_time': auditModifiedTime,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowVersion != null) 'row_version': rowVersion,
      if (additionalFields != null) 'additional_fields': additionalFields,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReferralCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? projectId,
      Value<String?>? projectBeneficiaryClientReferenceId,
      Value<String?>? referrerId,
      Value<String?>? recipientType,
      Value<String?>? recipientId,
      Value<String?>? reasons,
      Value<String?>? auditCreatedBy,
      Value<bool?>? nonRecoverableError,
      Value<int?>? auditCreatedTime,
      Value<int?>? clientCreatedTime,
      Value<String?>? clientModifiedBy,
      Value<String?>? clientCreatedBy,
      Value<int?>? clientModifiedTime,
      Value<String?>? auditModifiedBy,
      Value<int?>? auditModifiedTime,
      Value<String>? clientReferenceId,
      Value<String?>? tenantId,
      Value<bool?>? isDeleted,
      Value<int?>? rowVersion,
      Value<String?>? additionalFields,
      Value<int>? rowid}) {
    return ReferralCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      projectBeneficiaryClientReferenceId:
          projectBeneficiaryClientReferenceId ??
              this.projectBeneficiaryClientReferenceId,
      referrerId: referrerId ?? this.referrerId,
      recipientType: recipientType ?? this.recipientType,
      recipientId: recipientId ?? this.recipientId,
      reasons: reasons ?? this.reasons,
      auditCreatedBy: auditCreatedBy ?? this.auditCreatedBy,
      nonRecoverableError: nonRecoverableError ?? this.nonRecoverableError,
      auditCreatedTime: auditCreatedTime ?? this.auditCreatedTime,
      clientCreatedTime: clientCreatedTime ?? this.clientCreatedTime,
      clientModifiedBy: clientModifiedBy ?? this.clientModifiedBy,
      clientCreatedBy: clientCreatedBy ?? this.clientCreatedBy,
      clientModifiedTime: clientModifiedTime ?? this.clientModifiedTime,
      auditModifiedBy: auditModifiedBy ?? this.auditModifiedBy,
      auditModifiedTime: auditModifiedTime ?? this.auditModifiedTime,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      tenantId: tenantId ?? this.tenantId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowVersion: rowVersion ?? this.rowVersion,
      additionalFields: additionalFields ?? this.additionalFields,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (projectBeneficiaryClientReferenceId.present) {
      map['project_beneficiary_client_reference_id'] =
          Variable<String>(projectBeneficiaryClientReferenceId.value);
    }
    if (referrerId.present) {
      map['referrer_id'] = Variable<String>(referrerId.value);
    }
    if (recipientType.present) {
      map['recipient_type'] = Variable<String>(recipientType.value);
    }
    if (recipientId.present) {
      map['recipient_id'] = Variable<String>(recipientId.value);
    }
    if (reasons.present) {
      map['reasons'] = Variable<String>(reasons.value);
    }
    if (auditCreatedBy.present) {
      map['audit_created_by'] = Variable<String>(auditCreatedBy.value);
    }
    if (nonRecoverableError.present) {
      map['non_recoverable_error'] = Variable<bool>(nonRecoverableError.value);
    }
    if (auditCreatedTime.present) {
      map['audit_created_time'] = Variable<int>(auditCreatedTime.value);
    }
    if (clientCreatedTime.present) {
      map['client_created_time'] = Variable<int>(clientCreatedTime.value);
    }
    if (clientModifiedBy.present) {
      map['client_modified_by'] = Variable<String>(clientModifiedBy.value);
    }
    if (clientCreatedBy.present) {
      map['client_created_by'] = Variable<String>(clientCreatedBy.value);
    }
    if (clientModifiedTime.present) {
      map['client_modified_time'] = Variable<int>(clientModifiedTime.value);
    }
    if (auditModifiedBy.present) {
      map['audit_modified_by'] = Variable<String>(auditModifiedBy.value);
    }
    if (auditModifiedTime.present) {
      map['audit_modified_time'] = Variable<int>(auditModifiedTime.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (additionalFields.present) {
      map['additional_fields'] = Variable<String>(additionalFields.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferralCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write(
              'projectBeneficiaryClientReferenceId: $projectBeneficiaryClientReferenceId, ')
          ..write('referrerId: $referrerId, ')
          ..write('recipientType: $recipientType, ')
          ..write('recipientId: $recipientId, ')
          ..write('reasons: $reasons, ')
          ..write('auditCreatedBy: $auditCreatedBy, ')
          ..write('nonRecoverableError: $nonRecoverableError, ')
          ..write('auditCreatedTime: $auditCreatedTime, ')
          ..write('clientCreatedTime: $clientCreatedTime, ')
          ..write('clientModifiedBy: $clientModifiedBy, ')
          ..write('clientCreatedBy: $clientCreatedBy, ')
          ..write('clientModifiedTime: $clientModifiedTime, ')
          ..write('auditModifiedBy: $auditModifiedBy, ')
          ..write('auditModifiedTime: $auditModifiedTime, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('tenantId: $tenantId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('additionalFields: $additionalFields, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$RegistrationLocalSqlDataStore extends GeneratedDatabase {
  _$RegistrationLocalSqlDataStore(QueryExecutor e) : super(e);
  late final $HouseholdTable household = $HouseholdTable(this);
  late final $HouseholdMemberTable householdMember =
      $HouseholdMemberTable(this);
  late final $IdentifierTable identifier = $IdentifierTable(this);
  late final $NameTable name = $NameTable(this);
  late final $TaskTable task = $TaskTable(this);
  late final $TaskResourceTable taskResource = $TaskResourceTable(this);
  late final $SideEffectTable sideEffect = $SideEffectTable(this);
  late final $ProductVariantTable productVariant = $ProductVariantTable(this);
  late final $ProjectBeneficiaryTable projectBeneficiary =
      $ProjectBeneficiaryTable(this);
  late final $ProjectProductVariantTable projectProductVariant =
      $ProjectProductVariantTable(this);
  late final $ProjectResourceTable projectResource =
      $ProjectResourceTable(this);
  late final $ProjectTypeTable projectType = $ProjectTypeTable(this);
  late final $ReferralTable referral = $ReferralTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        household,
        householdMember,
        identifier,
        name,
        task,
        taskResource,
        sideEffect,
        productVariant,
        projectBeneficiary,
        projectProductVariant,
        projectResource,
        projectType,
        referral
      ];
}
