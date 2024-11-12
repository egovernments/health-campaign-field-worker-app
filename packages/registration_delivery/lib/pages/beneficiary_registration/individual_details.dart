import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class IndividualDetailsPage extends LocalizedStatefulWidget {
  final Map<String, Map<String, dynamic>> widgetConfig;
  final bool isHeadOfHousehold;

  IndividualDetailsPage({
    Map<String, Map<String, dynamic>>? widgetConfig,
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  }) : widgetConfig = widgetConfig ??
            {
              'individualName': {
                'isEnabled': true,
                'readOnly': true,
                'order': 1,
              },
              'idType': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': true,
                'order': 2,
              },
              'idNumber': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': true,
                'regex': ["^\\d+\$"],
                "errorMessage": "Invalid input",
                'order': 3,
              },
              'dob': {
                'isEnabled': true,
                'readOnly': false,
                'order': 4,
              },
              'gender': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': true,
                'order': 5,
              },
              'mobileNumber': {
                'isEnabled': true,
                'readOnly': false,
                'order': 6,
              },
            };

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
  bool isHeadOfHousehold = false;

  @override
  void initState() {
    isHeadOfHousehold = widget.isHeadOfHousehold;
    super.initState();
  }

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];

    // Sort the config keys by the 'order' key
    var sortedKeys = model.config.keys.toList();
    sortedKeys.sort(
        (a, b) => model.config[a]['order'].compareTo(model.config[b]['order']));

    for (var key in sortedKeys) {
      var fieldConfig = model.config[key];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (key) {
          case _individualNameKey:
            widget = DigitTextFormField(
              formControlName: _individualNameKey,
              label: localizations.translate(
                i18.individualDetails.nameLabelText,
              ),
              isRequired: fieldConfig['isRequired'] ?? false,
              readOnly: fieldConfig['readOnly'] ?? false,
              validationMessages: {
                'required': (object) => localizations.translate(
                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                    ),
                'maxLength': (object) => localizations
                    .translate(i18.common.maxCharsRequired)
                    .replaceAll('{}', maxLength.toString()),
                'customError': (object) => localizations.translate(
                      fieldConfig['errorMessage'] ?? '',
                    )
              },
            );
            if (isHeadOfHousehold) {
              widgets.add(widget);
              widget = Offstage(
                offstage: !isHeadOfHousehold,
                child: DigitCheckbox(
                  label: localizations.translate(
                    i18.individualDetails.checkboxLabelText,
                  ),
                  value: isHeadOfHousehold,
                ),
              );
            }
            break;
          case _idTypeKey:
            widget = DigitReactiveSearchDropdown<String>(
              enabled: (fieldConfig['readOnly'] ?? false) != true,
              label: localizations.translate(
                i18.individualDetails.idTypeLabelText,
              ),
              form: model.form,
              menuItems: RegistrationDeliverySingleton().idTypeOptions!.map(
                (e) {
                  return e;
                },
              ).toList(),
              formControlName: _idTypeKey,
              valueMapper: (value) {
                return localizations.translate(value);
              },
              onSelected: (value) {
                setState(() {
                  if (value == 'DEFAULT') {
                    model.form.control(_idNumberKey).value =
                        IdGen.i.identifier.toString();
                  } else {
                    model.form.control(_idNumberKey).value = null;
                  }
                });
              },
              isRequired: fieldConfig['isRequired'] ?? false,
              validationMessage: model.form.control(_idTypeKey).hasErrors &&
                      model.form.control(_idTypeKey).touched
                  ? localizations.translate(
                      i18.common.corecommonRequired,
                    )
                  : null,
              emptyText: localizations.translate(i18.common.noMatchFound),
            );
            break;
          case _idNumberKey:
            widget = model.form.control(_idTypeKey).value != 'DEFAULT'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                          return DigitTextFormField(
                            readOnly: fieldConfig['readOnly'] ?? false,
                            isRequired: fieldConfig['isRequired'] ?? false,
                            formControlName: _idNumberKey,
                            label: localizations.translate(
                              i18.individualDetails.idNumberLabelText,
                            ),
                            validationMessages: {
                              'required': (object) => localizations.translate(
                                    '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                                  ),
                              'customError': (object) => localizations.translate(
                                fieldConfig['errorMessage'] ?? '',
                              )
                            },
                            padding: const EdgeInsets.only(
                              top: kPadding * 2,
                              left: kPadding / 2,
                              right: kPadding / 2,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : const SizedBox(height: 4);
            break;
          case _dobKey:
            DateTime before150Years =
                DateTime(now.year - 150, now.month, now.day);
            widget = individualDetailsShowcaseData.dateOfBirth.buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
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
                    initialDate: before150Years,
                    onChangeOfFormControl: (formControl) {
                      // Handle changes to the control's value here
                      final value = formControl.value;
                      if (value == null) {
                        formControl.setErrors({'': true});
                      } else {
                        DigitDOBAge age = DigitDateUtils.calculateAge(value);
                        if ((age.years == 0 && age.months == 0) ||
                            age.months > 11 ||
                            (age.years >= 150 && age.months >= 0)) {
                          formControl.setErrors({'': true});
                        } else {
                          formControl.removeError('');
                        }
                      }
                    },
                    cancelText:
                        localizations.translate(i18.common.coreCommonCancel),
                    confirmText:
                        localizations.translate(i18.common.coreCommonOk),
                  ),
                ),
              ),
            );
            break;
          case _genderKey:
            widget = AbsorbPointer(
              absorbing: fieldConfig['readOnly'] ?? false,
              child: Opacity(
                opacity: (fieldConfig['readOnly'] ?? false) ? 0.5 : 1,
                child: SelectionBox<String>(
                  title: '${localizations.translate(
                    i18.individualDetails.genderLabelText,
                  )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                  allowMultipleSelection: false,
                  width: 126,
                  initialSelection: model.form.control(_genderKey).value != null
                      ? [model.form.control(_genderKey).value]
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
                        model.form.control(_genderKey).value = value.first;
                      } else {
                        model.form.control(_genderKey).value = null;
                        setState(() {
                          model.form.control(_genderKey).setErrors({'': true});
                        });
                      }
                    });
                  },
                  valueMapper: (value) {
                    return localizations.translate(value);
                  },
                  errorMessage: model.form.control(_genderKey).hasErrors &&
                          model.form.control(_genderKey).touched
                      ? localizations.translate(i18.common.corecommonRequired)
                      : null,
                ),
              ),
            );
            break;
          case _mobileNumberKey:
            widget = individualDetailsShowcaseData.mobile.buildWith(
              child: DigitTextFormField(
                isRequired: fieldConfig['isRequired'] ?? false,
                readOnly: fieldConfig['readOnly'] ?? false,
                keyboardType: TextInputType.number,
                formControlName: _mobileNumberKey,
                maxLength: 10,
                label: localizations.translate(
                  i18.individualDetails.mobileNumberLabelText,
                ),
                validationMessages: {
                  'maxLength': (object) => localizations.translate(i18
                      .individualDetails.mobileNumberLengthValidationMessage),
                  'minLength': (object) => localizations.translate(i18
                      .individualDetails.mobileNumberLengthValidationMessage),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            );
            break;
          default:
            throw Exception("Unsupported widget type: ${key}");
        }

        widgets.add(widget);
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    DateTime before150Years = DateTime(now.year - 150, now.month, now.day);

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
              enableFixedButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
                ),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: ValueListenableBuilder(
                  valueListenable: clickedStatus,
                  builder: (context, bool isClicked, _) {
                    return DigitElevatedButton(
                      onPressed: () async {
                        final age = DigitDateUtils.calculateAge(
                          form.control(_dobKey).value as DateTime?,
                        );
                        if ((widget.widgetConfig[_dobKey]?['isRequired'] ??
                                false) &&
                            ((age.years == 0 && age.months == 0) ||
                                (age.years >= 150 && age.months > 0))) {
                          form.control(_dobKey).setErrors({'': true});
                        }
                        if (form.control(_idTypeKey).value == null &&
                            (widget.widgetConfig[_idTypeKey]?['isRequired'] ??
                                false)) {
                          form.control(_idTypeKey).setErrors({'': true});
                        }
                        if (form.control(_genderKey).value == null &&
                            (widget.widgetConfig[_genderKey]?['isRequired'] ??
                                false)) {
                          setState(() {
                            form.control(_genderKey).setErrors({'': true});
                          });
                        }
                        final userId =
                            RegistrationDeliverySingleton().loggedInUserUuid;
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
                              clickedStatus.value = true;
                              final scannerBloc =
                                  context.read<DigitScannerBloc>();
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
                                                .clientAuditDetails!.createdBy,
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
                                    beneficiaryType:
                                        RegistrationDeliverySingleton()
                                            .beneficiaryType!,
                                    householdModel: householdModel,
                                    individualModel: individual,
                                    addressModel: addressModel,
                                    userUuid: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId!,
                                    tag: scannerBloc.state.qrCodes.isNotEmpty
                                        ? scannerBloc.state.qrCodes.first
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
                    );
                  },
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: kPadding),
                          child: Text(
                            localizations.translate(
                              i18.individualDetails.individualsDetailsLabelText,
                            ),
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                        Column(
                            children: buildWidgetsFromConfig(WidgetConfigModel(
                                config: widget.widgetConfig, form: form))),
                        const SizedBox(height: 16),
                        if ((RegistrationDeliverySingleton().beneficiaryType ==
                                    BeneficiaryType.household &&
                                widget.isHeadOfHousehold) ||
                            (RegistrationDeliverySingleton().beneficiaryType ==
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
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
                                              .translate(state.qrCodes.last),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: kPadding * 2,
                                        ),
                                        child: IconButton(
                                          color: theme.colorScheme.secondary,
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
                                                settings: const RouteSettings(
                                                    name: '/qr-scanner'),
                                              ),
                                            );
                                          },
                                        ),
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
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: individual.clientReferenceId,
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

    String? individualName = form.control(_individualNameKey).value as String?;
    individual = individual.copyWith(
      name: name.copyWith(
        givenName: individualName?.trim(),
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

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    final formGroup = fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          CustomValidator.requiredMin,
          Validators.maxLength(200),
        ],
        value: individual?.name?.givenName ?? searchQuery?.trim(),
      ),
      _idTypeKey: FormControl<String>(
        value: individual?.identifiers?.firstOrNull?.identifierType,
      ),
      _idNumberKey: FormControl<String>(
        validators: [Validators.required],
        value: individual?.identifiers?.firstOrNull?.identifierId,
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
        CustomValidator.validMobileNumber,
        CustomValidator.minPhoneNumValidation,
        Validators.maxLength(10)
      ]),
    });

    widget.widgetConfig.forEach((key, fieldConfig) {
      final formControl = formGroup.control(key);

      // Get current validators
      final currentValidators = formControl.validators;

      dynamic updatedValidators = currentValidators.where((validator) {
        // Check if the validator is of the same type as Validators.required
        return validator.runtimeType != Validators.required.runtimeType;
      }).toList();

      if (fieldConfig['isRequired'] == true) {
        // Add the new validator to the list
        updatedValidators = [
          ...currentValidators,
          Validators.required // Example new validator
        ];
      }

      // If JSON config has regex, add it as a validator
      if (fieldConfig.containsKey('regex') && fieldConfig['regex'] is List) {
        List<String> regexList = fieldConfig['regex'];
        String errorMessages = fieldConfig['errorMessage'];

        regexList.asMap().forEach((index, regexPattern) {
          updatedValidators.add((control) {
            final value = control.value;
            if (value != null &&
                value.isNotEmpty &&
                !RegExp(regexPattern).hasMatch(value)) {
              // Ensure there's a matching error message for this index
              return {'customError': errorMessages};
            }
            return null;
          });
        });
      }

      // Set the updated validators back to the form control
      formControl.setValidators(updatedValidators);

      // Re-run validation with the new validators
      formControl.updateValueAndValidity();
    });

    return formGroup;
  }

  getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }
}
