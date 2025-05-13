import 'package:auto_route/auto_route.dart';

import 'package:registration/widgets/table_card/table_card.dart';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:registration/blocs/app_localization.dart';
import 'package:registration/blocs/household_overview/household_overview.dart';
import '../../blocs/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

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

          // Building the table content based on the DeliverInterventionState

          return BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariantsValue) {
                  return Scaffold(
                    body: ScrollableContent(
                      header: const Column(children: [
                        BackNavigationHelpHeaderWidget(),
                      ]),
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

                                    return localizations.translate(
                                        identifiers.first.identifierType ??
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

                                    return maskString(identifiers
                                        .first.identifierId
                                        .toString());
                                  }(),
                                  localizations.translate(
                                    i18.common.coreCommonAge,
                                  ): () {
                                    final dob = RegistrationDeliverySingleton()
                                                .beneficiaryType !=
                                            BeneficiaryType.individual
                                        ? householdMemberWrapper
                                            .headOfHousehold?.dateOfBirth
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
                                          DateTime.now().millisecondsSinceEpoch,
                                    );

                                    return DateFormat('dd MMMM yyyy')
                                        .format(registrationDate);
                                  }(),
                                },
                              ),
                            ]),
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
