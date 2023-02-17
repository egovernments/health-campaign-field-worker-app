import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/household_overview/household_overview.dart';
import '../blocs/search_households/search_households.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/action_card/action_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/member_card/member_card.dart';

class HouseholdOverviewPage extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMemberWrapper;

  const HouseholdOverviewPage({
    super.key,
    super.appLocalizations,
    required this.householdMemberWrapper,
  });

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
  late HouseholdMemberWrapper householdMemberWrapper;

  @override
  void initState() {
    householdMemberWrapper = widget.householdMemberWrapper;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HouseholdOverviewPage oldWidget) {
    householdMemberWrapper = widget.householdMemberWrapper;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        bloc: HouseholdOverviewBloc(
          HouseholdOverviewState(
            householdMemberWrapper: householdMemberWrapper,
          ),
          projectBeneficiaryRepository: context.read(),
          householdMemberRepository: context.read(),
          householdRepository: context.read(),
          individualRepository: context.read(),
        ),
        builder: (context, state) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            localizations.translate(
                              i18.householdOverView.householdOverViewLabel,
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
                                  action: () {
                                    context.router.push(
                                      BeneficiaryRegistrationWrapperRoute(
                                        isEditing: true,
                                        householdMemberWrapper:
                                            householdMemberWrapper,
                                        children: [
                                          HouseholdLocationRoute(),
                                        ],
                                      ),
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
                                      titleText: localizations.translate(i18
                                          .householdOverView
                                          .householdOverViewActionCardTitle),
                                      primaryAction: DigitDialogActions(
                                        label: localizations.translate(i18
                                            .householdOverView
                                            .householdOverViewPrimaryActionLabel),
                                        action: (context) {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                        },
                                      ),
                                      secondaryAction: DigitDialogActions(
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
                            i18.householdOverView.householdOverViewEditIconText,
                          ),
                          icon: Icons.edit,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DigitIconButton(
                        icon: Icons.check_circle,
                        iconText: localizations.translate(
                          i18.householdOverView
                              .householdOverViewDeliveredIconLabel,
                        ),
                        iconTextColor:
                            DigitTheme.instance.colorScheme.onSurfaceVariant,
                        iconColor:
                            DigitTheme.instance.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    DigitTableCard(
                      element: {
                        localizations.translate(i18.householdOverView
                                .householdOverViewHouseholdHeadNameLabel):
                            householdMemberWrapper
                                .headOfHousehold.name?.givenName,
                        localizations.translate(
                          i18.householdLocation.administrationAreaFormLabel,
                        ): 'Solimbo',
                        localizations.translate(
                          i18.deliverIntervention.memberCountText,
                        ): householdMemberWrapper.members.length,
                      },
                    ),
                    Column(
                      children: householdMemberWrapper.members
                          .map(
                            (e) => MemberCard(
                              name: e.name?.givenName ?? ' - ',
                              age: (e.dateOfBirth == null
                                      ? null
                                      : int.tryParse((DateTime.now()
                                                  .difference(
                                                    DateFormat(
                                                      'dd/MM/yyyy',
                                                    ).parse(e.dateOfBirth!),
                                                  )
                                                  .inDays /
                                              365)
                                          .round()
                                          .toStringAsFixed(0))) ??
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
                        onPressed: () {
                          context.router.push(
                            BeneficiaryRegistrationWrapperRoute(
                              householdMemberWrapper:
                                  householdMemberWrapper.copyWith(
                                members: [],
                                headOfHousehold: IndividualModel(
                                  clientReferenceId: IdGen.i.identifier,
                                  tenantId: envConfig.variables.tenantId,
                                  rowVersion: 1,
                                ),
                              ),
                              isEditing: true,
                              children: [
                                IndividualDetailsRoute(),
                              ],
                            ),
                          );
                        },
                        iconText: localizations.translate(
                          i18.householdOverView.householdOverViewAddActionText,
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
        child: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => context.router.push(
              DeliverInterventionRoute(
                householdMemberWrapper: householdMemberWrapper,
              ),
            ),
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
    );
  }
}
