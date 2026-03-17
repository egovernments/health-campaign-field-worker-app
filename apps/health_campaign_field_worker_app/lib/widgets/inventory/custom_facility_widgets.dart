import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_scanner/blocs/scanner.dart';
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
      valueListenable: FlowCrudStateRegistry().listen('FORM::${widget.schemaName}'),
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

  /// Extracts facilityHierarchy validation config from field schema
  Map<String, dynamic>? _getFacilityHierarchyConfig() {
    final validations = widget.fieldSchema.validations;
    if (validations == null || validations.isEmpty) return null;

    for (final validation in validations) {
      if (validation.type == 'facilityHierarchy' && validation.value != null) {
        return validation.value as Map<String, dynamic>;
      }
    }
    return null;
  }

  /// Gets the current user's facility level based on their role
  String _getCurrentUserFacilityLevel() {
    final isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
    )
        .toList()
        .isNotEmpty;
    final isWareHouseMgr = context.loggedInUserRoles
        .where(
            (role) => role.code == RolesType.warehouseManager.toValue())
        .toList()
        .isNotEmpty;

    // Determine facility level based on role
    // Warehouse Manager (LGA level) > Distributor (Health Facility level)
    if (isWareHouseMgr) {
      return 'LGA'; // Warehouse managers are at LGA level
    } else if (isDistributor) {
      return 'Health Facility'; // Distributors operate from Health Facility
    }
    // Default to Health Facility for supervisors and other roles
    return 'Health Facility';
  }

  /// Filters facilities based on hierarchy config and transaction type
  List<DropdownItem> _filterFacilitiesByHierarchy(
    List<DropdownItem> allFacilities,
    Map<String, dynamic> hierarchyConfig,
    String transactionType,
  ) {
    final hierarchyMapping =
        hierarchyConfig['hierarchyMapping'] as Map<String, dynamic>?;
    final useTransactionType =
        hierarchyConfig['useTransactionType'] as bool? ?? false;

    if (hierarchyMapping == null) return allFacilities;

    final currentLevel = _getCurrentUserFacilityLevel();
    final levelConfig = hierarchyMapping[currentLevel] as Map<String, dynamic>?;

    if (levelConfig == null) return allFacilities;

    // Determine which facility types to show based on transaction type
    List<dynamic> allowedTypes = [];
    if (useTransactionType) {
      if (transactionType == 'RECEIVED' || transactionType == 'RECEIPT') {
        allowedTypes = levelConfig['forReceipt'] as List<dynamic>? ?? [];
      } else if (transactionType == 'DISPATCHED' ||
          transactionType == 'ISSUED') {
        allowedTypes = levelConfig['forIssue'] as List<dynamic>? ?? [];
      } else {
        // For RETURNED, DAMAGED, LOSS - show all relevant facilities
        allowedTypes = [
          ...(levelConfig['forReceipt'] as List<dynamic>? ?? []),
          ...(levelConfig['forIssue'] as List<dynamic>? ?? []),
        ];
      }
    }

    if (allowedTypes.isEmpty) return allFacilities;

    // Check if DELIVERY_TEAM is in allowed types
    final allowDeliveryTeam = allowedTypes.contains('DELIVERY_TEAM');

    // Filter facilities - for now return all since actual facility type filtering
    // would require additional metadata about each facility's type
    // This can be enhanced when facility type info is available
    return allFacilities.where((facility) {
      // Always include Delivery Team if allowed
      if (facility.code == 'Delivery Team') {
        return allowDeliveryTeam;
      }
      // Include all other facilities for now (can be enhanced with type filtering)
      return true;
    }).toList();
  }

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
        deliveryTeamSelected = selectedFacilityId == 'Delivery Team';
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
        .where(
            (role) => role.code == RolesType.warehouseManager.toValue())
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
    final navigationParams =
        FlowCrudStateRegistry().getNavigationParams('FORM::${widget.pageSchema}') ??
            FlowCrudStateRegistry().getNavigationParams(widget.pageSchema) ??
            {};
    final transactionType =
        navigationParams['transactionType']?.toString() ?? '';

    debugPrint(
        'FacilityCard: Transaction type for filtering: $transactionType');

    // Build facility list with Delivery Team option if applicable
    var facilities = <DropdownItem>[];

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

    // Apply facility hierarchy filtering if configured
    final hierarchyConfig = _getFacilityHierarchyConfig();
    if (hierarchyConfig != null && transactionType.isNotEmpty) {
      facilities = _filterFacilitiesByHierarchy(
        facilities,
        hierarchyConfig,
        transactionType,
      );
      debugPrint(
          'FacilityCard: Applied hierarchy filter, facilities count: ${facilities.length}');
    }

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
                    // Check if the dependant form control exists before accessing it
                    if (form.contains(widget.dependantFormKey)) {
                      form.control(widget.dependantFormKey).value = '';
                    }
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
