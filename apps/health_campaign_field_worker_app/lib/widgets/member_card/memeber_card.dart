import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  final bool? isHead;
  final bool isDelivered;

  const MemberCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isHead,
    required this.isDelivered,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.background,
          width: 0.6,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    name,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      Container(
                        margin: DigitTheme.instance.containerMargin,
                        child: Text(
                          gender,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        " | ${age} years",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DigitIconButton(
              onPressed: () => DigitActionDialog.show(
                context,
                widget: ActionCard(
                  items: [
                    // ignore: no-empty-block
                    ActionCardModel(
                      Icons.edit,
                      "Assign as household head",
                      () {},
                    ),
                    ActionCardModel(
                      Icons.edit,
                      "Edit  Individual Details",
                      () {},
                    ),
                    ActionCardModel(
                      Icons.delete,
                      "Delete Individual",
                      () {},
                    ),
                  ],
                ),
              ),
              iconText: 'Edit',
              icon: Icons.edit,
            ),
          ],
        ),
        isDelivered
            ? DigitIconButton(
                icon: Icons.info_rounded,
                iconText: 'Not Delivered',
                iconTextColor: theme.errorColor,
                iconColor: theme.errorColor,
              )
            : DigitIconButton(
                icon: Icons.check_circle,
                iconText: 'Delivered',
                iconTextColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
                iconColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
              ),
        isDelivered
            ? DigitElevatedButton(
                onPressed: () {
                  print("");
                },
                child: const Center(
                  child: Text('Deliver Intervention'),
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DigitOutLineButton(
                  label: 'Update Delivery Details',
                  onPressed: () {},
                ),
              ),
      ]),
    );
  }
}
