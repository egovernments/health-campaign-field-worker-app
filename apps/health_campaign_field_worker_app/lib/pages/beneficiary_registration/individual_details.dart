import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/scanner/scanner.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

class IndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<IndividualDetailsPage> createState() => _IndividualDetailsPageState();
}

class _IndividualDetailsPageState
    extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _idTypeKey = 'idType';
  static const _idNumberKey = 'idNumber';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';
  static const maxLength = 200;
  bool isDuplicateTag = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) => BlocConsumer<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          listener: (context, state) {
            state.mapOrNull(
              persisted: (value) {
                if (value.navigateToRoot) {
                  (router.parent() as StackRouter).pop();
                } else {
                  (router.parent() as StackRouter).pop();
                  context.read<SearchHouseholdsBloc>().add(
                        SearchHouseholdsByHouseholdsEvent(
                          householdModel: value.householdModel,
                          projectId: context.projectId,
                          isProximityEnabled: false,
                        ),
                      );
                  router.push(AcknowledgementRoute());
                }
              },
            );
          },
          builder: (context, state) {
            return ScrollableContent(
              enableFixedButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
                ),
              ]),
              footer: SizedBox(
                child: DigitCard(
                  margin: const EdgeInsets.only(top: 10),
                  child: DigitElevatedButton(
                    onPressed: () async {
                      if (form.control(_dobKey).value == null) {
                        form.control(_dobKey).setErrors({'': true});
                      }
                      final userId = context.loggedInUserUuid;
                      final projectId = context.projectId;
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

                          final boundary = context.boundary;

                          bloc.add(
                            BeneficiaryRegistrationSaveIndividualDetailsEvent(
                              model: individual,
                              isHeadOfHousehold: widget.isHeadOfHousehold,
                            ),
                          );
                          final scannerBloc = context.read<ScannerBloc>();

                          if (scannerBloc.state.duplicate) {
                            DigitToast.show(
                              context,
                              options: DigitToastOptions(
                                localizations.translate(
                                  i18.deliverIntervention
                                      .resourceAlreadyScanned,
                                ),
                                true,
                                theme,
                              ),
                            );
                          } else {
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
                                final scannerBloc = context.read<ScannerBloc>();

                                bloc.add(
                                  BeneficiaryRegistrationCreateEvent(
                                    projectId: projectId,
                                    userUuid: userId,
                                    boundary: boundary,
                                    tag: scannerBloc.state.qrcodes.isNotEmpty
                                        ? scannerBloc.state.qrcodes.first
                                        : null,
                                  ),
                                );
                              }
                            }
                          }
                        },
                        editIndividual: (
                          householdModel,
                          individualModel,
                          addressModel,
                          projectBeneficiaryModel,
                          loading,
                        ) {
                          final scannerBloc = context.read<ScannerBloc>();
                          final individual = _getIndividualModel(
                            context,
                            form: form,
                            oldIndividual: individualModel,
                          );
                          final tag = scannerBloc.state.qrcodes.isNotEmpty
                              ? scannerBloc.state.qrcodes.first
                              : null;

                          if (tag != null &&
                              tag != projectBeneficiaryModel?.tag &&
                              scannerBloc.state.duplicate) {
                            DigitToast.show(
                              context,
                              options: DigitToastOptions(
                                localizations.translate(
                                  i18.deliverIntervention
                                      .resourceAlreadyScanned,
                                ),
                                true,
                                theme,
                              ),
                            );
                          } else {
                            bloc.add(
                              BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                addressModel: addressModel,
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
                                              .clientAuditDetails!.createdBy,
                                          createdTime: individual
                                              .clientAuditDetails!.createdTime,
                                          lastModifiedBy:
                                              context.loggedInUserUuid,
                                          lastModifiedTime:
                                              context.millisecondsSinceEpoch(),
                                        )
                                      : null,
                                ),
                                tag: scannerBloc.state.qrcodes.isNotEmpty
                                    ? scannerBloc.state.qrcodes.first
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
                            final scannerBloc = context.read<ScannerBloc>();

                            if (scannerBloc.state.duplicate) {
                              DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  localizations.translate(
                                    i18.deliverIntervention
                                        .resourceAlreadyScanned,
                                  ),
                                  true,
                                  theme,
                                ),
                              );
                            } else {
                              bloc.add(
                                BeneficiaryRegistrationAddMemberEvent(
                                  beneficiaryType: context.beneficiaryType,
                                  householdModel: householdModel,
                                  individualModel: individual,
                                  addressModel: addressModel,
                                  userUuid: userId,
                                  projectId: context.projectId,
                                  tag: scannerBloc.state.qrcodes.isNotEmpty
                                      ? scannerBloc.state.qrcodes.first
                                      : null,
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        state.mapOrNull(
                              editIndividual: (value) => localizations
                                  .translate(i18.common.coreCommonSave),
                            ) ??
                            localizations
                                .translate(i18.common.coreCommonSubmit),
                      ),
                    ),
                  ),
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                    padding: const EdgeInsets.fromLTRB(
                      kPadding,
                      kPadding,
                      kPadding,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localizations.translate(
                            i18.individualDetails.individualsDetailsLabelText,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        Column(
                          children: [
                            individualDetailsShowcaseData.nameOfIndividual
                                .buildWith(
                              child: DigitTextFormField(
                                formControlName: _individualNameKey,
                                label: localizations.translate(
                                  i18.individualDetails.nameLabelText,
                                ),
                                isRequired: true,
                                validationMessages: {
                                  'required': (object) =>
                                      localizations.translate(
                                        '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                      ),
                                  'maxLength': (object) => localizations
                                      .translate(i18.common.maxCharsRequired)
                                      .replaceAll('{}', maxLength.toString()),
                                },
                                padding: const EdgeInsets.only(
                                  top: 16,
                                ),
                              ),
                            ),
                            Offstage(
                              offstage: !widget.isHeadOfHousehold,
                              child: individualDetailsShowcaseData
                                  .headOfHousehold
                                  .buildWith(
                                child: DigitCheckbox(
                                  padding: const EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  label: localizations.translate(
                                    i18.individualDetails.checkboxLabelText,
                                  ),
                                  value: widget.isHeadOfHousehold,
                                ),
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final idTypeOptions =
                                      appConfiguration.idTypeOptions ??
                                          <IdTypeOptions>[];

                                  return individualDetailsShowcaseData.idType
                                      .buildWith(
                                    child: DigitReactiveDropdown<String>(
                                      isRequired: true,
                                      label: localizations.translate(
                                        i18.individualDetails.idTypeLabelText,
                                      ),
                                      validationMessages: {
                                        'required': (object) =>
                                            localizations.translate(
                                              '${i18.individualDetails.idTypeLabelText}_IS_REQUIRED',
                                            ),
                                      },
                                      valueMapper: (e) => e,
                                      onChanged: (value) {
                                        setState(() {
                                          if (value == 'DEFAULT') {
                                            form.control(_idNumberKey).value =
                                                IdGen.i.identifier.toString();
                                          } else {
                                            form.control(_idNumberKey).value =
                                                null;
                                          }
                                        });
                                      },
                                      initialValue:
                                          idTypeOptions.firstOrNull?.name,
                                      menuItems: idTypeOptions.map(
                                        (e) {
                                          return localizations
                                              .translate(e.name);
                                        },
                                      ).toList(),
                                      formControlName: _idTypeKey,
                                      padding: EdgeInsets.only(
                                        top: widget.isHeadOfHousehold ? 16 : 0,
                                        bottom:
                                            !widget.isHeadOfHousehold ? 0 : 16,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (form.control(_idTypeKey).value != 'DEFAULT')
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReactiveFormConsumer(
                                    builder: (context, formGroup, child) {
                                      return DigitTextFormField(
                                        readOnly:
                                            form.control(_idTypeKey).value ==
                                                'DEFAULT',
                                        isRequired: form
                                            .control(_idNumberKey)
                                            .validators
                                            .isNotEmpty,
                                        formControlName: _idNumberKey,
                                        label: localizations.translate(
                                          i18.individualDetails
                                              .idNumberLabelText,
                                        ),
                                        validationMessages: {
                                          'required': (object) =>
                                              localizations.translate(
                                                '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                                              ),
                                        },
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                        ),
                                      );
                                    },
                                  ),
                                ],
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
                                onChangeOfFormControl: (formControl) {
                                  // Handle changes to the control's value here
                                  final value = formControl.value;
                                  if (value == null) {
                                    formControl.setErrors({'': true});
                                  } else {
                                    DigitDOBAge age =
                                        DigitDateUtils.calculateAge(value);
                                    if ((age.years == 0 && age.months == 0) ||
                                        age.months > 11 ||
                                        (age.years >= 150 && age.months > 0)) {
                                      formControl.setErrors({'': true});
                                    } else {
                                      formControl.removeError('');
                                    }
                                  }
                                },
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final genderOptions =
                                      appConfiguration.genderOptions ??
                                          <GenderOptions>[];

                                  return individualDetailsShowcaseData.gender
                                      .buildWith(
                                    child: DigitReactiveDropdown<String>(
                                      label: localizations.translate(
                                        i18.individualDetails.genderLabelText,
                                      ),
                                      valueMapper: (value) =>
                                          localizations.translate(value),
                                      initialValue:
                                          genderOptions.firstOrNull?.name,
                                      menuItems: genderOptions
                                          .map(
                                            (e) => e.name,
                                          )
                                          .toList(),
                                      formControlName: _genderKey,
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            individualDetailsShowcaseData.mobile.buildWith(
                              child: DigitTextFormField(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                ),
                                keyboardType: TextInputType.number,
                                formControlName: _mobileNumberKey,
                                label: localizations.translate(
                                  i18.individualDetails.mobileNumberLabelText,
                                ),
                                maxLength: 10,
                                validationMessages: {
                                  'mobileNumber': (object) =>
                                      localizations.translate(i18
                                          .individualDetails
                                          .mobileNumberInvalidFormatValidationMessage),
                                },
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<ScannerBloc, ScannerState>(
                          builder: (context, state) => state.qrcodes.isNotEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        localizations.translate(
                                          i18.deliverIntervention.voucherCode,
                                        ),
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        localizations
                                            .translate(state.qrcodes.first),
                                      ),
                                    ),
                                    IconButton(
                                      color: theme.colorScheme.secondary,
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        // TODO : [Need to handle the Scanner event];
                                        // context.read<ScannerBloc>().add(ScannerScanEvent())
                                        context.router.push(QRScannerRoute(
                                          quantity: 1,
                                          isGS1code: false,
                                          sinlgleValue: true,
                                          isEditEnabled: true,
                                        ));
                                      },
                                    ),
                                  ],

                                  // ignore: no-empty-block
                                )
                              : DigitOutlineIconButton(
                                  buttonStyle: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.router.push(QRScannerRoute(
                                      quantity: 1,
                                      isGS1code: false,
                                      sinlgleValue: true,
                                    ));
                                  },
                                  icon: Icons.qr_code,
                                  label: localizations.translate(
                                    i18.individualDetails
                                        .linkVoucherToIndividual,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   child: DigitElevatedButton(
      //     onPressed: () {},
      //     child: Center(
      //       child: Text(localizations.translate(
      //         i18.searchBeneficiary.beneficiaryAddActionLabel,
      //       )),
      //     ),
      //   ),
      // ),
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
      dobString = DateFormat('dd/MM/yyyy').format(dob);
    }

    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: individual.clientReferenceId,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    individual = individual.copyWith(
      name: name.copyWith(
        givenName: form.control(_individualNameKey).value,
      ),
      gender: form.control(_genderKey).value == null
          ? null
          : Gender.values
              .byName(form.control(_genderKey).value.toString().toLowerCase()),
      mobileNumber: form.control(_mobileNumberKey).value,
      dateOfBirth: dobString,
      identifiers: [
        identifier.copyWith(
          identifierId: form.control(_idNumberKey).value,
          identifierType: form.control(_idTypeKey).value,
        ),
      ],
    );

    return individual;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context
              .read<ScannerBloc>()
              .add(ScannerScanEvent([], [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          CustomValidator.requiredMin,
          Validators.maxLength(200),
        ],
        value: individual?.name?.givenName ?? searchQuery,
      ),
      _idTypeKey: FormControl<String>(
        validators: [Validators.required],
        value: individual?.identifiers?.firstOrNull?.identifierType,
      ),
      _idNumberKey: FormControl<String>(
        validators: [Validators.required],
        value: individual?.identifiers?.firstOrNull?.identifierId,
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat('dd/MM/yyyy').parse(
                individual!.dateOfBirth!,
              )
            : null,
      ),
      _genderKey: FormControl<String>(
        value: context.read<AppInitializationBloc>().state.maybeWhen(
              orElse: () => null,
              initialized: (appConfiguration, serviceRegistryList) {
                final options =
                    appConfiguration.genderOptions ?? <GenderOptions>[];

                return options.map((e) => e.code).firstWhereOrNull(
                      (element) =>
                          element.toLowerCase() == individual?.gender?.name,
                    );
              },
            ),
      ),
      _mobileNumberKey:
          FormControl<String>(value: individual?.mobileNumber, validators: [
        CustomValidator.validMobileNumber,
      ]),
    });
  }
}
