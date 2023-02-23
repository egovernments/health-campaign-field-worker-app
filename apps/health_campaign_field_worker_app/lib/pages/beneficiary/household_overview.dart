import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_households.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';

class HouseholdOverviewPage extends LocalizedStatefulWidget {
  const HouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
      builder: (ctx, state) {
        return Scaffold(
          body: state.loading
              ? const Center(child: CircularProgressIndicator())
              : BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                  builder: (ctx, state) {
                    if (state.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ScrollableContent(
                      header: Column(children: const [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      children: [
                        DigitCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      localizations.translate(
                                        i18.householdOverView
                                            .householdOverViewLabel,
                                      ),
                                      style: theme.textTheme.displayMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  DigitIconButton(
                                    onPressed: () => DigitActionDialog.show(
                                      context,
                                      widget: ActionCard(
                                        items: [
                                          ActionCardModel(
                                            icon: Icons.edit,
                                            label: localizations.translate(
                                              i18.householdOverView
                                                  .householdOverViewEditLabel,
                                            ),
                                            action: () async {
                                              final bloc = context.read<
                                                  HouseholdOverviewBloc>();
                                              Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop();

                                              HouseholdMemberWrapper wrapper =
                                                  state.householdMemberWrapper;

                                              final timestamp = wrapper
                                                  .projectBeneficiary
                                                  .dateOfRegistration;
                                              final date = DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                timestamp,
                                              );

                                              final address =
                                                  wrapper.household.address;

                                              if (address == null) return;

                                              await context.router.root.push(
                                                BeneficiaryRegistrationWrapperRoute(
                                                  initialState:
                                                      BeneficiaryRegistrationEditHouseholdState(
                                                    addressModel: address,
                                                    individualModel:
                                                        wrapper.members,
                                                    householdModel:
                                                        wrapper.household,
                                                    registrationDate: date,
                                                  ),
                                                  children: [
                                                    HouseholdLocationRoute(),
                                                  ],
                                                ),
                                              );

                                              bloc.add(
                                                const HouseholdOverviewReloadEvent(),
                                              );
                                            },
                                          ),
                                          ActionCardModel(
                                            icon: Icons.delete,
                                            label: localizations.translate(i18
                                                .householdOverView
                                                .householdOverViewDeleteLabel),
                                            action: () => DigitDialog.show(
                                              context,
                                              options: DigitDialogOptions(
                                                titleText:
                                                    localizations.translate(i18
                                                        .householdOverView
                                                        .householdOverViewActionCardTitle),
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label: localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewPrimaryActionLabel),
                                                  action: (ctx) {
                                                    Navigator.of(
                                                      ctx,
                                                      rootNavigator: true,
                                                    )
                                                      ..pop()
                                                      ..pop();
                                                    context
                                                        .read<
                                                            HouseholdOverviewBloc>()
                                                        .add(
                                                          HouseholdOverviewDeleteHouseholdEvent(
                                                            householdModel: state
                                                                .householdMemberWrapper
                                                                .household,
                                                            members: state
                                                                .householdMemberWrapper
                                                                .members,
                                                            projectBeneficiaryModel: state
                                                                .householdMemberWrapper
                                                                .projectBeneficiary,
                                                          ),
                                                        );

                                                    (context.router.parent()
                                                            as StackRouter)
                                                        .pop();
                                                  },
                                                ),
                                                secondaryAction:
                                                    DigitDialogActions(
                                                  label: localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewSecondaryActionLabel),
                                                  action: (context) {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    iconText: localizations.translate(
                                      i18.householdOverView
                                          .householdOverViewEditIconText,
                                    ),
                                    icon: Icons.edit,
                                  ),
                                ],
                              ),
                              BlocBuilder<DeliverInterventionBloc,
                                  DeliverInterventionState>(
                                builder: (ctx, state) => Align(
                                  alignment: Alignment.centerLeft,
                                  child: DigitIconButton(
                                    icon: state.task?.status == 'delivered'
                                        ? Icons.check_circle
                                        : Icons.info_rounded,
                                    iconText: localizations.translate(
                                      state.task?.status == 'delivered'
                                          ? i18.householdOverView
                                              .householdOverViewDeliveredIconLabel
                                          : i18.householdOverView
                                              .householdOverViewNotDeliveredIconLabel,
                                    ),
                                    iconTextColor: state.task?.status ==
                                            'delivered'
                                        ? DigitTheme.instance.colorScheme
                                            .onSurfaceVariant
                                        : DigitTheme.instance.colorScheme.error,
                                    iconColor: state.task?.status == 'delivered'
                                        ? DigitTheme.instance.colorScheme
                                            .onSurfaceVariant
                                        : DigitTheme.instance.colorScheme.error,
                                  ),
                                ),
                              ),
                              DigitTableCard(
                                element: {
                                  localizations.translate(i18.householdOverView
                                          .householdOverViewHouseholdHeadNameLabel):
                                      state.householdMemberWrapper
                                          .headOfHousehold.name?.givenName,
                                  localizations.translate(
                                    i18.householdLocation
                                        .administrationAreaFormLabel,
                                  ): 'Solimbo',
                                  localizations.translate(
                                    i18.deliverIntervention.memberCountText,
                                  ): state.householdMemberWrapper.household
                                      .memberCount,
                                },
                              ),
                              Column(
                                children: state.householdMemberWrapper.members
                                    .map(
                                      (e) => MemberCard(
                                        editMemberAction: () async {
                                          final bloc =
                                              ctx.read<HouseholdOverviewBloc>();

                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();

                                          final wrapper =
                                              state.householdMemberWrapper;
                                          final address = e.address;
                                          if (address == null ||
                                              address.isEmpty) {
                                            return;
                                          }
                                          await context.router.root.push(
                                            BeneficiaryRegistrationWrapperRoute(
                                              initialState:
                                                  BeneficiaryRegistrationEditIndividualState(
                                                individualModel: e,
                                                addressModel: address.first,
                                              ),
                                              children: [
                                                IndividualDetailsRoute(
                                                  isHeadOfHousehold: false,
                                                ),
                                              ],
                                            ),
                                          );

                                          bloc.add(
                                            const HouseholdOverviewReloadEvent(),
                                          );
                                        },
                                        setAsHeadAction: () {
                                          ctx.read<HouseholdOverviewBloc>().add(
                                                HouseholdOverviewSetAsHeadEvent(
                                                  individualModel: e,
                                                  householdModel: state
                                                      .householdMemberWrapper
                                                      .household,
                                                ),
                                              );

                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                        },
                                        deleteMemberAction: () {
                                          DigitDialog.show(
                                            context,
                                            options: DigitDialogOptions(
                                              titleText: localizations.translate(i18
                                                  .householdOverView
                                                  .householdOverViewActionCardTitle),
                                              primaryAction: DigitDialogActions(
                                                label: localizations.translate(i18
                                                    .householdOverView
                                                    .householdOverViewPrimaryActionLabel),
                                                action: (ctx) {
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  )
                                                    ..pop()
                                                    ..pop();

                                                  context
                                                      .read<
                                                          HouseholdOverviewBloc>()
                                                      .add(
                                                        HouseholdOverviewDeleteIndividualEvent(
                                                          householdModel: state
                                                              .householdMemberWrapper
                                                              .household,
                                                          individualModel: e,
                                                        ),
                                                      );
                                                },
                                              ),
                                              secondaryAction:
                                                  DigitDialogActions(
                                                label: localizations.translate(i18
                                                    .householdOverView
                                                    .householdOverViewSecondaryActionLabel),
                                                action: (context) {
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pop();
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.name?.givenName ?? ' - ',
                                        age: (e.dateOfBirth == null
                                                ? null
                                                : DateFormat('dd/MM/yyyy')
                                                    .parse(e.dateOfBirth!)
                                                    .age) ??
                                            0,
                                        gender: e.gender?.name ?? ' - ',
                                        isDelivered: false,
                                        localizations: localizations,
                                      ),
                                    )
                                    .toList(),
                              ),
                              Center(
                                child: DigitIconButton(
                                  onPressed: () async {
                                    final bloc =
                                        context.read<HouseholdOverviewBloc>();

                                    final wrapper =
                                        state.householdMemberWrapper;
                                    final address = wrapper.household.address;

                                    if (address == null) return;

                                    await context.router.push(
                                      BeneficiaryRegistrationWrapperRoute(
                                        initialState:
                                            BeneficiaryRegistrationAddMemberState(
                                          addressModel: address,
                                          householdModel: wrapper.household,
                                        ),
                                        children: [
                                          IndividualDetailsRoute(),
                                        ],
                                      ),
                                    );

                                    bloc.add(
                                      const HouseholdOverviewReloadEvent(),
                                    );
                                  },
                                  iconText: localizations.translate(
                                    i18.householdOverView
                                        .householdOverViewAddActionText,
                                  ),
                                  icon: Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
          bottomNavigationBar: SizedBox(
            height: 90,
            child:
                BlocBuilder<DeliverInterventionBloc, DeliverInterventionState>(
              builder: (ctx, state) => DigitCard(
                child: state.task?.status == 'delivered'
                    ? DigitOutLineButton(
                        label: localizations.translate(
                          i18.memberCard.deliverDetailsUpdateLabel,
                        ),
                        onPressed: () async {
                          final bloc = ctx.read<DeliverInterventionBloc>();
                          await context.router.push(DeliverInterventionRoute());
                        },
                      )
                    : DigitElevatedButton(
                        onPressed: () async {
                          final bloc = ctx.read<HouseholdOverviewBloc>();
                          await context.router.push(DeliverInterventionRoute());

                          bloc.add(const HouseholdOverviewReloadEvent());
                        },
                        child: Center(
                          child: Text(
                            localizations.translate(
                              i18.householdOverView.householdOverViewActionText,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
