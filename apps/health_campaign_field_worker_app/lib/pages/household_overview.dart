import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../router/app_router.dart';
import '../widgets/action_card/action_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/member_card/member_card.dart';

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
          DigitCard(
            child: Column(
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
                            // ignore: no-empty-block
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
                              label: i18.householdOverView
                                  .householdOverViewDeleteLabel,
                              action: () => DigitDialog.show(
                                context,
                                title: localizations.translate(i18
                                    .householdOverView
                                    .householdOverViewActionCardTitle),
                                primaryActionLabel: localizations.translate(i18
                                    .householdOverView
                                    .householdOverViewPrimaryActionLabel),
                                primaryAction: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                secondaryActionLabel: localizations.translate(
                                  i18.householdOverView
                                      .householdOverViewSecondaryActionLabel,
                                ),
                                secondaryAction: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(),
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
                DigitIconButton(
                  icon: Icons.check_circle,
                  iconText: localizations.translate(
                    i18.householdOverView.householdOverViewDeliveredIconLabel,
                  ),
                  iconTextColor:
                      DigitTheme.instance.colorScheme.onSurfaceVariant,
                  iconColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
                ),
                DigitTableCard(
                  element: {
                    localizations.translate(i18.householdOverView
                        .householdOverViewHouseholdHeadLabel): "Joseph Sergio",
                    localizations.translate(i18.householdOverView
                        .householdOverViewHouseholdHeadNameLabel): "Jose (H)",
                  },
                ),
                MemberCard(
                  name: 'Joseph Sergio (H)',
                  age: 40,
                  gender: 'Male',
                  isDelivered: false,
                  localizations: localizations,
                ),
                MemberCard(
                  name: 'Maria',
                  age: 40,
                  gender: 'Female',
                  isDelivered: true,
                  localizations: localizations,
                ),
                Center(
                  child: DigitIconButton(
                    onPressed: () {
                      // TODO: Complete implementation
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
