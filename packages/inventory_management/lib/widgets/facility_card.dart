import 'package:digit_data_model/blocs/facility/facility.dart';
import 'package:digit_data_model/models/entities/facility.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/pages/facility_selection.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/inventory/no_facilities_assigned_dialog.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;

class FacilityInput extends LocalizedStatefulWidget {
  const FacilityInput({
    super.key,
    super.appLocalizations,
  });

  @override
  State<FacilityInput> createState() => _FacilityInputState();
}

class _FacilityInputState extends LocalizedState<FacilityInput> {
  static const _warehouseKey = 'warehouseKey';
  bool deliveryTeamSelected = false;

  String? selectedFacilityId;
  TextEditingController controller1 = TextEditingController();

  @override
  void initState() {
    // final stockState = context.read<RecordStockBloc>().state;
    // setState(() {
    //   selectedFacilityId = stockState.primaryId;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocConsumer<FacilityBloc, FacilityState>(
      listener: (context, state) {
        state.whenOrNull(
          empty: () => NoFacilitiesAssignedDialog.show(context, localizations),
        );
      },
      builder: (context, facilityState) {
        final facilities = facilityState.whenOrNull(
              fetched: (facilities, allfacilities) {
                if (true) {
                  List<FacilityModel> filteredFacilities = [];

                  facilities = filteredFacilities.isEmpty
                      ? facilities
                      : filteredFacilities;
                }

                final teamFacilities = [
                  FacilityModel(
                    id: 'Delivery Team',
                    name: 'Delivery Team',
                  ),
                ];
                teamFacilities.addAll(
                  facilities,
                );

                return InventorySingleton().isDistributor &&
                        !InventorySingleton().isWareHouseMgr
                    ? teamFacilities
                    : facilities;
              },
            ) ??
            [];

        return ReactiveFormBuilder(
          form: () => buildForm(context),
          builder: (context, form, child) {
            _updateResourceCards(form);
            return InkWell(
              onTap: () async {
                // clearQRCodes();
                // form.control(_teamCodeKey).value = '';

                final facility = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InventoryFacilitySelectionPage(
                      facilities: facilities.isEmpty
                          ? [FacilityModel(id: "FT-456-AS")]
                          : facilities,
                    ),
                  ),
                );

                if (facility == null) return;
                form.control(_warehouseKey).value =
                    localizations.translate('FAC_${facility.id}');
                controller1.text =
                    localizations.translate('FAC_${facility.id}');

                setState(() {
                  selectedFacilityId = facility.id;
                });
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
              child: IgnorePointer(
                child: ReactiveWrapperField(
                    formControlName: _warehouseKey,
                    validationMessages: {
                      'required': (object) => localizations.translate(
                            '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                          ),
                    },
                    showErrors: (control) => control.invalid && control.touched,
                    builder: (field) {
                      return InputField(
                        type: InputType.search,
                        label: localizations.translate(
                          i18.stockReconciliationDetails.facilityLabel,
                        ),
                        controller: controller1,
                        isRequired: true,
                        errorMessage: field.errorText,
                        onChange: (value) {
                          field.control.markAsTouched();
                        },
                      );
                    }),
              ),
            );
          },
        );
      },
    );
  }

// TODO:: To implement
  void _updateResourceCards(FormGroup form) {
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: 'MANAGESTOCK',
            key: 'facilityId',
            value: form.control(_warehouseKey).value,
          ),
        );
  }

  FormGroup buildForm(
    BuildContext context,
  ) {
    //_controllers.clear();

    return fb.group(<String, Object>{
      _warehouseKey: FormControl<dynamic>(),
    });
  }
}
