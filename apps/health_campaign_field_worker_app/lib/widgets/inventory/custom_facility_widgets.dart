import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../models/entities/roles_type.dart';
import '../../utils/extensions/extensions.dart';
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

    // Wrap with ValueListenableBuilder to rebuild when state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable:
          FlowCrudStateRegistry().listen('FORM::${widget.schemaName}'),
      builder: (context, flowState, _) {
        return _FacilityCardContent(
          formKey: widget.formKey,
          dependantFormKey: widget.dependantFormKey,
          fieldSchema: fieldSchema!,
          stateData: widget.stateData,
          pageSchema: widget.schemaName,
          localizations: localizations,
        );
      },
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
          (formData['warehouseDetails']
              as Map<String, dynamic>?)?[widget.formKey] ??
          (formData['stockDetails'] as Map<String, dynamic>?)?[widget.formKey];

      debugPrint(
          'FacilityCard: Looking for ${widget.formKey}, found: $facilityValue');

      if (facilityValue != null && facilityValue.toString().isNotEmpty) {
        selectedFacilityId = facilityValue.toString();
        deliveryTeamSelected = selectedFacilityId == 'DELIVERY_TEAM';
        _initialized = true;
        _formControlUpdated =
            false; // Need to update form control when available
        debugPrint(
            'FacilityCard: Initialized ${widget.formKey} with prefilled value: $selectedFacilityId');
      }
    }
  }

  /// Updates the form control with the prefilled value
  /// This must be called after the form is built and the control is accessible
  void _updateFormControlIfNeeded(
      ReactiveFormFieldState<dynamic, dynamic> field) {
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

        // If delivery team is prefilled, also sync the team code
        if (deliveryTeamSelected && teamCodeController.text.isNotEmpty) {
          final form = ReactiveForm.of(context);
          if (form is FormGroup && form.contains(widget.dependantFormKey)) {
            form.control(widget.dependantFormKey).value =
                teamCodeController.text;
          }
          context.read<FormsBloc>().add(
                FormsEvent.updateField(
                  schemaKey: widget.pageSchema,
                  context: context,
                  key: widget.dependantFormKey,
                  value: teamCodeController.text,
                ),
              );
        }

        debugPrint(
            'FacilityCard: Updated form control ${widget.formKey} with value: $selectedFacilityId');
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
    final isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
        )
        .toList()
        .isNotEmpty;
    final isWareHouseMgr = context.loggedInUserRoles
        .where((role) => role.code == RolesType.warehouseManager.toValue())
        .toList()
        .isNotEmpty;

    final showDeliveryTeamOption = isDistributor && !isWareHouseMgr;

    // Try to get wrapper data from multiple sources
    // First try the passed stateData, then try current form state directly
    var wrapperData = widget.stateData?.stateWrapper;

    // If stateData wrapper is null, try to get from FlowCrudStateRegistry
    if (wrapperData == null) {
      final formState =
          FlowCrudStateRegistry().get('FORM::${widget.pageSchema}') ??
              FlowCrudStateRegistry().get(widget.pageSchema);
      wrapperData = formState?.stateWrapper;
    }

    // Extract ProjectFacilityModel from wrapper data
    // Handle different wrapper data structures
    List<dynamic>? projectFacilities;

    if (wrapperData != null && wrapperData is List && wrapperData.isNotEmpty) {
      final firstItem = wrapperData.first;
      if (firstItem is Map) {
        // Old structure: List<Map<String, List<dynamic>>>
        final wrapperList = wrapperData as List<Map<String, List<dynamic>>>;
        projectFacilities = wrapperList.firstWhere(
            (m) => m.containsKey('ProjectFacilityModel'),
            orElse: () => {'ProjectFacilityModel': []})['ProjectFacilityModel'];
      } else if (firstItem is ProjectFacilityModel) {
        // Direct list of ProjectFacilityModel
        projectFacilities = wrapperData;
      } else {
        // Mixed EntityModel list - filter for ProjectFacilityModel
        projectFacilities =
            wrapperData.whereType<ProjectFacilityModel>().toList();
      }
    }

    projectFacilities ??= [];

    final labelFromSchema =
        widget.fieldSchema.label ?? widget.fieldSchema.innerLabel;

    // Get transaction type from navigation params for hierarchy filtering
    // Try current form's navigation params
    final navigationParams = FlowCrudStateRegistry()
            .getNavigationParams('FORM::${widget.pageSchema}') ??
        FlowCrudStateRegistry().getNavigationParams(widget.pageSchema) ??
        {};
    final transactionType =
        navigationParams['transactionType']?.toString() ?? '';
    final stockEntryType = navigationParams['stockEntryType']?.toString() ?? '';
    final isReturnFlow = stockEntryType == 'RETURNED';

    debugPrint(
        'FacilityCard: Transaction type: $transactionType, stockEntryType: $stockEntryType');

    // Filter facilities by facilityLevel based on transaction type and field
    // facilityToWhich = destination, facilityFromWhich = source
    final isToField = widget.formKey == 'facilityToWhich';
    final isFromField = widget.formKey == 'facilityFromWhich';

    // For return flow, prefill facilityFromWhich with "Delivery Team"
    // and set team code to logged-in user's UUID
    final isLeastLevel = showDeliveryTeamOption;
    if (isReturnFlow && isFromField && isLeastLevel && !_initialized) {
      selectedFacilityId = 'DELIVERY_TEAM';
      deliveryTeamSelected = true;
      teamCodeController.text = context.loggedInUserUuid;
      _initialized = true;
      _formControlUpdated = false;
    }

    final filteredFacilities = projectFacilities.where((e) {
      final model = e as ProjectFacilityModel;
      final facilityLevel = model.additionalFields?.fields
          .where((f) => f.key == 'facilityLevel')
          .firstOrNull
          ?.value;

      // If no facilityLevel (e.g. from ProjectFacilities list), always include
      if (facilityLevel == null) return true;

      if (isReturnFlow) {
        if (isToField) return facilityLevel == 'parent';
        if (isFromField) return facilityLevel == 'current';
      } else if (transactionType == 'DISPATCHED' ||
          transactionType == 'ISSUED') {
        if (isToField) return facilityLevel == 'child';
        if (isFromField) return facilityLevel == 'current';
      } else if (transactionType == 'RECEIVED' ||
          transactionType == 'RECEIPT') {
        if (isToField) return facilityLevel == 'current';
        if (isFromField) return facilityLevel == 'parent';
      }

      return true;
    }).toList();

    // Build facility list with Delivery Team option if applicable
    var facilities = <DropdownItem>[];

    // Show Delivery Team option:
    // 1. In "to" field for DISPATCHED/ISSUED when user is distributor or no child facilities
    // 2. In "from" field for RETURNED flow when user is distributor (least level)
    final showDeliveryTeam = (isToField &&
            (transactionType == 'DISPATCHED' || transactionType == 'ISSUED') &&
            (showDeliveryTeamOption || filteredFacilities.isEmpty)) ||
        (isFromField && isReturnFlow && isLeastLevel);
    if (showDeliveryTeam) {
      facilities.add(const DropdownItem(
        code: 'DELIVERY_TEAM',
        name: 'Delivery Team',
      ));
    }

    // Add actual facilities
    facilities.addAll(filteredFacilities.map((e) {
      final model = e as ProjectFacilityModel;
      final facilityId = model.facilityId;
      // Don't prepend FAC_ for UUIDs (distributor's own ID)
      final isUuid = facilityId.contains('-') && !facilityId.startsWith('F-');
      return DropdownItem(
        code: facilityId,
        name: isUuid
            ? facilityId
            : widget.localizations.translate('FAC_$facilityId'),
      );
    }).toList());

    final enums = facilities;

    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
      builder: (context, scannerState) {
        // Update team code from scanner
        if (deliveryTeamSelected && scannerState.qrCodes.isNotEmpty) {
          final scannedCode = scannerState.qrCodes.first;
          if (teamCodeController.text != scannedCode) {
            teamCodeController.text = scannedCode;
            // Sync scanned value to form
            final form = ReactiveForm.of(context);
            if (form is FormGroup && form.contains(widget.dependantFormKey)) {
              form.control(widget.dependantFormKey).value = scannedCode;
            }
            context.read<FormsBloc>().add(
                  FormsEvent.updateField(
                    schemaKey: widget.pageSchema,
                    context: context,
                    key: widget.dependantFormKey,
                    value: scannedCode,
                  ),
                );
          }
        }

        // Use BaseReactiveFieldWrapper to automatically handle all validation messages
        return BaseReactiveFieldWrapper(
          formControlName: widget.formKey,
          schema: widget
              .fieldSchema, // Pass the schema - it handles all validations!
          builder: (field) {
            // Update form control with prefilled value if needed
            _updateFormControlIfNeeded(field);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledField(
                  label: labelFromSchema != null
                      ? widget.localizations.translate(
                          labelFromSchema,
                        )
                      : widget.localizations.translate("SELECT_FACILITY"),
                  capitalizedFirstLetter: false,
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
                            name: selectedFacilityId == 'DELIVERY_TEAM'
                                ? 'Delivery Team'
                                : (selectedFacilityId!.contains('-') &&
                                        !selectedFacilityId!.startsWith('F-'))
                                    ? selectedFacilityId!
                                    : widget.localizations
                                        .translate('FAC_$selectedFacilityId'),
                          )
                        : const DropdownItem(name: '', code: ''),
                    onSelect: (value) {
                      setState(() {
                        selectedFacilityId = value.code;
                        deliveryTeamSelected = value.code == 'DELIVERY_TEAM';
                      });

                      final form = ReactiveForm.of(context) as FormGroup;

                      // Clear team code when switching facilities
                      if (!deliveryTeamSelected) {
                        if (form.contains(widget.dependantFormKey)) {
                          form.control(widget.dependantFormKey).value = '';
                        }
                        teamCodeController.clear();
                        context.read<DigitScannerBloc>().add(
                            const DigitScannerEvent.handleScanner(
                                barCode: [], qrCode: []));
                      }

                      field.control.value = value.code;

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
                ),
                if (deliveryTeamSelected) ...[
                  const SizedBox(height: 16),
                  LabeledField(
                    label: widget.localizations
                        .translate('INVENTORY_TEAM_CODE_LABEL'),
                    isRequired: true,
                    child: DigitTextFormInput(
                      controller: teamCodeController,
                      keyboardType: TextInputType.text,
                      onChange: (value) {
                        final form = ReactiveForm.of(context) as FormGroup;
                        if (form.contains(widget.dependantFormKey)) {
                          form.control(widget.dependantFormKey).value = value;
                        }
                        context.read<FormsBloc>().add(
                              FormsEvent.updateField(
                                schemaKey: widget.pageSchema,
                                context: context,
                                key: widget.dependantFormKey,
                                value: value,
                              ),
                            );
                      },
                      suffixIcon: Icons.qr_code_scanner,
                      onSuffixTap: (value) {
                        context.router.push(DigitScannerRoute(
                          singleValue: true,
                          quantity: 1,
                          isGS1code: false,
                          scannerId: widget.dependantFormKey,
                        ));
                      },
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
