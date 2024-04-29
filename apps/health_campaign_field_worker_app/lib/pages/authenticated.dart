import 'dart:async';

import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:registration_delivery/blocs/household_details/household_details.dart';
import 'package:registration_delivery/blocs/search_households/proximity_search.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_by_head.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/blocs/search_households/tag_by_search.dart';
import 'package:registration_delivery/blocs/service/service.dart';
import 'package:registration_delivery/data/repositories/local/registration_delivery_address.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:digit_data_model/data_model.dart';

import '../blocs/boundary/boundary.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../blocs/sync/sync.dart';
import '../data/remote_client.dart';
import '../data/repositories/oplog/hcm_oplog.dart';
import '../data/repositories/remote/bandwidth_check.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../router/authenticated_route_observer.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/sidebar/side_bar.dart';

@RoutePage()
class AuthenticatedPageWrapper extends StatelessWidget {
  AuthenticatedPageWrapper({Key? key}) : super(key: key);

  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return ShowcaseWidget(
      enableAutoScroll: true,
      builder: Builder(
        builder: (context) {
          return StreamBuilder<bool>(
            stream: _drawerVisibilityController.stream,
            builder: (context, snapshot) {
              final showDrawer = snapshot.data ?? false;

              return Portal(
                child: Scaffold(
                  backgroundColor: DigitTheme.instance.colorScheme.background,
                  appBar: AppBar(
                    backgroundColor: DigitTheme.instance.colorScheme.primary,
                    actions: showDrawer
                        ? [
                            BlocBuilder<BoundaryBloc, BoundaryState>(
                              builder: (ctx, state) {
                                final selectedBoundary = ctx.boundaryOrNull;

                                if (selectedBoundary == null) {
                                  return const SizedBox.shrink();
                                } else {
                                  final boundaryName = selectedBoundary.name ??
                                      selectedBoundary.code ??
                                      AppLocalizations.of(context).translate(
                                        i18.projectSelection.onProjectMapped,
                                      );

                                  final theme = Theme.of(context);

                                  return GestureDetector(
                                    onTap: () {
                                      ctx.router.replaceAll([
                                        HomeRoute(),
                                        BoundarySelectionRoute(),
                                      ]);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          boundaryName,
                                          style: TextStyle(
                                            color: theme.colorScheme.surface,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down_outlined,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ]
                        : null,
                  ),
                  drawer: showDrawer ? const Drawer(child: SideBar()) : null,
                  body: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) {
                          final isar = context.read<Isar>();

                          return SearchHouseholdsBloc(
                            beneficiaryType: context.beneficiaryType,
                            userUid: context.loggedInUserUuid,
                            projectId: context.projectId,
                            addressRepository: RegistrationDeliveryAddressRepo(
                              context.read<LocalSqlDataStore>(),
                              AddressOpLogManager(isar),
                            ),
                            projectBeneficiary: context.repository<
                                ProjectBeneficiaryModel,
                                ProjectBeneficiarySearchModel>(),
                            householdMember: context.repository<
                                HouseholdMemberModel,
                                HouseholdMemberSearchModel>(),
                            household: context.repository<HouseholdModel,
                                HouseholdSearchModel>(),
                            individual: context.repository<IndividualModel,
                                IndividualSearchModel>(),
                            taskDataRepository: context
                                .repository<TaskModel, TaskSearchModel>(),
                            sideEffectDataRepository: context.repository<
                                SideEffectModel, SideEffectSearchModel>(),
                            referralDataRepository: context.repository<
                                ReferralModel, ReferralSearchModel>(),
                          );
                        },
                      ),
                      BlocProvider(
                        create: (context) {
                          final isar = context.read<Isar>();

                          return SearchByHeadBloc(
                            beneficiaryType: context.beneficiaryType,
                            userUid: context.loggedInUserUuid,
                            projectId: context.projectId,
                            addressRepository: RegistrationDeliveryAddressRepo(
                              context.read<LocalSqlDataStore>(),
                              AddressOpLogManager(isar),
                            ),
                            projectBeneficiary: context.repository<
                                ProjectBeneficiaryModel,
                                ProjectBeneficiarySearchModel>(),
                            householdMember: context.repository<
                                HouseholdMemberModel,
                                HouseholdMemberSearchModel>(),
                            household: context.repository<HouseholdModel,
                                HouseholdSearchModel>(),
                            individual: context.repository<IndividualModel,
                                IndividualSearchModel>(),
                            taskDataRepository: context
                                .repository<TaskModel, TaskSearchModel>(),
                            sideEffectDataRepository: context.repository<
                                SideEffectModel, SideEffectSearchModel>(),
                            referralDataRepository: context.repository<
                                ReferralModel, ReferralSearchModel>(),
                          );
                        },
                      ),
                      BlocProvider(
                        create: (context) {
                          final isar = context.read<Isar>();

                          return ProximitySearchBloc(
                            beneficiaryType: context.beneficiaryType,
                            userUid: context.loggedInUserUuid,
                            projectId: context.projectId,
                            addressRepository: RegistrationDeliveryAddressRepo(
                              context.read<LocalSqlDataStore>(),
                              AddressOpLogManager(isar),
                            ),
                            projectBeneficiary: context.repository<
                                ProjectBeneficiaryModel,
                                ProjectBeneficiarySearchModel>(),
                            householdMember: context.repository<
                                HouseholdMemberModel,
                                HouseholdMemberSearchModel>(),
                            household: context.repository<HouseholdModel,
                                HouseholdSearchModel>(),
                            individual: context.repository<IndividualModel,
                                IndividualSearchModel>(),
                            taskDataRepository: context
                                .repository<TaskModel, TaskSearchModel>(),
                            sideEffectDataRepository: context.repository<
                                SideEffectModel, SideEffectSearchModel>(),
                            referralDataRepository: context.repository<
                                ReferralModel, ReferralSearchModel>(),
                          );
                        },
                      ),
                      BlocProvider(
                        create: (context) {
                          final isar = context.read<Isar>();

                          return TagSearchBloc(
                            beneficiaryType: context.beneficiaryType,
                            userUid: context.loggedInUserUuid,
                            projectId: context.projectId,
                            addressRepository: RegistrationDeliveryAddressRepo(
                              context.read<LocalSqlDataStore>(),
                              AddressOpLogManager(isar),
                            ),
                            projectBeneficiary: context.repository<
                                ProjectBeneficiaryModel,
                                ProjectBeneficiarySearchModel>(),
                            householdMember: context.repository<
                                HouseholdMemberModel,
                                HouseholdMemberSearchModel>(),
                            household: context.repository<HouseholdModel,
                                HouseholdSearchModel>(),
                            individual: context.repository<IndividualModel,
                                IndividualSearchModel>(),
                            taskDataRepository: context
                                .repository<TaskModel, TaskSearchModel>(),
                            sideEffectDataRepository: context.repository<
                                SideEffectModel, SideEffectSearchModel>(),
                            referralDataRepository: context.repository<
                                ReferralModel, ReferralSearchModel>(),
                          );
                        },
                      ),
                      BlocProvider(
                        create: (context) {
                          return SearchBlocWrapper(
                            searchHouseholdsBloc:
                                context.read<SearchHouseholdsBloc>(),
                            searchByHeadBloc: context.read<SearchByHeadBloc>(),
                            proximitySearchBloc:
                                context.read<ProximitySearchBloc>(),
                            tagSearchBloc: context.read<TagSearchBloc>(),
                          );
                        },
                      ),
                      BlocProvider(
                        create: (context) {
                          final userId = context.loggedInUserUuid;

                          final isar = context.read<Isar>();
                          final bloc = SyncBloc(
                            isar: isar,
                            networkManager: context.read(),
                          );

                          if (!bloc.isClosed) {
                            bloc.add(SyncRefreshEvent(userId));
                          }
/* Every time when the user changes the screen
 this will refresh the data of sync count */
                          isar.opLogs
                              .filter()
                              .createdByEqualTo(userId)
                              .syncedUpEqualTo(false)
                              .watch()
                              .listen(
                            (event) {
                              if (!bloc.isClosed) {
                                bloc.add(
                                  SyncRefreshEvent(
                                    userId,
                                    event.where((element) {
                                      switch (element.entityType) {
                                        case DataModelType.household:
                                        case DataModelType.individual:
                                        case DataModelType.householdMember:
                                        case DataModelType.projectBeneficiary:
                                        case DataModelType.task:
                                        case DataModelType.stock:
                                        case DataModelType.stockReconciliation:
                                        case DataModelType.service:
                                        case DataModelType.complaints:
                                        case DataModelType.sideEffect:
                                        case DataModelType.referral:
                                        case DataModelType.hFReferral:
                                        case DataModelType.attendance:
                                          return true;
                                        default:
                                          return false;
                                      }
                                    }).length,
                                  ),
                                );
                              }
                            },
                          );

                          isar.opLogs
                              .filter()
                              .createdByEqualTo(userId)
                              .syncedUpEqualTo(true)
                              .syncedDownEqualTo(false)
                              .watch()
                              .listen(
                            (event) {
                              if (!bloc.isClosed) {
                                bloc.add(
                                  SyncRefreshEvent(
                                    userId,
                                    event.where((element) {
                                      switch (element.entityType) {
                                        case DataModelType.household:
                                        case DataModelType.householdMember:
                                        case DataModelType.individual:
                                        case DataModelType.projectBeneficiary:
                                        case DataModelType.task:
                                        case DataModelType.stock:
                                        case DataModelType.stockReconciliation:
                                        case DataModelType.complaints:
                                        case DataModelType.sideEffect:
                                        case DataModelType.referral:
                                        case DataModelType.hFReferral:
                                        case DataModelType.attendance:
                                          return true;
                                        default:
                                          return false;
                                      }
                                    }).length,
                                  ),
                                );
                              }
                            },
                          );

                          return bloc;
                        },
                      ),
                      BlocProvider(
                        create: (_) => LocationBloc(location: Location())
                          ..add(const LoadLocationEvent()),
                      ),
                      BlocProvider(
                        create: (_) =>
                            HouseholdDetailsBloc(const HouseholdDetailsState()),
                      ),
                      BlocProvider(
                        create: (ctx) => BeneficiaryDownSyncBloc(
                          bandwidthCheckRepository: BandwidthCheckRepository(
                            DioClient().dio,
                            bandwidthPath:
                                envConfig.variables.checkBandwidthApiPath,
                          ),
                          householdLocalRepository: ctx.read<
                              LocalRepository<HouseholdModel,
                                  HouseholdSearchModel>>(),
                          householdMemberLocalRepository: ctx.read<
                              LocalRepository<HouseholdMemberModel,
                                  HouseholdMemberSearchModel>>(),
                          individualLocalRepository: ctx.read<
                              LocalRepository<IndividualModel,
                                  IndividualSearchModel>>(),
                          projectBeneficiaryLocalRepository: ctx.read<
                              LocalRepository<ProjectBeneficiaryModel,
                                  ProjectBeneficiarySearchModel>>(),
                          taskLocalRepository: ctx.read<
                              LocalRepository<TaskModel, TaskSearchModel>>(),
                          sideEffectLocalRepository: ctx.read<
                              LocalRepository<SideEffectModel,
                                  SideEffectSearchModel>>(),
                          referralLocalRepository: ctx.read<
                              LocalRepository<ReferralModel,
                                  ReferralSearchModel>>(),
                          downSyncRemoteRepository: ctx.read<
                              RemoteRepository<DownsyncModel,
                                  DownsyncSearchModel>>(),
                          downSyncLocalRepository: ctx.read<
                              LocalRepository<DownsyncModel,
                                  DownsyncSearchModel>>(),
                          networkManager: ctx.read(),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => ServiceBloc(
                          const ServiceEmptyState(),
                          serviceDataRepository: context
                              .repository<ServiceModel, ServiceSearchModel>(),
                        ),
                      ),
                    ],
                    child: AutoRouter(
                      navigatorObservers: () => [
                        AuthenticatedRouteObserver(
                          onNavigated: () {
                            bool shouldShowDrawer;
                            switch (context.router.topRoute.name) {
                              case ProjectSelectionRoute.name:
                              case BoundarySelectionRoute.name:
                                shouldShowDrawer = false;
                                break;
                              default:
                                shouldShowDrawer = true;
                            }

                            _drawerVisibilityController.add(shouldShowDrawer);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
