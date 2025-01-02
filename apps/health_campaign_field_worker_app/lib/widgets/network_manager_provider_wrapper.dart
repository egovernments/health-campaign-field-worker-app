import 'dart:io';

import 'package:complaints/complaints.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:survey_form/survey_form.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/local_store/downsync/downsync.dart';
import '../data/network_manager.dart';
import '../data/repositories/local/custom_task.dart';
import '../data/repositories/oplog.dart';
import '../data/repositories/remote/auth.dart';
import '../data/repositories/remote/downsync.dart';
import '../models/downsync/downsync.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:complaints/complaints.dart';

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
      RepositoryProvider<LocalRepository<ProjectModel, ProjectSearchModel>>(
        create: (_) => ProjectLocalRepository(
          sql,
          ProjectOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectStaffModel, ProjectStaffSearchModel>>(
        create: (_) => ProjectStaffLocalRepository(
          sql,
          ProjectStaffOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>(
        create: (_) => ProjectFacilityLocalRepository(
          sql,
          ProjectFacilityOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<DownsyncModel, DownsyncSearchModel>>(
        create: (_) => DownsyncLocalRepository(
          sql,
          DownsyncOpLogManager(isar),
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

      // INFO Need to add packages here
      RepositoryProvider<
          LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(
        create: (_) => HouseholdMemberLocalRepository(
          sql,
          HouseholdMemberOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<HouseholdModel, HouseholdSearchModel>>(
        create: (_) => HouseholdLocalRepository(
          sql,
          HouseholdOpLogManager(isar),
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
      RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
        create: (_) => TaskLocalRepository(
          sql,
          TaskOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
        create: (_) => CustomTaskLocalRepository(
          sql,
          TaskOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<ReferralModel, ReferralSearchModel>>(
        create: (_) => ReferralLocalRepository(
          sql,
          ReferralOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<SideEffectModel, SideEffectSearchModel>>(
        create: (_) => SideEffectLocalRepository(
          sql,
          SideEffectOpLogManager(isar),
        ),
      ),
      RepositoryProvider<RegistrationDeliveryAddressRepo>(
        create: (_) => RegistrationDeliveryAddressRepo(
          sql,
          AddressOpLogManager(isar),
        ),
      ),
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
      RepositoryProvider<
          LocalRepository<ServiceDefinitionModel,
              ServiceDefinitionSearchModel>>(
        create: (_) => ServiceDefinitionLocalRepository(
          sql,
          ServiceDefinitionOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<ServiceModel, ServiceSearchModel>>(
        create: (_) => ServiceLocalRepository(
          sql,
          ServiceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(
        create: (_) => PgrServiceLocalRepository(
          sql,
          PgrServiceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<AttendanceRegisterModel,
              AttendanceRegisterSearchModel>>(
        create: (_) => AttendanceLocalRepository(
          sql,
          AttendanceOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>>(
        create: (_) => AttendanceLogsLocalRepository(
          sql,
          AttendanceLogOpLogManager(isar),
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

        if (value == DataModelType.user)
          RepositoryProvider<RemoteRepository<UserModel, UserSearchModel>>(
            create: (_) => UserRemoteRepository(
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
// INFO Need to add the packages here
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
            create: (_) => HouseholdMemberRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectBeneficiary)
          RepositoryProvider<
              RemoteRepository<ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>>(
            create: (_) => ProjectBeneficiaryRemoteRepository(
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
        if (value == DataModelType.sideEffect)
          RepositoryProvider<
              RemoteRepository<SideEffectModel, SideEffectSearchModel>>(
            create: (_) => SideEffectRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
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
        if (value == DataModelType.service)
          RepositoryProvider<
              RemoteRepository<ServiceModel, ServiceSearchModel>>(
            create: (_) => ServiceRemoteRepository(
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
        if (value == DataModelType.complaints)
          RepositoryProvider<
              RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(
            create: (_) => PgrServiceRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectFacility)
          RepositoryProvider<
              RemoteRepository<ProjectFacilityModel,
                  ProjectFacilitySearchModel>>(
            create: (_) => ProjectFacilityRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectStaff)
          RepositoryProvider<
              RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>>(
            create: (_) => ProjectStaffRemoteRepository(
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
        if (value == DataModelType.attendanceRegister)
          RepositoryProvider<
              RemoteRepository<AttendanceRegisterModel,
                  AttendanceRegisterSearchModel>>(
            create: (_) => AttendanceRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.attendance)
          RepositoryProvider<
              RemoteRepository<AttendanceLogModel, AttendanceLogSearchModel>>(
            create: (_) =>
                AttendanceLogRemoteRepository(dio, actionMap: actions),
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
