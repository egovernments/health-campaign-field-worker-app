import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:recase/recase.dart';
import 'package:registration_delivery/pages/beneficiary/widgets/past_delivery.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import 'widgets/record_delivery_cycle.dart';

@RoutePage()
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
    final localizations = RegistrationDeliveryLocalization.of(context);
    final router = context.router;

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMemberWrapper;
          // Filtering project beneficiaries based on the selected individual
          final projectBeneficiary =
              RegistrationDeliverySingleton().beneficiaryType !=
                      BeneficiaryType.individual
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
          final bloc = context.read<DeliverInterventionBloc>();
          final lastDose = taskData != null && taskData.isNotEmpty
              ? taskData.last.additionalFields?.fields
                      .firstWhereOrNull(
                        (e) =>
                            e.key == AdditionalFieldsType.doseIndex.toValue(),
                      )
                      ?.value ??
                  '1'
              : '0';
          final lastCycle = taskData != null && taskData.isNotEmpty
              ? taskData.last.additionalFields?.fields
                      .firstWhereOrNull(
                        (e) =>
                            e.key == AdditionalFieldsType.cycleIndex.toValue(),
                      )
                      ?.value ??
                  '1'
              : '1';

          // [TODO] Need to move this to Bloc Lisitner or consumer
          if (RegistrationDeliverySingleton().projectType != null) {
            bloc.add(
              DeliverInterventionEvent.setActiveCycleDose(
                individualModel: state.selectedIndividual,
                projectType: RegistrationDeliverySingleton().projectType!,
                lastCycle: int.parse(lastCycle),
                lastDose: int.parse(lastDose),
              ),
            );
          }

          // Building the table content based on the DeliverInterventionState

          return BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariantsValue) {
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
                          final projectType =
                              RegistrationDeliverySingleton().projectType;
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
                                                individualModel:
                                                    state.selectedIndividual,
                                                cycle: selectedCycle,
                                                dose: deliverState.dose,
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
                                            '${localizations.translate(i18.beneficiaryDetails.recordCycle)} ${(deliverState.cycle == 0 ? (deliverState.cycle + 1) : deliverState.cycle).toString()} ${localizations.translate(i18.deliverIntervention.dose)} ${(deliverState.dose).toString()}',
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
                                    RegistrationDeliverySingleton()
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? i18.householdOverView
                                            .householdOverViewHouseholdHeadLabel
                                        : i18.common.coreCommonName,
                                  ): RegistrationDeliverySingleton()
                                              .beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? householdMemberWrapper
                                          .headOfHousehold.name?.givenName
                                      : state.selectedIndividual?.name
                                              ?.givenName ??
                                          '--',
                                  localizations.translate(
                                    i18.deliverIntervention.idTypeText,
                                  ): () {
                                    final identifiers =
                                        RegistrationDeliverySingleton()
                                                    .beneficiaryType !=
                                                BeneficiaryType.individual
                                            ? householdMemberWrapper
                                                .headOfHousehold.identifiers
                                            : state.selectedIndividual
                                                ?.identifiers;
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
                                    final identifiers =
                                        RegistrationDeliverySingleton()
                                                    .beneficiaryType !=
                                                BeneficiaryType.individual
                                            ? householdMemberWrapper
                                                .headOfHousehold.identifiers
                                            : state.selectedIndividual
                                                ?.identifiers;
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
                                    final dob = RegistrationDeliverySingleton()
                                                .beneficiaryType !=
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
                                  ): RegistrationDeliverySingleton()
                                              .beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? householdMemberWrapper.headOfHousehold
                                          .gender?.name.sentenceCase
                                      : state.selectedIndividual?.gender?.name
                                              .sentenceCase ??
                                          '--',
                                  localizations.translate(
                                    i18.common.coreCommonMobileNumber,
                                  ): RegistrationDeliverySingleton()
                                              .beneficiaryType !=
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
                        if ((RegistrationDeliverySingleton()
                                    .projectType
                                    ?.cycles ??
                                [])
                            .isNotEmpty)
                          DigitCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: RegistrationDeliverySingleton()
                                          .projectType
                                          ?.cycles !=
                                      null
                                  ? [
                                      BlocBuilder<DeliverInterventionBloc,
                                          DeliverInterventionState>(
                                        builder: (context, deliverState) {
                                          return Column(
                                            children: [
                                              (RegistrationDeliverySingleton()
                                                              .projectType
                                                              ?.cycles ??
                                                          [])
                                                      .isNotEmpty
                                                  ? RecordDeliveryCycle(
                                                      projectCycles:
                                                          RegistrationDeliverySingleton()
                                                                  .projectType
                                                                  ?.cycles ??
                                                              [],
                                                      taskData: taskData ?? [],
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
                          )
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
