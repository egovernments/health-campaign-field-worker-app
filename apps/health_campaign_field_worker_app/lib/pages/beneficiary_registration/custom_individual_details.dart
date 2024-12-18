import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';

import '../../router/app_router.dart';
import '../../widgets/custom_digit_dob_picker.dart';
import '../custom_qr_scanner.dart';
import '../../utils/utils.dart' as utilsLocal;
import '../../utils/i18_key_constants.dart' as i18Local;

@RoutePage()
class CustomIndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const CustomIndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = true,
  });

  @override
  State<CustomIndividualDetailsPage> createState() =>
      CustomIndividualDetailsPageState();
}

class CustomIndividualDetailsPageState
    extends LocalizedState<CustomIndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  bool isDuplicateTag = false;
  static const maxLength = 200;
  final clickedStatus = ValueNotifier<bool>(false);
  DateTime now = DateTime.now();

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
                        if ((age.years == 0 && age.months == 0) ||
                            age.years >= 150 && age.months > 0) {
                          form.control(_dobKey).setErrors({'': true});
                        }
                        if (form.control(_genderKey).value == null) {
                          setState(() {
                            form.control(_genderKey).setErrors({'': true});
                          });
                        }
                        final scannerBloc = context.read<DigitScannerBloc>();
                        if (scannerBloc.state.qrCodes.isEmpty) {
                          await DigitToast.show(
                            context,
                            options: DigitToastOptions(
                              localizations.translate(
                                i18Local.individualDetails
                                    .scanVoucherAndLinkToIndividual,
                              ),
                              true,
                              theme,
                            ),
                          );
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
                              router.push(CustomSummaryRoute());
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
                        Column(children: [
                          individualDetailsShowcaseData.nameOfIndividual
                              .buildWith(
                            child: DigitTextFormField(
                              formControlName: _individualNameKey,
                              label: localizations.translate(
                                i18.individualDetails.nameLabelText,
                              ),
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                    ),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', maxLength.toString()),
                                "min3": (object) => localizations.translate(
                                      i18Local.common.min3CharsRequired,
                                    ),
                                "validName": (object) =>
                                    localizations.translate(
                                      i18Local.individualDetails
                                          .individualNameValidation,
                                    )
                              },
                            ),
                          ),
                          Offstage(
                            offstage: !widget.isHeadOfHousehold,
                            child: DigitCheckbox(
                              label: localizations.translate(
                                i18.individualDetails.checkboxLabelText,
                              ),
                              value: widget.isHeadOfHousehold,
                            ),
                          ),
                          individualDetailsShowcaseData.dateOfBirth.buildWith(
                            child: CustomDigitDobPicker(
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
                                  DigitDOBAge age =
                                      DigitDateUtils.calculateAge(value);
                                  if ((age.years == 0 && age.months == 0) ||
                                      age.months > 11 ||
                                      (age.years >= 150 && age.months >= 0)) {
                                    formControl.setErrors({'': true});
                                  } else {
                                    formControl.removeError('');
                                  }
                                }
                              },
                              cancelText: localizations
                                  .translate(i18.common.coreCommonCancel),
                              confirmText: localizations
                                  .translate(i18.common.coreCommonOk),
                            ),
                          ),
                          SelectionBox<String>(
                            isRequired: true,
                            title: '${localizations.translate(
                              i18.individualDetails.genderLabelText,
                            )} *',
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
                                  form.control(_genderKey).value = value.first;
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
                        ]),
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
                                              .translate(state.qrCodes.first),
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
                                                    const CustomDigitScannerPage(
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
                                              const CustomDigitScannerPage(
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
      dateOfBirth: dobString,
      identifiers: [
        identifier.copyWith(
          identifierId: "DEFAULT",
          identifierType: "DEFAULT",
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

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          utilsLocal.CustomValidator.requiredMin3,
          Validators.maxLength(200),
          utilsLocal.CustomValidator.validIndividualName,
        ],
        value: individual?.name?.givenName ?? searchQuery?.trim(),
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat(Constants().dateFormat).parse(
                individual!.dateOfBirth!,
              )
            : null,
      ),
      _genderKey: FormControl<String>(value: getGenderOptions(individual)),
    });
  }

  getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }
}
