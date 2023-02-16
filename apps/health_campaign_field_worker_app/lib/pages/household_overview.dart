import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/selected_households/selected_households.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/action_card/action_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/member_card/member_card.dart';
import 'beneficiary_registration/individual_details.dart';

class HouseholdOverViewPage extends LocalizedStatefulWidget {
  const HouseholdOverViewPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseholdOverViewPage> createState() => _HouseholdOverViewPageState();
}

class _HouseholdOverViewPageState
    extends LocalizedState<HouseholdOverViewPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocBuilder<SelectedHouseHoldsBloc, SelectedHouseHoldsState>(
            builder: (context, state) {
              print(
                state.individual?.name?.givenName,
              );

              return DigitCard(
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
                                    // TODO: Complete implementation
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
                            state.individual?.name?.givenName,
                        localizations.translate(
                          i18.householdLocation.administrationAreaFormLabel,
                        ): 'Solimbo',
                        localizations.translate(
                          i18.deliverIntervention.memberCountText,
                        ): state.household?.memberCount,
                      },
                    ),
                    Column(
                      children: state.householdMembers!
                          .map(
                            (ele) => MemberCard(
                              name: ele.name!.givenName!.toString(),
                              age: int.parse((DateTime.now()
                                          .difference(DateTime.parse(
                                            ele.dateOfBirth!,
                                          ))
                                          .inDays /
                                      365)
                                  .round()
                                  .toStringAsFixed(0)),
                              gender: ele.gender!.name,
                              isDelivered: false,
                              localizations: localizations,
                            ),
                          )
                          .toList(),
                    ),
                    Center(
                      child: DigitIconButton(
                        onPressed: () {
                          /// TODO - change to auto route
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const IndividualDetailsPage(),
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
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => context.router.push(DeliverInterventionRoute()),
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
