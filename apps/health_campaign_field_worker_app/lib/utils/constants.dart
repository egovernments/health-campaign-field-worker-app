import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/utils/utils.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:referral_reconciliation/utils/utils.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/localization.dart';
import '../data/local_store/no_sql/schema/project_types.dart';
import '../data/local_store/no_sql/schema/row_versions.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import 'environment_config.dart';

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
    await initializeAllMappers();
    setInitialDataOfPackages();
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

  static List<LocalRepository> getLocalRepositories(
    LocalSqlDataStore sql,
    Isar isar,
  ) {
    return [
      FacilityLocalRepository(sql, FacilityOpLogManager(isar)),
      ProjectLocalRepository(sql, ProjectOpLogManager(isar)),
      ProjectStaffLocalRepository(sql, ProjectStaffOpLogManager(isar)),
      IndividualLocalRepository(sql, IndividualOpLogManager(isar)),
      HouseholdMemberLocalRepository(sql, HouseholdMemberOpLogManager(isar)),
      HouseholdLocalRepository(sql, HouseholdOpLogManager(isar)),
      StockLocalRepository(sql, StockOpLogManager(isar)),
      StockReconciliationLocalRepository(
        sql,
        StockReconciliationOpLogManager(isar),
      ),
      ProjectBeneficiaryLocalRepository(
        sql,
        ProjectBeneficiaryOpLogManager(
          isar,
        ),
      ),
      ProjectFacilityLocalRepository(sql, ProjectFacilityOpLogManager(isar)),
      TaskLocalRepository(sql, TaskOpLogManager(isar)),
      SideEffectLocalRepository(sql, SideEffectOpLogManager(isar)),
      ReferralLocalRepository(sql, ReferralOpLogManager(isar)),
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
      AttendanceLocalRepository(
        sql,
        AttendanceOpLogManager(isar),
      ),
      AttendanceLogsLocalRepository(
        sql,
        AttendanceLogOpLogManager(isar),
      ),
      HFReferralLocalRepository(
        sql,
        HFReferralOpLogManager(isar),
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
        if (value == DataModelType.projectStaff)
          ProjectStaffRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectProductVariant)
          ProjectProductVariantRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectFacility)
          ProjectFacilityRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.individual)
          IndividualRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.stock)
          StockRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.stockReconciliation)
          StockReconciliationRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.household)
          HouseholdRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectBeneficiary)
          ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.task)
          TaskRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.householdMember)
          HouseholdMemberRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.sideEffect)
          SideEffectRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.referral)
          ReferralRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.downsync)
          DownsyncRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.attendanceRegister)
          AttendanceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.attendance)
          AttendanceLogRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.hFReferral)
          HFReferralRemoteRepository(dio, actionMap: actions),
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

  void setInitialDataOfPackages() {
    DigitDataModelSingleton().setData(
        syncDownRetryCount: envConfig.variables.syncDownRetryCount,
        retryTimeInterval: envConfig.variables.retryTimeInterval,
        tenantId: envConfig.variables.tenantId,
        errorDumpApiPath: envConfig.variables.dumpErrorApiPath);
    RegistrationDeliverySingleton().setTenantId(envConfig.variables.tenantId);
    AttendanceSingleton().setTenantId(envConfig.variables.tenantId);
    ReferralReconSingleton().setTenantId(envConfig.variables.tenantId);
  }
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
