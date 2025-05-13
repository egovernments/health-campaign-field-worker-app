import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/household_overview/household_overview.dart';
import 'package:registration/router/registration_delivery_router.gm.dart';
import 'package:survey_form/blocs/service_definition.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../blocs/app_localization.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../utils/utils.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String? gender;
  final int? years;
  final int? months;
  final bool isHead;
  final IndividualModel individual;
  final List<ProjectBeneficiaryModel>? projectBeneficiaries;

  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final RegistrationDeliveryLocalization localizations;

  final String? projectBeneficiaryClientReferenceId;

  const MemberCard({
    super.key,
    required this.individual,
    required this.name,
    this.gender,
    this.years,
    this.isHead = false,
    this.months,
    required this.localizations,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
    this.projectBeneficiaries,
    this.projectBeneficiaryClientReferenceId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType;
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(
        margin: const EdgeInsets.only(bottom: spacer2),
        cardType: CardType.secondary,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Padding(
                            padding: const EdgeInsets.all(spacer2),
                            child: Text(
                              name,
                              style: textTheme.headingM,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: DigitButton(
                          isDisabled: (projectBeneficiaries ?? []).isEmpty,
                          onPressed: () => showDialog(
                            context: context,
                            builder: (ctx) => DigitActionCard(
                              onOutsideTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              actions: [
                                DigitButton(
                                  prefixIcon: Icons.person,
                                  label: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? localizations.translate(
                                          i18.memberCard.assignAsClfhead)
                                      : localizations.translate(
                                          i18.memberCard.assignAsHouseholdhead,
                                        ),
                                  isDisabled: isHead ? true : false,
                                  onPressed: setAsHeadAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                                DigitButton(
                                  prefixIcon: Icons.edit,
                                  label: localizations.translate(
                                    i18.memberCard.editIndividualDetails,
                                  ),
                                  onPressed: editMemberAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                                DigitButton(
                                  prefixIcon: Icons.delete,
                                  label: localizations.translate(
                                    i18.memberCard.deleteIndividualActionText,
                                  ),
                                  isDisabled: isHead ? true : false,
                                  onPressed: deleteMemberAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                              ],
                            ),
                          ),
                          label: localizations.translate(
                            i18.memberCard.editDetails,
                          ),
                          prefixIcon: Icons.edit,
                          type: DigitButtonType.tertiary,
                          size: DigitButtonSize.medium,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(spacer2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        gender != null
                            ? localizations.translate(
                                'CORE_COMMON_${gender?.toUpperCase()}')
                            : ' -- ',
                        style: textTheme.bodyS,
                      ),
                      Expanded(
                        child: Text(
                          years != null && months != null
                              ? " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}"
                              : "|   --",
                          style: textTheme.bodyS,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: spacer1, bottom: spacer2),
                  child: Offstage(
                    offstage: beneficiaryType != BeneficiaryType.individual,
                  ),
                ),
                Offstage(
                  offstage: beneficiaryType != BeneficiaryType.individual,
                  child: Padding(
                    padding: const EdgeInsets.all(spacer1),
                    child: Column(
                      children: [
                        DigitButton(
                            mainAxisSize: MainAxisSize.max,
                            isDisabled: (projectBeneficiaries ?? []).isEmpty
                                ? true
                                : false,
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.medium,
                            label: localizations.translate(
                              i18.beneficiaryDetails
                                  .beneficiarysDetailsLabelText,
                            ),
                            onPressed: () {
                              final bloc =
                                  context.read<HouseholdOverviewBloc>();
                              final serviceDefinitionBloc =
                                  context.read<ServiceDefinitionBloc>().state;

                              bloc.add(
                                HouseholdOverviewEvent.selectedIndividual(
                                  individualModel: individual,
                                ),
                              );
                              bloc.add(HouseholdOverviewReloadEvent(
                                projectId:
                                    RegistrationDeliverySingleton().projectId!,
                                projectBeneficiaryType:
                                    RegistrationDeliverySingleton()
                                            .beneficiaryType ??
                                        BeneficiaryType.individual,
                              ));

                              navigateToBeneficiaryDetails(context);
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ])
        ]);
  }

  void navigateToBeneficiaryDetails(BuildContext context) {
    context.router.push(BeneficiaryDetailsRoute());
  }
}
