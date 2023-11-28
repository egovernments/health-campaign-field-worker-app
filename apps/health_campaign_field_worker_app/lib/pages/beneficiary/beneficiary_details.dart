import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary/widgets/past_delivery.dart';
import 'package:intl/intl.dart';
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
          final lastDose = taskData != null && taskData.isNotEmpty
              ? taskData.last.additionalFields?.fields
                      .firstWhereOrNull((e) =>
                          e.key == AdditionalFieldsType.doseIndex.toValue())
                      ?.value ??
                  '1'
              : '0';
          final lastCycle = taskData != null && taskData.isNotEmpty
              ? taskData.last.additionalFields?.fields
                      .firstWhereOrNull((e) =>
                          e.key == AdditionalFieldsType.cycleIndex.toValue())
                      ?.value ??
                  '1'
              : '1';

          // [TODO] Need to move this to Bloc Lisitner or consumer
          if (projectState.projectType != null) {
            bloc.add(
              DeliverInterventionEvent.setActiveCycleDose(
                taskData != null && taskData.isNotEmpty
                    ? int.tryParse(
                          lastDose,
                        ) ??
                        1
                    : 0,
                taskData != null && taskData.isNotEmpty
                    ? int.tryParse(
                          lastCycle,
                        ) ??
                        1
                    : 1,
                state.selectedIndividual,
                projectState.projectType!,
              ),
            );
          }

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
                    body: ScrollableContent(
                      enableFixedButton: true,
                      header: const Column(children: [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: BlocBuilder<DeliverInterventionBloc,
                          DeliverInterventionState>(
                        builder: (context, deliverState) {
                          final projectType = projectState.projectType;
                          final cycles = projectType?.cycles;

                          return cycles != null && cycles.isNotEmpty
                              ? deliverState.hasCycleArrived
                                  ? DigitCard(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, kPadding, 0, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          kPadding, 0, kPadding, 0),
                                      child: DigitElevatedButton(
                                        onPressed: () async {
                                          final selectedCycle =
                                              cycles.firstWhereOrNull((c) =>
                                                  c.id == deliverState.cycle);
                                          if (selectedCycle != null) {
                                            bloc.add(
                                              DeliverInterventionEvent
                                                  .selectFutureCycleDose(
                                                deliverState.dose,
                                                projectState
                                                    .projectType!.cycles!
                                                    .firstWhere((c) =>
                                                        c.id ==
                                                        deliverState.cycle),
                                                state.selectedIndividual,
                                              ),
                                            );
                                            await DigitDialog.show<bool>(
                                              context,
                                              options: DigitDialogOptions(
                                                titlePadding:
                                                    const EdgeInsets.fromLTRB(
                                                  kPadding,
                                                  0,
                                                  kPadding,
                                                  0,
                                                ),
                                                titleText:
                                                    localizations.translate(i18
                                                        .beneficiaryDetails
                                                        .resourcesTobeDelivered),
                                                content: buildTableContent(
                                                  deliverState,
                                                  context,
                                                  variant,
                                                  state.selectedIndividual,
                                                ),
                                                barrierDismissible: true,
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label: localizations
                                                      .translate(i18
                                                          .beneficiaryDetails
                                                          .ctaProceed),
                                                  action: (ctx) {
                                                    Navigator.of(ctx).pop();
                                                    router.push(
                                                      DeliverInterventionRoute(),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Center(
                                          child: Text(
                                            'Record Cycle ${(deliverState.cycle == 0 ? (deliverState.cycle + 1) : deliverState.cycle).toString()} Dose ${(deliverState.dose).toString()}',
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                              : DigitCard(
                                  margin: const EdgeInsets.only(top: kPadding),
                                  padding: const EdgeInsets.fromLTRB(
                                      kPadding, 0, kPadding, 0),
                                  child: DigitElevatedButton(
                                    child: Center(
                                      child: Text(localizations.translate(i18
                                          .householdOverView
                                          .householdOverViewActionText)),
                                    ),
                                    onPressed: () {
                                      context.router
                                          .push(DeliverInterventionRoute());
                                    },
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
                                ],
                              ),
                              DigitTableCard(
                                element: {
                                  localizations.translate(
                                    context.beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? i18.householdOverView
                                            .householdOverViewHouseholdHeadLabel
                                        : i18.common.coreCommonName,
                                  ): context.beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? householdMemberWrapper
                                          .headOfHousehold.name?.givenName
                                      : state.selectedIndividual?.name
                                              ?.givenName ??
                                          '--',
                                  localizations.translate(
                                    i18.deliverIntervention.idTypeText,
                                  ): () {
                                    final identifiers = context
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper
                                            .headOfHousehold.identifiers
                                        : state.selectedIndividual?.identifiers;
                                    if (identifiers == null ||
                                        identifiers.isEmpty) {
                                      return '--';
                                    }

                                    return identifiers.first.identifierType ??
                                        '--';
                                  }(),
                                  localizations.translate(
                                    i18.deliverIntervention.idNumberText,
                                  ): () {
                                    final identifiers = context
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper
                                            .headOfHousehold.identifiers
                                        : state.selectedIndividual?.identifiers;
                                    if (identifiers == null ||
                                        identifiers.isEmpty) {
                                      return '--';
                                    }

                                    return maskString(identifiers
                                            .first.identifierId
                                            .toString()) ??
                                        '--';
                                  }(),
                                  localizations.translate(
                                    i18.common.coreCommonAge,
                                  ): () {
                                    final dob = context.beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper
                                            .headOfHousehold.dateOfBirth
                                        : state.selectedIndividual?.dateOfBirth;
                                    if (dob == null || dob.isEmpty) {
                                      return '--';
                                    }

                                    final int years =
                                        DigitDateUtils.calculateAge(
                                      DigitDateUtils.getFormattedDateToDateTime(
                                            dob,
                                          ) ??
                                          DateTime.now(),
                                    ).years;
                                    final int months =
                                        DigitDateUtils.calculateAge(
                                      DigitDateUtils.getFormattedDateToDateTime(
                                            dob,
                                          ) ??
                                          DateTime.now(),
                                    ).months;

                                    return "$years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}";
                                  }(),
                                  localizations.translate(
                                    i18.common.coreCommonGender,
                                  ): context.beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? householdMemberWrapper.headOfHousehold
                                          .gender?.name.sentenceCase
                                      : state.selectedIndividual?.gender?.name
                                              .sentenceCase ??
                                          '--',
                                  localizations.translate(
                                    i18.common.coreCommonMobileNumber,
                                  ): context.beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? householdMemberWrapper
                                          .headOfHousehold.mobileNumber
                                      : state.selectedIndividual
                                              ?.mobileNumber ??
                                          '--',
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
                        if ((projectState.projectType?.cycles ?? []).isNotEmpty)
                          BlocBuilder<ProjectBloc, ProjectState>(
                            builder: (context, projectState) {
                              return DigitCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: projectState.projectType?.cycles !=
                                          null
                                      ? [
                                          BlocBuilder<DeliverInterventionBloc,
                                              DeliverInterventionState>(
                                            builder: (context, deliverState) {
                                              return Column(
                                                children: [
                                                  (projectState.projectType
                                                                  ?.cycles ??
                                                              [])
                                                          .isNotEmpty
                                                      ? RecordDeliveryCycle(
                                                          projectCycles:
                                                              projectState
                                                                      .projectType
                                                                      ?.cycles ??
                                                                  [],
                                                          taskData:
                                                              taskData ?? [],
                                                          individualModel: state
                                                              .selectedIndividual,
                                                        )
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
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
