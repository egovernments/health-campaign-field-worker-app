import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/app_localization.dart';
import '../../models/entities/household.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String? gender;
  final int? years;
  final int? months;
  final bool isHead;
  final HouseholdModel? household;
  final IndividualModel individual;
  final List<IndividualModel>? children;
  final List<ProjectBeneficiaryModel>? projectBeneficiaries;
  final bool isDelivered;
  final bool showAddChildAction;
  final VoidCallback? setAsHeadAction;
  final TemplateProperty? editMemberActionProperties;
  final TemplateProperty? primaryButtonProperties;
  final TemplateProperty? secondaryButtonProperties;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final RegistrationDeliveryLocalization localizations;
  final List<TaskModel>? tasks;
  final List<SideEffectModel>? sideEffects;
  final bool isNotEligible;
  final bool isBeneficiaryRefused;
  final bool isBeneficiaryReferred;
  final String? projectBeneficiaryClientReferenceId;

  const MemberCard({
    super.key,
    required this.individual,
    this.children,
    required this.name,
    this.gender,
    this.years,
    this.isHead = false,
    this.months,
    this.household,
    this.showAddChildAction = true,
    required this.localizations,
    required this.isDelivered,
    this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
    this.projectBeneficiaries,
    this.tasks,
    this.isNotEligible = false,
    this.projectBeneficiaryClientReferenceId,
    this.isBeneficiaryRefused = false,
    this.isBeneficiaryReferred = false,
    this.sideEffects,
    this.editMemberActionProperties,
    this.primaryButtonProperties,
    this.secondaryButtonProperties,
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
                if (individual.identifiers != null)
                  if (individual.identifiers!
                          .lastWhereOrNull(
                            (e) =>
                                e.identifierType ==
                                IdentifierTypes.uniqueBeneficiaryID.toValue(),
                          )
                          ?.identifierId !=
                      null)
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacer1),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: theme.colorTheme.text.disabled,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(spacer2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(spacer1),
                              child: Text(
                                individual.identifiers
                                        ?.lastWhereOrNull(
                                          (e) =>
                                              e.identifierType ==
                                              IdentifierTypes
                                                  .uniqueBeneficiaryID
                                                  .toValue(),
                                        )
                                        ?.identifierId ??
                                    localizations
                                        .translate(i18.common.noResultsFound),
                                style: textTheme.headingXS.copyWith(
                                    color: theme.colorTheme.primary.primary2),
                              ),
                            ),
                          ),
                        )),
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
                    if (editMemberActionProperties?.hidden != true)
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
                                            i18.memberCard
                                                .assignAsHouseholdhead,
                                          ),
                                    isDisabled:
                                        isHead || setAsHeadAction == null
                                            ? true
                                            : false,
                                    onPressed: setAsHeadAction != null
                                        ? setAsHeadAction!
                                        : () {},
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
                              editMemberActionProperties?.label ??
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
                    child: !isDelivered ||
                            isNotEligible ||
                            isBeneficiaryRefused ||
                            isBeneficiaryReferred
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Tag(
                              isIcon: true,
                              label: localizations.translate(
                                isNotEligible
                                    ? i18.householdOverView
                                        .householdOverViewNotEligibleIconLabel
                                    : isBeneficiaryReferred
                                        ? i18.householdOverView
                                            .householdOverViewBeneficiaryReferredLabel
                                        : isBeneficiaryRefused
                                            ? Status.beneficiaryRefused
                                                .toValue()
                                            : i18.householdOverView
                                                .householdOverViewNotDeliveredIconLabel,
                              ),
                              type: TagType.error,
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Tag(
                              isIcon: true,
                              label: localizations.translate(
                                i18.householdOverView
                                    .householdOverViewDeliveredIconLabel,
                              ),
                              type: TagType.success,
                            ),
                          ),
                  ),
                ),
                Offstage(
                  offstage: beneficiaryType != BeneficiaryType.individual ||
                      isNotEligible ||
                      isBeneficiaryRefused ||
                      isBeneficiaryReferred,
                  child: Padding(
                    padding: const EdgeInsets.all(spacer1),
                    child: Column(
                      children: [
                        isNotEligible ||
                                isBeneficiaryRefused ||
                                isBeneficiaryReferred
                            ? const Offstage()
                            : !isNotEligible
                                ? Offstage(
                                    offstage: beneficiaryType != BeneficiaryType.individual && primaryButtonProperties?.hidden !=
                                            null &&
                                        primaryButtonProperties?.hidden == true,
                                    child: DigitButton(
                                      mainAxisSize: MainAxisSize.max,
                                      isDisabled:
                                          (projectBeneficiaries ?? []).isEmpty
                                              ? true
                                              : false,
                                      type: DigitButtonType.primary,
                                      size: DigitButtonSize.medium,
                                      label: allDosesDelivered(
                                                tasks,
                                                context.selectedCycle,
                                                sideEffects,
                                                individual,
                                              ) &&
                                              !checkStatus(
                                                tasks,
                                                context.selectedCycle,
                                              )
                                          ? localizations.translate(
                                              i18.householdOverView
                                                  .viewDeliveryLabel,
                                            )
                                          : localizations.translate(
                                              i18.householdOverView
                                                  .householdOverViewActionText,
                                            ),
                                      onPressed: () {
                                        //// TODO: need to write for logic for eligibility checklist and other flows
                                      },
                                    ),
                                  )
                                : const Offstage(),
                        const SizedBox(
                          height: 10,
                        ),
                        //// TODO:need to check
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: spacer2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (showAddChildAction)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: DigitButton(
                          label: localizations
                              .translate(i18.memberCard.addChildLabel),
                          type: DigitButtonType.tertiary,
                          prefixIcon: Icons.add_circle_outline,
                          size: DigitButtonSize.medium,
                          onPressed: () async {
                            if (household != null) {
                              /// TODO: adding a child, need to implement
                            }
                          },
                        ),
                      ),
                    if ((children ?? []).isNotEmpty)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: DigitButton(
                            label:
                                '${localizations.translate(i18.memberCard.noOfChildren)} ${children?.length}',
                            onPressed: () {
                              /// TODO: navigate to parent details screen
                            },
                            type: DigitButtonType.tertiary,
                            size: DigitButtonSize.medium),
                      ),
                  ],
                ),
              ])
        ]);
  }

  void navigateToChecklist(BuildContext context, clientReferenceId) async {
    //// TODO: need to figure out logic for checklist navigation
  }
}
