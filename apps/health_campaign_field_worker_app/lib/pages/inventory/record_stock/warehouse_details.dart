import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
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
import '../facility_selection.dart';

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
  static const _teamCodeKey = 'teamCode';

  bool deliveryTeamSelected = false;

  FormGroup buildForm(bool isDistributor) => fb.group(<String, Object>{
        _dateOfEntryKey: FormControl<DateTime>(value: DateTime.now()),
        _administrativeUnitKey: FormControl<String>(
          value: context.boundary.name,
        ),
        _warehouseKey: FormControl<FacilityModel>(
          validators: context.loggedInUserRoles
                  .where(
                    (role) => role.code == Roles.warehouseManager.name,
                  )
                  .toList()
                  .isNotEmpty
              ? [Validators.required]
              : [],
        ),
        _teamCodeKey: FormControl<String>(
          value: isDistributor || deliveryTeamSelected
              ? context.loggedInUserUuid
              : "",
          validators: isDistributor ? [Validators.required] : [],
        ),
      });

  @override
  Widget build(BuildContext context) {
    bool isWareHouseMgr = context.loggedInUserRoles
        .where(
          (role) => role.code == Roles.warehouseManager.name,
        )
        .toList()
        .isNotEmpty;
    print(Roles.distributor.name);

    bool isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == Roles.distributor.name,
        )
        .toList()
        .isNotEmpty;

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (ctx, projectState) {
        final selectedProject = projectState.selectedProject;

        if (selectedProject == null) {
          return const Center(child: Text('No project selected'));
        }

        final theme = Theme.of(context);

        return BlocConsumer<FacilityBloc, FacilityState>(
          listener: (context, state) {
            state.whenOrNull(
              empty: () => deliveryTeamSelected
                  ? false
                  : NoFacilitiesAssignedDialog.show(context),
            );
          },
          builder: (ctx, facilityState) {
            final facilities = facilityState.whenOrNull(
                  fetched: (facilities, _) => facilities,
                ) ??
                [];

            return Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ReactiveFormBuilder(
                  form: () => buildForm(isDistributor),
                  builder: (context, form, child) {
                    return ScrollableContent(
                      header: const Column(children: [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: SizedBox(
                        height: 85,
                        child: DigitCard(
                          margin: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 10,
                          ),
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

                                        final facility = isWareHouseMgr
                                            ? form.control(_warehouseKey).value
                                                as FacilityModel
                                            : FacilityModel(
                                                id: "Delivery Team",
                                              );

                                        final teamCode =
                                            form.control(_teamCodeKey).value;

                                        context.read<RecordStockBloc>().add(
                                              RecordStockSaveTransactionDetailsEvent(
                                                dateOfRecord: dateOfRecord,
                                                facilityModel: isWareHouseMgr
                                                    ? facility
                                                    : FacilityModel(
                                                        id: "Delivery Team",
                                                      ),
                                                primaryId: facility.id ==
                                                        "Delivery Team"
                                                    ? teamCode
                                                    : facility.id,
                                                primaryType: isDistributor ||
                                                        deliveryTeamSelected
                                                    ? "STAFF"
                                                    : "WAREHOUSE",
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
                                isDistributor
                                    ? localizations.translate(
                                        i18.stockDetails
                                            .transactionDetailsLabel,
                                      )
                                    : localizations.translate(
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
                                  confirmText: localizations.translate(
                                    i18.common.coreCommonOk,
                                  ),
                                  cancelText: localizations.translate(
                                    i18.common.coreCommonCancel,
                                  ),
                                ),
                                DigitTextFormField(
                                  readOnly: true,
                                  formControlName: _administrativeUnitKey,
                                  label: localizations.translate(
                                    i18.warehouseDetails.administrativeUnit,
                                  ),
                                ),
                              ]),
                              DigitTextFormField(
                                valueAccessor: FacilityValueAccessor(
                                  facilities,
                                ),
                                isRequired: isWareHouseMgr,
                                label: localizations.translate(
                                  i18.stockReconciliationDetails.facilityLabel,
                                ),
                                suffix: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.search),
                                ),
                                formControlName: _warehouseKey,
                                readOnly: true,
                                onTap: () async {
                                  final parent =
                                      context.router.parent() as StackRouter;
                                  final facility =
                                      await parent.push<FacilityModel>(
                                    FacilitySelectionRoute(
                                      facilities: facilities,
                                    ),
                                  );

                                  if (facility == null) return;
                                  form.control(_warehouseKey).value = facility;
                                  if (facility.id == 'Delivery Team') {
                                    setState(() {
                                      deliveryTeamSelected = true;
                                    });
                                  } else {
                                    setState(() {
                                      deliveryTeamSelected = false;
                                    });
                                  }
                                },
                              ),
                              if (isDistributor ||
                                  (isWareHouseMgr && deliveryTeamSelected))
                                DigitTextFormField(
                                  label: localizations.translate(
                                    i18.stockReconciliationDetails
                                        .teamCodeLabel,
                                  ),
                                  formControlName: _teamCodeKey,
                                  isRequired: true,
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
  }
}
