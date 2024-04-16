import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/data_repository.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/localization.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../data/local_store/no_sql/schema/project_types.dart';
import '../data/local_store/no_sql/schema/row_versions.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/repositories/local/attendance_logs.dart';
import '../data/repositories/local/boundary.dart';
import '../data/repositories/local/facility.dart';
import '../data/repositories/local/hcm_attendance.dart';
import '../data/repositories/local/hcm_hf_referral.dart';
import '../data/repositories/local/household.dart';
import '../data/repositories/local/houshold_member.dart';
import '../data/repositories/local/individual.dart';
import '../data/repositories/local/pgr_service.dart';
import '../data/repositories/local/product_variant.dart';
import '../data/repositories/local/project.dart';
import '../data/repositories/local/project_beneficiary.dart';
import '../data/repositories/local/project_facility.dart';
import '../data/repositories/local/project_resource.dart';
import '../data/repositories/local/project_staff.dart';
import '../data/repositories/local/referral.dart';
import '../data/repositories/local/service.dart';
import '../data/repositories/local/service_definition.dart';
import '../data/repositories/local/side_effect.dart';
import '../data/repositories/local/stock.dart';
import '../data/repositories/local/stock_reconciliation.dart';
import '../data/repositories/local/task.dart';
import '../data/repositories/oplog/oplog.dart';
import '../data/repositories/remote/attendance_logs.dart';
import '../data/repositories/remote/boundary.dart';
import '../data/repositories/remote/downsync.dart';
import '../data/repositories/remote/facility.dart';
import '../data/repositories/remote/h_f_referral.dart';
import '../data/repositories/remote/hcm_attendance.dart';
import '../data/repositories/remote/household.dart';
import '../data/repositories/remote/household_member.dart';
import '../data/repositories/remote/individual.dart';
import '../data/repositories/remote/pgr_service.dart';
import '../data/repositories/remote/product_variant.dart';
import '../data/repositories/remote/project_beneficiary.dart';
import '../data/repositories/remote/project_facility.dart';
import '../data/repositories/remote/project_product_variant.dart';
import '../data/repositories/remote/project_resource.dart';
import '../data/repositories/remote/project_staff.dart';
import '../data/repositories/remote/project_type.dart';
import '../data/repositories/remote/referral.dart';
import '../data/repositories/remote/service.dart';
import '../data/repositories/remote/service_definition.dart';
import '../data/repositories/remote/side_effect.dart';
import '../data/repositories/remote/stock.dart';
import '../data/repositories/remote/stock_reconciliation.dart';
import '../data/repositories/remote/task.dart';
import '../models/data_model.dart';
import '../models/data_model.init.dart';

class Constants {
  late Future<Isar> _isar;
  late String _version;
  static final Constants _instance = Constants._();
  Constants._() {
    _isar = openIsar();
  }
  factory Constants() {
    return _instance;
  }
  Future initialize(version) async {
    initializeMappers();
    await _initializeIsar(version);
  }

  String get version {
    return _version;
  }

