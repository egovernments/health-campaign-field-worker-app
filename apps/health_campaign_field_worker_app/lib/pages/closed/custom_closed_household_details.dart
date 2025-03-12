import 'package:closed_household/closed_household.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:closed_household/utils/i18_key_constants.dart' as i18;
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18Local;
import '../../blocs/custom_blocs/closed_household.dart' as custombloc;
import '../../utils/utils.dart' as utilsLocal;

import 'package:closed_household/widgets/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

enum ClosedHouseholdReasons { closed, refusal }

@RoutePage()
class CustomClosedHouseholdDetailsPage extends LocalizedStatefulWidget {
  const CustomClosedHouseholdDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomClosedHouseholdDetailsPage> createState() =>
      CustomClosedHouseholdDetailsPageState();
}

class CustomClosedHouseholdDetailsPageState
    extends LocalizedState<CustomClosedHouseholdDetailsPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _householdHeadNameKey = 'householdHeadName';
  static const _refusalCommentKey = 'refusalComment';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _reasonKey = 'reason';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;

  @override
  void initState() {
    context.read<LocationBloc>().add(const LoadLocationEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      DigitComponentsUtils().showLocationCapturingDialog(
        context,
        localizations.translate(i18.common.locationCapturing),
        DigitSyncDialogType.inProgress,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ClosedHouseholdBloc>();
    const reasonOptions = ClosedHouseholdReasons.values;

    refuseCommentValidator(FormGroup form) {
      if (form.control(_reasonKey).value ==
          ClosedHouseholdReasons.refusal.name) {
        form.control(_refusalCommentKey).setValidators(
          [
            Validators.required,
            Validators.delegate((validator) =>
                utilsLocal.CustomValidator.requiredMin3(validator)),
            Validators.maxLength(200)
          ],
          autoValidate: true,
        );
      } else {
        form.control(_refusalCommentKey).setValidators(
          [],
          autoValidate: true,
        );
      }
    }

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            if (locationState.accuracy != null) {
              Future.delayed(const Duration(seconds: 1), () {
                DigitComponentsUtils().hideDialog(context);
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
              enableFixedButton: true,
              header: const Column(
                children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                    showcaseButton: null,
                  ),
                ],
              ),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    return DigitElevatedButton(
                      onPressed: () {
                        form.markAllAsTouched();
                        if (!form.valid) return;
                        final String? householdHeadName = form
                            .control(_householdHeadNameKey)
                            .value as String?;

                        context.read<custombloc.ClosedHouseholdBloc>().add(
                              custombloc.ClosedHouseholdEvent.handleSummary(
                                latitude: locationState.latitude!,
                                longitude: locationState.longitude!,
                                locationAccuracy:
                                    form.control(_accuracyKey).value,
                                householdHeadName: householdHeadName != null &&
                                        householdHeadName.trim().isNotEmpty
                                    ? householdHeadName
                                    : null,
                              ),
                            );

                        final reason =
                            form.control(_reasonKey).value as String?;
                        final String? refuseReasonComment =
                            form.control(_refusalCommentKey).value as String?;
                        if (reason == null || reason.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                localizations
                                    .translate(i18.common.corecommonRequired),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        context.router.push(CustomClosedHouseholdSummaryRoute(
                            reason: reason,
                            refuseReasonComment: refuseReasonComment));
                      },
                      child: Center(
                        child: Text(
                          localizations.translate(
                            i18.common.coreCommonNext,
                          ),
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
                        TextBlock(
                          heading: localizations.translate(
                            i18.closeHousehold.closeHouseHoldDetailLabel,
                          ),
                          headingStyle: theme.textTheme.displayMedium,
                          body: localizations.translate(
                            i18.closeHousehold.closeHouseHoldDetailDescLabel,
                          ),
                        ),
                        Column(children: [
                          DigitTextFormField(
                            formControlName: _administrationAreaKey,
                            label: localizations.translate(
                              i18.closeHousehold.villageName,
                            ),
                            readOnly: true,
                          ),
                          DigitTextFormField(
                            readOnly: true,
                            formControlName: _accuracyKey,
                            label: localizations.translate(
                              i18.closeHousehold.accuracyLabel,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kPadding, 0, kPadding, 0),
                            child: SelectionBox<String>(
                              isRequired: true,
                              title: localizations.translate(
                                  i18Local.beneficiaryDetails.reasonLabelText),
                              allowMultipleSelection: false,
                              width: 148,
                              initialSelection:
                                  form.control(_reasonKey).value != null
                                      ? [form.control(_reasonKey).value]
                                      : [],
                              options:
                                  reasonOptions.map((e) => e.name).toList(),
                              onSelectionChanged: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    form.control(_reasonKey).value =
                                        value.first;
                                    refuseCommentValidator(form);
                                  } else if (true) {
                                    form.control(_reasonKey).value = null;
                                    setState(() {
                                      form
                                          .control(_reasonKey)
                                          .setErrors({'': true});
                                    });
                                  }
                                });
                              },
                              valueMapper: (value) {
                                return localizations
                                    .translate(value.toUpperCase());
                              },
                              errorMessage: form.control(_reasonKey).hasErrors
                                  ? localizations
                                      .translate(i18.common.corecommonRequired)
                                  : null,
                            ),
                          ),
                          Visibility(
                            visible: form.control(_reasonKey).value ==
                                ClosedHouseholdReasons.refusal.name,
                            child: DigitTextFormField(
                              formControlName: _refusalCommentKey,
                              isRequired: true,
                              label: localizations.translate(
                                i18Local.common.refuseReasonComment,
                              ),
                              validationMessages: {
                                'required': (object) => localizations
                                    .translate(i18.common.corecommonRequired),
                                'maxLength': (object) => localizations
                                    .translate(i18.common.maxCharsRequired)
                                    .replaceAll('{}', maxLength.toString()),
                                'min3': (object) => localizations
                                    .translate(
                                        i18Local.common.min3CharsRequired)
                                    .replaceAll('{}', ''),
                              },
                            ),
                          ),
                          DigitTextFormField(
                            formControlName: _householdHeadNameKey,
                            label: localizations.translate(
                              i18.closeHousehold.headNameLabel,
                            ),
                            validationMessages: {
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                              'min3': (object) => localizations
                                  .translate(i18Local.common.min3CharsRequired)
                                  .replaceAll('{}', ''),
                            },
                          ),
                        ]),
                      ],
                    ),
                  ),
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
            .translate(ClosedHouseholdSingleton().boundary!.name.toString()),
        validators: [Validators.required],
      ),
      _householdHeadNameKey: FormControl<String>(
        value: null,
        validators: [
          Validators.delegate((validator) =>
              utilsLocal.CustomValidator.requiredMin3(validator)),
          Validators.maxLength(200),
        ],
      ),
      _reasonKey: FormControl<String>(validators: []),
      _refusalCommentKey: FormControl<String>(),
      _latKey: FormControl<double>(validators: []),
      _lngKey: FormControl<double>(),
      _accuracyKey: FormControl<double>(),
    });
  }
}
