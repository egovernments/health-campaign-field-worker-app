import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/showcase/showcase_button.dart';

import '../../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/search_households/search_bloc_common_wrapper.dart';
import '../blocs/search_households/search_households.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

@RoutePage()
class SummaryPage extends LocalizedStatefulWidget {
  const SummaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SummaryPage> createState() => SummaryPageState();
}

class SummaryPageState extends LocalizedState<SummaryPage> {
  final clickedStatus = ValueNotifier<bool>(false);

  String getLocalizedMessage(String code) {
    return localizations.translate(code);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) {
        context.read<BeneficiaryRegistrationBloc>().add(
              BeneficiaryRegistrationCreateEvent(
                projectId: RegistrationDeliverySingleton().projectId!,
                userUuid: RegistrationDeliverySingleton().loggedInUserUuid!,
                boundary: RegistrationDeliverySingleton().boundary!,
              ),
            );
      },
      child: Scaffold(
          body: BlocConsumer<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
        listener: (context, householdState) {
          final router = context.router;
          householdState.mapOrNull(
            persisted: (value) {
              if (value.navigateToRoot) {
                (router.parent() as StackRouter).maybePop();
              } else {
                router.popUntil((route) =>
                    route.settings.name == SearchBeneficiaryRoute.name);
                context.read<SearchBlocWrapper>().searchHouseholdsBloc.add(
                      SearchHouseholdsEvent.searchByHousehold(
                        householdModel: value.householdModel,
                        projectId: RegistrationDeliverySingleton().projectId!,
                        isProximityEnabled: false,
                      ),
                    );
                router.push(BeneficiaryAcknowledgementRoute(
                  enableViewHousehold: true,
                ));
              }
            },
          );
        },
        builder: (context, householdState) {
          return ScrollableContent(
              enableFixedButton: true,
              header: Column(children: [
                const BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: kPadding, left: kPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.translate(
                        i18.common.coreCommonSummaryDetails,
                      ),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.displayMedium,
                    ),
                  ),
                ),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: ValueListenableBuilder(
                  valueListenable: clickedStatus,
                  builder: (context, bool isClicked, _) {
                    return DigitElevatedButton(
                      onPressed: isClicked
                          ? null
                          : () async {
                              final bloc =
                                  context.read<BeneficiaryRegistrationBloc>();
                              final userId = RegistrationDeliverySingleton()
                                  .loggedInUserUuid;
                              final projectId =
                                  RegistrationDeliverySingleton().projectId;

                              householdState.maybeWhen(
                                orElse: () {
                                  return;
                                },
                                summary: (
                                  navigateToRoot,
                                  householdModel,
                                  individualModel,
                                  projectBeneficiaryModel,
                                  registrationDate,
                                  addressModel,
                                  selectedClosedHouseholdID,
                                  loading,
                                  isHeadOfHousehold,
                                ) async {
                                  final submit = await DigitDialog.show<bool>(
                                    context,
                                    options: DigitDialogOptions(
                                      titleText: localizations.translate(
                                        i18.deliverIntervention.dialogTitle,
                                      ),
                                      contentText: localizations.translate(
                                        i18.deliverIntervention.dialogContent,
                                      ),
                                      primaryAction: DigitDialogActions(
                                        label: localizations.translate(
                                          i18.common.coreCommonSubmit,
                                        ),
                                        action: (context) {
                                          clickedStatus.value = true;
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop(true);
                                        },
                                      ),
                                      secondaryAction: DigitDialogActions(
                                        label: localizations.translate(
                                          i18.common.coreCommonCancel,
                                        ),
                                        action: (context) => Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).pop(false),
                                      ),
                                    ),
                                  );

                                  if (submit ?? false) {
                                    if (context.mounted) {
                                      bloc.add(
                                        BeneficiaryRegistrationCreateEvent(
                                            projectId: projectId!,
                                            userUuid: userId!,
                                            boundary:
                                                RegistrationDeliverySingleton()
                                                    .boundary!,
                                            tag: projectBeneficiaryModel?.tag,
                                            navigateToSummary: false),
                                      );
                                      if (selectedClosedHouseholdID != null &&
                                          householdModel != null) {
                                        context.read<ClosedHouseholdBloc>().add(
                                            ClosedHouseholdEvent.handleUpdate(
                                                selectedClosedHouseholdID,
                                                householdModel
                                                    .clientReferenceId));
                                      }
                                    }
                                  }
                                },
                              );
                            },
                      child: Center(
                        child: Text(
                          householdState.mapOrNull(
                                editIndividual: (value) => localizations
                                    .translate(i18.common.coreCommonSave),
                              ) ??
                              localizations
                                  .translate(i18.common.coreCommonSubmit),
                        ),
                      ),
                    );
                  },
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      DigitCard(
                        child: LabelValueList(
                            heading: localizations.translate(i18
                                .householdLocation.householdLocationLabelText),
                            withDivider: true,
                            items: [
                              LabelValuePair(
                                  label: localizations.translate(
                                      i18.householdLocation.villageLabel),
                                  value: householdState.householdModel?.address
                                          ?.locality?.code
                                          .split('_')
                                          .last
                                          .toString()
                                          .titleCase ??
                                      localizations
                                          .translate(i18.common.coreCommonNA),
                                  isInline: true),
                              LabelValuePair(
                                  label: localizations.translate(
                                      i18.householdLocation.landmarkFormLabel),
                                  value: householdState
                                          .householdModel?.address?.landmark ??
                                      localizations
                                          .translate(i18.common.coreCommonNA),
                                  isInline: true),
                            ]),
                      ),
                      DigitCard(
                        child: LabelValueList(
                            heading: localizations.translate(
                                i18.householdDetails.householdDetailsLabel),
                            withDivider: true,
                            items: [
                              LabelValuePair(
                                  label: localizations.translate(
                                      i18.beneficiaryDetails.totalMembers),
                                  value: householdState
                                          .householdModel?.memberCount
                                          .toString() ??
                                      '0',
                                  isInline: true),
                              LabelValuePair(
                                  label: localizations.translate(i18
                                      .householdDetails
                                      .noOfPregnantWomenCountLabel),
                                  value: householdState.householdModel
                                          ?.additionalFields?.fields
                                          .where((h) =>
                                              h.key ==
                                              AdditionalFieldsType.pregnantWomen
                                                  .toValue())
                                          .firstOrNull
                                          ?.value
                                          .toString() ??
                                      '0',
                                  isInline: true),
                              LabelValuePair(
                                  label: localizations.translate(i18
                                      .householdDetails
                                      .noOfChildrenBelow5YearsLabel),
                                  value: householdState.householdModel
                                          ?.additionalFields?.fields
                                          .where((h) =>
                                              h.key ==
                                              AdditionalFieldsType.children
                                                  .toValue())
                                          .firstOrNull
                                          ?.value
                                          .toString() ??
                                      '0',
                                  isInline: true),
                            ]),
                      ),
                      DigitCard(
                        child: LabelValueList(
                            heading: localizations.translate(
                                i18.householdDetails.houseDetailsLabel),
                            withDivider: true,
                            items: [
                              LabelValuePair(
                                  label: localizations.translate(
                                      i18.householdDetails.noOfRoomsLabel),
                                  value: householdState.householdModel
                                          ?.additionalFields?.fields
                                          .where((h) =>
                                              h.key ==
                                              AdditionalFieldsType.noOfRooms
                                                  .toValue())
                                          .firstOrNull
                                          ?.value
                                          .toString() ??
                                      '0',
                                  isInline: true),
                              LabelValuePair(
                                  label: localizations.translate(
                                      i18.householdDetails.typeOfStructure),
                                  value: (householdState.householdModel
                                              ?.additionalFields?.fields
                                              .where((h) =>
                                                  h.key ==
                                                  AdditionalFieldsType
                                                      .houseStructureTypes
                                                      .toValue())
                                              .firstOrNull
                                              ?.value ??
                                          [])
                                      .toString()
                                      .split('|')
                                      .map((item) => getLocalizedMessage(item))
                                      .toList()
                                      .join(', '),
                                  isInline: true),
                            ]),
                      ),
                      DigitCard(
                        child: LabelValueList(
                            heading: localizations.translate(i18
                                .individualDetails.individualsDetailsLabelText),
                            withDivider: true,
                            items: [
                              LabelValuePair(
                                label: localizations.translate(
                                    i18.individualDetails.nameLabelText),
                                value: householdState.maybeWhen(
                                    orElse: () => localizations
                                        .translate(i18.common.coreCommonNA),
                                    summary: (
                                      navigateToRoot,
                                      householdModel,
                                      individualModel,
                                      projectBeneficiaryModel,
                                      registrationDate,
                                      addressModel,
                                      selectedClosedHouseholdID,
                                      loading,
                                      isHeadOfHousehold,
                                    ) =>
                                        individualModel?.name?.givenName ??
                                        localizations.translate(
                                            i18.common.coreCommonNA)),
                              ),
                              LabelValuePair(
                                label: localizations.translate(
                                    i18.individualDetails.dobLabelText),
                                value: householdState.maybeWhen(
                                    orElse: () => localizations
                                        .translate(i18.common.coreCommonNA),
                                    summary: (
                                      navigateToRoot,
                                      householdModel,
                                      individualModel,
                                      projectBeneficiaryModel,
                                      registrationDate,
                                      addressModel,
                                      selectedClosedHouseholdID,
                                      loading,
                                      isHeadOfHousehold,
                                    ) =>
                                        individualModel?.dateOfBirth != null
                                            ? DigitDateUtils.getFilteredDate(
                                                    DigitDateUtils
                                                            .getFormattedDateToDateTime(
                                                                individualModel
                                                                        ?.dateOfBirth ??
                                                                    '')
                                                        .toString(),
                                                    dateFormat: Constants()
                                                        .dateMonthYearFormat)
                                                .toString()
                                            : localizations.translate(
                                                i18.common.coreCommonNA)),
                              ),
                              LabelValuePair(
                                label: localizations.translate(
                                    i18.individualDetails.genderLabelText),
                                value: householdState.maybeWhen(
                                    orElse: () => localizations
                                        .translate(i18.common.coreCommonNA),
                                    summary: (
                                      navigateToRoot,
                                      householdModel,
                                      individualModel,
                                      projectBeneficiaryModel,
                                      registrationDate,
                                      addressModel,
                                      selectedClosedHouseholdID,
                                      loading,
                                      isHeadOfHousehold,
                                    ) =>
                                        individualModel?.gender != null
                                            ? localizations.translate(
                                                individualModel?.gender?.name
                                                        .toUpperCase() ??
                                                    '')
                                            : localizations.translate(
                                                i18.common.coreCommonNA)),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )
              ]);
        },
      )),
    );
  }
}
