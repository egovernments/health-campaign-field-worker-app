import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../localized.dart';

class FacilityCard extends LocalizedStatefulWidget {
  final String formKey;
  final String dependantFormKey;
  final String? label;
  final bool readOnly;
  final dynamic stateData;

  const FacilityCard({
    super.key,
    super.appLocalizations,
    required this.formKey,
    required this.dependantFormKey,
    this.label,
    this.readOnly = false,
    this.stateData,
  });

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends LocalizedState<FacilityCard> {
  bool deliveryTeamSelected = false;
  String? selectedFacilityId;
  TextEditingController teamCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Clear QR codes on init
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    teamCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if user is distributor but not warehouse manager
    final isDistributor = InventorySingleton().isDistributor;
    final isWareHouseMgr = InventorySingleton().isWareHouseMgr;
    final showDeliveryTeamOption = isDistributor && !isWareHouseMgr;

    final pages =
        context.read<FormsBloc>().state.cachedSchemas['MANAGESTOCK']?.pages;
    final wrapperData = widget.stateData?.stateWrapper;
    if (wrapperData == null) {
      return const SizedBox.shrink();
    }
    final wrapperList = wrapperData as List<Map<String, List<dynamic>>>;

    final projectFacilities = wrapperList.firstWhere(
        (m) => m.containsKey('ProjectFacilityModel'))['ProjectFacilityModel'];

    String? labelFromSchema;
    List<DropdownItem> enums = [];

    void walk(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == widget.formKey) {
          labelFromSchema = schema.label ?? schema.innerLabel;

          // Build facility list with Delivery Team option if applicable
          final facilities = <DropdownItem>[];

          // Add Delivery Team option for distributors who are not warehouse managers
          if (showDeliveryTeamOption) {
            facilities.add(const DropdownItem(
              code: 'Delivery Team',
              name: 'Delivery Team',
            ));
          }

          // Add actual facilities
          facilities.addAll(projectFacilities?.map((e) {
                final model = e as ProjectFacilityModel;
                return DropdownItem(
                  code: model.facilityId,
                  name: localizations.translate('FAC_${model.facilityId}'),
                );
              }).toList() ??
              []);

          enums = facilities;
          return;
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!);
        }
      }
    }

    walk(pages!);

    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
      builder: (context, scannerState) {
        // Update team code from scanner
        if (deliveryTeamSelected && scannerState.qrCodes.isNotEmpty) {
          teamCodeController.text = scannerState.qrCodes.first;
        }

        return ReactiveWrapperField(
          formControlName: widget.formKey,
          validationMessages: {
            'required': (_) => localizations.translate(
                  "APPONE_MANAGESTOCK_WAREHOUSE_label_${widget.formKey}_mandatory_message",
                ),
          },
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                labelFromSchema ?? "Select Facility",
              ),
              isRequired: true,
              child: DigitDropdown(
                errorMessage: field.errorText,
                emptyItemText: localizations.translate(
                  'NOT_FOUND',
                ),
                items: enums,
                selectedOption: selectedFacilityId != null
                    ? DropdownItem(
                        code: selectedFacilityId!,
                        name: selectedFacilityId == 'Delivery Team'
                            ? 'Delivery Team'
                            : localizations
                                .translate('FAC_$selectedFacilityId'),
                      )
                    : const DropdownItem(name: '', code: ''),
                onSelect: (value) {
                  setState(() {
                    selectedFacilityId = value.code;
                    deliveryTeamSelected = value.code == 'Delivery Team';
                  });

                  final form = ReactiveForm.of(context) as FormGroup;

                  // Clear team code when switching facilities
                  if (!deliveryTeamSelected) {
                    form.control(widget.dependantFormKey).value = '';
                    teamCodeController.clear();
                    context.read<DigitScannerBloc>().add(
                        const DigitScannerEvent.handleScanner(
                            barCode: [], qrCode: []));
                  }

                  field.control.value = value.code;

                  // Update FormsBloc with appropriate values
                  if (deliveryTeamSelected) {
                    context.read<FormsBloc>().add(
                          FormsEvent.updateField(
                            schemaKey: 'MANAGESTOCK',
                            context: context,
                            key: widget.formKey,
                            value: value.code,
                          ),
                        );
                  } else {
                    final selectedModel = projectFacilities!
                        .map((e) => e as ProjectFacilityModel)
                        .firstWhere((m) => m.facilityId == value.code);

                    context.read<FormsBloc>().add(
                          FormsEvent.updateField(
                              schemaKey: 'MANAGESTOCK',
                              context: context,
                              key: widget.formKey,
                              value: selectedModel.facilityId),
                        );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