  Future<Isar> get isar {
    return _isar;
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          ServiceRegistrySchema,
          LocalizationWrapperSchema,
          AppConfigurationSchema,
          OpLogSchema,
          ProjectTypeListCycleSchema,
          RowVersionListSchema,
        ],
        name: 'HCM',
        inspector: true,
        directory: directory.path,
      );
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  static const String localizationApiPath = 'localization/messages/v1/_search';
  static const int validMinAge = 0;
  static const int validMaxAge = 64;

  static List<LocalRepository> getLocalRepositories(
    LocalSqlDataStore sql,
    Isar isar,
  ) {
    return [
      IndividualLocalRepository(sql, IndividualOpLogManager(isar)),
      FacilityLocalRepository(sql, FacilityOpLogManager(isar)),
      HouseholdMemberLocalRepository(sql, HouseholdMemberOpLogManager(isar)),
      HouseholdLocalRepository(sql, HouseholdOpLogManager(isar)),
      ProjectLocalRepository(sql, ProjectOpLogManager(isar)),
      ProjectBeneficiaryLocalRepository(
        sql,
        ProjectBeneficiaryOpLogManager(
          isar,
        ),
      ),
      ProjectFacilityLocalRepository(sql, ProjectFacilityOpLogManager(isar)),
      ProjectStaffLocalRepository(sql, ProjectStaffOpLogManager(isar)),
      StockLocalRepository(sql, StockOpLogManager(isar)),
      TaskLocalRepository(sql, TaskOpLogManager(isar)),
      SideEffectLocalRepository(sql, SideEffectOpLogManager(isar)),
      ReferralLocalRepository(sql, ReferralOpLogManager(isar)),
      StockReconciliationLocalRepository(
        sql,
        StockReconciliationOpLogManager(isar),
      ),
      ServiceDefinitionLocalRepository(
        sql,
        ServiceDefinitionOpLogManager(isar),
      ),
      ServiceLocalRepository(
        sql,
        ServiceOpLogManager(isar),
      ),
      ProjectResourceLocalRepository(
        sql,
        ProjectResourceOpLogManager(isar),
      ),
      ProductVariantLocalRepository(
        sql,
        ProductVariantOpLogManager(isar),
      ),
      BoundaryLocalRepository(
        sql,
        BoundaryOpLogManager(isar),
      ),
      PgrServiceLocalRepository(
        sql,
        PgrServiceOpLogManager(isar),
      ),
      HFReferralLocalRepository(
        sql,
        HFReferralOpLogManager(isar),
      ),
      AttendanceLocalRepository(
        sql,
        AttendanceOpLogManager(isar),
      ),
      AttendanceLogsLocalRepository(
        sql,
        AttendanceLogOpLogManager(isar),
      ),
    ];
  }

  Future<void> _initializeIsar(version) async {
    _isar = Constants().isar;

    final isar = await _isar;
    final appConfigs = await isar.appConfigurations.where().findAll();
    final config = appConfigs.firstOrNull;

    final enableCrashlytics =
        config?.firebaseConfig?.enableCrashlytics ?? false;

    _version = version;
  }

  static List<RemoteRepository> getRemoteRepositories(
    Dio dio,
    Map<DataModelType, Map<ApiOperation, String>> actionMap,
  ) {
    final remoteRepositories = <RemoteRepository>[];
    for (final value in DataModelType.values) {
      if (!actionMap.containsKey(value)) {
        continue;
      }

      final actions = actionMap[value]!;

      remoteRepositories.addAll([
        if (value == DataModelType.facility)
          FacilityRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.household)
          HouseholdRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectBeneficiary)
          ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.complaints)
          PgrServiceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.productVariant)
          ProductVariantRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.boundary)
          BoundaryRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.serviceDefinition)
          ServiceDefinitionRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectResource)
          ProjectResourceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.service)
          ServiceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.stockReconciliation)
          StockReconciliationRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.task)
          TaskRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.stock)
          StockRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectType)
          ProjectTypeRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectStaff)
          ProjectStaffRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectProductVariant)
          ProjectProductVariantRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectFacility)
          ProjectFacilityRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.individual)
          IndividualRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.householdMember)
          HouseholdMemberRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.sideEffect)
          SideEffectRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.referral)
          ReferralRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.downsync)
          DownsyncRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.hFReferral)
          HFReferralRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.attendanceRegister)
          AttendanceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.attendance)
          AttendanceLogRemoteRepository(dio, actionMap: actions),
      ]);
    }

    return remoteRepositories;
  }

  static String getEndPoint({
    required AppInitialized state,
    required String service,
    required String action,
    required String entityName,
  }) {
    final actionResult = state.serviceRegistryList
        .firstWhereOrNull((element) => element.service == service)
        ?.actions
        .firstWhereOrNull((element) => element.entityName == entityName)
        ?.path;

    return actionResult ?? '';
  }

  static List<KeyValue> yesNo = [
    KeyValue('CORE_COMMON_YES', true),
    KeyValue('CORE_COMMON_NO', false),
  ];
}

/// By using this key, we can push pages without context
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class KeyValue {
  String label;
  dynamic key;
  KeyValue(this.label, this.key);
}

class StatusKeys {
  bool isNotEligible;
  bool isBeneficiaryRefused;
  bool isBeneficiaryReferred;
  bool isStatusReset;
  StatusKeys(this.isNotEligible, this.isBeneficiaryRefused,
      this.isBeneficiaryReferred, this.isStatusReset);
}

class RequestInfoData {
  static const String apiId = 'hcm';
  static const String ver = '.01';
  static num ts = DateTime.now().millisecondsSinceEpoch;
  static const did = "1";
  static const key = "";
  static String? authToken;
}

class Modules {
  static const String localizationModule = "LOCALIZATION_MODULE";
}

class EntityPlurals {
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

const String noResultSvg = 'assets/icons/svg/no_result.svg';
const String myChecklistSvg = 'assets/icons/svg/mychecklist.svg';

enum DigitProgressDialogType {
  inProgress,
  dataFound,
  success,
  failed,
  insufficientStorage,
  checkFailed,
  pendingSync,
}

class DownloadBeneficiary {
  String title;
  String projectId;
  String boundary;
  String boundaryName;
  int? pendingSyncCount;
  int? syncCount;
  int? totalCount;
  String? content;
  int? batchSize;
  String? primaryButtonLabel;
  String? secondaryButtonLabel;
  String? prefixLabel;
  String? suffixLabel;
  AppConfiguration? appConfiguartion;
  DownloadBeneficiary({
    required this.title,
    required this.projectId,
    required this.boundary,
    required this.boundaryName,
    this.appConfiguartion,
    this.pendingSyncCount,
    this.batchSize,
    this.syncCount,
    this.totalCount,
    this.content,
    this.primaryButtonLabel,
    this.secondaryButtonLabel,
    this.prefixLabel,
    this.suffixLabel,
  });
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
      default:
        return DataModelType.householdMember;
    }
  }
}
