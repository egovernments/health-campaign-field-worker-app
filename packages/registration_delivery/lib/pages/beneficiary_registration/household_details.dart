import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/household.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseHoldDetailsPage extends LocalizedStatefulWidget {
  const HouseHoldDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseHoldDetailsPage> createState() => HouseHoldDetailsPageState();
}

class HouseHoldDetailsPageState extends LocalizedState<HouseHoldDetailsPage> {
  static const _dateOfRegistrationKey = 'dateOfRegistration';
  static const _memberCountKey = 'memberCount';
  static const _pregnantWomenCountKey = 'pregnantWomenCount';
  static const _childrenCountKey = 'childrenCount';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) {
          int pregnantWomen = form.control(_pregnantWomenCountKey).value;
          int children = form.control(_childrenCountKey).value;
          return BlocConsumer<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            listener: (context, state) {
              if (state is BeneficiaryRegistrationPersistedState &&
                  state.isEdit) {
                final overviewBloc = context.read<HouseholdOverviewBloc>();

                overviewBloc.add(
                  HouseholdOverviewReloadEvent(
                    projectId:
                        RegistrationDeliverySingleton().projectId.toString(),
                    projectBeneficiaryType:
                        RegistrationDeliverySingleton().beneficiaryType ??
                            BeneficiaryType.household,
                  ),
                );
                HouseholdMemberWrapper memberWrapper =
                    overviewBloc.state.householdMemberWrapper;
                final route = router.parent() as StackRouter;
                route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
              }
            },
            builder: (context, registrationState) {
              return ScrollableContent(
                header: const Column(children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                    showcaseButton: ShowcaseButton(),
                  ),
                ]),
                enableFixedDigitButton: true,
                footer: DigitCard(
                    margin: const EdgeInsets.only(top: spacer2),
                    children: [
                      DigitButton(
                        label: registrationState.mapOrNull(
                              editHousehold: (value) => localizations
                                  .translate(i18.common.coreCommonSave),
                            ) ??
                            localizations
                                .translate(i18.householdDetails.actionLabel),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () {
                          form.markAllAsTouched();
                          if (!form.valid) return;

                          final memberCount =
                              form.control(_memberCountKey).value as int;

                          final dateOfRegistration = form
                              .control(_dateOfRegistrationKey)
                              .value as DateTime;
                          //[TODO: Use pregnant women form value based on project config
                          final pregnantWomen =
                              form.control(_pregnantWomenCountKey).value as int;
                          final children =
                              form.control(_childrenCountKey).value as int;

                          if (memberCount < (pregnantWomen + children)) {
                            Toast.showToast(context,
                                message: localizations.translate(
                                    i18.householdDetails.memberCountError),
                                type: ToastType.error);
                          } else {
                            registrationState.maybeWhen(
                              orElse: () {
                                return;
                              },
                              create: (
                                addressModel,
                                householdModel,
                                individualModel,
                                projectBeneficiaryModel,
                                registrationDate,
                                searchQuery,
                                loading,
                                isHeadOfHousehold,
                              ) {
                                var household = householdModel;
                                household ??= HouseholdModel(
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  clientReferenceId:
                                      householdModel?.clientReferenceId ??
                                          IdGen.i.identifier,
                                  rowVersion: 1,
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                );

                                household = household.copyWith(
                                    rowVersion: 1,
                                    tenantId: RegistrationDeliverySingleton()
                                        .tenantId,
                                    clientReferenceId:
                                        householdModel?.clientReferenceId ??
                                            IdGen.i.identifier,
                                    memberCount: memberCount,
                                    clientAuditDetails: ClientAuditDetails(
                                      createdBy: RegistrationDeliverySingleton()
                                          .loggedInUserUuid
                                          .toString(),
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                      lastModifiedBy:
                                          RegistrationDeliverySingleton()
                                              .loggedInUserUuid
                                              .toString(),
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    auditDetails: AuditDetails(
                                      createdBy: RegistrationDeliverySingleton()
                                          .loggedInUserUuid
                                          .toString(),
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                      lastModifiedBy:
                                          RegistrationDeliverySingleton()
                                              .loggedInUserUuid
                                              .toString(),
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    address: addressModel,
                                    additionalFields: HouseholdAdditionalFields(
                                        version: 1,
                                        fields: [
                                          //[TODO: Use pregnant women form value based on project config
                                          ...?householdModel
                                              ?.additionalFields?.fields
                                              .where((e) =>
                                                  e.key !=
                                                      AdditionalFieldsType
                                                          .pregnantWomen
                                                          .toValue() &&
                                                  e.key !=
                                                      AdditionalFieldsType
                                                          .children
                                                          .toValue()),
                                          AdditionalField(
                                            AdditionalFieldsType.pregnantWomen
                                                .toValue(),
                                            pregnantWomen,
                                          ),
                                          AdditionalField(
                                            AdditionalFieldsType.children
                                                .toValue(),
                                            children,
                                          )
                                        ]));

                                bloc.add(
                                  BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                                    household: household,
                                    registrationDate: dateOfRegistration,
                                  ),
                                );
                                context.router.push(
                                  IndividualDetailsRoute(
                                      isHeadOfHousehold: true),
                                );
                              },
                              editHousehold: (
                                addressModel,
                                householdModel,
                                individuals,
                                registrationDate,
                                projectBeneficiaryModel,
                                loading,
                                isHeadOfHousehold,
                              ) {
                                var household = householdModel.copyWith(
                                    memberCount: memberCount,
                                    address: addressModel,
                                    clientAuditDetails: (householdModel
                                                    .clientAuditDetails
                                                    ?.createdBy !=
                                                null &&
                                            householdModel.clientAuditDetails
                                                    ?.createdTime !=
                                                null)
                                        ? ClientAuditDetails(
                                            createdBy: householdModel
                                                .clientAuditDetails!.createdBy,
                                            createdTime: householdModel
                                                .clientAuditDetails!
                                                .createdTime,
                                            lastModifiedBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid,
                                            lastModifiedTime: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          )
                                        : null,
                                    rowVersion: householdModel.rowVersion,
                                    additionalFields: HouseholdAdditionalFields(
                                        version: householdModel
                                                .additionalFields?.version ??
                                            1,
                                        fields: [
                                          //[TODO: Use pregnant women form value based on project config
                                          ...?householdModel
                                              .additionalFields?.fields
                                              .where((e) =>
                                                  e.key !=
                                                      AdditionalFieldsType
                                                          .pregnantWomen
                                                          .toValue() &&
                                                  e.key !=
                                                      AdditionalFieldsType
                                                          .children
                                                          .toValue()),
                                          AdditionalField(
                                            AdditionalFieldsType.pregnantWomen
                                                .toValue(),
                                            pregnantWomen,
                                          ),
                                          AdditionalField(
                                            AdditionalFieldsType.children
                                                .toValue(),
                                            children,
                                          )
                                        ]));

                                bloc.add(
                                  BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                                    household: household.copyWith(
                                      clientAuditDetails: (addressModel
                                                      .clientAuditDetails
                                                      ?.createdBy !=
                                                  null &&
                                              addressModel.clientAuditDetails
                                                      ?.createdTime !=
                                                  null)
                                          ? ClientAuditDetails(
                                              createdBy: addressModel
                                                  .clientAuditDetails!
                                                  .createdBy,
                                              createdTime: addressModel
                                                  .clientAuditDetails!
                                                  .createdTime,
                                              lastModifiedBy:
                                                  RegistrationDeliverySingleton()
                                                      .loggedInUserUuid,
                                              lastModifiedTime: context
                                                  .millisecondsSinceEpoch(),
                                            )
                                          : null,
                                    ),
                                    addressModel: addressModel.copyWith(
                                      clientAuditDetails: (addressModel
                                                      .clientAuditDetails
                                                      ?.createdBy !=
                                                  null &&
                                              addressModel.clientAuditDetails
                                                      ?.createdTime !=
                                                  null)
                                          ? ClientAuditDetails(
                                              createdBy: addressModel
                                                  .clientAuditDetails!
                                                  .createdBy,
                                              createdTime: addressModel
                                                  .clientAuditDetails!
                                                  .createdTime,
                                              lastModifiedBy:
                                                  RegistrationDeliverySingleton()
                                                      .loggedInUserUuid,
                                              lastModifiedTime: context
                                                  .millisecondsSinceEpoch(),
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ]),
                slivers: [
                  SliverToBoxAdapter(
                    child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
                        children: [
                      DigitTextBlock(
                        padding: const EdgeInsets.all(0),
                        heading: localizations.translate(
                          i18.householdDetails.householdDetailsLabel,
                        ),
                        description: localizations.translate(
                          i18.householdDetails.householdDetailsDescription,
                        ),
                      ),
                      householdDetailsShowcaseData.dateOfRegistration.buildWith(
                        child: ReactiveWrapperField(
                          formControlName: _dateOfRegistrationKey,
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.householdDetails.dateOfRegistrationLabel,
                            ),
                            child: DigitDateFormInput(
                              readOnly: true,
                              confirmText: localizations.translate(
                                i18.common.coreCommonOk,
                              ),
                              cancelText: localizations.translate(
                                i18.common.coreCommonCancel,
                              ),
                              initialValue:
                                  DateFormat(Constants().dateMonthYearFormat)
                                      .format(form
                                          .control(_dateOfRegistrationKey)
                                          .value)
                                      .toString(),
                            ),
                          ),
                        ),
                      ),
                      //[TODO: Use pregnant women form value based on project config
                      householdDetailsShowcaseData
                          .numberOfPregnantWomenInHousehold
                          .buildWith(
                        child: ReactiveWrapperField(
                          formControlName: _pregnantWomenCountKey,
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.householdDetails.noOfPregnantWomenCountLabel,
                            ),
                            child: DigitNumericFormInput(
                              minValue: 0,
                              maxValue: 10,
                              step: 1,
                              initialValue: form
                                  .control(_pregnantWomenCountKey)
                                  .value
                                  .toString(),
                              onChange: (value) {
                                form.control(_pregnantWomenCountKey).value =
                                    int.parse(value);
                                int pregnantWomen =
                                    form.control(_pregnantWomenCountKey).value;
                                int children =
                                    form.control(_childrenCountKey).value;
                                int memberCount =
                                    form.control(_memberCountKey).value;
                                form.control(_memberCountKey).value =
                                    memberCount < (children + pregnantWomen)
                                        ? children + pregnantWomen
                                        : memberCount;
                              },
                            ),
                          ),
                        ),
                      ),
                      householdDetailsShowcaseData
                          .numberOfChildrenBelow5InHousehold
                          .buildWith(
                        child: ReactiveWrapperField(
                          formControlName: _childrenCountKey,
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.householdDetails.noOfChildrenBelow5YearsLabel,
                            ),
                            child: DigitNumericFormInput(
                              minValue: 0,
                              maxValue: 20,
                              step: 1,
                              initialValue: form
                                  .control(_childrenCountKey)
                                  .value
                                  .toString(),
                              onChange: (value) {
                                form.control(_childrenCountKey).value =
                                    int.parse(value);
                                int pregnantWomen =
                                    form.control(_pregnantWomenCountKey).value;
                                int children =
                                    form.control(_childrenCountKey).value;
                                int memberCount =
                                    form.control(_memberCountKey).value;
                                form.control(_memberCountKey).value =
                                    memberCount <= (children + pregnantWomen)
                                        ? children + pregnantWomen
                                        : memberCount;
                              },
                            ),
                          ),
                        ),
                      ),
                      householdDetailsShowcaseData
                          .numberOfMembersLivingInHousehold
                          .buildWith(
                        child: ReactiveWrapperField(
                          formControlName: _memberCountKey,
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.householdDetails.noOfMembersCountLabel,
                            ),
                            child: DigitNumericFormInput(
                              minValue: children + pregnantWomen != 0
                                  ? children + pregnantWomen
                                  : 1,
                              maxValue: 30,
                              step: 1,
                              initialValue: form
                                  .control(_memberCountKey)
                                  .value
                                  .toString(),
                              onChange: (value) {
                                form.control(_memberCountKey).value =
                                    int.parse(value);
                                int pregnantWomen =
                                    form.control(_pregnantWomenCountKey).value;
                                int children =
                                    form.control(_childrenCountKey).value;
                                int memberCount =
                                    form.control(_memberCountKey).value;
                                if (memberCount <= pregnantWomen + children) {
                                  form.control(_memberCountKey).value =
                                      (children + pregnantWomen);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ]),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(editHousehold: (value) {
      return value.householdModel;
    }, create: (value) {
      return value.householdModel;
    });

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
          FormControl<DateTime>(value: registrationDate, validators: []),
      _memberCountKey: FormControl<int>(
        value: household?.memberCount ?? 1,
      ),
      _pregnantWomenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
                    .where((h) =>
                        h.key == AdditionalFieldsType.pregnantWomen.toValue())
                    .firstOrNull
                    ?.value !=
                null
            ? int.tryParse(household?.additionalFields?.fields
                    .where((h) =>
                        h.key == AdditionalFieldsType.pregnantWomen.toValue())
                    .firstOrNull
                    ?.value
                    .toString() ??
                '0')
            : 0,
      ),
      _childrenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value !=
                null
            ? int.tryParse(household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value
                    .toString() ??
                '0')
            : 0,
      )
    });
  }
}
