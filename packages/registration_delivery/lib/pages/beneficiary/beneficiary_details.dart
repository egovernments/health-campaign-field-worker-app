import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/pages/beneficiary/widgets/past_delivery.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/localized.dart';
import '../../widgets/table_card/table_card.dart';
import 'widgets/record_delivery_cycle.dart';

@RoutePage()
class BeneficiaryDetailsPage extends LocalizedStatefulWidget {
  const BeneficiaryDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryDetailsPage> createState() => BeneficiaryDetailsPageState();
}

class BeneficiaryDetailsPageState
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
    final textTheme = theme.digitTextTheme(context);

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMemberWrapper;
          // Filtering project beneficiaries based on the selected individual
          final projectBeneficiary =
              RegistrationDeliverySingleton().beneficiaryType !=
                      BeneficiaryType.individual
                  ? [householdMemberWrapper.projectBeneficiaries?.first]
                  : householdMemberWrapper.projectBeneficiaries
                      ?.where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList();

          // Extracting task data related to the selected project beneficiary

          final taskData = state.householdMemberWrapper.tasks
              ?.where((element) =>
                  element.projectBeneficiaryClientReferenceId ==
                  projectBeneficiary?.first?.clientReferenceId)
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
                lastDose: taskData != null && taskData.isNotEmpty
                    ? int.tryParse(
                          lastDose,
                        ) ??
                        1
                    : 0,
                lastCycle: taskData != null && taskData.isNotEmpty
                    ? int.tryParse(
                          lastCycle,
                        ) ??
                        1
                    : 1,
                individualModel: state.selectedIndividual,
                projectType: RegistrationDeliverySingleton().projectType!,
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
                        enableFixedDigitButton: true,
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
                                        margin:
                                            const EdgeInsets.only(top: spacer2),
                                        children: [
                                            DigitButton(
                                              label:
                                                  '${localizations.translate(i18.beneficiaryDetails.recordCycle)} '
                                                  '${(deliverState.cycle == 0 ? (deliverState.cycle + 1) : deliverState.cycle).toString()} ${localizations.translate(i18.deliverIntervention.dose)} '
                                                  '${(deliverState.dose).toString()}',
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large,
                                              mainAxisSize: MainAxisSize.max,
                                              onPressed: () async {
                                                final selectedCycle = cycles
                                                    .firstWhereOrNull((c) =>
                                                        c.id ==
                                                        deliverState.cycle);
                                                if (selectedCycle != null) {
                                                  final currentCycle =
                                                      deliverState.cycle >= 0
                                                          ? deliverState.cycle
                                                          : 0;

                                                  // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
                                                  final currentDose =
                                                      deliverState.dose >= 0
                                                          ? deliverState.dose
                                                          : 0;

                                                  final items =
                                                      RegistrationDeliverySingleton()
                                                              .projectType!
                                                              .cycles?[
                                                                  currentCycle - 1]
                                                              .deliveries?[
                                                          currentDose - 1];

                                                  bloc.add(
                                                    DeliverInterventionEvent
                                                        .selectFutureCycleDose(
                                                      dose: deliverState.dose,
                                                      cycle:
                                                          RegistrationDeliverySingleton()
                                                              .projectType!
                                                              .cycles!
                                                              .firstWhere((c) =>
                                                                  c.id ==
                                                                  deliverState
                                                                      .cycle),
                                                      individualModel: state
                                                          .selectedIndividual,
                                                    ),
                                                  );

                                                  var productVariants =
                                                      fetchProductVariant(
                                                          items,
                                                          state
                                                              .selectedIndividual,
                                                          state
                                                              .householdMemberWrapper
                                                              .household,
                                                          context: context);

                                                  if (productVariants[
                                                          'criteria'] ==
                                                      null) {
                                                    showCustomPopup(
                                                      context: context,
                                                      builder: (BuildContext context) => Popup(
                                                          title: localizations
                                                              .translate(i18
                                                                  .common
                                                                  .coreCommonError),
                                                          description: localizations
                                                                  .translate(
                                                                      'CONDITION_FAILED') +
                                                              productVariants[
                                                                      'errors']
                                                                  .toString()
                                                                  .replaceAll(
                                                                      '[', '')
                                                                  .replaceAll(
                                                                      ']', ''),
                                                          type: PopUpType.alert,
                                                          actions: [
                                                            DigitButton(
                                                                label: localizations
                                                                    .translate(i18
                                                                        .common
                                                                        .corecommonclose),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true,
                                                                  ).pop();
                                                                },
                                                                type: DigitButtonType
                                                                    .tertiary,
                                                                size:
                                                                    DigitButtonSize
                                                                        .large)
                                                          ]),
                                                    );
                                                  } else {
                                                    showCustomPopup(
                                                      context: context,
                                                      builder: (popUpContext) => Popup(
                                                          title: localizations
                                                              .translate(i18
                                                                  .beneficiaryDetails
                                                                  .resourcesTobeDelivered),
                                                          type:
                                                              PopUpType.simple,
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          additionalWidgets: [
                                                            buildTableContent(
                                                                deliverState,
                                                                context,
                                                                variant,
                                                                state
                                                                    .selectedIndividual,
                                                                state
                                                                    .householdMemberWrapper
                                                                    .household),
                                                          ],
                                                          actions: [
                                                            DigitButton(
                                                                label: localizations
                                                                    .translate(i18
                                                                        .beneficiaryDetails
                                                                        .ctaProceed),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true,
                                                                  ).pop();
                                                                  router.push(
                                                                    DeliverInterventionRoute(),
                                                                  );
                                                                },
                                                                type:
                                                                    DigitButtonType
                                                                        .primary,
                                                                size:
                                                                    DigitButtonSize
                                                                        .large),
                                                          ]),
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ])
                                    : const SizedBox.shrink()
                                : DigitCard(
                                    margin: const EdgeInsets.only(top: spacer2),
                                    children: [
                                        DigitButton(
                                          label: localizations.translate(i18
                                              .householdOverView
                                              .householdOverViewActionText),
                                          type: DigitButtonType.primary,
                                          size: DigitButtonSize.large,
                                          mainAxisSize: MainAxisSize.max,
                                          onPressed: () {
                                            final currentCycle =
                                                deliverState.cycle >= 0
                                                    ? deliverState.cycle
                                                    : 0;

                                            // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
                                            final currentDose =
                                                deliverState.dose >= 0
                                                    ? deliverState.dose
                                                    : 0;

                                            final items =
                                                RegistrationDeliverySingleton()
                                                    .projectType!
                                                    .cycles?[currentCycle - 1]
                                                    .deliveries?[currentDose - 1];

                                            var productVariants =
                                                fetchProductVariant(
                                                    items,
                                                    state.selectedIndividual,
                                                    state.householdMemberWrapper
                                                        .household,
                                                    context: context);

                                            if (productVariants['criteria'] ==
                                                null) {
                                              showCustomPopup(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    Popup(
                                                        title: localizations
                                                            .translate(i18
                                                                .common
                                                                .coreCommonError),
                                                        description: localizations
                                                                .translate(
                                                                    'CONDITION_FAILED') +
                                                            productVariants[
                                                                    'errors']
                                                                .toString()
                                                                .replaceAll(
                                                                    '[', '')
                                                                .replaceAll(
                                                                    ']', ''),
                                                        type: PopUpType.alert,
                                                        actions: [
                                                      DigitButton(
                                                          label: localizations
                                                              .translate(i18
                                                                  .common
                                                                  .corecommonclose),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
                                                            ).pop();
                                                          },
                                                          type: DigitButtonType
                                                              .tertiary,
                                                          size: DigitButtonSize
                                                              .large)
                                                    ]),
                                              );
                                            } else {
                                              context.router.push(
                                                  DeliverInterventionRoute());
                                            }
                                          },
                                        ),
                                      ]);
                          },
                        ),
                        children: [
                          DigitCard(
                              margin: const EdgeInsets.all(spacer2),
                              children: [
                                Text(
                                  localizations.translate(i18.beneficiaryDetails
                                      .beneficiarysDetailsLabelText),
                                  style: textTheme.headingXl.copyWith(
                                      color: theme.colorTheme.primary.primary2),
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
                                            .headOfHousehold?.name?.givenName
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
                                                  .headOfHousehold?.identifiers
                                              : state.selectedIndividual
                                                  ?.identifiers;
                                      if (identifiers == null ||
                                          identifiers.isEmpty) {
                                        return '--';
                                      }

                                      String? primaryIdType = state
                                          .selectedIndividual
                                          ?.additionalFields
                                          ?.fields
                                          .firstWhereOrNull((idType) =>
                                              idType.key == 'primaryIdType')
                                          ?.value;

                                      return localizations.translate(
                                          primaryIdType != null
                                              ? state.selectedIndividual
                                                      ?.identifiers
                                                      ?.firstWhereOrNull((type) =>
                                                          type.identifierType ==
                                                          primaryIdType)
                                                      ?.identifierType ??
                                                  '--'
                                              : state
                                                      .selectedIndividual
                                                      ?.identifiers
                                                      ?.firstOrNull
                                                      ?.identifierType ??
                                                  '--');
                                    }(),
                                    localizations.translate(
                                      i18.deliverIntervention.idNumberText,
                                    ): () {
                                      final identifiers =
                                          RegistrationDeliverySingleton()
                                                      .beneficiaryType !=
                                                  BeneficiaryType.individual
                                              ? householdMemberWrapper
                                                  .headOfHousehold?.identifiers
                                              : state.selectedIndividual
                                                  ?.identifiers;
                                      if (identifiers == null ||
                                          identifiers.isEmpty) {
                                        return '--';
                                      }

                                      String? primaryIdType = state
                                          .selectedIndividual
                                          ?.additionalFields
                                          ?.fields
                                          .firstWhereOrNull((idType) =>
                                              idType.key == 'primaryIdType')
                                          ?.value;

                                      String? getMaskedOrRawIdentifier(
                                          List<IdentifierModel> identifiers,
                                          String? type) {
                                        final identifier =
                                            identifiers.firstWhereOrNull(
                                          (id) =>
                                              type == null ||
                                              id.identifierType == type,
                                        );
                                        if (identifier == null) return null;

                                        return type ==
                                                IdentifierTypes
                                                    .uniqueBeneficiaryID
                                                    .toValue()
                                            ? identifier.identifierId
                                            : maskString(
                                                identifier.identifierId ?? '');
                                      }

                                      final identifiersList = state
                                              .selectedIndividual
                                              ?.identifiers ??
                                          identifiers;

                                      return getMaskedOrRawIdentifier(
                                          identifiersList, primaryIdType);
                                    }(),
                                    localizations.translate(
                                      i18.common.coreCommonAge,
                                    ): () {
                                      final dob =
                                          RegistrationDeliverySingleton()
                                                      .beneficiaryType !=
                                                  BeneficiaryType.individual
                                              ? householdMemberWrapper
                                                  .headOfHousehold?.dateOfBirth
                                              : state.selectedIndividual
                                                  ?.dateOfBirth;
                                      if (dob == null || dob.isEmpty) {
                                        return '--';
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

                                      return "$years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} ${localizations.translate(months.toString().toUpperCase())} ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}";
                                    }(),
                                    localizations.translate(
                                      i18.common.coreCommonGender,
                                    ): RegistrationDeliverySingleton()
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper.headOfHousehold
                                            ?.gender?.name.sentenceCase
                                        : state.selectedIndividual?.gender?.name
                                                .sentenceCase ??
                                            '--',
                                    localizations.translate(
                                      i18.common.coreCommonMobileNumber,
                                    ): RegistrationDeliverySingleton()
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper
                                            .headOfHousehold?.mobileNumber
                                        : state.selectedIndividual
                                                ?.mobileNumber ??
                                            '--',
                                    localizations.translate(i18
                                        .deliverIntervention
                                        .dateOfRegistrationLabel): () {
                                      final date = projectBeneficiary
                                          ?.first?.dateOfRegistration;

                                      final registrationDate =
                                          DateTime.fromMillisecondsSinceEpoch(
                                        date ??
                                            DateTime.now()
                                                .millisecondsSinceEpoch,
                                      );

                                      return DateFormat('dd MMMM yyyy')
                                          .format(registrationDate);
                                    }(),
                                  },
                                ),
                              ]),
                          if ((RegistrationDeliverySingleton()
                                      .projectType
                                      ?.cycles ??
                                  [])
                              .isNotEmpty)
                            DigitCard(
                                margin: const EdgeInsets.all(spacer2),
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
                                    : [])
                        ],
                      ),
                    );
                  },
                  empty: () => Center(
                        child: Text(
                          localizations.translate(
                            i18.deliverIntervention
                                .checkForProductVariantsConfig,
                          ),
                        ),
                      ));
            },
          );
        },
      ),
    );
  }
}
