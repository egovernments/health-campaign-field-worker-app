import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/closed_household.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/i18_key_constants.dart' as i18;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/entities/user_action.dart';
import '../router/closed_household_router.gm.dart';
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
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            if(locationState.accuracy!=null){
              //Hide the dialog after 1 seconds
              Future.delayed(const Duration(seconds: 1), () {
                DigitComponentsUtils().hideLocationDialog(context);
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
                    //showcaseButton: ShowcaseButton(), //TODO:
                    showHelp: false,
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
                        final summary = UserActionModel(
                          clientReferenceId: IdGen.i.identifier,
                          latitude: form.control(_latKey).value,
                          longitude: form.control(_lngKey).value,
                          locationAccuracy: form.control(_accuracyKey).value,
                          additionalFields: UserActionAdditionalFields(
                            version: 1,
                            fields: [
                              AdditionalField(
                                'householdHead',
                                form.control(_householdHeadNameKey).value ?? '',
                              ),
                            ],
                          ),
                        );
                        context.read<ClosedHouseholdBloc>().add(
                              ClosedHouseholdEvent.handleSummary(summary),
                            );
                        context.router.push(ClosedHouseholdSummaryRoute());
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
        value: '',
        validators: [],
      ),
      _latKey: FormControl<double>(
          value: state.userActions?.first.latitude, validators: []),
      _lngKey: FormControl<double>(
        value: state.userActions?.first.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: state.userActions?.first.locationAccuracy,
      ),
    });
  }
}
