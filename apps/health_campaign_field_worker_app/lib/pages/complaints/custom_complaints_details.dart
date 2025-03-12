import 'package:auto_route/auto_route.dart';
import 'package:complaints/complaints.dart';

import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_components/blocs/location/location.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:complaints/utils/i18_key_constants.dart' as i18;
import 'package:complaints/widgets/header/back_navigation_help_header.dart';
import 'package:complaints/widgets/localized.dart';

import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class CustomComplaintsDetailsPage extends LocalizedStatefulWidget {
  const CustomComplaintsDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomComplaintsDetailsPage> createState() =>
      CustomComplaintsDetailsPageState();
}

class CustomComplaintsDetailsPageState
    extends LocalizedState<CustomComplaintsDetailsPage> {
  static const _dateOfComplaint = 'dateOfComplaint';
  static const _administrativeArea = 'administrativeArea';
  static const _complaintRaisedFor = 'complaintRaisedFor';
  static const _complainantName = 'complainantName';
  static const _complainantContactNumber = 'complainantContactNumber';
  static const _supervisorName = 'supervisorName';
  static const _supervisorContactNumber = 'supervisorContactNumber';
  static const _complaintDescription = 'complaintDescription';
  static const _complaintDetailsForm = 'complaintDetailsForm';
  static const _latKey = 'latKey';
  static const _lngKey = 'lngKey';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;
    final complainantRaisedFor = [
      i18.complaints.raisedForMyself,
      i18.complaints.raisedForAnotherUser,
    ];
    final textTheme = theme.digitTextTheme(context);

    final locationBloc = context.read<LocationBloc>();
    final locationInitialState = locationBloc.state;

    final initialLat = locationInitialState.latitude;
    final initialLng = locationInitialState.longitude;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => bloc.state.map(
          create: (value) => buildForm(value),
          persisted: (value) =>
              throw const InvalidComplaintsRegistrationStateException(),
          view: (value) => buildForm(value),
        ),
        builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            final lat = locationState.latitude;
            final lng = locationState.longitude;

            if (lat != null) {
              form.control(_latKey).value = lat;
            }
            if (lng != null) {
              form.control(_lngKey).value = lng;
            }
          },
          listenWhen: (previous, current) {
            final lat = form.control(_latKey).value;
            final lng = form.control(_lngKey).value;

            return lat != null || lng != null ? false : true;
          },
          child: BlocListener<BoundaryBloc, BoundaryState>(
            listener: (context, state) {
              context.navigateTo(const ComplaintsInboxWrapperRoute());
            },
            child: BlocConsumer<ComplaintsRegistrationBloc,
                ComplaintsRegistrationState>(
              listener: (context, complaintState) {
                complaintState.mapOrNull(
                  persisted: (value) {
                    router.replace(ComplaintsAcknowledgementRoute());
                  },
                );
              },
              builder: (context, state) {
                final isRaisedForSelf =
                    form.control(_complaintRaisedFor).value ==
                        i18.complaints.raisedForMyself;

                return ScrollableContent(
                  enableFixedDigitButton: true,
                  header: const Column(
                    children: [
                      BackNavigationHelpHeaderWidget(),
                    ],
                  ),
                  footer: DigitCard(
                      cardType: CardType.primary,
                      margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                      children: [
                        DigitButton(
                          label: form.control(_complaintDetailsForm).disabled
                              ? localizations
                                  .translate(i18.complaints.backToInbox)
                              : localizations
                                  .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () async {
                            setState(() {
                              form.markAllAsTouched();
                            });

                            if (form.control(_complaintDetailsForm).disabled) {
                              router.parent()?.maybePop();
                            }

                            if (!form.valid) {
                              return;
                            }

                            FocusManager.instance.primaryFocus?.unfocus();

                            final dateOfComplaint = form
                                .control(_dateOfComplaint)
                                .value as DateTime;

                            final complaintRaisedFor = form
                                .control(_complaintRaisedFor)
                                .value as String;

                            final administrativeArea = form
                                .control(_administrativeArea)
                                .value as String;

                            final complainantName =
                                form.control(_complainantName).value as String;

                            final complainantContactNumber = form
                                .control(_complainantContactNumber)
                                .value as String;

                            final supervisorName =
                                form.control(_supervisorName).value as String?;

                            final supervisorContactNumber = form
                                .control(_supervisorContactNumber)
                                .value as String?;

                            if (supervisorContactNumber != null &&
                                supervisorContactNumber.isNotEmpty &&
                                supervisorContactNumber.length < 8) {
                              await DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  localizations.translate(i18_local.complaints
                                      .supervisorContactNumberMinLength),
                                  true,
                                  theme,
                                ),
                              );
                              return;
                            }

                            final complaintDescription = form
                                .control(_complaintDescription)
                                .value as String;

                            state.whenOrNull(
                              create: (
                                loading,
                                complaintType,
                                _,
                                addressModel,
                                complaintsDetailsModel,
                              ) {
                                bloc.add(
                                  ComplaintsRegistrationEvent.saveAddress(
                                    addressModel: PgrAddressModel(
                                      geoLocation: GeoLocation(
                                        latitude: form.control(_latKey).value ??
                                            initialLat,
                                        longitude:
                                            form.control(_lngKey).value ??
                                                initialLng,
                                      ),
                                    ),
                                  ),
                                );
                                bloc.add(
                                  ComplaintsRegistrationEvent
                                      .saveComplaintDetails(
                                    boundaryModel:
                                        ComplaintsSingleton().boundary,
                                    complaintsDetailsModel:
                                        ComplaintsDetailsModel(
                                      administrativeArea: ComplaintsSingleton()
                                          .boundary
                                          .code
                                          .toString(),
                                      dateOfComplaint: dateOfComplaint,
                                      complaintRaisedFor: complaintRaisedFor,
                                      complainantName: complainantName,
                                      complainantContactNumber:
                                          complainantContactNumber,
                                      supervisorName: supervisorName,
                                      supervisorContactNumber:
                                          supervisorContactNumber,
                                      complaintDescription:
                                          complaintDescription,
                                    ),
                                  ),
                                );
                              },
                            );

                            final userId =
                                ComplaintsSingleton().loggedInUserUuid;

                            showCustomPopup(
                              context: context,
                              builder: (popupContext) => Popup(
                                  title: localizations.translate(
                                    i18.complaints.dialogTitle,
                                  ),
                                  type: PopUpType.simple,
                                  description: localizations.translate(
                                    i18.complaints.dialogContent,
                                  ),
                                  actions: [
                                    DigitButton(
                                      label: localizations.translate(
                                        i18.common.coreCommonSubmit,
                                      ),
                                      onPressed: () {
                                        bloc.add(
                                          ComplaintsRegistrationSubmitComplaintEvent(
                                            userId: userId,
                                          ),
                                        );
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      type: DigitButtonType.primary,
                                      size: DigitButtonSize.large,
                                    ),
                                    DigitButton(
                                        label: localizations.translate(
                                          i18.common.coreCommonCancel,
                                        ),
                                        onPressed: () {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                        },
                                        type: DigitButtonType.secondary,
                                        size: DigitButtonSize.large),
                                  ]),
                            );
                          },
                        ),
                      ]),
                  children: [
                    DigitCard(
                        margin: const EdgeInsets.all(spacer2),
                        cardType: CardType.primary,
                        children: [
                          Text(
                            localizations.translate(
                              i18.complaints.complaintsDetailsLabel,
                            ),
                            style: textTheme.headingXl,
                          ),
                          LabeledField(
                            label: localizations.translate(
                              i18.complaints.dateOfComplaint,
                            ),
                            child: DigitDateFormInput(
                              isRequired: true,
                              readOnly: true,
                              initialValue: DateFormat('yyyy-MM-dd')
                                  .format(form.control(_dateOfComplaint).value),
                              initialDate: DateTime.now(),
                              confirmText: localizations.translate(
                                i18.common.coreCommonOk,
                              ),
                              cancelText: localizations.translate(
                                i18.common.coreCommonCancel,
                              ),
                            ),
                          ),
                          LabeledField(
                            label: localizations.translate(
                              i18.householdLocation.administrationAreaFormLabel,
                            ),
                            child: DigitTextFormInput(
                              isRequired: true,
                              readOnly: true,
                              initialValue:
                                  form.control(_administrativeArea).value,
                            ),
                          ),
                          LabeledField(
                            label: localizations.translate(
                              i18.complaints.complainantTypeQuestion,
                            ),
                            isRequired: true,
                            child: Column(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: spacer2),
                                    child: RadioList(
                                      containerPadding: const EdgeInsets.only(
                                          bottom: spacer3),
                                      radioDigitButtons: complainantRaisedFor
                                          .map((item) => RadioButtonModel(
                                                code: item,
                                                name: localizations
                                                    .translate(item.trim()),
                                              ))
                                          .toList(),
                                      groupValue: form
                                              .control(_complaintRaisedFor)
                                              .value ??
                                          "",
                                      onChanged: (changedValue) {
                                        if (form
                                            .control(_complaintRaisedFor)
                                            .disabled) return;

                                        if (changedValue.code ==
                                            i18.complaints
                                                .raisedForAnotherUser) {
                                          form.control(_complainantName).value =
                                              "";
                                          form
                                              .control(
                                                  _complainantContactNumber)
                                              .value = "";
                                        } else {
                                          form.control(_complainantName).value =
                                              ComplaintsSingleton().userName;
                                          form
                                                  .control(
                                                      _complainantContactNumber)
                                                  .value =
                                              ComplaintsSingleton()
                                                  .userMobileNumber;
                                        }

                                        setState(() {
                                          form
                                              .control(_complaintRaisedFor)
                                              .value = changedValue.code;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                if (form.touched &&
                                    form
                                        .control(_complaintRaisedFor)
                                        .invalid) ...[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: spacer1,
                                        bottom: spacer1,
                                      ),
                                      child: Text(
                                        localizations.translate(i18.complaints
                                            .validationRadioRequiredError),
                                        style: TextStyle(
                                          color: theme.colorTheme.alert.error,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          ReactiveWrapperField<String>(
                              formControlName: _complainantName,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                    i18.complaints.validationRequiredError),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', '64'),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.complainantName,
                                  ),
                                  isRequired: true,
                                  child: DigitTextFormInput(
                                    readOnly: (isRaisedForSelf)
                                        ? (field.value == null ||
                                                field.value.isEmpty)
                                            ? false
                                            : true
                                        : false,
                                    initialValue: field.value,
                                    isRequired: true,
                                    errorMessage: field.errorText,
                                    onChange: (value) => form
                                        .control(_complainantName)
                                        .value = value,
                                  ),
                                );
                              }),
                          ReactiveWrapperField<String>(
                              formControlName: _complainantContactNumber,
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(i18
                                        .individualDetails
                                        .mobileNumberInvalidFormatValidationMessage),
                                'required': (object) => localizations.translate(
                                    i18.complaints.validationRequiredError),
                                'minLength': (object) =>
                                    localizations.translate(i18
                                        .complaints.validationMinLengthError),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', '8'),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.complainantContactNumber,
                                  ),
                                  isRequired: true,
                                  child: DigitTextFormInput(
                                    readOnly: (isRaisedForSelf)
                                        ? (field.value == null ||
                                                field.value.isEmpty)
                                            ? false
                                            : true
                                        : false,
                                    initialValue: field.value,
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    errorMessage: field.errorText,
                                    onChange: (value) => form
                                        .control(_complainantContactNumber)
                                        .value = value,
                                  ),
                                );
                              }),
                          ReactiveWrapperField<String>(
                              formControlName: _supervisorName,
                              validationMessages: {
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', '64'),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.supervisorName,
                                  ),
                                  child: DigitTextFormInput(
                                    errorMessage: field.errorText,
                                    initialValue: field.value,
                                    onChange: (value) => form
                                        .control(_supervisorName)
                                        .value = value,
                                  ),
                                );
                              }),
                          ReactiveWrapperField<String>(
                              formControlName: _supervisorContactNumber,
                              showErrors: (control) => control.touched,
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(
                                      i18.individualDetails
                                          .mobileNumberInvalidFormatValidationMessage,
                                    ),
                                'minLength': (object) =>
                                    localizations.translate(i18
                                        .complaints.validationMinLengthError),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', '8'),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.supervisorContactNumber,
                                  ),
                                  child: DigitTextFormInput(
                                    keyboardType: TextInputType.number,
                                    initialValue: field.value,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    errorMessage: field.errorText,
                                    onChange: (value) => form
                                        .control(_supervisorContactNumber)
                                        .value = value,
                                  ),
                                );
                              }),
                          ReactiveWrapperField<String>(
                              formControlName: _complaintDescription,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      i18.complaints.validationRequiredError,
                                    ),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', '1000'),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.complaintDescription,
                                  ),
                                  isRequired: true,
                                  child: DigitTextAreaFormInput(
                                    initialValue: field.value,
                                    maxLine: 3,
                                    errorMessage: field.errorText,
                                    isRequired: true,
                                    onChange: (value) => form
                                        .control(_complaintDescription)
                                        .value = value,
                                  ),
                                );
                              }),
                        ]),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  FormGroup buildForm(ComplaintsRegistrationState state) {
    final complaintDetails = state.mapOrNull(
      view: (value) => value.complaintsDetailsModel,
    );

    final shouldDisableForm = complaintDetails != null;

    return fb.group(<String, Object>{
      _dateOfComplaint: FormControl<DateTime>(
        value: complaintDetails?.dateOfComplaint ?? DateTime.now(),
        disabled: shouldDisableForm,
        validators: [],
      ),
      _administrativeArea: FormControl<String>(
        value: localizations.translate((complaintDetails?.administrativeArea ??
                ComplaintsSingleton().boundary?.code.toString() ??
                ComplaintsSingleton().boundary?.name.toString() ??
                "")
            .toString()),
        disabled: shouldDisableForm,
        validators: [Validators.required],
      ),
      _complaintRaisedFor: FormControl<String>(
        value: complaintDetails?.complaintRaisedFor,
        disabled: shouldDisableForm,
        validators: [Validators.required],
      ),
      _complainantName: FormControl<String>(
        value: complaintDetails?.complainantName,
        disabled: shouldDisableForm,
        validators: [Validators.required, Validators.maxLength(64)],
      ),
      _complainantContactNumber: FormControl<String>(
        value: complaintDetails?.complainantContactNumber,
        disabled: shouldDisableForm,
        validators: [
          Validators.required,
          Validators.delegate(
              (validator) => CustomValidator.validMobileNumber(validator)),
          Validators.minLength(8),
          Validators.maxLength(8)
        ],
      ),
      _supervisorName: FormControl<String>(
        value: complaintDetails?.supervisorName,
        disabled: shouldDisableForm,
        validators: [Validators.maxLength(64)],
      ),
      _supervisorContactNumber: FormControl<String>(
        value: complaintDetails?.supervisorContactNumber,
        disabled: shouldDisableForm,
        validators: [
          Validators.delegate(
              (validator) => CustomValidator.validMobileNumber(validator)),
          Validators.maxLength(8),
        ],
      ),
      _complaintDescription: FormControl<String>(
        value: complaintDetails?.complaintDescription,
        disabled: shouldDisableForm,
        validators: [Validators.required, Validators.maxLength(1000)],
      ),
      _complaintDetailsForm: FormControl<String>(
        disabled: shouldDisableForm,
      ),
      _latKey: FormControl<double>(
        validators: [],
      ),
      _lngKey: FormControl<double>(
        validators: [],
      )
    });
  }
}
