import 'package:collection/collection.dart';
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
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          final projectState = context.read<ProjectBloc>().state;
          final bloc = context.read<DeliverInterventionBloc>();

          final lastDose = taskData?.last.additionalFields?.fields
              .firstWhereOrNull((e) => e.key == 'DoseIndex')
              ?.value;
          final lastCycle = taskData?.last.additionalFields?.fields
              .firstWhereOrNull((e) => e.key == 'CycleIndex')
              ?.value;

          bloc.add(
            DeliverInterventionEvent.setActiveCycleDose(
              taskData != null && taskData.isNotEmpty
                  ? int.tryParse(
                        lastDose,
                      ) ??
                      1
                  : 1,
              taskData != null && taskData.isNotEmpty
                  ? int.tryParse(
                        lastCycle,
                      ) ??
                      1
                  : 1,
              projectState.projectType!,
            ),
          );

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
                            return state.hasCycleArrived
                                ? SizedBox(
                                    height: 85,
                                    child: DigitCard(
                                      margin: const EdgeInsets.only(
                                        left: 0,
                                        right: 0,
                                        top: 10,
                                      ),
                                      child: DigitElevatedButton(
                                        onPressed: () async {
                                          bloc.add(
                                            DeliverInterventionEvent
                                                .selectFutureCycleDose(
                                              state.dose,
                                              projectState.projectType!.cycles!
                                                  .firstWhere((c) =>
                                                      c.id == state.cycle),
                                            ),
                                          );
                                          await DigitDialog.show<bool>(
                                            context,
                                            options: DigitDialogOptions(
                                              titleText:
                                                  localizations.translate(
                                                i18.beneficiaryDetails
                                                    .resourcesTobeDelivered,
                                              ),
                                              content: buildTableContent(
                                                state,
                                                context,
                                                headerListResource,
                                                variant,
                                              ),
                                              barrierDismissible: true,
                                              primaryAction: DigitDialogActions(
                                                label: localizations.translate(
                                                  i18.beneficiaryDetails
                                                      .ctaProceed,
                                                ),
                                                action: (ctx) {
                                                  Navigator.of(ctx).pop();
                                                  router.push(
                                                    DeliverInterventionRoute(),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Record Cycle ${(state.cycle == 0 ? (state.cycle + 1) : state.cycle).toString()} Dose ${(state.dose).toString()}',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
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
                              return DigitCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: state.projectType?.cycles != null
                                      ? [
                                          BlocBuilder<DeliverInterventionBloc,
                                              DeliverInterventionState>(
                                            builder: (context, deliverState) {
                                              return Column(
                                                children: [
                                                  (state.projectType?.cycles !=
                                                          null)
                                                      ? state
                                                              .projectType!
                                                              .cycles!
                                                              .isNotEmpty
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                kPadding,
                                                              ),
                                                              child:
                                                                  RecordDeliveryCycle(
                                                                projectCycles:
                                                                    projectState
                                                                            .projectType
                                                                            ?.cycles ??
                                                                        [],
                                                                taskData:
                                                                    taskData ??
                                                                        [],
                                                              ),
                                                            )
                                                          : const Offstage()
                                                      : const Offstage(),
                                                ],
                                              );
                                            },
                                          ),
                                        ]
                                      : [],
                                ),
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
