import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  bool _initialized = false;
  bool _formControlUpdated = false;

  @override
  void initState() {
    super.initState();
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
        // deliveryTeamSelected will be set in build() when config is available
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

  /// Extract the delivery team code from the facilityHierarchy validation in config.
  /// Returns the code (e.g. 'DELIVERY_TEAM') if present for the given transaction type,
  /// or null if not configured.
  String? _getDeliveryTeamCodeFromConfig(
      PropertySchema fieldSchema, String transactionType) {
    final hierarchyValidation = fieldSchema.validations?.firstWhere(
      (v) => v.type == 'facilityHierarchy',
      orElse: () => const ValidationRule(type: ''),
    );

    if (hierarchyValidation == null || hierarchyValidation.type.isEmpty) {
      return null;
    }

    final value = hierarchyValidation.value;
    if (value is! Map) return null;

    final hierarchyMapping = value['hierarchyMapping'];
    if (hierarchyMapping is! Map) return null;

    // Determine the key based on transaction type
    final isReceipt = transactionType == 'RECEIVED' ||
        transactionType == 'RECEIPT' ||
        transactionType == 'RETURNED';
    final directionKey = isReceipt ? 'forReceipt' : 'forIssue';

    // Search all facility levels for DELIVERY_TEAM in the appropriate direction
    for (final entry in hierarchyMapping.entries) {
      final directions = entry.value;
      if (directions is Map && directions.containsKey(directionKey)) {
        final targets = directions[directionKey];
        if (targets is List) {
          for (final target in targets) {
            if (target is String && target.startsWith('DELIVERY')) {
              return target;
            }
          }
        }
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Get the delivery team code from config's facilityHierarchy validation
    final deliveryTeamCode = _getDeliveryTeamCodeFromConfig(
        widget.fieldSchema,
        FlowCrudStateRegistry()
                .getNavigationParams('FORM::${widget.pageSchema}')?['transactionType']
                ?.toString() ??
            FlowCrudStateRegistry()
                .getNavigationParams(widget.pageSchema)?['transactionType']
                ?.toString() ??
            '');
    final hasDeliveryTeamInConfig = deliveryTeamCode != null;

    // Sync deliveryTeamSelected with config-derived code (for prefilled values)
    if (selectedFacilityId != null && hasDeliveryTeamInConfig) {
      deliveryTeamSelected = selectedFacilityId == deliveryTeamCode;
    }

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

    // For return flow, prefill facilityFromWhich with delivery team from config
    if (isReturnFlow &&
        isFromField &&
        hasDeliveryTeamInConfig &&
        !_initialized) {
      selectedFacilityId = deliveryTeamCode;
      deliveryTeamSelected = true;
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
        if (isFromField) {
          return hasDeliveryTeamInConfig
              ? facilityLevel == 'parent'
              : facilityLevel == 'current';
        }
      } else if (transactionType == 'RECEIVED' ||
          transactionType == 'RECEIPT') {
        if (isToField) return facilityLevel == 'current';
        if (isFromField) return facilityLevel == 'parent';
      }

      return true;
    }).toList();

    // Build facility list with Delivery Team option if applicable
    var facilities = <DropdownItem>[];

    // Show Delivery Team option when configured in facilityHierarchy:
    // 1. In "to" field for DISPATCHED/ISSUED (not return flow) when config has delivery team or no child facilities
    // 2. In "from" field for RETURNED flow when config has delivery team
    final showDeliveryTeam = hasDeliveryTeamInConfig &&
        ((isToField &&
                !isReturnFlow &&
                (transactionType == 'DISPATCHED' ||
                    transactionType == 'ISSUED')) ||
            (isFromField && isReturnFlow));
    if (showDeliveryTeam) {
      facilities.add(DropdownItem(
        code: deliveryTeamCode!,
        name: widget.localizations.translate('DELIVERY_TEAM'),
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

    // Use BaseReactiveFieldWrapper to automatically handle all validation messages
    return BaseReactiveFieldWrapper(
      formControlName: widget.formKey,
      schema: widget.fieldSchema,
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
                    name: selectedFacilityId == deliveryTeamCode
                        ? widget.localizations.translate('DELIVERY_TEAM')
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
                deliveryTeamSelected = value.code == deliveryTeamCode;
              });

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
        );
      },
    );
  }
}
