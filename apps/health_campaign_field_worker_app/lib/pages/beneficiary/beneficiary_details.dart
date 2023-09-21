import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary/widgets/past_delivery.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/project/project.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import 'widgets/record_delivery_cycle.dart';

class BeneficiaryDetailsPage extends LocalizedStatefulWidget {
  const BeneficiaryDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryDetailsPage> createState() => _BeneficiaryDetailsPageState();
}

class _BeneficiaryDetailsPageState
    extends LocalizedState<BeneficiaryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;
    bool hidePastDelivery = true;

    // Defining a list of table headers for cycle

    // Defining a list of table headers for resource popup
    final headerListResource = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
        cellKey: 'resources',
      ),
    ];

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMemberWrapper;

          // Filtering project beneficiaries based on the selected individual
          final projectBeneficiary =
              context.beneficiaryType != BeneficiaryType.individual
                  ? [householdMemberWrapper.projectBeneficiaries.first]
                  : householdMemberWrapper.projectBeneficiaries
                      .where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList();

          // Extracting task data related to the selected project beneficiary

          final taskData = state.householdMemberWrapper.tasks
              ?.where((element) =>
                  element.projectBeneficiaryClientReferenceId ==
                  projectBeneficiary.first.clientReferenceId)
              .toList();

          // Building the table content based on the DeliverInterventionState

          return BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariantsvalue) {
                  final variant = productState.whenOrNull(
                    fetched: (productVariants) {
                      return productVariants;
                    },
                  );

                  return Scaffold(
                    body: ReactiveFormBuilder(
                      form: buildForm,
                      builder: (context, formGroup, child) => ScrollableContent(
                        header: const Column(children: [
                          BackNavigationHelpHeaderWidget(),
                        ]),
                        footer: BlocBuilder<DeliverInterventionBloc,
                            DeliverInterventionState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 85,
                              child: DigitCard(
                                margin: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: DigitElevatedButton(
                                  onPressed: () async {
                                    final bloc =
                                        context.read<DeliverInterventionBloc>();

                                    bloc.add(
                                      DeliverInterventionEvent.selectCycleDose(
                                        taskData != null && taskData.isNotEmpty
                                            ? int.tryParse(taskData
                                                    .last
                                                    .additionalFields
                                                    ?.fields[4]
                                                    .value) ??
                                                0
                                            : -1,
                                        taskData != null && taskData.isNotEmpty
                                            ? int.tryParse(taskData
                                                    .last
                                                    .additionalFields
                                                    ?.fields[3]
                                                    .value) ??
                                                0
                                            : 1,
                                      ),
                                    );
                                    await DigitDialog.show<bool>(
                                      context,
                                      options: DigitDialogOptions(
                                        titleText: localizations.translate(
                                          i18.beneficiaryDetails
                                              .reourcesTobeDelivered,
                                        ),
                                        content: buildTableContent(
                                          state,
                                          context,
                                          headerListResource,
                                          variant,
                                        ),
                                        primaryAction: DigitDialogActions(
                                          label: localizations.translate(
                                            i18.beneficiaryDetails.ctaProceed,
                                          ),
                                          action: (ctx) {
                                            Navigator.of(ctx).pop();
                                            router.push(
                                                DeliverInterventionRoute());
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      localizations
                                          .translate(i18.common.coreCommonNext),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        children: [
                          DigitCard(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        localizations.translate(i18
                                            .beneficiaryDetails
                                            .beneficiarysDetailsLabelText),
                                        style: theme.textTheme.displayMedium,
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
                                                i18.beneficiaryDetails
                                                    .beneficiarysDetailsEditIconLabel,
                                              ),
                                              action: () async {},
                                            ),
                                            ActionCardModel(
                                              icon: Icons.delete,
                                              label: localizations.translate(i18
                                                  .beneficiaryDetails
                                                  .beneficiarysDetailsDeleteIconLabel),
                                              action: () => null,
                                              // action: () => DigitDialog.show(
                                              //   context,
                                              //   options: DigitDialogOptions(
                                              //     titleText: localizations.translate(i18
                                              //         .householdOverView
                                              //         .householdOverViewActionCardTitle),
                                              //     primaryAction: DigitDialogActions(
                                              //       label: localizations.translate(i18
                                              //           .householdOverView
                                              //           .householdOverViewPrimaryActionLabel),
                                              //       action: (ctx) {
                                              //         Navigator.of(
                                              //           ctx,
                                              //           rootNavigator: true,
                                              //         )
                                              //           ..pop()
                                              //           ..pop();
                                              //         context.router.push(
                                              //           ReasonForDeletionRoute(
                                              //             isHousholdDelete: true,
                                              //           ),
                                              //         );
                                              //       },
                                              //     ),
                                              //     secondaryAction: DigitDialogActions(
                                              //       label: localizations.translate(i18
                                              //           .householdOverView
                                              //           .householdOverViewSecondaryActionLabel),
                                              //       action: (context) {
                                              //         Navigator.of(
                                              //           context,
                                              //           rootNavigator: true,
                                              //         ).pop();
                                              //       },
                                              //     ),
                                              //   ),
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      iconText: localizations.translate(
                                        i18.beneficiaryDetails
                                            .beneficiarysDetailsEditIconLabelText,
                                      ),
                                      icon: Icons.edit,
                                    ),
                                  ],
                                ),
                                DigitTableCard(
                                  element: {
                                    localizations.translate(i18
                                            .householdOverView
                                            .householdOverViewHouseholdHeadLabel):
                                        householdMemberWrapper.headOfHousehold
                                                .name?.givenName ??
                                            '',
                                    localizations.translate(
                                      i18.deliverIntervention.idTypeText,
                                    ): () {
                                      final identifiers = householdMemberWrapper
                                          .headOfHousehold.identifiers;
                                      if (identifiers == null ||
                                          identifiers.isEmpty) {
                                        return '';
                                      }

                                      return identifiers.first.identifierType ??
                                          '';
                                    }(),
                                    localizations.translate(
                                      i18.deliverIntervention.idNumberText,
                                    ): () {
                                      final identifiers = householdMemberWrapper
                                          .headOfHousehold.identifiers;
                                      if (identifiers == null ||
                                          identifiers.isEmpty) {
                                        return '';
                                      }

                                      return identifiers.first.identifierId ??
                                          '';
                                    }(),
                                    localizations.translate(
                                      i18.common.coreCommonAge,
                                    ): () {
                                      final dob = householdMemberWrapper
                                          .headOfHousehold.dateOfBirth;
                                      if (dob == null || dob.isEmpty) {
                                        return '';
                                      }

                                      final int years =
                                          DigitDateUtils.calculateAge(
                                        DigitDateUtils
                                                .getFormattedDateToDateTime(
                                              dob,
                                            ) ??
                                            DateTime.now(),
                                      ).years;
                                      final int months =
                                          DigitDateUtils.calculateAge(
                                        DigitDateUtils
                                                .getFormattedDateToDateTime(
                                              dob,
                                            ) ??
                                            DateTime.now(),
                                      ).months;

                                      return "$years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}";
                                    }(),
                                    localizations.translate(
                                      i18.common.coreCommonGender,
                                    ): householdMemberWrapper.headOfHousehold
                                            .gender?.name.sentenceCase ??
                                        '',
                                    localizations.translate(
                                      i18.common.coreCommonMobileNumber,
                                    ): householdMemberWrapper
                                            .headOfHousehold.mobileNumber ??
                                        '',
                                    localizations.translate(i18
                                        .deliverIntervention
                                        .dateOfRegistrationLabel): () {
                                      final date = projectBeneficiary
                                          .first.dateOfRegistration;

                                      final registrationDate =
                                          DateTime.fromMillisecondsSinceEpoch(
                                        date,
                                      );

                                      return DateFormat('dd MMMM yyyy')
                                          .format(registrationDate);
                                    }(),
                                  },
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<ProjectBloc, ProjectState>(
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: state.projectType!.cycles!.map((e) {
                                  final int cycleIndex =
                                      state.projectType!.cycles!.indexOf(e) + 1;

                                  return Column(
                                    children: [
                                      (state.projectType?.cycles != null)
                                          ? state.projectType!.cycles!
                                                  .isNotEmpty
                                              ? RecordDeliveryCycle(
                                                  cycleIndex: cycleIndex,
                                                  e: e,
                                                  taskData: taskData ?? [],
                                                )
                                              : const Offstage()
                                          : const Offstage(),
                                    ],
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{});
  }
}
