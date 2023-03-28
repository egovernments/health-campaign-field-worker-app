import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../blocs/localization/app_localization.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  final bool isHead;
  final bool isDelivered;
  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final AppLocalizations localizations;

  const MemberCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isHead = false,
    required this.localizations,
    required this.isDelivered,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.outline,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.all(8),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    name,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                    children: [
                      Container(
                        margin: DigitTheme.instance.containerMargin,
                        child: Text(
                          localizations.translate(gender),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          " | $age ${localizations.translate(i18.memberCard.deliverDetailsYearText)}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: DigitIconButton(
                      onPressed: () => DigitActionDialog.show(
                        context,
                        widget: ActionCard(
                          items: [
                            ActionCardModel(
                              icon: Icons.person,
                              label: localizations.translate(
                                i18.memberCard.assignAsHouseholdhead,
                              ),
                              action: isHead ? null : setAsHeadAction,
                            ),
                            ActionCardModel(
                              icon: Icons.edit,
                              label: localizations.translate(
                                i18.memberCard.editIndividualDetails,
                              ),
                              action: editMemberAction,
                            ),
                            ActionCardModel(
                              icon: Icons.delete,
                              label: localizations.translate(
                                i18.memberCard.deleteIndividualActionText,
                              ),
                              action: isHead ? null : deleteMemberAction,
                            ),
                          ],
                        ),
                      ),
                      iconText: localizations.translate(
                        i18.memberCard.editDetails,
                      ),
                      icon: Icons.edit,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        Offstage(
          offstage: true,
          child: !isDelivered
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: DigitIconButton(
                    icon: Icons.info_rounded,
                    iconText: localizations.translate(i18.householdOverView
                        .householdOverViewNotDeliveredIconLabel),
                    iconTextColor: theme.errorColor,
                    iconColor: theme.errorColor,
                  ),
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: DigitIconButton(
                    icon: Icons.check_circle,
                    iconText: localizations.translate(
                      i18.householdOverView.householdOverViewDeliveredIconLabel,
                    ),
                    iconTextColor:
                        DigitTheme.instance.colorScheme.onSurfaceVariant,
                    iconColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
                  ),
                ),
        ),
        Offstage(
          offstage: true,
          child: isDelivered
              ? DigitElevatedButton(
                  onPressed: () {
                    // TODO: Complete implementation
                  },
                  child: Center(
                    child: Text(
                      localizations.translate(
                        i18.memberCard.deliverInterventionSubmitLabel,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DigitOutLineButton(
                    label: localizations
                        .translate(i18.memberCard.deliverDetailsUpdateLabel),
                    onPressed: () {
                      // TODO: Complete implementation
                    },
                  ),
                ),
        ),
      ]),
    );
  }
}
