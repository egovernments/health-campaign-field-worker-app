import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dob_picker.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/app_localization.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/beneficiary/id_count_alert.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';

@RoutePage()
class IndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<IndividualDetailsPage> createState() => IndividualDetailsPageState();
}

class IndividualDetailsPageState extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _idTypeKey = 'idType';
  static const _idNumberKey = 'idNumber';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';
  bool isDuplicateTag = false;
  static const maxLength = 200;
  final clickedStatus = ValueNotifier<bool>(false);
  DateTime now = DateTime.now();
  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

  @override
  void initState() {
    if (RegistrationDeliverySingleton()
        .idTypeOptions!
        .contains(IdentifierTypes.uniqueBeneficiaryID.toValue())) {
      context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
    }
    super.initState();
  }

  @override
  void dispose() {
    _progressDialog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    DateTime before150Years = DateTime(now.year - 150, now.month, now.day);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) => BlocConsumer<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          listener: (context, state) {
            state.mapOrNull(
              persisted: (value) async {
                if (value.navigateToRoot) {
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

                  await overviewBloc.stream.firstWhere((element) =>
                      element.loading == false &&
                      element.householdMemberWrapper.household != null);
                  HouseholdMemberWrapper memberWrapper =
                      overviewBloc.state.householdMemberWrapper;
                  final route = router.parent() as StackRouter;
                  route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                  route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
                }
              },
            );
          },
          builder: (context, state) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(children: [
                Padding(
                  padding: EdgeInsets.only(bottom: spacer2),
                  child: BackNavigationHelpHeaderWidget(
                    showHelp: false,
                  ),
                ),
              ]),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    ValueListenableBuilder(
                      valueListenable: clickedStatus,
                      builder: (context, bool isClicked, _) {
                        return DigitButton(
                          label: state.mapOrNull(
                                editIndividual: (value) => localizations
                                    .translate(i18.common.coreCommonSave),
                              ) ??
                              localizations
                                  .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () async {
                            if (form.control(_dobKey).value == null) {
                              setState(() {
                                form.control(_dobKey).setErrors({'': true});
                              });
                            }
                            if (form.control(_idTypeKey).value == null) {
                              form.control(_idTypeKey).setErrors({'': true});
                            }
                            if (form.control(_genderKey).value == null) {
                              setState(() {
                                form.control(_genderKey).setErrors({'': true});
                              });
                            }
                            final userId = RegistrationDeliverySingleton()
                                .loggedInUserUuid;
                            final projectId =
                                RegistrationDeliverySingleton().projectId;
                            form.markAllAsTouched();
                            if (!form.valid) return;
                            FocusManager.instance.primaryFocus?.unfocus();

                            state.maybeWhen(
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
                              ) async {
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                  oldIndividual: null,
                                );

                                final boundary =
                                    RegistrationDeliverySingleton().boundary;

                                bloc.add(
                                  BeneficiaryRegistrationSaveIndividualDetailsEvent(
                                    model: individual,
                                    isHeadOfHousehold: widget.isHeadOfHousehold,
                                  ),
                                );
                                final scannerBloc =
                                    context.read<DigitScannerBloc>();
                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
                                );

                                if (scannerBloc.state.duplicate) {
                                  Toast.showToast(context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error);
                                } else {
                                  clickedStatus.value = true;
                                  final scannerBloc =
                                      context.read<DigitScannerBloc>();
                                  scannerBloc.add(
                                    const DigitScannerEvent.handleScanner(),
                                  );
                                  bloc.add(
                                    BeneficiaryRegistrationSummaryEvent(
                                      projectId: projectId!,
                                      userUuid: userId!,
                                      boundary: boundary!,
                                      tag: scannerBloc.state.qrCodes.isNotEmpty
                                          ? scannerBloc.state.qrCodes.first
                                          : null,
                                    ),
                                  );
                                  router.push(SummaryRoute());
                                }
                              },
                              editIndividual: (
                                householdModel,
                                individualModel,
                                addressModel,
                                projectBeneficiaryModel,
                                loading,
                              ) {
                                final scannerBloc =
                                    context.read<DigitScannerBloc>();
                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
                                );
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                  oldIndividual: individualModel,
                                );
                                final tag = scannerBloc.state.qrCodes.isNotEmpty
                                    ? scannerBloc.state.qrCodes.first
                                    : null;

                                if (tag != null &&
                                    tag != projectBeneficiaryModel?.tag &&
                                    scannerBloc.state.duplicate) {
                                  Toast.showToast(context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error);
                                } else {
                                  bloc.add(
                                    BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                      addressModel: addressModel,
                                      householdModel: householdModel,
                                      model: individual.copyWith(
                                        clientAuditDetails: (individual
                                                        .clientAuditDetails
                                                        ?.createdBy !=
                                                    null &&
                                                individual.clientAuditDetails
                                                        ?.createdTime !=
                                                    null)
                                            ? ClientAuditDetails(
                                                createdBy: individual
                                                    .clientAuditDetails!
                                                    .createdBy,
                                                createdTime: individual
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
                                      tag: scannerBloc.state.qrCodes.isNotEmpty
                                          ? scannerBloc.state.qrCodes.first
                                          : null,
                                    ),
                                  );
                                }
                              },
                              addMember: (
                                addressModel,
                                householdModel,
                                loading,
                              ) {
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                );

                                if (context.mounted) {
                                  final scannerBloc =
                                      context.read<DigitScannerBloc>();
                                  scannerBloc.add(
                                    const DigitScannerEvent.handleScanner(),
                                  );
                                  if (scannerBloc.state.duplicate) {
                                    Toast.showToast(
                                      context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error,
                                    );
                                  } else {
                                    bloc.add(
                                      BeneficiaryRegistrationAddMemberEvent(
                                        beneficiaryType:
                                            RegistrationDeliverySingleton()
                                                .beneficiaryType!,
                                        householdModel: householdModel,
                                        individualModel: individual,
                                        addressModel: addressModel,
                                        userUuid:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid!,
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        tag: scannerBloc
                                                .state.qrCodes.isNotEmpty
                                            ? scannerBloc.state.qrCodes.first
                                            : null,
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (RegistrationDeliverySingleton()
                          .idTypeOptions!
                          .contains(
                              IdentifierTypes.uniqueBeneficiaryID.toValue()))
                        displayUniqueIdCount(theme, form),
                      DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            Text(
                              localizations.translate(
                                i18.individualDetails
                                    .individualsDetailsLabelText,
                              ),
                              style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2),
                            ),
                            Column(
                              children: [
                                individualDetailsShowcaseData.nameOfIndividual
                                    .buildWith(
                                  child: ReactiveWrapperField(
                                    formControlName: _individualNameKey,
                                    validationMessages: {
                                      'required': (object) =>
                                          localizations.translate(
                                            '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                          ),
                                      'maxLength': (object) => localizations
                                          .translate(
                                              i18.common.maxCharsRequired)
                                          .replaceAll(
                                              '{}', maxLength.toString()),
                                    },
                                    builder: (field) => LabeledField(
                                      label: localizations.translate(
                                        i18.individualDetails.nameLabelText,
                                      ),
                                      isRequired: true,
                                      child: DigitTextFormInput(
                                        initialValue: form
                                            .control(_individualNameKey)
                                            .value,
                                        onChange: (value) {
                                          form
                                              .control(_individualNameKey)
                                              .value = value;
                                        },
                                        errorMessage: field.errorText,
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget.isHeadOfHousehold)
                                  const SizedBox(
                                    height: spacer2,
                                  ),
                                Offstage(
                                  offstage: !widget.isHeadOfHousehold,
                                  child: DigitCheckbox(
                                    capitalizeFirstLetter: false,
                                    label: (RegistrationDeliverySingleton()
                                                .householdType ==
                                            HouseholdType.community)
                                        ? localizations.translate(i18
                                            .individualDetails
                                            .clfCheckboxLabelText)
                                        : localizations.translate(
                                            i18.individualDetails
                                                .checkboxLabelText,
                                          ),
                                    value: widget.isHeadOfHousehold,
                                    readOnly: widget.isHeadOfHousehold,
                                    onChanged: (_) {},
                                  ),
                                ),
                              ],
                            ),

                            ReactiveWrapperField(
                              formControlName: _idTypeKey,
                              validationMessages: {
                                'required': (_) => localizations.translate(
                                      i18.common.corecommonRequired,
                                    ),
                              },
                              builder: (field) => LabeledField(
                                label: localizations.translate(
                                  i18.individualDetails.idTypeLabelText,
                                ),
                                capitalizedFirstLetter: false,
                                isRequired: true,
                                child: DigitDropdown<String>(
                                  selectedOption: (form
                                              .control(_idTypeKey)
                                              .value !=
                                          null)
                                      ? DropdownItem(
                                          name: localizations.translate(
                                              form.control(_idTypeKey).value),
                                          code: form.control(_idTypeKey).value)
                                      : const DropdownItem(name: '', code: ''),
                                  items: RegistrationDeliverySingleton()
                                      .idTypeOptions!
                                      .map(
                                        (e) => DropdownItem(
                                            name: localizations.translate(e),
                                            code: e),
                                      )
                                      .toList(),
                                  onSelect: (value) {
                                    form.control(_idTypeKey).value = value.code;
                                    setState(() {
                                      if (value.code ==
                                          IdentifierTypes.defaultID.toValue()) {
                                        form.control(_idNumberKey).value =
                                            IdGen.i.identifier.toString();
                                      } else if (value.code ==
                                          IdentifierTypes.uniqueBeneficiaryID
                                              .toValue()) {
                                        setUniqueBeneficiaryId(
                                            form, bloc.state);
                                      } else {
                                        form.control(_idNumberKey).value = null;
                                      }
                                    });
                                    getIdNumberIfExists(bloc.state, form);
                                  },
                                  emptyItemText: localizations
                                      .translate(i18.common.noMatchFound),
                                  errorMessage:
                                      form.control(_idTypeKey).hasErrors
                                          ? localizations.translate(
                                              i18.common.corecommonRequired,
                                            )
                                          : null,
                                ),
                              ),
                            ),
                            if (form.control(_idTypeKey).value !=
                                    IdentifierTypes.defaultID.toValue() &&
                                form.control(_idTypeKey).value !=
                                    IdentifierTypes.uniqueBeneficiaryID
                                        .toValue())
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReactiveFormConsumer(
                                    builder: (context, formGroup, child) {
                                      return ReactiveWrapperField(
                                        formControlName: _idNumberKey,
                                        validationMessages: {
                                          'required': (object) =>
                                              localizations.translate(
                                                '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                                              ),
                                        },
                                        builder: (field) => LabeledField(
                                          label: localizations.translate(
                                            i18.individualDetails
                                                .idNumberLabelText,
                                          ),
                                          capitalizedFirstLetter: false,
                                          isRequired: form
                                              .control(_idNumberKey)
                                              .validators
                                              .isNotEmpty,
                                          child: DigitTextFormInput(
                                            readOnly: form
                                                        .control(_idTypeKey)
                                                        .value ==
                                                    IdentifierTypes.defaultID
                                                        .toValue() ||
                                                form
                                                        .control(_idTypeKey)
                                                        .value ==
                                                    IdentifierTypes
                                                        .uniqueBeneficiaryID
                                                        .toValue(),
                                            initialValue: form
                                                .control(_idNumberKey)
                                                .value,
                                            onChange: (value) {
                                              form.control(_idNumberKey).value =
                                                  value;
                                            },
                                            errorMessage: field.errorText,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            if (form.control(_idTypeKey).value ==
                                    IdentifierTypes.defaultID.toValue() ||
                                form.control(_idTypeKey).value ==
                                    IdentifierTypes.uniqueBeneficiaryID
                                        .toValue())
                              const SizedBox(
                                height: spacer2,
                              ),
                            individualDetailsShowcaseData.dateOfBirth.buildWith(
                              child: DigitDobPicker(
                                datePickerFormControl: _dobKey,
                                datePickerLabel: localizations.translate(
                                  i18.individualDetails.dobLabelText,
                                ),
                                ageFieldLabel: localizations.translate(
                                  i18.individualDetails.ageLabelText,
                                ),
                                yearsHintLabel: localizations.translate(
                                  i18.individualDetails.yearsHintText,
                                ),
                                monthsHintLabel: localizations.translate(
                                  i18.individualDetails.monthsHintText,
                                ),
                                separatorLabel: localizations.translate(
                                  i18.individualDetails.separatorLabelText,
                                ),
                                yearsAndMonthsErrMsg: localizations.translate(
                                  i18.individualDetails.yearsAndMonthsErrorText,
                                ),
                                errorMessage:
                                    _getDobErrorMessage(form.control(_dobKey)),
                                initialDate: before150Years,
                                initialValue: getInitialDateValue(form),
                                onChangeOfFormControl: (value) {
                                  setState(() {
                                    if (value == null) {
                                      form
                                          .control(_dobKey)
                                          .setErrors({'': true});
                                    } else {
                                      DigitDOBAgeConvertor age =
                                          DigitDateUtils.calculateAge(value);
                                      if ((age.years == 0 && age.months == 0) ||
                                          (age.months > 11) ||
                                          (age.years >= 150 &&
                                              age.months >= 0)) {
                                        form.control(_dobKey).value = value;
                                        form
                                            .control(_dobKey)
                                            .setErrors({'': true});
                                      } else {
                                        form.control(_dobKey).value = value;
                                        form.control(_dobKey).removeError('');
                                      }
                                    }
                                  });
                                  // Handle changes to the control's value here
                                },
                                cancelText: localizations
                                    .translate(i18.common.coreCommonCancel),
                                confirmText: localizations
                                    .translate(i18.common.coreCommonOk),
                              ),
                            ),
                            SelectionCard<String>(
                              isRequired: true,
                              showParentContainer: true,
                              title: localizations.translate(
                                i18.individualDetails.genderLabelText,
                              ),
                              allowMultipleSelection: false,
                              width: 126,
                              initialSelection:
                                  form.control(_genderKey).value != null
                                      ? [form.control(_genderKey).value]
                                      : [],
                              options: RegistrationDeliverySingleton()
                                  .genderOptions!
                                  .map(
                                    (e) => e,
                                  )
                                  .toList(),
                              onSelectionChanged: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    form.control(_genderKey).value =
                                        value.first;
                                  } else {
                                    form.control(_genderKey).value = null;
                                    setState(() {
                                      form
                                          .control(_genderKey)
                                          .setErrors({'': true});
                                    });
                                  }
                                });
                              },
                              valueMapper: (value) {
                                return localizations.translate(value);
                              },
                              errorMessage: form.control(_genderKey).hasErrors
                                  ? localizations
                                      .translate(i18.common.corecommonRequired)
                                  : null,
                            ),
                            individualDetailsShowcaseData.mobile.buildWith(
                              child: ReactiveWrapperField(
                                formControlName: _mobileNumberKey,
                                validationMessages: {
                                  'maxLength': (object) =>
                                      localizations.translate(i18
                                          .individualDetails
                                          .mobileNumberLengthValidationMessage),
                                  'minLength': (object) =>
                                      localizations.translate(i18
                                          .individualDetails
                                          .mobileNumberLengthValidationMessage),
                                },
                                builder: (field) => LabeledField(
                                  label: localizations.translate(
                                    i18.individualDetails.mobileNumberLabelText,
                                  ),
                                  child: DigitTextFormInput(
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    initialValue:
                                        form.control(_mobileNumberKey).value,
                                    onChange: (value) {
                                      form.control(_mobileNumberKey).value =
                                          value;
                                    },
                                    errorMessage: field.errorText,
                                  ),
                                ),
                              ),
                            ),
                            // const SizedBox(height: spacer4),
                            if ((RegistrationDeliverySingleton()
                                            .beneficiaryType ==
                                        BeneficiaryType.household &&
                                    widget.isHeadOfHousehold) ||
                                (RegistrationDeliverySingleton()
                                        .beneficiaryType ==
                                    BeneficiaryType.individual))
                              BlocBuilder<DigitScannerBloc, DigitScannerState>(
                                buildWhen: (p, c) {
                                  return true;
                                },
                                builder: (context, state) => state
                                        .qrCodes.isNotEmpty
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Text(
                                              localizations.translate(
                                                i18.deliverIntervention
                                                    .voucherCode,
                                              ),
                                              style: textTheme.headingS,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              localizations.translate(
                                                  state.qrCodes.last),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: spacer2 * 2,
                                            ),
                                            child: IconButton(
                                              color: theme
                                                  .colorTheme.primary.primary1,
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  //[TODO: Add the route to auto_route]
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DigitScannerPage(
                                                      quantity: 1,
                                                      isGS1code: false,
                                                      singleValue: true,
                                                      isEditEnabled: true,
                                                    ),
                                                    settings:
                                                        const RouteSettings(
                                                            name:
                                                                '/qr-scanner'),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],

                                        // ignore: no-empty-block
                                      )
                                    : DigitButton(
                                        type: DigitButtonType.secondary,
                                        size: DigitButtonSize.large,
                                        mainAxisSize: MainAxisSize.max,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            // [TODO: Add the route to auto_route]
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DigitScannerPage(
                                                quantity: 1,
                                                isGS1code: false,
                                                singleValue: true,
                                              ),
                                              settings: const RouteSettings(
                                                  name: '/qr-scanner'),
                                            ),
                                          );
                                        },
                                        prefixIcon: Icons.qr_code,
                                        label: localizations.translate(
                                          i18.individualDetails
                                              .linkVoucherToIndividual,
                                        ),
                                      ),
                              ),
                          ]),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  IndividualModel _getIndividualModel(
    BuildContext context, {
    required FormGroup form,
    IndividualModel? oldIndividual,
  }) {
    final dob = form.control(_dobKey).value as DateTime?;
    String? dobString;
    if (dob != null) {
      dobString = DateFormat(Constants().dateFormat).format(dob);
    }

    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.firstWhereOrNull((id) =>
            id.identifierType == form.control(_idTypeKey).value ? true : false)
        : null;

    if (identifier != null &&
        identifier.identifierId != form.control(_idNumberKey).value) {
      setState(() {
        identifier = identifier!.copyWith(
            identifierId: form.control(_idNumberKey).value,
            clientAuditDetails: identifier?.clientAuditDetails?.copyWith(
              lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
              lastModifiedTime: context.millisecondsSinceEpoch(),
            ));
      });
    }

    identifier ??= IdentifierModel(
      clientReferenceId: IdGen.i.identifier,
      individualId: individual.clientReferenceId,
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      identifierId: form.control(_idNumberKey).value,
      identifierType: form.control(_idTypeKey).value,
    );

    String? individualName = form.control(_individualNameKey).value as String?;
    individual = individual.copyWith(
        name: name.copyWith(
          givenName: individualName?.trim(),
        ),
        gender: form.control(_genderKey).value == null
            ? null
            : Gender.values.byName(
                form.control(_genderKey).value.toString().toLowerCase()),
        mobileNumber: form.control(_mobileNumberKey).value,
        dateOfBirth: dobString,
        additionalFields: IndividualAdditionalFields(version: 1, fields: [
          AdditionalField("primaryIdType", form.control(_idTypeKey).value),
        ]));
    if (individual.identifiers != null) {
      final idType = form.control(_idTypeKey).value;

      final existingIdentifier = individual.identifiers!.firstWhereOrNull(
        (e) => e.identifierType == idType,
      );

      if (existingIdentifier == null) {
        individual.identifiers!.add(identifier!);
      } else {
        final updatedIdentifier = existingIdentifier.copyWith(
            identifierId: identifier!.identifierId,
            clientAuditDetails: identifier?.clientAuditDetails?.copyWith(
              lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
              lastModifiedTime: context.millisecondsSinceEpoch(),
            ));

        final index = individual.identifiers!.indexOf(existingIdentifier);
        individual.identifiers![index] = updatedIdentifier;
      }
    } else {
      individual = individual.copyWith(identifiers: [identifier!]);
    }

    return individual;
  }

  String? _getDobErrorMessage(AbstractControl<dynamic> control) {
    if (!control.hasErrors) return null;

    final dobValue = control.value;
    final age = dobValue != null ? DigitDateUtils.calculateAge(dobValue) : null;

    if (dobValue == null) {
      return localizations.translate(i18.common.corecommonRequired);
    }

    if (age != null) {
      const minAge = 0;
      const maxAge = 150;

      if (age.years == minAge && age.months == minAge) {
        return localizations.translate(i18.common.minAge);
      }

      if (age.years >= maxAge) {
        return localizations.translate(i18.common.maxAge);
      }
    }

    return null;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );

    String? primaryIdType = individual?.additionalFields?.fields
        .firstWhereOrNull((idType) => idType.key == 'primaryIdType')
        ?.value;

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.delegate(
              (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(200),
        ],
        value: individual?.name?.givenName ??
            ((RegistrationDeliverySingleton().householdType ==
                    HouseholdType.community)
                ? null
                : searchQuery?.trim()),
      ),
      _idTypeKey: FormControl<String>(
        value: primaryIdType != null
            ? individual?.identifiers
                ?.firstWhereOrNull(
                    (type) => type.identifierType == primaryIdType)
                ?.identifierType
            : individual?.identifiers?.firstOrNull?.identifierType,
      ),
      _idNumberKey: FormControl<String>(
        validators: [Validators.required],
        value: primaryIdType != null
            ? individual?.identifiers
                ?.firstWhereOrNull(
                    (type) => type.identifierType == primaryIdType)
                ?.identifierId
            : individual?.identifiers?.firstOrNull?.identifierId,
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat(Constants().dateFormat).parse(
                individual!.dateOfBirth!,
              )
            : null,
      ),
      _genderKey: FormControl<String>(value: getGenderOptions(individual)),
      _mobileNumberKey:
          FormControl<String>(value: individual?.mobileNumber, validators: [
        Validators.pattern(Constants.mobileNumberRegExp,
            validationMessage:
                localizations.translate(i18.common.coreCommonMobileNumber)),
        Validators.maxLength(10)
      ]),
    });
  }

  getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }

  getInitialDateValue(FormGroup form) {
    var date = form.control(_dobKey).value != null
        ? DateFormat(Constants().dateTimeExtFormat)
            .format(form.control(_dobKey).value)
        : null;

    return date;
  }

  void setUniqueBeneficiaryId(
      FormGroup form, BeneficiaryRegistrationState state) async {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }
        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );

    if (individual == null) {
      context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
      final uniqueId = context.read<UniqueIdBloc>().state;
      uniqueId.maybeWhen(
          orElse: () {},
          idCount: (availableCount, totalCount) {
            if (availableCount > 0) {
              context
                  .read<UniqueIdBloc>()
                  .add(const UniqueIdEvent.fetchAUniqueId());
            }
          },
          aUniqueId: (uniqueId) {
            form.control(_idNumberKey).value = uniqueId.id;
          });
    } else {
      var uniqueIdType = individual.identifiers
          ?.firstWhereOrNull((type) =>
              type.identifierType ==
              IdentifierTypes.uniqueBeneficiaryID.toValue())
          ?.identifierType;

      var uniqueId = individual.identifiers?.firstWhereOrNull((type) =>
          type.identifierType == IdentifierTypes.uniqueBeneficiaryID.toValue());

      if (uniqueIdType == form.control(_idTypeKey).value) {
        form.control(_idTypeKey).value = uniqueId!.identifierType;
        form.control(_idNumberKey).value = uniqueId.identifierId;
      } else {
        context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
        final uniqueId = context.read<UniqueIdBloc>().state;
        uniqueId.maybeWhen(
            orElse: () {},
            idCount: (availableCount, totalCount) {
              if (availableCount > 0) {
                context
                    .read<UniqueIdBloc>()
                    .add(const UniqueIdEvent.fetchAUniqueId());
              }
            },
            aUniqueId: (uniqueId) {
              form.control(_idTypeKey).value =
                  IdentifierTypes.uniqueBeneficiaryID.toValue();
              form.control(_idNumberKey).value = uniqueId.id;
            });
      }
    }
  }

  displayUniqueIdCount(ThemeData theme, FormGroup form) {
    int? idCount;
    return BlocListener<UniqueIdBloc, UniqueIdState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            idCount: (availableIdCount, totalCount) {
              idCount = availableIdCount;
              if (availableIdCount != 0 &&
                  availableIdCount <
                      RegistrationDeliverySingleton().beneficiaryIdMinCount!) {
                showLowIdsAlert(
                    context: context,
                    localizations: localizations,
                    availableCount: availableIdCount,
                    shouldProceedFurther: (bool proceed) {});
              } else if (availableIdCount <= 0) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (form.control(_idNumberKey).value == null) {
                    showNoIdsAlert(
                        context: context,
                        showSkip: form.control(_idTypeKey).value ==
                                IdentifierTypes.uniqueBeneficiaryID.toValue()
                            ? false
                            : true,
                        localizations: localizations,
                        shouldProceedFurther: (bool skip) {});
                  }
                });
                setState(() {
                  if (form.control(_idTypeKey).value ==
                          IdentifierTypes.uniqueBeneficiaryID.toValue() &&
                      form.control(_idNumberKey).value == null) {
                    form.control(_idTypeKey).value = null;
                    form.control(_idNumberKey).value = null;
                  }
                });
              }
            },
            ids: (ids) {
              _isProgressDialogVisible = false;
            },
            aUniqueId: (uniqueId) {
              form.control(_idNumberKey).value = uniqueId.id;
            },
            fetching: (currentCount, totalCount) {
              if (_isProgressDialogVisible == false) {
                _progressDialog.showProgressDialog(
                  context: context,
                  localizations: RegistrationDeliveryLocalization.of(context),
                  currentCount: currentCount,
                  totalCount: totalCount,
                  theme: Theme.of(context),
                );
                _isProgressDialogVisible = true;
              } else {
                // To update progress:
                _progressDialog.updateProgressDialog(
                  currentCount: currentCount,
                  totalCount: totalCount,
                );
              }
            },
            failed: (String? error) {
              _progressDialog.closeProgressDialog();
              _isProgressDialogVisible = false;
              if (error != null) {
                Toast.showToast(context,
                    message: localizations.translate(
                      i18.beneficiaryDetails.failedBeneficiaryIds,
                    ),
                    type: ToastType.error);
              }
            },
            limitExceeded: (String? error) {
              _progressDialog.closeProgressDialog();
              _isProgressDialogVisible = false;
              if (error != null) {
                showCustomPopup(
                    context: context,
                    builder: (ctx) {
                      return Popup(
                        type: PopUpType.alert,
                        onCrossTap: () {
                          Navigator.of(ctx).pop();
                        },
                        actions: [
                          DigitButton(
                            capitalizeLetters: false,
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              Navigator.pop(ctx);
                              context.read<UniqueIdBloc>().add(
                                    const UniqueIdEvent
                                        .fetchUniqueIdsFromServer(
                                        reFetch: true),
                                  );
                            },
                            label: localizations.translate(
                                i18.beneficiaryDetails.beneficiaryIdsReFetch),
                          ),
                          DigitButton(
                            capitalizeLetters: false,
                            type: DigitButtonType.secondary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            label: localizations.translate(
                              i18.common.corecommonclose,
                            ),
                          ),
                        ],
                        title: localizations.translate(
                            i18.beneficiaryDetails.beneficiaryIdsLimitError),
                      );
                    });
              }
            },
            noInternet: () {
              _progressDialog.closeProgressDialog();
              _isProgressDialogVisible = false;
              showCustomPopup(
                  context: context,
                  builder: (ctx) {
                    return Popup(
                      type: PopUpType.alert,
                      onCrossTap: () {
                        Navigator.of(ctx).pop();
                      },
                      actions: [
                        DigitButton(
                          capitalizeLetters: false,
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            Navigator.of(ctx).pop();

                            context.read<UniqueIdBloc>().add(
                                  const UniqueIdEvent
                                      .fetchUniqueIdsFromServer(),
                                );
                          },
                          label: localizations.translate(
                            i18.common.coreCommonDataSyncRetry,
                          ),
                        ),
                        DigitButton(
                          capitalizeLetters: false,
                          type: DigitButtonType.secondary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          label: localizations.translate(
                            i18.common.corecommonclose,
                          ),
                        ),
                      ],
                      title: localizations
                          .translate(i18.common.coreCommonNoInternet),
                      description: localizations.translate(
                          i18.beneficiaryDetails.noInternetBeneficiaryIdsText),
                    );
                  });
            });
      },
      child: BlocBuilder<UniqueIdBloc, UniqueIdState>(
        builder: (context, state) {
          if (state is! LoadingState && state is FetchedIdCountState ||
              idCount != null) {
            state.maybeWhen(
              orElse: () {},
              idCount: (availableIdCount, totalCount) {
                idCount = availableIdCount;
              },
            );
          }
          return idCount != null
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: theme.colorTheme.text.disabled,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(spacer2)),
                    color: theme.colorTheme.primary.primaryBg,
                  ),
                  margin: const EdgeInsets.only(left: spacer2),
                  padding: const EdgeInsets.all(spacer2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations.translate(
                            i18.beneficiaryDetails.availableBeneficiaryIdsText),
                        style: theme
                            .digitTextTheme(context)
                            .bodyXS
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      Text(
                        " $idCount",
                        style: theme.digitTextTheme(context).headingXS.copyWith(
                            color: idCount! <
                                    RegistrationDeliverySingleton()
                                        .beneficiaryIdMinCount!
                                ? theme.colorTheme.alert.error
                                : theme.colorTheme.primary.primary2),
                      ),
                    ],
                  ),
                )
              : const Offstage();
        },
      ),
    );
  }

  void getIdNumberIfExists(BeneficiaryRegistrationState state, FormGroup form) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );
    if (individual != null) {
      var existingId = individual.identifiers?.lastWhereOrNull((id) =>
          id.identifierType == form.control(_idTypeKey).value ? true : false);

      if (existingId != null) {
        form.control(_idNumberKey).value = existingId.identifierId;
      }
    }
  }
}
