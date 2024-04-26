import 'dart:io';

import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/oplog/oplog_entry.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/data/repositories/local/stock.dart';
import 'package:inventory_management/data/repositories/local/stock_reconciliation.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:registration_delivery/data/repositories/local/individual.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/network_manager.dart';
import '../data/repositories/local/downsync.dart';
import '../data/repositories/local/facility.dart';
import '../data/repositories/local/hcm_attendance.dart';
import '../data/repositories/local/hcm_hf_referral.dart';
import '../data/repositories/local/pgr_service.dart';
import '../data/repositories/local/product_variant.dart';
import '../data/repositories/local/project.dart';
import '../data/repositories/local/project_beneficiary.dart';
import '../data/repositories/local/project_facility.dart';
import '../data/repositories/local/project_resource.dart';
import '../data/repositories/local/project_staff.dart';
import '../data/repositories/local/service.dart';
import '../data/repositories/local/service_definition.dart';
import '../data/repositories/oplog/hcm_oplog.dart';
import '../data/repositories/remote/auth.dart';
import '../data/repositories/remote/boundary.dart';
import '../data/repositories/remote/downsync.dart';
import '../data/repositories/remote/facility.dart';
import '../data/repositories/remote/hcm_attendance.dart';
import '../data/repositories/remote/hcm_hf_referral.dart';
import '../data/repositories/remote/household.dart';
import '../data/repositories/remote/household_member.dart';
import '../data/repositories/remote/individual.dart';
import '../data/repositories/remote/pgr_service.dart';
import '../data/repositories/remote/product.dart';
import '../data/repositories/remote/product_variant.dart';
import '../data/repositories/remote/project.dart';
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
import '../data/repositories/remote/task.dart';
import '../data/repositories/remote/user.dart';
import '../data/repositories/local/attendance_logs.dart';
import '../data/repositories/remote/attendance_logs.dart';
import '../data/repositories/remote/stock.dart';
import '../data/repositories/remote/stock_reconciliation.dart';
import '../models/entities/facility.dart';
// import '../models/entities/hcm_attendance_log_model.dart';
// import '../models/entities/hcm_attendance_model.dart';
import '../models/entities/hcm_hf_referral.dart';
import '../models/entities/product.dart';
import '../models/entities/product_variant.dart';
import '../models/entities/project.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/project_facility.dart';
import '../models/entities/project_product_variant.dart';
import '../models/entities/project_resource.dart';
import '../models/entities/project_staff.dart';
import '../models/entities/project_type.dart';
import '../models/entities/service.dart';
import '../models/entities/service_definition.dart';
import '../models/entities/user.dart';

class NetworkManagerProviderWrapper extends StatelessWidget {
  final LocalSqlDataStore sql;
  final Dio dio;
  final Widget child;
  final Isar isar;

  final NetworkManagerConfiguration configuration;

