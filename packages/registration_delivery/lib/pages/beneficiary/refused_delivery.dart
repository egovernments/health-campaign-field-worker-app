import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class RefusedDeliveryPage extends LocalizedStatefulWidget {
  const RefusedDeliveryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<RefusedDeliveryPage> createState() => _RefusedDeliveryPageState();
}

class _RefusedDeliveryPageState extends LocalizedState<RefusedDeliveryPage> {
  static const _noOfRoomsKey = 'noOfRooms';
  static const _dataOfRefusalKey = 'dateOfAdministration';
  List<String>? selectedHouseStructureTypes;

  @override
  void initState() {
    final registrationState = context.read<HouseholdOverviewBloc>().state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<HouseholdOverviewBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(),
          builder: (_, form, __) => BlocBuilder<HouseholdOverviewBloc,
              HouseholdOverviewState>(
            builder: (context, registrationState) {
              return ScrollableContent(
                enableFixedButton: true,
                header: const Column(
                  children: [
                    BackNavigationHelpHeaderWidget(
                      showcaseButton: ShowcaseButton(),
                      showHelp: false,
                    ),
                  ],
                ),
                footer: DigitCard(
                  margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                  padding:
                  const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: DigitElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (!form.valid) return;
                      // TODO: need to update form value based on project config
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(
                          i18.householdLocation.actionLabel,
                        ),
                      ),
                    ),
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
                            padding: const EdgeInsets.fromLTRB(
                                0, 0, 0, kPadding),
                            child: Text(
                              localizations.translate(
                                i18.householdDetails.houseDetailsLabel,
                              ),
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
                          Column(children: [
                            DigitDateFormPicker(
                              isEnabled: false,
                              formControlName:
                              _dataOfRefusalKey,
                              label: localizations
                                  .translate(
                                i18.householdDetails
                                    .dateOfRegistrationLabel,
                              ),
                              confirmText:
                              localizations
                                  .translate(
                                i18.common
                                    .coreCommonOk,
                              ),
                              cancelText:
                              localizations
                                  .translate(
                                i18.common
                                    .coreCommonCancel,
                              ),
                              isRequired: false,
                              padding:
                              const EdgeInsets
                                  .only(
                                top: kPadding,
                              ),
                            ),
                            SelectionBox<String>(
                                width: 120,
                                options: RegistrationDeliverySingleton()
                                    .refusalReasons ??
                                    [],
                                onSelectionChanged: (values) {
                                  setState(() {
                                    selectedHouseStructureTypes = values;
                                  });
                                },
                                valueMapper: (value) {
                                  return localizations
                                      .translate(value.toString());
                                },
                              ),
                            houseShowcaseData.noOfRooms.buildWith(
                              child: DigitIntegerFormPicker(
                                minimum: 1,
                                form: form,
                                formControlName: _noOfRoomsKey,
                                label: localizations.translate(
                                  i18.householdDetails.noOfRoomsLabel,
                                ),
                                incrementer: true,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _noOfRoomsKey: FormControl<int>(
          value: 0, validators: [Validators.required]),
      _dataOfRefusalKey:
      FormControl<DateTime>(value: DateTime.now(), validators: []),
    });
  }
}
