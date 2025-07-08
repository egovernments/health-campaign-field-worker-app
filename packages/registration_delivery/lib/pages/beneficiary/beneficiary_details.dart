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
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:recase/recase.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/pages/beneficiary/widgets/past_delivery.dart';
import 'package:registration_delivery/widgets/beneficiary/resource_card.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/registration_component_keys.dart' as registration_keys;
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
    final pageKey = BeneficiaryDetailsRoute.name.replaceAll('Route', '');
    final beneficiaryDetailsTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final localizations = RegistrationDeliveryLocalization.of(context);
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return ProductVariantBlocWrapper(
      child: BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMembers;
          // Filtering project beneficiaries based on the selected individual
          final projectBeneficiary = RegistrationDeliverySingleton()
                      .beneficiaryType !=
                  BeneficiaryType.individual
              ? householdMemberWrapper.firstOrNull?.projectBeneficiaries != null
                  ? [householdMemberWrapper.first.projectBeneficiaries?.first]
                  : householdMemberWrapper.firstOrNull?.projectBeneficiaries
                      ?.where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList()
              : null;

          // Extracting task data related to the selected project beneficiary

          final taskData = projectBeneficiary != null
              ? state.householdMembers.first.tasks
                  ?.where((element) =>
                      element.projectBeneficiaryClientReferenceId ==
                      projectBeneficiary.first?.clientReferenceId)
                  .toList()
              : null;
          final deliverState = state.deliveryWrapper;
          final pastCycles = deliverState?.pastCycles;
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
                        footer: BlocBuilder<RegistrationWrapperBloc,
                            RegistrationWrapperState>(
                          builder: (context, deliverState) {
                            final projectType =
                                RegistrationDeliverySingleton().projectType;
                            final cycles = projectType?.cycles;

                            return (beneficiaryDetailsTemplate
                                        ?.properties?[registration_keys
                                            .commonKeys.primaryButtonKey]
                                        ?.hidden ==
                                    true)
                                ? const SizedBox.shrink()
                                : cycles != null && cycles.isNotEmpty
                                    ? deliverState.deliveryWrapper
                                                ?.hasCycleArrived ??
                                            false

                                        /// todo need to check for multiround campaigns
                                        ? DigitCard(
                                            margin: const EdgeInsets.only(
                                                top: spacer2),
                                            children: [
                                                DigitButton(
                                                  label: (beneficiaryDetailsTemplate
                                                                  ?.properties?[
                                                                      registration_keys
                                                                          .commonKeys
                                                                          .primaryButtonKey]
                                                                  ?.label ??
                                                              '')
                                                          .isNotEmpty
                                                      ? localizations.translate(
                                                          beneficiaryDetailsTemplate
                                                                  ?.properties?[
                                                                      registration_keys
                                                                          .commonKeys
                                                                          .primaryButtonKey]
                                                                  ?.label ??
                                                              '')
                                                      : '${localizations.translate(i18.beneficiaryDetails.recordCycle)} '
                                                          '${(deliverState.deliveryWrapper?.cycle == 0 ? (deliverState.deliveryWrapper?.cycle ?? 0 + 1) : deliverState.deliveryWrapper?.cycle).toString()} ${localizations.translate(i18.deliverIntervention.dose)} '
                                                          '${(deliverState.deliveryWrapper?.dose).toString()}',
                                                  type: DigitButtonType.primary,
                                                  size: DigitButtonSize.large,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  onPressed: () async {
                                                    final selectedCycle = cycles
                                                        .firstWhereOrNull((c) =>
                                                            c.id ==
                                                            deliverState
                                                                .deliveryWrapper
                                                                ?.cycle);

                                                    if (selectedCycle != null) {
                                                      final currentCycle =
                                                          (deliverState.deliveryWrapper
                                                                          ?.cycle ??
                                                                      0) >=
                                                                  0
                                                              ? deliverState
                                                                  .deliveryWrapper
                                                                  ?.cycle
                                                              : 0;

                                                      // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
                                                      final currentDose =
                                                          (deliverState.deliveryWrapper
                                                                          ?.dose ??
                                                                      0) >=
                                                                  0
                                                              ? deliverState
                                                                  .deliveryWrapper
                                                                  ?.dose
                                                              : 0;

                                                      final items =
                                                          RegistrationDeliverySingleton()
                                                              .projectType
                                                              ?.cycles
                                                              ?.firstWhere((c) =>
                                                                  c.id ==
                                                                  currentCycle)
                                                              .deliveries
                                                              ?.firstWhere((d) =>
                                                                  d.id ==
                                                                  currentDose);

                                                      // bloc.add(
                                                      //   DeliverInterventionEvent
                                                      //       .selectFutureCycleDose(
                                                      //     dose: deliverState.dose,
                                                      //     cycle:
                                                      //         RegistrationDeliverySingleton()
                                                      //             .projectType!
                                                      //             .cycles!
                                                      //             .firstWhere((c) =>
                                                      //                 c.id ==
                                                      //                 deliverState
                                                      //                     .cycle),
                                                      //     individualModel: state
                                                      //         .selectedIndividual,
                                                      //   ),
                                                      // );

                                                      var productVariants =
                                                          fetchProductVariant(
                                                              items,
                                                              state
                                                                  .selectedIndividual,
                                                              state
                                                                  .householdMembers
                                                                  .first
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
                                                              description: localizations.translate(
                                                                      'CONDITION_FAILED') +
                                                                  productVariants[
                                                                          'errors']
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '[', '')
                                                                      .replaceAll(
                                                                          ']', ''),
                                                              type: PopUpType
                                                                  .alert,
                                                              actions: [
                                                                DigitButton(
                                                                    label: localizations
                                                                        .translate(i18
                                                                            .common
                                                                            .corecommonclose),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true,
                                                                      ).pop();
                                                                    },
                                                                    type: DigitButtonType
                                                                        .secondary,
                                                                    size: DigitButtonSize
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
                                                              type: PopUpType
                                                                  .simple,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              additionalWidgets: [
                                                                buildTableContent(
                                                                    deliverState,
                                                                    context,
                                                                    variant,
                                                                    state
                                                                        .selectedIndividual,
                                                                    state
                                                                        .householdMembers
                                                                        .first
                                                                        .household),
                                                              ],
                                                              actions: [
                                                                DigitButton(
                                                                    label: localizations.translate(i18
                                                                        .beneficiaryDetails
                                                                        .ctaProceed),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true,
                                                                      ).pop();
                                                                      if (beneficiaryDetailsTemplate
                                                                              ?.navigateTo !=
                                                                          null) {
                                                                        if (beneficiaryDetailsTemplate?.navigateTo?.type ==
                                                                            'form') {
                                                                          final pageName = context
                                                                              .read<FormsBloc>()
                                                                              .state
                                                                              .cachedSchemas['DELIVERYFLOW']
                                                                              ?.pages
                                                                              .entries
                                                                              .firstOrNull
                                                                              ?.key;

                                                                          if (pageName ==
                                                                              null) {
                                                                            Toast.showToast(
                                                                              context,
                                                                              message: localizations.translate('NO_FORM_FOUND_FOR_DELIVERY'),
                                                                              type: ToastType.error,
                                                                            );
                                                                          } else {
                                                                            context.router.push(FormsRenderRoute(
                                                                              currentSchemaKey: 'DELIVERYFLOW',
                                                                              pageName: pageName,
                                                                              defaultValues: {
                                                                                'locality': localizations.translate(RegistrationDeliverySingleton().boundary?.code ?? '')
                                                                              },
                                                                              customComponents: const [
                                                                                {
                                                                                  'resourceCard': ResourceCard()
                                                                                }
                                                                              ],
                                                                            ));
                                                                          }
                                                                        }
                                                                      } else {
                                                                        context
                                                                            .router
                                                                            .push(DeliverInterventionRoute());
                                                                      }
                                                                      // router.push(
                                                                      //   DeliverInterventionRoute(),
                                                                      // );
                                                                    },
                                                                    type: DigitButtonType
                                                                        .primary,
                                                                    size: DigitButtonSize
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
                                        margin:
                                            const EdgeInsets.only(top: spacer2),
                                        children: [
                                            DigitButton(
                                              label: (beneficiaryDetailsTemplate
                                                              ?.properties?[
                                                                  registration_keys
                                                                      .commonKeys
                                                                      .primaryButtonKey]
                                                              ?.label ??
                                                          '')
                                                      .isNotEmpty
                                                  ? localizations.translate(
                                                      beneficiaryDetailsTemplate
                                                              ?.properties?[
                                                                  registration_keys
                                                                      .commonKeys
                                                                      .primaryButtonKey]
                                                              ?.label ??
                                                          '')
                                                  : localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewActionText),
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large,
                                              mainAxisSize: MainAxisSize.max,
                                              onPressed: () {
                                                final currentCycle =
                                                    (deliverState.deliveryWrapper
                                                                    ?.cycle ??
                                                                0) >=
                                                            0
                                                        ? deliverState
                                                            .deliveryWrapper
                                                            ?.cycle
                                                        : 0;

                                                // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
                                                final currentDose = (deliverState
                                                                .deliveryWrapper
                                                                ?.dose ??
                                                            0) >=
                                                        0
                                                    ? deliverState
                                                        .deliveryWrapper?.dose
                                                    : 0;

                                                final items =
                                                    RegistrationDeliverySingleton()
                                                            .projectType!
                                                            .cycles?[
                                                                currentCycle ??
                                                                    0 - 1]
                                                            .deliveries?[
                                                        currentDose ?? 0 - 1];

                                                var productVariants =
                                                    fetchProductVariant(
                                                        items,
                                                        state
                                                            .selectedIndividual,
                                                        state.householdMembers
                                                            .first.household,
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
                                                              type:
                                                                  DigitButtonType
                                                                      .tertiary,
                                                              size:
                                                                  DigitButtonSize
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
                                  localizations.translate(
                                      beneficiaryDetailsTemplate?.label ??
                                          i18.beneficiaryDetails
                                              .beneficiarysDetailsLabelText),
                                  style: textTheme.headingXl.copyWith(
                                      color: theme.colorTheme.primary.primary2),
                                ),
                                if (beneficiaryDetailsTemplate?.description !=
                                        null &&
                                    (beneficiaryDetailsTemplate?.description ??
                                            '')
                                        .isNotEmpty)
                                  Text(
                                    localizations.translate(
                                        beneficiaryDetailsTemplate
                                                ?.description ??
                                            ''),
                                    style: textTheme.bodyS.copyWith(
                                      color: theme.colorTheme.text.secondary,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                if (beneficiaryDetailsTemplate
                                        ?.properties?[registration_keys
                                            .beneficiaryDetailsKeys
                                            .detailsCardKey]
                                        ?.hidden !=
                                    true)
                                  DigitTableCard(
                                    element: buildEnumValueMap(
                                                HouseholdWrapper(
                                                  household:
                                                      householdMemberWrapper
                                                          .first.household,
                                                  headOfHousehold:
                                                      RegistrationDeliverySingleton()
                                                                  .beneficiaryType !=
                                                              BeneficiaryType
                                                                  .individual
                                                          ? householdMemberWrapper
                                                              .first
                                                              .headOfHousehold
                                                          : state
                                                              .selectedIndividual,
                                                  tasks: householdMemberWrapper
                                                      .first.tasks,
                                                  projectBeneficiaries:
                                                      householdMemberWrapper
                                                          .first
                                                          .projectBeneficiaries,
                                                  sideEffects:
                                                      householdMemberWrapper
                                                          .first.sideEffects,
                                                  referrals:
                                                      householdMemberWrapper
                                                          .first.referrals,
                                                ),
                                                beneficiaryDetailsTemplate
                                                    ?.properties?[registration_keys
                                                        .beneficiaryDetailsKeys
                                                        .detailsCardKey]
                                                    ?.enums)
                                            ?.map((k, v) => MapEntry(
                                                localizations.translate(k),
                                                localizations.translate(
                                                    v.toString()))) ??
                                        {
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
                                                  .first
                                                  .headOfHousehold
                                                  ?.name
                                                  ?.givenName
                                              : state.selectedIndividual?.name
                                                      ?.givenName ??
                                                  '--',
                                          localizations.translate(
                                            i18.deliverIntervention.idTypeText,
                                          ): () {
                                            final identifiers =
                                                RegistrationDeliverySingleton()
                                                            .beneficiaryType !=
                                                        BeneficiaryType
                                                            .individual
                                                    ? householdMemberWrapper
                                                        .first
                                                        .headOfHousehold
                                                        ?.identifiers
                                                    : state.selectedIndividual
                                                        ?.identifiers;
                                            if (identifiers == null ||
                                                identifiers.isEmpty) {
                                              return '--';
                                            }

                                            return localizations.translate(
                                                identifiers
                                                        .first.identifierType ??
                                                    '--');
                                          }(),
                                          localizations.translate(
                                            i18.deliverIntervention
                                                .idNumberText,
                                          ): () {
                                            final identifiers =
                                                RegistrationDeliverySingleton()
                                                            .beneficiaryType !=
                                                        BeneficiaryType
                                                            .individual
                                                    ? householdMemberWrapper
                                                        .first
                                                        .headOfHousehold
                                                        ?.identifiers
                                                    : state.selectedIndividual
                                                        ?.identifiers;
                                            if (identifiers == null ||
                                                identifiers.isEmpty) {
                                              return '--';
                                            }

                                            return maskString(identifiers
                                                .first.identifierId
                                                .toString());
                                          }(),
                                          localizations.translate(
                                            i18.common.coreCommonAge,
                                          ): () {
                                            final dob =
                                                RegistrationDeliverySingleton()
                                                            .beneficiaryType !=
                                                        BeneficiaryType
                                                            .individual
                                                    ? householdMemberWrapper
                                                        .first
                                                        .headOfHousehold
                                                        ?.dateOfBirth
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
                                              ? householdMemberWrapper
                                                  .first
                                                  .headOfHousehold
                                                  ?.gender
                                                  ?.name
                                                  .sentenceCase
                                              : state.selectedIndividual?.gender
                                                      ?.name.sentenceCase ??
                                                  '--',
                                          localizations.translate(
                                            i18.common.coreCommonMobileNumber,
                                          ): RegistrationDeliverySingleton()
                                                      .beneficiaryType !=
                                                  BeneficiaryType.individual
                                              ? householdMemberWrapper.first
                                                  .headOfHousehold?.mobileNumber
                                              : state.selectedIndividual
                                                      ?.mobileNumber ??
                                                  '--',
                                          localizations.translate(i18
                                              .deliverIntervention
                                              .dateOfRegistrationLabel): () {
                                            final date = projectBeneficiary
                                                ?.first?.dateOfRegistration;

                                            final registrationDate = DateTime
                                                .fromMillisecondsSinceEpoch(
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
                                  .isNotEmpty &&
                              (beneficiaryDetailsTemplate
                                      ?.properties?[registration_keys
                                          .beneficiaryDetailsKeys.tableCardKey]
                                      ?.hidden !=
                                  true) &&
                              (deliverState?.hasCycleArrived == true ||
                                  (pastCycles ?? []).isNotEmpty))
                            DigitCard(
                                margin: const EdgeInsets.all(spacer2),
                                children: RegistrationDeliverySingleton()
                                                .projectType
                                                ?.cycles !=
                                            null &&
                                        (beneficiaryDetailsTemplate
                                                ?.properties?[registration_keys
                                                    .beneficiaryDetailsKeys
                                                    .tableCardKey]
                                                ?.hidden !=
                                            true)
                                    ? [
                                        BlocBuilder<RegistrationWrapperBloc,
                                            RegistrationWrapperState>(
                                          builder: (context, deliverState) {
                                            return Column(
                                              children: [
                                                (RegistrationDeliverySingleton()
                                                                    .projectType
                                                                    ?.cycles ??
                                                                [])
                                                            .isNotEmpty &&
                                                        (beneficiaryDetailsTemplate
                                                                ?.properties?[
                                                                    registration_keys
                                                                        .beneficiaryDetailsKeys
                                                                        .tableCardKey]
                                                                ?.hidden !=
                                                            true)
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
