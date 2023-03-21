import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/facility/facility.dart';
import '../../../blocs/project/project.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/inventory/no_facilities_assigned_dialog.dart';
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

  FormGroup buildForm() => fb.group(<String, Object>{
        _dateOfEntryKey: FormControl<DateTime>(value: DateTime.now()),
        _administrativeUnitKey:
            FormControl<String>(value: context.boundaryCode),
        _warehouseKey: FormControl<FacilityModel>(
          validators: [Validators.required],
        ),
      });

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

            return BlocConsumer<FacilityBloc, FacilityState>(
              listener: (context, state) {
                state.whenOrNull(
                  empty: () => NoFacilitiesAssignedDialog.show(context),
                );
              },
              builder: (ctx, facilityState) {
                return Scaffold(
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ReactiveFormBuilder(
                      form: buildForm,
                      builder: (context, form, child) {
                        return ScrollableContent(
                          header: Column(children: const [
                            BackNavigationHelpHeaderWidget(),
                          ]),
                          footer: SizedBox(
                            height: 90,
                            child: DigitCard(
                              child: ReactiveFormConsumer(
                                builder: (context, form, child) {
                                  return DigitElevatedButton(
                                    onPressed: !form.valid
                                        ? null
                                        : () {
                                            form.markAllAsTouched();
                                            if (!form.valid) {
                                              return;
                                            }
                                            final dateOfRecord = form
                                                .control(_dateOfEntryKey)
                                                .value as DateTime;

                                            final facility = form
                                                .control(_warehouseKey)
                                                .value as FacilityModel;

                                            context.read<RecordStockBloc>().add(
                                                  RecordStockSaveWarehouseDetailsEvent(
                                                    dateOfRecord: dateOfRecord,
                                                    facilityModel: facility,
                                                  ),
                                                );
                                            context.router.push(
                                              StockDetailsRoute(),
                                            );
                                          },
                                    child: child!,
                                  );
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
                                      readOnly: true,
                                      formControlName: _administrativeUnitKey,
                                      label: localizations.translate(
                                        i18.warehouseDetails.administrativeUnit,
                                      ),
                                    ),
                                  ]),
                                  DigitSearchDropdown<FacilityModel>(
                                    isRequired: true,
                                    valueMapper: (value) => value.id,
                                    formControlName: _warehouseKey,
                                    menuItems: facilityState.maybeWhen(
                                      orElse: () => [],
                                      fetched: (facilities, _) => facilities,
                                    ),
                                    label: localizations.translate(
                                      i18.warehouseDetails.warehouseNameId,
                                    ),
                                    initialValue: facilityState.whenOrNull(
                                      fetched: (facilities, _) {
                                        return facilities.length == 1
                                            ? facilities.elementAt(0)
                                            : null;
                                      },
                                    ),
                                    initialValueText: facilityState.whenOrNull(
                                      fetched: (facilities, _) {
                                        return facilities.length == 1
                                            ? facilities
                                                .elementAt(0)
                                                .id
                                                .toString()
                                            : null;
                                      },
                                    ),
                                    suggestionsCallback: (items, pattern) =>
                                        items
                                            .where(
                                              (e) => e.id.contains(pattern),
                                            )
                                            .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
