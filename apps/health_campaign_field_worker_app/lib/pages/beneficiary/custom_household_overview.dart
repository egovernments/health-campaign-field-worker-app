import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/registration_delivery_enums.dart';
import 'package:registration_delivery/models/entities/status.dart' as regStatus;
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/member_card/member_card.dart';
import 'package:survey_form/survey_form.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';

import '../../router/app_router.dart';

@RoutePage()
class CustomHouseholdOverviewPage extends LocalizedStatefulWidget {
  const CustomHouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<CustomHouseholdOverviewPage> createState() =>
      _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<CustomHouseholdOverviewPage> {
  @override
  void initState() {
    final bloc = context.read<HouseholdOverviewBloc>();
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: RegistrationDeliverySingleton().projectId!,
        projectBeneficiaryType:
            RegistrationDeliverySingleton().beneficiaryType!,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType!;

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<SearchBlocWrapper>()
            .searchHouseholdsBloc
            .add(const SearchHouseholdsClearEvent());
        context.router.maybePop();
      },
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : ScrollableContent(
                    header: BackNavigationHelpHeaderWidget(
                      handleback: () {
                        context
                            .read<SearchHouseholdsBloc>()
                            .add(const SearchHouseholdsEvent.clear());
                      },
                      showHelp: false,
                    ),
                    enableFixedButton: true,
                    footer: Offstage(
                      offstage: beneficiaryType == BeneficiaryType.individual ||
                          isOutsideProjectDateRange() ||
                          !context.isDistributor,
                      child: BlocBuilder<ServiceDefinitionBloc,
                          ServiceDefinitionState>(
                        builder: (context, serviceDefinitionState) =>
                            BlocBuilder<DeliverInterventionBloc,
                                DeliverInterventionState>(
                          builder: (ctx, deliverInterventionState) => DigitCard(
                            margin:
                                const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                            padding: const EdgeInsets.fromLTRB(
                                kPadding, 0, kPadding, 0),
                            child: state.householdMemberWrapper.tasks
                                        ?.lastOrNull?.status ==
                                    Status.administeredSuccess.toValue()
                                ? const Offstage()
                                : DigitElevatedButton(
                                    onPressed: (state.householdMemberWrapper
                                                        .projectBeneficiaries ??
                                                    [])
                                                .isEmpty ||
                                            state.householdMemberWrapper.tasks
                                                    ?.lastOrNull?.status ==
                                                Status.closeHousehold.toValue()
                                        ? null
                                        : () async {
                                            final bloc = ctx
                                                .read<HouseholdOverviewBloc>();

                                            final projectId =
                                                RegistrationDeliverySingleton()
                                                    .projectId!;

                                            bloc.add(
                                              HouseholdOverviewReloadEvent(
                                                projectId: projectId,
                                                projectBeneficiaryType:
                                                    beneficiaryType,
                                              ),
                                            );

                                            serviceDefinitionState.when(
                                                empty: () {},
                                                isloading: () {},
                                                serviceDefinitionFetch:
                                                    (value, model) {
                                                  if (value
                                                      .where((element) => element
                                                          .code
                                                          .toString()
                                                          .contains(
                                                              '${RegistrationDeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}'))
                                                      .toList()
                                                      .isEmpty) {
                                                    context.router.push(
                                                      DeliverInterventionRoute(),
                                                    );
                                                  } else {
                                                    navigateToChecklist(ctx);
                                                  }
                                                });
                                          },
                                    child: Center(
                                      child: Text(
                                        localizations.translate(
                                          i18.householdOverView
                                              .householdOverViewActionText,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: kPadding,
                                  right: kPadding,
                                ),
                                child: Text(
                                  localizations.translate(i18.householdOverView
                                      .householdOverViewLabel),
                                  style: theme.textTheme.displayMedium,
                                ),
                              ),
                              BlocBuilder<DeliverInterventionBloc,
                                  DeliverInterventionState>(
                                builder: (ctx, deliverInterventionState) =>
                                    Offstage(
                                  offstage: beneficiaryType ==
                                      BeneficiaryType.individual,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: DigitIconButton(
                                      icon: getStatusAttributes(state,
                                          deliverInterventionState)['icon'],
                                      iconText: localizations.translate(
                                        getStatusAttributes(state,
                                                deliverInterventionState)[
                                            'textLabel'],
                                      ), // [TODO: map task status accordingly based on projectBeneficiaries and tasks]
                                      iconTextColor: getStatusAttributes(state,
                                          deliverInterventionState)['color'],
                                      iconColor: getStatusAttributes(state,
                                          deliverInterventionState)['color'],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: kPadding,
                                  right: kPadding,
                                ),
                                child: BlocBuilder<DeliverInterventionBloc,
                                        DeliverInterventionState>(
                                    builder: (ctx, deliverInterventionState) {
                                  return Column(
                                    children: [
                                      DigitTableCard(
                                        element: {
                                          localizations.translate(i18
                                                  .householdOverView
                                                  .householdOverViewHouseholdHeadNameLabel):
                                              state
                                                      .householdMemberWrapper
                                                      .headOfHousehold
                                                      ?.name
                                                      ?.givenName ??
                                                  localizations.translate(
                                                      i18.common.coreCommonNA),
                                          localizations.translate(
                                            i18.householdLocation
                                                .administrationAreaFormLabel,
                                          ): localizations.translate(state
                                                  .householdMemberWrapper
                                                  .headOfHousehold
                                                  ?.address
                                                  ?.first
                                                  .locality
                                                  ?.code ??
                                              i18.common.coreCommonNA),
                                          localizations.translate(
                                            i18.deliverIntervention
                                                .memberCountText,
                                          ): state.householdMemberWrapper
                                              .household?.memberCount,
                                        },
                                      ),
                                    ],
                                  );
                                }),
                              ),

                              const SizedBox(
                                height: kPadding,
                              ),
                              // Center(
                              //   child: DigitIconButton(
                              //     buttonDisabled: (state.householdMemberWrapper
                              //                 .projectBeneficiaries ??
                              //             [])
                              //         .isEmpty,
                              //     onPressed: (state.householdMemberWrapper
                              //                     .projectBeneficiaries ??
                              //                 [])
                              //             .isEmpty
                              //         ? null
                              //         : () => addIndividual(
                              //               context,
                              //               state.householdMemberWrapper
                              //                   .household!,
                              //             ),
                              //     iconText: localizations.translate(
                              //       i18.householdOverView
                              //           .householdOverViewAddActionText,
                              //     ),
                              //     icon: Icons.add_circle,
                              //   ),
                              // ),
                              const SizedBox(
                                height: kPadding,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  addIndividual(BuildContext context, HouseholdModel household) async {
    final bloc = context.read<HouseholdOverviewBloc>();

    final address = household.address;

    if (address == null) return;
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: RegistrationDeliverySingleton().projectId!,
        projectBeneficiaryType:
            RegistrationDeliverySingleton().beneficiaryType!,
      ),
    );
    await context.router.push(
      BeneficiaryRegistrationWrapperRoute(
        initialState: BeneficiaryRegistrationAddMemberState(
          addressModel: address,
          householdModel: household,
        ),
        children: [
          IndividualDetailsRoute(),
        ],
      ),
    );
  }

// TODO : hardcoding to false , reverify is there is a need
  bool isOutsideProjectDateRange() {
    return false;
  }

  getStatusAttributes(HouseholdOverviewState state,
      DeliverInterventionState deliverInterventionState) {
    var textLabel =
        i18.householdOverView.householdOverViewNotRegisteredIconLabel;
    var color = DigitTheme.instance.colorScheme.error;
    var icon = Icons.info_rounded;

    if ((state.householdMemberWrapper.projectBeneficiaries ?? []).isNotEmpty) {
      textLabel = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? getTaskStatus(state.householdMemberWrapper.tasks ?? [])
              .toValue() //check
          : Status.registered.toValue();

      color = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberWrapper.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? DigitTheme.instance.colorScheme.onSurfaceVariant
              : DigitTheme.instance.colorScheme.error)
          : DigitTheme.instance.colorScheme.onSurfaceVariant;

      icon = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberWrapper.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? Icons.check_circle
              : Icons.info_rounded)
          : Icons.check_circle;
    } else {
      textLabel = i18.householdOverView.householdOverViewNotRegisteredIconLabel;
      color = DigitTheme.instance.colorScheme.error;
      icon = Icons.info_rounded;
    }

    return {'textLabel': textLabel, 'color': color, 'icon': icon};
  }

  void navigateToChecklist(BuildContext ctx) async {
    await context.router.push(BeneficiaryChecklistRoute());
  }
}