  const NetworkManagerProviderWrapper({
    super.key,
    required this.configuration,
    required this.isar,
    required this.dio,
    required this.sql,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, state) {
        final actionMap = state.entityActionMapping;
        if (actionMap.isEmpty) {
          return MaterialApp(
            theme: DigitTheme.instance.mobileTheme,
            home: Scaffold(
              appBar: AppBar(),
              body: state.maybeWhen(
                orElse: () => const Center(
                  child: Text('Unable to initialize the application'),
                ),
                /*Returns Loading state while app initialization is in progress*/
                loading: () => const Center(
                  child: Text('Loading'),
                ),
                /*Returns No Internet Connection warning if its failed to initialize after all retries
                  and shows a button to close the app*/
                failed: () => ScrollableContent(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  footer: DigitCard(
                    child: DigitElevatedButton(
                      onPressed: () => exit(0),
                      child: const Center(
                        child: Text('Close'),
                      ),
                    ),
                  ),
                  children: const [
                    Center(
                      child: Text('Internet not available. Try later.'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        final remote = _getRemoteRepositories(dio, actionMap);
        final local = _getLocalRepositories(sql, isar);

        return MultiRepositoryProvider(
          providers: [
            ...local,
            ...remote,
          ],
          child: Provider(
            create: (ctx) => NetworkManager(configuration: configuration),
            child: child,
          ),
        );
      },
    );
  }

  List<RepositoryProvider> _getLocalRepositories(
    LocalSqlDataStore sql,
    Isar isar,
  ) {
    return [
      RepositoryProvider<
          LocalRepository<IndividualModel, IndividualSearchModel>>(
        create: (_) => IndividualLocalRepository(
          sql,
          IndividualOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<FacilityModel, FacilitySearchModel>>(
        create: (_) => FacilityLocalRepository(
          sql,
          FacilityOpLogManager(isar),
        ),
      ),
      // RepositoryProvider<
      //     LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(
      //   create: (_) => HouseholdMemberLocalRepository(
      //     sql,
      //     HouseholdMemberOpLogManager(isar),
      //   ),
      // ),
      // RepositoryProvider<LocalRepository<HouseholdModel, HouseholdSearchModel>>(
      //   create: (_) => HouseholdLocalRepository(
      //     sql,
      //     HouseholdOpLogManager(isar),
      //   ),
      // ),
      RepositoryProvider<LocalRepository<ProjectModel, ProjectSearchModel>>(
        create: (_) => ProjectLocalRepository(
          sql,
          ProjectOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectBeneficiaryModel,
              ProjectBeneficiarySearchModel>>(
        create: (_) => ProjectBeneficiaryLocalRepository(
          sql,
          ProjectBeneficiaryOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>(
        create: (_) => ProjectFacilityLocalRepository(
          sql,
          ProjectFacilityOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectStaffModel, ProjectStaffSearchModel>>(
        create: (_) => ProjectStaffLocalRepository(
          sql,
          ProjectStaffOpLogManager(isar),
        ),
      ),
      // RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
      //   create: (_) => TaskLocalRepository(
      //     sql,
      //     TaskOpLogManager(isar),
      //   ),
      // ),
      // RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
      //   create: (_) => TaskLocalRepository(
      //     sql,
      //     TaskOpLogManager(isar),
      //   ),
      // ),
      // RepositoryProvider<LocalRepository<ReferralModel, ReferralSearchModel>>(
      //   create: (_) => ReferralLocalRepository(
      //     sql,
      //     ReferralOpLogManager(isar),
      //   ),
      // ),
      // RepositoryProvider<
      //     LocalRepository<SideEffectModel, SideEffectSearchModel>>(
      //   create: (_) => SideEffectLocalRepository(
      //     sql,
      //     SideEffectOpLogManager(isar),
      //   ),
      // ),
      RepositoryProvider<
          LocalRepository<ServiceDefinitionModel,
              ServiceDefinitionSearchModel>>(
        create: (_) => ServiceDefinitionLocalRepository(
          sql,
          ServiceDefinitionOpLogManager(
            isar,
          ),
        ),
      ),
      RepositoryProvider<LocalRepository<ServiceModel, ServiceSearchModel>>(
        create: (_) => ServiceLocalRepository(
          sql,
          ServiceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>>(
        create: (_) => ProjectResourceLocalRepository(
          sql,
          ProjectResourceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProductVariantModel, ProductVariantSearchModel>>(
        create: (_) => ProductVariantLocalRepository(
          sql,
          ProductVariantOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<BoundaryModel, BoundarySearchModel>>(
        create: (_) => BoundaryLocalRepository(
          sql,
          BoundaryOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(
        create: (_) => PgrServiceLocalRepository(
          sql,
          PgrServiceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<DownsyncModel, DownsyncSearchModel>>(
        create: (_) => DownsyncLocalRepository(
          sql,
          DownsyncOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<HcmHFReferralModel, HcmHFReferralSearchModel>>(
        create: (_) => HFReferralLocalRepository(
          sql,
          HFReferralOpLogManager(isar),
        ),
      ),
      // RepositoryProvider<
      //     LocalRepository<HCMAttendanceRegisterModel,
      //         HCMAttendanceSearchModel>>(
      //   create: (_) => AttendanceLocalRepository(
      //       sql, AttendanceOpLogManager(isar), hcmSqlStore),
      // ),
      // RepositoryProvider<
      //     LocalRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>>(
      //   create: (_) => AttendanceLogsLocalRepository(
      //       sql, AttendanceLogOpLogManager(isar), hcmSqlStore),
      // ),
      RepositoryProvider<LocalRepository<StockModel, StockSearchModel>>(
        create: (_) => StockLocalRepository(
          sql,
          StockOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<StockReconciliationModel,
              StockReconciliationSearchModel>>(
        create: (_) => StockReconciliationLocalRepository(
          sql,
          StockReconciliationOpLogManager(isar),
        ),
      ),
    ];
  }

  List<RepositoryProvider> _getRemoteRepositories(
    Dio dio,
    Map<DataModelType, Map<ApiOperation, String>> actionMap,
  ) {
    final remoteRepositories = <RepositoryProvider>[];
    for (final value in DataModelType.values) {
      if (!actionMap.containsKey(value)) {
        continue;
      }

      final actions = actionMap[value]!;

      remoteRepositories.addAll([
        if (value == DataModelType.user)
          RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepository(
              dio,
              loginPath: actions[ApiOperation.login] ?? '',
            ),
          ),
        if (value == DataModelType.facility)
          RepositoryProvider<
              RemoteRepository<FacilityModel, FacilitySearchModel>>(
            create: (_) => FacilityRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.household)
          RepositoryProvider<
              RemoteRepository<HouseholdModel, HouseholdSearchModel>>(
            create: (_) => HouseholdRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.householdMember)
          RepositoryProvider<
              RemoteRepository<HouseholdMemberModel,
                  HouseholdMemberSearchModel>>(
            create: (_) =>
                HouseholdMemberRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.individual)
          RepositoryProvider<
              RemoteRepository<IndividualModel, IndividualSearchModel>>(
            create: (_) => IndividualRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.product)
          RepositoryProvider<
              RemoteRepository<ProductModel, ProductSearchModel>>(
            create: (_) => ProductRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.productVariant)
          RepositoryProvider<
              RemoteRepository<ProductVariantModel, ProductVariantSearchModel>>(
            create: (_) =>
                ProductVariantRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.project)
          RepositoryProvider<
              RemoteRepository<ProjectModel, ProjectSearchModel>>(
            create: (_) => ProjectRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectBeneficiary)
          RepositoryProvider<
              RemoteRepository<ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>>(
            create: (_) =>
                ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectFacility)
          RepositoryProvider<
              RemoteRepository<ProjectFacilityModel,
                  ProjectFacilitySearchModel>>(
            create: (_) =>
                ProjectFacilityRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectProductVariant)
          RepositoryProvider<
              RemoteRepository<ProjectProductVariantModel,
                  ProjectProductVariantSearchModel>>(
            create: (_) =>
                ProjectProductVariantRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectStaff)
          RepositoryProvider<
              RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>>(
            create: (_) =>
                ProjectStaffRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectResource)
          RepositoryProvider<
              RemoteRepository<ProjectResourceModel,
                  ProjectResourceSearchModel>>(
            create: (_) =>
                ProjectResourceRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectType)
          RepositoryProvider<
              RemoteRepository<ProjectTypeModel, ProjectTypeSearchModel>>(
            create: (_) => ProjectTypeRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.stock)
          RepositoryProvider<RemoteRepository<StockModel, StockSearchModel>>(
            create: (_) => StockRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.task)
          RepositoryProvider<RemoteRepository<TaskModel, TaskSearchModel>>(
            create: (_) => TaskRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.referral)
          RepositoryProvider<
              RemoteRepository<ReferralModel, ReferralSearchModel>>(
            create: (_) => ReferralRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.service)
          RepositoryProvider<
              RemoteRepository<ServiceModel, ServiceSearchModel>>(
            create: (_) => ServiceRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectResource)
          RepositoryProvider<
              RemoteRepository<ProjectResourceModel,
                  ProjectResourceSearchModel>>(
            create: (_) => ProjectResourceRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.serviceDefinition)
          RepositoryProvider<
              RemoteRepository<ServiceDefinitionModel,
                  ServiceDefinitionSearchModel>>(
            create: (_) => ServiceDefinitionRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.boundary)
          RepositoryProvider<
              RemoteRepository<BoundaryModel, BoundarySearchModel>>(
            create: (_) => BoundaryRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.productVariant)
          RepositoryProvider<
              RemoteRepository<ProductVariantModel, ProductVariantSearchModel>>(
            create: (_) => ProductVariantRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.complaints)
          RepositoryProvider<
              RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(
            create: (_) => PgrServiceRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.user)
          RepositoryProvider<RemoteRepository<UserModel, UserSearchModel>>(
            create: (_) => UserRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.sideEffect)
          RepositoryProvider<
              RemoteRepository<SideEffectModel, SideEffectSearchModel>>(
            create: (_) => SideEffectRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.downsync)
          RepositoryProvider<
              RemoteRepository<DownsyncModel, DownsyncSearchModel>>(
            create: (_) => DownsyncRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.hFReferral)
          RepositoryProvider<
              RemoteRepository<HcmHFReferralModel, HcmHFReferralSearchModel>>(
            create: (_) => HFReferralRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        // if (value == DataModelType.attendanceRegister)
        //   RepositoryProvider<
        //       RemoteRepository<HCMAttendanceRegisterModel,
        //           HCMAttendanceSearchModel>>(
        //     create: (_) => AttendanceRemoteRepository(dio, actionMap: actions),
        //   ),
        // if (value == DataModelType.attendance)
        //   RepositoryProvider<
        //       RemoteRepository<HCMAttendanceLogModel,
        //           HCMAttendanceLogSearchModel>>(
        //     create: (_) =>
        //         AttendanceLogRemoteRepository(dio, actionMap: actions),
        //   ),
        if (value == DataModelType.stock)
          RepositoryProvider<RemoteRepository<StockModel, StockSearchModel>>(
            create: (_) => StockRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.stockReconciliation)
          RepositoryProvider<
              RemoteRepository<StockReconciliationModel,
                  StockReconciliationSearchModel>>(
            create: (_) =>
                StockReconciliationRemoteRepository(dio, actionMap: actions),
          ),
      ]);
    }

    return remoteRepositories;
  }
}

class ActionPathModel {
  final DataModelType type;
  final String path;
  final ApiOperation operation;

  const ActionPathModel({
    required this.operation,
    required this.type,
    required this.path,
  });
}
