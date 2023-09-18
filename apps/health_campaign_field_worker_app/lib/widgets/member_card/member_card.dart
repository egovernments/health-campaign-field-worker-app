import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/localization/app_localization.dart';
import '../../models/entities/beneficiary_type.dart';
import '../../models/entities/individual.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String gender;
  final int years;
  final int months;
  final bool isHead;
  final IndividualModel individual;
  final bool isDelivered;
  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final AppLocalizations localizations;

  const MemberCard({
    super.key,
    required this.individual,
    required this.name,
    required this.gender,
    required this.years,
    this.isHead = false,
    this.months = 0,
    required this.localizations,
    required this.isDelivered,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = context.beneficiaryType;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    name,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                child: Align(
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
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
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
                    " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual,
            child: !isDelivered
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: DigitIconButton(
                      icon: Icons.info_rounded,
                      iconText: localizations.translate(
                        i18.householdOverView
                            .householdOverViewNotDeliveredIconLabel,
                      ),
                      iconTextColor: theme.colorScheme.error,
                      iconColor: theme.colorScheme.error,
                    ),
                  )
                : Align(
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
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual,
            child: !isDelivered
                ? DigitElevatedButton(
                    onPressed: () async {
                      context.read<HouseholdOverviewBloc>().add(
                            HouseholdOverviewEvent.selectedIndividual(
                              individualModel: individual,
                            ),
                          );
                      await context.router.push(BeneficiaryDetailsRoute());
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(
                          i18.householdOverView.householdOverViewActionText,
                        ),
                      ),
                    ),
                  )
                : BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                    builder: (ctx, state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DigitOutLineButton(
                          label: localizations.translate(
                            i18.memberCard.deliverDetailsUpdateLabel,
                          ),
                          onPressed: () async {
                            context.read<HouseholdOverviewBloc>().add(
                                  HouseholdOverviewEvent.selectedIndividual(
                                    individualModel: individual,
                                  ),
                                );
                            await context.router
                                .push(BeneficiaryDetailsRoute());
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
