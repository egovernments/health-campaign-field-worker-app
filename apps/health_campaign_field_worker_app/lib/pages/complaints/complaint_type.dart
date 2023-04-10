import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/complaints_registration/complaints_registration.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class ComplaintTypePage extends LocalizedStatefulWidget {
  const ComplaintTypePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintTypePage> createState() => _ComplaintTypePageState();
}

class _ComplaintTypePageState extends LocalizedState<ComplaintTypePage> {
  static const _complaintType = 'complaintType';

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);

    final complaintTypes = ["Sync Not Working", "Not Enough Stock"];
    complaintTypes.add("Other");

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) => BlocConsumer<
            ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ScrollableContent(
              header: Column(children: const [
                BackNavigationHelpHeaderWidget(),
              ]),
              footer: SizedBox(
                height: 85,
                child: DigitCard(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: DigitElevatedButton(
                    onPressed: () async {
                      form.markAllAsTouched();

                      if (!form.valid) return;

                      state.maybeWhen(
                        orElse: () {
                          return;
                        },
                        saveComplaint: (
                          complaintType,
                          addressModel,
                          complaintsDetailsModel,
                        ) {
                          bloc.add(
                            ComplaintsRegistrationEvent.saveComplaintType(
                              complaintType: form.control(_complaintType).value,
                            ),
                          );
                        },
                      );

                      router.push(ComplaintsLocationRoute());
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(i18.complaints.actionLabel),
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
                          i18.complaints.complaintsTypeHeading,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                      LabeledField(
                        label: localizations.translate(
                          i18.complaints.complaintsTypeHeading,
                        ),
                        child: BlocBuilder<ComplaintsRegistrationBloc,
                            ComplaintsRegistrationState>(
                          builder: (context, state) {
                            return RadioGroup<String>.builder(
                              groupValue:
                                  form.control(_complaintType).value ?? "",
                              onChanged: (changedValue) {
                                setState(() {
                                  form.control(_complaintType).value =
                                      changedValue;
                                });
                              },
                              items: complaintTypes,
                              itemBuilder: (item) => RadioButtonBuilder(
                                item.trim(),
                              ),
                            );
                          },
                        ),
                      ),
                      if (form.control(_complaintType).value == "Other") ...[
                        const DigitTextFormField(
                          formControlName: _complaintType,
                          label: "",
                          maxLength: 64,
                        ),
                      ],
                      const SizedBox(height: 16),
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

  FormGroup buildForm(ComplaintsRegistrationState state) {
    return fb.group(<String, Object>{
      _complaintType: FormControl<String>(
        validators: [Validators.required],
        value: state.complaintType,
      ),
    });
  }
}
