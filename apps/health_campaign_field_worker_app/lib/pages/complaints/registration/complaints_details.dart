import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/auth/auth.dart';
import '../../../blocs/boundary/boundary.dart';
import '../../../blocs/complaints_registration/complaints_registration.dart';
import '../../../models/complaints/complaints.dart';
import '../../../models/pgr_complaints/pgr_address.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class ComplaintsDetailsPage extends LocalizedStatefulWidget {
  const ComplaintsDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsDetailsPage> createState() => _ComplaintsDetailsPageState();
}

class _ComplaintsDetailsPageState
    extends LocalizedState<ComplaintsDetailsPage> {
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
              context.navigateTo(HomeRoute());
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
                  header: const Column(
                    children: [
                      BackNavigationHelpHeaderWidget(),
                    ],
                  ),
                  footer: SizedBox(
                    height: 85,
                    child: DigitCard(
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                      child: DigitElevatedButton(
                        onPressed: () async {
                          setState(() {
                            form.markAllAsTouched();
                          });

                          if (form.control(_complaintDetailsForm).disabled) {
                            router.parent()?.pop();
                          }

                          if (!form.valid) return;

                          FocusManager.instance.primaryFocus?.unfocus();

                          final dateOfComplaint =
                              form.control(_dateOfComplaint).value as DateTime;

                          final complaintRaisedFor =
                              form.control(_complaintRaisedFor).value as String;

                          final administrativeArea =
                              form.control(_administrativeArea).value as String;

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
                                      longitude: form.control(_lngKey).value ??
                                          initialLng,
                                    ),
                                  ),
                                ),
                              );

                              bloc.add(
                                ComplaintsRegistrationEvent
                                    .saveComplaintDetails(
                                  boundaryModel: context.boundary,
                                  complaintsDetailsModel:
                                      ComplaintsDetailsModel(
                                    administrativeArea: administrativeArea,
                                    dateOfComplaint: dateOfComplaint,
                                    complaintRaisedFor: complaintRaisedFor,
                                    complainantName: complainantName,
                                    complainantContactNumber:
                                        complainantContactNumber,
                                    supervisorName: supervisorName,
                                    supervisorContactNumber:
                                        supervisorContactNumber,
                                    complaintDescription: complaintDescription,
                                  ),
                                ),
                              );
                            },
                          );

                          final userId = context.loggedInUserUuid;

                          final submit = await DigitDialog.show<bool>(
                            context,
                            options: DigitDialogOptions(
                              titleText: localizations.translate(
                                i18.complaints.dialogTitle,
                              ),
                              contentText: localizations.translate(
                                i18.complaints.dialogContent,
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

                          if (submit != true) return;

                          bloc.add(
                            ComplaintsRegistrationSubmitComplaintEvent(
                              userId: userId,
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            form.control(_complaintDetailsForm).disabled
                                ? localizations
                                    .translate(i18.complaints.backToInbox)
                                : localizations
                                    .translate(i18.common.coreCommonSubmit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  children: [
                    DigitCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            localizations.translate(
                              i18.complaints.complaintsDetailsLabel,
                            ),
                            style: theme.textTheme.displayMedium,
                          ),
                          Column(children: [
                            DigitDateFormPicker(
                              label: localizations.translate(
                                i18.complaints.dateOfComplaint,
                              ),
                              formControlName: _dateOfComplaint,
                              isRequired: true,
                              isEnabled: false,
                              initialDate: DateTime.now(),
                              confirmText: localizations.translate(
                                i18.common.coreCommonOk,
                              ),
                              cancelText: localizations.translate(
                                i18.common.coreCommonCancel,
                              ),
                            ),
                            DigitTextFormField(
                              formControlName: _administrativeArea,
                              label: localizations.translate(
                                i18.householdLocation
                                    .administrationAreaFormLabel,
                              ),
                              maxLength: 64,
                              isRequired: true,
                              readOnly: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: LabeledField(
                                label: "${localizations.translate(
                                  i18.complaints.complainantTypeQuestion,
                                )} *",
                                child: Column(
                                  children: [
                                    RadioGroup<String>.builder(
                                      groupValue: form
                                              .control(_complaintRaisedFor)
                                              .value ??
                                          "",
                                      onChanged: (changedValue) {
                                        setState(() {
                                          form
                                              .control(_complaintRaisedFor)
                                              .value = changedValue;
                                        });
                                      },
                                      textStyle: TextStyle(
                                        color: form
                                                .control(_complaintRaisedFor)
                                                .disabled
                                            ? theme.colorScheme.shadow
                                            : theme.colorScheme.onBackground,
                                      ),
                                      items: complainantRaisedFor,
                                      itemBuilder: (item) => RadioButtonBuilder(
                                        localizations.translate(item.trim()),
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
                                            top: 5,
                                            bottom: 5,
                                          ),
                                          child: Text(
                                            localizations.translate(i18
                                                .complaints
                                                .validationRadioRequiredError),
                                            style: TextStyle(
                                              color: DigitTheme
                                                  .instance.colors.lavaRed,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                state.mapOrNull(
                                  authenticated: (value) {
                                    var user = value.userModel;
                                  },
                                );

                                return Column(
                                  children: [
                                    DigitTextFormField(
                                      formControlName: _complainantName,
                                      label: localizations.translate(
                                        i18.complaints.complainantName,
                                      ),
                                      maxLength: 64,
                                      isRequired: true,
                                      validationMessages: {
                                        'required': (object) =>
                                            localizations.translate(i18
                                                .complaints
                                                .validationRequiredError),
                                      },
                                    ),
                                    DigitTextFormField(
                                      formControlName:
                                          _complainantContactNumber,
                                      label: localizations.translate(
                                        i18.complaints.complainantContactNumber,
                                      ),
                                      maxLength: 9,
                                      isRequired: true,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                      validationMessages: {
                                        'mobileNumber': (object) =>
                                            localizations.translate(i18
                                                .individualDetails
                                                .mobileNumberInvalidFormatValidationMessage),
                                        'required': (object) =>
                                            localizations.translate(i18
                                                .complaints
                                                .validationRequiredError),
                                        'minLength': (object) =>
                                            localizations.translate(i18
                                                .complaints
                                                .validationMinLengthError),
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                            DigitTextFormField(
                              formControlName: _supervisorName,
                              label: localizations.translate(
                                i18.complaints.supervisorName,
                              ),
                              maxLength: 64,
                            ),
                            DigitTextFormField(
                              formControlName: _supervisorContactNumber,
                              label: localizations.translate(
                                i18.complaints.supervisorContactNumber,
                              ),
                              maxLength: 9,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(
                                      i18.individualDetails
                                          .mobileNumberInvalidFormatValidationMessage,
                                    ),
                              },
                            ),
                            DigitTextFormField(
                              formControlName: _complaintDescription,
                              label: localizations.translate(
                                i18.complaints.complaintDescription,
                              ),
                              maxLength: 1000,
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      i18.complaints.validationRequiredError,
                                    ),
                              },
                            ),
                          ]),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
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

    final addressModel = state.mapOrNull(
      view: (value) => value.addressModel,
    );

    final shouldDisableForm = complaintDetails != null;

    return fb.group(<String, Object>{
      _dateOfComplaint: FormControl<DateTime>(
        value: complaintDetails?.dateOfComplaint ?? DateTime.now(),
        disabled: shouldDisableForm,
        validators: [],
      ),
      _administrativeArea: FormControl<String>(
        value: complaintDetails?.administrativeArea ?? context.boundary.name,
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
        validators: [Validators.required],
      ),
      _complainantContactNumber: FormControl<String>(
        value: complaintDetails?.complainantContactNumber,
        disabled: shouldDisableForm,
        validators: [
          Validators.required,
          CustomValidator.validMobileNumber,
          Validators.minLength(9),
        ],
      ),
      _supervisorName: FormControl<String>(
        value: complaintDetails?.supervisorName,
        disabled: shouldDisableForm,
      ),
      _supervisorContactNumber: FormControl<String>(
        value: complaintDetails?.supervisorContactNumber,
        disabled: shouldDisableForm,
        validators: [CustomValidator.validMobileNumber],
      ),
      _complaintDescription: FormControl<String>(
        value: complaintDetails?.complaintDescription,
        disabled: shouldDisableForm,
        validators: [Validators.required],
      ),
      _complaintDetailsForm: FormControl<String>(
        disabled: shouldDisableForm,
      ),
      _latKey: FormControl<double>(
        value: addressModel?.geoLocation?.latitude,
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
      _lngKey: FormControl<double>(
        value: addressModel?.geoLocation?.longitude,
      ),
    });
  }
}
