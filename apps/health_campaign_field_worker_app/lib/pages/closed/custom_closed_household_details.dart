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
import '../../utils/utils.dart' as utilsLocal;

import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:closed_household/utils/utils.dart';
import 'package:closed_household/widgets/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

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
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
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

                        context.read<ClosedHouseholdBloc>().add(
                              ClosedHouseholdEvent.handleSummary(
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

                        context.router
                            .push(CustomClosedHouseholdSummaryRoute());
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
      _latKey: FormControl<double>(validators: []),
      _lngKey: FormControl<double>(),
      _accuracyKey: FormControl<double>(),
    });
  }
}
