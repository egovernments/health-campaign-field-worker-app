import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;

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
                      onPressed: () => DigitDialog.show(
                        context,
                        title: i18.forgotPassword.labelText,
                        content: i18.forgotPassword.contentText,
                        primaryActionLabel:
                            i18.forgotPassword.primaryActionLabel,
                        primaryAction: () => Navigator.pop(context),
                      ),
                      iconText: 'Edit HouseHold',
                      icon: Icons.edit,
                    ),
                  ],
                ),
                const DigitTableCard(
                  element: {
                    "HouseholdHead": "Joseph Segio",
                    "Administrative Area": "Solimbo",
                    "Member Count": 4,
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
            onPressed: null,
            child: Center(
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
