import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
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
  final dynamic stateData;
  final String schemaName;

  const FacilityCard(
      {super.key,
      super.appLocalizations,
      required this.formKey,
      required this.dependantFormKey,
      required this.stateData,
      required this.schemaName});

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends LocalizedState<FacilityCard> {
  @override
  Widget build(BuildContext context) {
    // Get schema from FormsBloc
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.schemaName]?.pages;

    if (pages == null) {
      return const SizedBox.shrink();
    }

    // Find the field schema
    PropertySchema? fieldSchema;
    void findSchema(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        if (entry.key == widget.formKey) {
          fieldSchema = entry.value;
          return;
        }
        if (entry.value.properties != null &&
            entry.value.properties!.isNotEmpty) {
          findSchema(entry.value.properties!);
        }
      }
    }

    findSchema(pages);

    if (fieldSchema == null) {
      return const SizedBox.shrink();
    }

    return _FacilityCardContent(
      formKey: widget.formKey,
      dependantFormKey: widget.dependantFormKey,
      fieldSchema: fieldSchema!,
      stateData: widget.stateData,
      pageSchema: widget.schemaName,
      localizations: localizations,
    );
  }
}

class _FacilityCardContent extends StatefulWidget {
  final String formKey;
  final String dependantFormKey;
  final PropertySchema fieldSchema;
  final String pageSchema;
  final dynamic stateData;
  final dynamic localizations;

  const _FacilityCardContent({
    required this.formKey,
    required this.dependantFormKey,
    required this.fieldSchema,
    required this.pageSchema,
    required this.stateData,
    required this.localizations,
  });

  @override
  State<_FacilityCardContent> createState() => __FacilityCardContentState();
}

class __FacilityCardContentState extends State<_FacilityCardContent> {
  bool deliveryTeamSelected = false;
  String? selectedFacilityId;
  TextEditingController teamCodeController = TextEditingController();
  bool _initialized = false;
  bool _formControlUpdated = false;

  @override
  void initState() {
    super.initState();
    // Clear QR codes on init
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));

    // Initialize from prefilled formData if available
    _initializeFromFormData();
  }

  void _initializeFromFormData() {
    if (_initialized) return;

    // Get prefilled value from stateData.formData
    final formData = widget.stateData?.formData as Map<String, dynamic>?;
    debugPrint('FacilityCard: formData for ${widget.formKey} = $formData');

    if (formData != null) {
      // Try to get facility value - check both nested and flat structure
      final facilityValue = formData['warehouseDetails.${widget.formKey}'] ??
          formData[widget.formKey] ??
          (formData['warehouseDetails'] as Map<String, dynamic>?)?[widget.formKey] ??
          (formData['stockDetails'] as Map<String, dynamic>?)?[widget.formKey];

      debugPrint('FacilityCard: Looking for ${widget.formKey}, found: $facilityValue');

      if (facilityValue != null && facilityValue.toString().isNotEmpty) {
        selectedFacilityId = facilityValue.toString();
        deliveryTeamSelected = selectedFacilityId == 'Delivery Team';
        _initialized = true;
        _formControlUpdated = false; // Need to update form control when available
        debugPrint('FacilityCard: Initialized ${widget.formKey} with prefilled value: $selectedFacilityId');
      }
    }
  }

  /// Updates the form control with the prefilled value
  /// This must be called after the form is built and the control is accessible
  void _updateFormControlIfNeeded(ReactiveFormFieldState<dynamic, dynamic> field) {
    if (_initialized && !_formControlUpdated && selectedFacilityId != null) {
      // Schedule the update for after the current build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        // Update the form control value
        field.control.value = selectedFacilityId;

        // Also update FormsBloc to sync state
        context.read<FormsBloc>().add(
              FormsEvent.updateField(
                schemaKey: widget.pageSchema,
                context: context,
                key: widget.formKey,
                value: selectedFacilityId,
              ),
            );

        debugPrint('FacilityCard: Updated form control ${widget.formKey} with value: $selectedFacilityId');
      });
      _formControlUpdated = true;
    }
  }

  @override
  void didUpdateWidget(covariant _FacilityCardContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-initialize if stateData changed and we haven't initialized yet
    if (!_initialized && widget.stateData != oldWidget.stateData) {
      _initializeFromFormData();
    }
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

    final wrapperData = widget.stateData?.stateWrapper;
    if (wrapperData == null) {
      return const SizedBox.shrink();
    }
    final wrapperList = wrapperData as List<Map<String, List<dynamic>>>;

    final projectFacilities = wrapperList.firstWhere(
        (m) => m.containsKey('ProjectFacilityModel'))['ProjectFacilityModel'];

    final labelFromSchema =
        widget.fieldSchema.label ?? widget.fieldSchema.innerLabel;

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
            name: widget.localizations.translate('FAC_${model.facilityId}'),
          );
        }).toList() ??
        []);

    final enums = facilities;

    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
      builder: (context, scannerState) {
        // Update team code from scanner
        if (deliveryTeamSelected && scannerState.qrCodes.isNotEmpty) {
          teamCodeController.text = scannerState.qrCodes.first;
        }

        // Use BaseReactiveFieldWrapper to automatically handle all validation messages
        return BaseReactiveFieldWrapper(
          formControlName: widget.formKey,
          schema: widget
              .fieldSchema, // Pass the schema - it handles all validations!
          builder: (field) {
            // Update form control with prefilled value if needed
            _updateFormControlIfNeeded(field);

            return LabeledField(
              label: widget.localizations.translate(
                labelFromSchema ?? "Select Facility",
              ),
              isRequired: true,
              child: DigitDropdown(
                errorMessage: field.errorText,
                emptyItemText: widget.localizations.translate(
                  'NOT_FOUND',
                ),
                items: enums,
                selectedOption: selectedFacilityId != null
                    ? DropdownItem(
                        code: selectedFacilityId!,
                        name: selectedFacilityId == 'Delivery Team'
                            ? 'Delivery Team'
                            : widget.localizations
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
                            schemaKey: widget.pageSchema,
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
                              schemaKey: widget.pageSchema,
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
