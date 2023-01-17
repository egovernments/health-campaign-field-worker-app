import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../router/app_router.dart';
import '../widgets/action_card/action_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/member_card/memeber_card.dart';

class HouseholdOverViewPage extends StatelessWidget {
  const HouseholdOverViewPage({super.key});

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
                    Text(
                      'HouseHold',
                      style: theme.textTheme.displayMedium,
                    ),
                    DigitIconButton(
                      onPressed: () => DigitActionDialog.show(
                        context,
                        widget: ActionCard(
                          items: [
                            // ignore: no-empty-block
                            ActionCardModel(
                              Icons.edit,
                              "Edit Household Details",
                              () {},
                            ),
                            ActionCardModel(
                              Icons.delete,
                              "Delete Household",
                              () => DigitDialog.show(
                                context,
                                title:
                                    "Do you want to delete this beneficiary?",
                                primaryActionLabel: "Delete",
                                primaryAction: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  context.router
                                      .push(const DeletionReasonRoute());
                                },
                                secondaryActionLabel: "Cancel",
                                secondaryAction: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      iconText: 'Edit HouseHold',
                      icon: Icons.edit,
                    ),
                  ],
                ),
                DigitIconButton(
                  icon: Icons.check_circle,
                  iconText: 'Delivered',
                  iconTextColor:
                      DigitTheme.instance.colorScheme.onSurfaceVariant,
                  iconColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
                ),
                const DigitTableCard(
                  element: {
                    "HouseholdHead": "Joseph Segio",
                    "Household Head Name": "Jose (H)",
                  },
                ),
                const MemberCard(
                  name: 'Joseph Sergio (H)',
                  age: 40,
                  gender: 'Male',
                  isDelivered: false,
                ),
                const MemberCard(
                  name: 'Maria',
                  age: 40,
                  gender: 'Female',
                  isDelivered: true,
                ),
                Center(
                  child: DigitIconButton(
                    onPressed: () {
                      print("");
                    },
                    iconText: 'Add Member',
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
            onPressed: () =>
                context.router.push(const DeliverInterventionRoute()),
            child: const Center(
              child: Text(
                "Deliver Intervention",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
