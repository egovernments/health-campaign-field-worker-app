import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/auth/auth.dart';
import '../../../blocs/complaints_registration/complaints_registration.dart';
import '../../../models/complaints/complaints.dart';
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
  static const complainantRaisedFor = ["Myself", "Another user"];

  static const _dateOfComplaint = 'dateOfComplaint';
  static const _administrativeArea = 'administrativeArea';
  static const _complaintRaisedFor = 'complaintRaisedFor';
  static const _complainantName = 'complainantName';
  static const _complainantContactNumber = 'complainantContactNumber';
  static const _supervisorName = 'supervisorName';
  static const _supervisorContactNumber = 'supervisorContactNumber';
  static const _complaintDescription = 'complaintDescription';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => bloc.state.map(
          create: (value) => buildForm(value),
          persisted: (value) =>
              throw const InvalidComplaintsRegistrationStateException(),
        ),
        builder: (_, form, __) => BlocListener<ComplaintsRegistrationBloc,
            ComplaintsRegistrationState>(
          listener: (context, complaintState) {
            complaintState.mapOrNull(
              persisted: (value) {
                router.replace(AcknowledgementRoute());
              },
            );
          },
          child: BlocBuilder<ComplaintsRegistrationBloc,
              ComplaintsRegistrationState>(
            builder: (context, state) {
              return ScrollableContent(
                header: Column(
                  children: const [
                    BackNavigationHelpHeaderWidget(),
                  ],
                ),
                footer: SizedBox(
                  height: 85,
                  child: DigitCard(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: DigitElevatedButton(
                      onPressed: () async {
                        form.markAllAsTouched();

                        if (!form.valid) return;

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

                        final complaintDescription =
                            form.control(_complaintDescription).value as String;

                        state.whenOrNull(
                          create: (
                            loading,
                            complaintType,
                            addressModel,
                            complaintsDetailsModel,
                          ) {
                            bloc.add(
                              ComplaintsRegistrationEvent.saveComplaintDetails(
                                boundaryModel: context.boundary,
                                complaintsDetailsModel: ComplaintsDetailsModel(
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
                          localizations.translate(i18.common.coreCommonSubmit),
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
                          ),
                          DigitTextFormField(
                            formControlName: _administrativeArea,
                            label: localizations.translate(
                              i18.householdLocation.administrationAreaFormLabel,
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
                              child: RadioGroup<String>.builder(
                                groupValue:
                                    form.control(_complaintRaisedFor).value ??
                                        "",
                                onChanged: (changedValue) {
                                  setState(() {
                                    form.control(_complaintRaisedFor).value =
                                        changedValue;
                                  });
                                },
                                items: complainantRaisedFor,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item.trim(),
                                ),
                              ),
                            ),
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              state.mapOrNull(
                                authenticated: (value) {
                                  var user = value.userModel;

                                  if (form.control(_complaintRaisedFor).value ==
                                      "Myself") {
                                    form.control(_complainantName).value =
                                        user.name;
                                    form
                                        .control(_complainantContactNumber)
                                        .value = user.mobileNumber;
                                  } else {
                                    form.control(_complainantName).value = "";
                                    form
                                        .control(_complainantContactNumber)
                                        .value = "";
                                  }
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
                                  ),
                                  DigitTextFormField(
                                    formControlName: _complainantContactNumber,
                                    label: localizations.translate(
                                      i18.complaints.complainantContactNumber,
                                    ),
                                    maxLength: 10,
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                    validationMessages: {
                                      'mobileNumber': (object) =>
                                          localizations.translate(i18
                                              .individualDetails
                                              .mobileNumberInvalidFormatValidationMessage),
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
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            validationMessages: {
                              'mobileNumber': (object) =>
                                  localizations.translate(i18.individualDetails
                                      .mobileNumberInvalidFormatValidationMessage),
                            },
                          ),
                          DigitTextFormField(
                            formControlName: _complaintDescription,
                            label: localizations.translate(
                              i18.complaints.complaintDescription,
                            ),
                            maxLength: 1000,
                            isRequired: true,
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
    );
  }

  FormGroup buildForm(ComplaintsRegistrationCreateState state) {
    final complaintDetails = state.complaintsDetailsModel;

    return fb.group(<String, Object>{
      _dateOfComplaint: FormControl<DateTime>(
        value: complaintDetails?.dateOfComplaint ?? DateTime.now(),
        validators: [],
      ),
      _administrativeArea: FormControl<String>(
        value: complaintDetails?.administrativeArea ?? context.boundary.name,
        validators: [Validators.required],
      ),
      _complaintRaisedFor: FormControl<String>(
        value: complaintDetails?.complaintRaisedFor,
        validators: [Validators.required],
      ),
      _complainantName: FormControl<String>(
        value: complaintDetails?.complainantName,
        validators: [Validators.required],
      ),
      _complainantContactNumber: FormControl<String>(
        value: complaintDetails?.complainantContactNumber,
        validators: [Validators.required, CustomValidator.validMobileNumber],
      ),
      _supervisorName: FormControl<String>(
        value: complaintDetails?.supervisorName,
      ),
      _supervisorContactNumber: FormControl<String>(
        value: complaintDetails?.supervisorContactNumber,
        validators: [CustomValidator.validMobileNumber],
      ),
      _complaintDescription: FormControl<String>(
        value: complaintDetails?.complaintDescription,
        validators: [Validators.required],
      ),
    });
  }
}
