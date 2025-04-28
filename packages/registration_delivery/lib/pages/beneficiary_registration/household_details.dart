import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/models/entities/beneficiary_checklist_enums.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:survey_form/blocs/service.dart';
import 'package:survey_form/models/entities/service.dart';
import 'package:survey_form/pages/survey_form_view.dart';

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

  // Define controllers
  final TextEditingController _pregnantWomenController =
      TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();

  final checklistKey = GlobalKey<SurveyFormViewPageState>();

  @override
  void dispose() {
    _pregnantWomenController.dispose();
    _childrenController.dispose();
    _memberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);
    final bool isCommunity = RegistrationDeliverySingleton().householdType ==
        HouseholdType.community;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) {
          int pregnantWomen = form.control(_pregnantWomenCountKey).value;
          int children = form.control(_childrenCountKey).value;
          int memberCount = form.control(_memberCountKey).value;
          // Get household type
          final bool isCommunity =
              RegistrationDeliverySingleton().householdType ==
                  HouseholdType.community;
          if (isCommunity) {
            _pregnantWomenController.text =
                form.control(_pregnantWomenCountKey).value.toString();
            _childrenController.text =
                form.control(_childrenCountKey).value.toString();
            _memberController.text =
                form.control(_memberCountKey).value.toString();
          }
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
                header: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: spacer2),
                    child: BackNavigationHelpHeaderWidget(
                      showHelp: false,
                      showcaseButton: ShowcaseButton(
                        isCommunity: isCommunity,
                      ),
                    ),
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

                          bool validForm =
                              RegistrationDeliverySingleton().householdType ==
                                      HouseholdType.family
                                  ? checklistKey.currentState
                                          ?.validateSurveyForm() ??
                                      false
                                  : true;

                          if (validForm == false) return;

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
                                parentClientReferenceId,
                                registrationDate,
                                searchQuery,
                                loading,
                                isHeadOfHousehold,
                                householdChecklists,
                                individualChecklists,
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
                                if (RegistrationDeliverySingleton()
                                        .householdType ==
                                    HouseholdType.family) {
                                  checklistKey.currentState?.draftSurvey(
                                      latitude: addressModel?.latitude,
                                      longitude: addressModel?.longitude,
                                      relatedReferenceId:
                                          householdModel?.clientReferenceId ??
                                              IdGen.i.identifier);
                                }

                                bloc.add(
                                  BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                                    household: household,
                                    registrationDate: dateOfRegistration,
                                  ),
                                );

                                context.read<ServiceBloc>().add(
                                      ServiceSearchEvent(
                                        serviceSearchModel: ServiceSearchModel(
                                          referenceIds: [
                                            householdModel?.clientReferenceId ??
                                                ""
                                          ],
                                        ),
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
                                parentClientReferenceId,
                                projectBeneficiaryModel,
                                loading,
                                isHeadOfHousehold,
                                householdChecklists,
                                individualChecklists,
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

                                checklistKey.currentState?.updateSurvey(
                                  latitude: addressModel.latitude,
                                  longitude: addressModel.longitude,
                                );

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
                            padding: EdgeInsets.zero,
                            heading: (isCommunity)
                                ? localizations.translate(
                                    i18.householdDetails.clfDetailsLabel,
                                  )
                                : localizations.translate(
                                    i18.householdDetails.householdDetailsLabel,
                                  ),
                            headingStyle: textTheme.headingXl.copyWith(
                                color: theme.colorTheme.primary.primary2),
                            description: localizations.translate(
                              i18.householdDetails.householdDetailsDescription,
                            ),
                          ),
                          householdDetailsShowcaseData.dateOfRegistration
                              .buildWith(
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
                                  initialValue: DateFormat(
                                          Constants().dateMonthYearFormat)
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
                                label: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? localizations.translate(
                                        i18.householdDetails
                                            .noOfPregnantWomenCountCLFLabel,
                                      )
                                    : localizations.translate(
                                        i18.householdDetails
                                            .noOfPregnantWomenCountLabel,
                                      ),
                                child: DigitNumericFormInput(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  minValue: 0,
                                  maxValue: !isCommunity ? 10 : 100000,
                                  maxLength: 5,
                                  step: 1,
                                  editable: isCommunity,
                                  controller: isCommunity
                                      ? _pregnantWomenController
                                      : null,
                                  initialValue: isCommunity
                                      ? null
                                      : form
                                          .control(_pregnantWomenCountKey)
                                          .value
                                          .toString(),
                                  onChange: (value) {
                                    setState(() {});
                                    if (value.isEmpty) {
                                      _pregnantWomenController.text = '0';
                                      form
                                          .control(_pregnantWomenCountKey)
                                          .value = 0;
                                    } else {
                                      // Remove leading zeros
                                      String newValue = value;

                                      // Remove leading zeros only if the length is greater than 1
                                      if (newValue.length > 1 && isCommunity) {
                                        newValue = newValue.replaceFirst(
                                            RegExp(r'^0+'), '');
                                        // If the value becomes empty after removing zeros, set it to "0"
                                        if (newValue.isEmpty) {
                                          newValue = '0';
                                        }
                                      }
                                      _pregnantWomenController.text = newValue;
                                      form
                                          .control(_pregnantWomenCountKey)
                                          .value = int.parse(newValue);
                                      int pregnantWomen = form
                                          .control(_pregnantWomenCountKey)
                                          .value;
                                      int children =
                                          form.control(_childrenCountKey).value;
                                      int memberCount =
                                          form.control(_memberCountKey).value;
                                      form.control(_memberCountKey).value =
                                          memberCount <
                                                  (children + pregnantWomen)
                                              ? children + pregnantWomen
                                              : memberCount;
                                      _memberController.text = (memberCount <
                                                  (children + pregnantWomen)
                                              ? children + pregnantWomen
                                              : memberCount)
                                          .toString();
                                    }
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
                                label: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? localizations.translate(
                                        i18.householdDetails
                                            .noOfChildrenBelow5YearsCLFLabel,
                                      )
                                    : localizations.translate(
                                        i18.householdDetails
                                            .noOfChildrenBelow5YearsLabel,
                                      ),
                                child: DigitNumericFormInput(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  minValue: 0,
                                  maxValue: !isCommunity ? 20 : 100000,
                                  maxLength: 5,
                                  step: 1,
                                  editable: isCommunity,
                                  controller:
                                      isCommunity ? _childrenController : null,
                                  initialValue: isCommunity
                                      ? null
                                      : form
                                          .control(_childrenCountKey)
                                          .value
                                          .toString(),
                                  onChange: (value) {
                                    if (value.isEmpty) {
                                      _childrenController.text = '0';
                                      form.control(_childrenCountKey).value = 0;
                                      return;
                                    }
                                    setState(() {});
                                    // Remove leading zeros
                                    String newValue = value;

                                    // Remove leading zeros only if the length is greater than 1
                                    if (newValue.length > 1 && isCommunity) {
                                      newValue = newValue.replaceFirst(
                                          RegExp(r'^0+'), '');
                                      // If the value becomes empty after removing zeros, set it to "0"
                                      if (newValue.isEmpty) {
                                        newValue = '0';
                                      }
                                    }
                                    _childrenController.text = newValue;
                                    form.control(_childrenCountKey).value =
                                        int.parse(newValue);
                                    int pregnantWomen = form
                                        .control(_pregnantWomenCountKey)
                                        .value;
                                    int children =
                                        form.control(_childrenCountKey).value;
                                    int memberCount =
                                        form.control(_memberCountKey).value;
                                    form.control(_memberCountKey).value =
                                        memberCount <=
                                                (children + pregnantWomen)
                                            ? children + pregnantWomen
                                            : memberCount;
                                    _memberController.text = (memberCount <=
                                                (children + pregnantWomen)
                                            ? children + pregnantWomen
                                            : memberCount)
                                        .toString();
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
                                label: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? localizations.translate(
                                        i18.householdDetails
                                            .noOfMembersCountCLFLabel,
                                      )
                                    : localizations.translate(
                                        i18.householdDetails
                                            .noOfMembersCountLabel,
                                      ),
                                child: DigitNumericFormInput(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  minValue: form
                                                  .control(_childrenCountKey)
                                                  .value +
                                              form
                                                  .control(
                                                      _pregnantWomenCountKey)
                                                  .value !=
                                          0
                                      ? form.control(_childrenCountKey).value +
                                          form
                                              .control(_pregnantWomenCountKey)
                                              .value
                                      : 1,
                                  maxValue: !isCommunity ? 30 : 1000000,
                                  maxLength: 5,
                                  step: 1,
                                  editable: isCommunity,
                                  controller:
                                      isCommunity ? _memberController : null,
                                  initialValue: isCommunity
                                      ? null
                                      : form
                                          .control(_memberCountKey)
                                          .value
                                          .toString(),
                                  onChange: (value) {
                                    if (value.isEmpty) {
                                      _memberController.text = '1';
                                      form.control(_memberCountKey).value = 1;
                                      return;
                                    }
                                    // Remove leading zeros
                                    String newValue = value;

                                    if (value == '0' && isCommunity) {
                                      newValue = '1';
                                    }
                                    _memberController.text = newValue;
                                    form.control(_memberCountKey).value =
                                        int.parse(newValue);
                                    int pregnantWomen = form
                                        .control(_pregnantWomenCountKey)
                                        .value;
                                    int children =
                                        form.control(_childrenCountKey).value;
                                    int memberCount =
                                        form.control(_memberCountKey).value;
                                    if (memberCount <=
                                        pregnantWomen + children) {
                                      form.control(_memberCountKey).value =
                                          (children + pregnantWomen);
                                      _memberController.text =
                                          (children + pregnantWomen).toString();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (RegistrationDeliverySingleton().householdType ==
                              HouseholdType.family)
                            SurveyFormViewPage(
                              key: checklistKey,
                              hideFooter: true,
                              hideHeader: true,
                              checklistType:
                                  BeneficiaryChecklistEnums.household.toValue(),
                              hideBackAlert: true,
                              useScaffold: false,
                              initialService: registrationState
                                  .householdChecklists?.firstOrNull,
                            )
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
