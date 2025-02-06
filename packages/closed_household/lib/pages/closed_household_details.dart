import 'package:auto_route/auto_route.dart';
import 'package:closed_household/closed_household.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../router/closed_household_router.gm.dart';
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class ClosedHouseholdDetailsPage extends LocalizedStatefulWidget {
  const ClosedHouseholdDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ClosedHouseholdDetailsPage> createState() =>
      ClosedHouseholdDetailsPageState();
}

class ClosedHouseholdDetailsPageState
    extends LocalizedState<ClosedHouseholdDetailsPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _householdHeadNameKey = 'householdHeadName';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;

  @override
  void initState() {
    context.read<LocationBloc>().add(const LoadLocationEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the dialog after the first frame is built
      DigitComponentsUtils.showDialog(
        context,
        localizations.translate(i18.common.locationCapturing),
        DialogType.inProgress,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ClosedHouseholdBloc>();
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            if (locationState.accuracy != null) {
              //Hide the dialog after 1 seconds
              Future.delayed(const Duration(seconds: 1), () {
                DigitComponentsUtils.hideDialog(context);
              });
            }
            final lat = locationState.latitude;
            final lng = locationState.longitude;
            final accuracy = locationState.accuracy;
            form.control(_latKey).value ??= lat;
            form.control(_lngKey).value ??= lng;
            form.control(_accuracyKey).value ??= accuracy;
          },
          listenWhen: (previous, current) {
            final lat = form.control(_latKey).value;
            final lng = form.control(_lngKey).value;
            final accuracy = form.control(_accuracyKey).value;

            return lat != null || lng != null || accuracy != null
                ? false
                : true;
          },
          child: BlocBuilder<ClosedHouseholdBloc, ClosedHouseholdState>(
              builder: (context, state) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(
                children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                  ),
                ],
              ),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, locationState) {
                        return DigitButton(
                          size: DigitButtonSize.large,
                          type: DigitButtonType.primary,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            if (!form.valid &&
                                form
                                        .control(
                                          _householdHeadNameKey,
                                        )
                                        .value
                                        .length >
                                    0) {
                              return;
                            }
                            final String? householdHeadName = form
                                .control(_householdHeadNameKey)
                                .value as String?;

                            context.read<ClosedHouseholdBloc>().add(
                                  ClosedHouseholdEvent.handleSummary(
                                    latitude: locationState.latitude!,
                                    longitude: locationState.longitude!,
                                    locationAccuracy: locationState.accuracy!,
                                    householdHeadName: householdHeadName !=
                                                null &&
                                            householdHeadName.trim().isNotEmpty
                                        ? householdHeadName
                                        : null,
                                  ),
                                );

                            context.router.push(ClosedHouseholdSummaryRoute());
                          },
                          label: localizations.translate(
                            i18.common.coreCommonNext,
                          ),
                        );
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
                            i18.closeHousehold.closeHouseHoldDetailLabel,
                          ),
                          headingStyle: textTheme.headingXl,
                          description: localizations.translate(
                            i18.closeHousehold.closeHouseHoldDetailDescLabel,
                          ),
                        ),
                        ReactiveWrapperField<String>(
                            formControlName: _administrationAreaKey,
                            showErrors: (control) =>
                                control.invalid && control.touched,
                            // Ensures error is shown if invalid and touched
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  i18.closeHousehold.villageName,
                                ),
                                child: DigitTextFormInput(
                                  errorMessage: field.errorText,
                                  readOnly: true,
                                  initialValue: form
                                      .control(_administrationAreaKey)
                                      .value,
                                ),
                              );
                            }),
                        ReactiveWrapperField<double>(
                            formControlName: _accuracyKey,
                            showErrors: (control) =>
                                control.invalid && control.touched,
                            // Ensures error is shown if invalid and touched
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  i18.closeHousehold.accuracyLabel,
                                ),
                                capitalizedFirstLetter: false,
                                capitalizedFirstLetter: false,
                                child: DigitTextFormInput(
                                  errorMessage: field.errorText,
                                  readOnly: true,
                                  initialValue: (form
                                          .control(
                                            _accuracyKey,
                                          )
                                          .value)
                                      .toString(),
                                ),
                              );
                            }),
                        ReactiveWrapperField<String>(
                            validationMessages: {
                              'maxLength': (_) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                              'minLength': (_) => localizations
                                  .translate(i18.common.min2CharsRequired)
                                  .replaceAll('{}', '2'),
                            },
                            formControlName: _householdHeadNameKey,
                            showErrors: (control) =>
                                control.invalid &&
                                control.touched &&
                                control.value != '',
                            // Ensures error is shown if invalid and touched
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  i18.closeHousehold.headNameLabel,
                                ),
                                child: DigitTextFormInput(
                                  maxLength: 64,
                                  charCount: true,
                                  onChange: (val) => {
                                    form
                                        .control(
                                          _householdHeadNameKey,
                                        )
                                        .markAsTouched(),
                                    form
                                        .control(
                                          _householdHeadNameKey,
                                        )
                                        .value = val,
                                  },
                                  errorMessage: field.errorText,
                                  initialValue: form
                                      .control(
                                        _householdHeadNameKey,
                                      )
                                      .value,
                                ),
                              );
                            }),
                      ]),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  FormGroup buildForm(ClosedHouseholdState state) {
    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(ClosedHouseholdSingleton().boundary!.code.toString()),
        validators: [Validators.required],
      ),
      _householdHeadNameKey: FormControl<String>(
        value: null,
        validators: [
          Validators.delegate(
            CustomValidator.requiredMin,
          ),
          Validators.maxLength(200),
          Validators.minLength(2),
        ],
      ),
      _latKey: FormControl<double>(validators: []),
      _lngKey: FormControl<double>(),
      _accuracyKey: FormControl<double>(),
    });
  }
}
