import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/facility/facility.dart';
import '../../../blocs/project/project.dart';
import '../../../data/network_manager.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class WarehouseDetailsPage extends LocalizedStatefulWidget {
  const WarehouseDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<WarehouseDetailsPage> createState() => _WarehouseDetailsPageState();
}

class _WarehouseDetailsPageState extends LocalizedState<WarehouseDetailsPage> {
  static const _dateOfEntryKey = 'dateOfReceipt';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _warehouseKey = 'warehouse';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (ctx, projectState) {
        return projectState.maybeWhen(
          orElse: () {
            return const Center(
              child: Text('Projects not initialized'),
            );
          },
          fetched: (projects, selectedProject) {
            final theme = Theme.of(context);

            if (selectedProject == null) {
              return const Center(
                child: Text('Project not selected'),
              );
            }

            final facilityRepository = context
                .read<NetworkManager>()
                .repository<FacilityModel, FacilitySearchModel>(context);

            final projectFacilityRepository = context
                .read<NetworkManager>()
                .repository<ProjectFacilityModel, ProjectFacilitySearchModel>(
                  context,
                );

            return BlocProvider(
              create: (context) => FacilityBloc(
                facilityDataRepository: facilityRepository,
                projectFacilityDataRepository: projectFacilityRepository,
              )..add(
                  FacilityLoadForProjectEvent(projectId: selectedProject.id),
                ),
              child: BlocConsumer<FacilityBloc, FacilityState>(
                listener: (context, state) {
                  state.whenOrNull(
                    empty: () {
                      DigitDialog.show(
                        context,
                        options: DigitDialogOptions(
                          titleIcon: Icon(
                            Icons.warning,
                            color: theme.colorScheme.error,
                          ),
                          titleText: 'No facilities assigned',
                          contentText: 'Please select another boundary or '
                              'contact the system administrator to assign '
                              'a facility.',
                          primaryAction: DigitDialogActions(
                            label: 'Close',
                            action: (dialogContext) {
                              Navigator.of(context, rootNavigator: true).pop();
                              context.router.pop();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                builder: (ctx, facilityState) {
                  return Scaffold(
                    body: ReactiveFormBuilder(
                      form: buildForm,
                      builder: (context, form, child) {
                        return ScrollableContent(
                          header: Column(children: const [
                            BackNavigationHelpHeaderWidget(),
                          ]),
                          footer: SizedBox(
                            height: 90,
                            child: DigitCard(
                              child: DigitElevatedButton(
                                onPressed: () {
                                  form.markAllAsTouched();
                                  if (!form.valid) {
                                    return;
                                  }
                                  context.router
                                      .push(StockReceivedDetailsRoute());
                                },
                                child: Center(
                                  child: Text(
                                    localizations.translate(
                                      i18.householdDetails.actionLabel,
                                    ),
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
                                      i18.warehouseDetails
                                          .warehouseDetailsLabel,
                                    ),
                                    style: theme.textTheme.displayMedium,
                                  ),
                                  Column(children: [
                                    DigitDateFormPicker(
                                      isEnabled: false,
                                      formControlName: _dateOfEntryKey,
                                      label: localizations.translate(
                                        i18.warehouseDetails.dateOfReceipt,
                                      ),
                                      isRequired: false,
                                    ),
                                    DigitTextFormField(
                                      formControlName: _administrativeUnitKey,
                                      label: localizations.translate(
                                        i18.warehouseDetails.administrativeUnit,
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 16),
                                  DigitDropdown<FacilityModel>(
                                    label: localizations.translate(
                                      i18.warehouseDetails.warehouseNameId,
                                    ),
                                    valueMapper: (value) {
                                      return value.id;
                                    },
                                    menuItems: facilityState.maybeWhen(
                                      orElse: () => [],
                                      fetched: (facilities) => facilities,
                                    ),
                                    formControlName: _warehouseKey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _dateOfEntryKey: FormControl<DateTime>(value: DateTime.now()),
        _administrativeUnitKey: FormControl<String>(value: 'Solimbo'),
        _warehouseKey: FormControl<FacilityModel>(),
      });
}
