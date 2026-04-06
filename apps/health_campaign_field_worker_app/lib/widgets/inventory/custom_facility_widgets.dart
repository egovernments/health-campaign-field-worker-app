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
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.schemaName]?.pages;

    if (pages == null) {
      return const SizedBox.shrink();
    }

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

class _FacilityCardContent extends StatelessWidget {
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

  /// Extract the delivery team code from the facilityHierarchy validation in config.
  String? _getDeliveryTeamCodeFromConfig(String transactionType) {
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

    final isReceipt = transactionType == 'RECEIVED' ||
        transactionType == 'RECEIPT' ||
        transactionType == 'RETURNED';
    final directionKey = isReceipt ? 'forReceipt' : 'forIssue';

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

  /// Read current selected value from form data or form control
  String? _getCurrentValue(AbstractControl<dynamic>? control) {
    // First try form control (most up-to-date after user interaction)
    final controlValue = control?.value?.toString();
    if (controlValue != null && controlValue.isNotEmpty) {
      return controlValue;
    }

    // Fallback to stateData.formData (for prefilled values)
    final formData = stateData?.formData as Map<String, dynamic>?;
    if (formData == null) return null;

    final value = formData['warehouseDetails.$formKey'] ??
        formData[formKey] ??
        (formData['warehouseDetails'] as Map<String, dynamic>?)?[formKey] ??
        (formData['stockDetails'] as Map<String, dynamic>?)?[formKey];

    return (value != null && value.toString().isNotEmpty)
        ? value.toString()
        : null;
  }

  String _getDisplayName(String facilityId, String? deliveryTeamCode) {
    if (facilityId == deliveryTeamCode) {
      return localizations.translate('DELIVERY_TEAM');
    }
    final isUuid = facilityId.contains('-') && !facilityId.startsWith('F-');
    return isUuid ? facilityId : localizations.translate('FAC_$facilityId');
  }

  @override
  Widget build(BuildContext context) {
    final navigationParams = FlowCrudStateRegistry()
            .getNavigationParams('FORM::$pageSchema') ??
        FlowCrudStateRegistry().getNavigationParams(pageSchema) ??
        {};
    final transactionType =
        navigationParams['transactionType']?.toString() ?? '';
    final stockEntryType =
        navigationParams['stockEntryType']?.toString() ?? '';
    final isReturnFlow = stockEntryType == 'RETURNED';

    final deliveryTeamCode = _getDeliveryTeamCodeFromConfig(transactionType);
    final hasDeliveryTeamInConfig = deliveryTeamCode != null;

    // Get wrapper data for project facilities
    var wrapperData = stateData?.stateWrapper;
    if (wrapperData == null) {
      final formState = FlowCrudStateRegistry().get('FORM::$pageSchema') ??
          FlowCrudStateRegistry().get(pageSchema);
      wrapperData = formState?.stateWrapper;
    }

    List<dynamic>? projectFacilities;
    if (wrapperData != null && wrapperData is List && wrapperData.isNotEmpty) {
      final firstItem = wrapperData.first;
      if (firstItem is Map) {
        final wrapperList = wrapperData as List<Map<String, List<dynamic>>>;
        projectFacilities = wrapperList.firstWhere(
            (m) => m.containsKey('ProjectFacilityModel'),
            orElse: () => {'ProjectFacilityModel': []})['ProjectFacilityModel'];
      } else if (firstItem is ProjectFacilityModel) {
        projectFacilities = wrapperData;
      } else {
        projectFacilities =
            wrapperData.whereType<ProjectFacilityModel>().toList();
      }
    }
    projectFacilities ??= [];

    final labelFromSchema = fieldSchema.label ?? fieldSchema.innerLabel;

    final isToField = formKey == 'facilityToWhich';
    final isFromField = formKey == 'facilityFromWhich';

    // Filter facilities
    final filteredFacilities = projectFacilities.where((e) {
      final model = e as ProjectFacilityModel;
      final facilityLevel = model.additionalFields?.fields
          .where((f) => f.key == 'facilityLevel')
          .firstOrNull
          ?.value;

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

    // Build facility dropdown items
    var facilities = <DropdownItem>[];

    final showDeliveryTeam = hasDeliveryTeamInConfig &&
        ((isToField &&
                !isReturnFlow &&
                (transactionType == 'DISPATCHED' ||
                    transactionType == 'ISSUED')) ||
            (isFromField && isReturnFlow));
    if (showDeliveryTeam) {
      facilities.add(DropdownItem(
        code: deliveryTeamCode!,
        name: localizations.translate('DELIVERY_TEAM'),
      ));
    }

    facilities.addAll(filteredFacilities.map((e) {
      final model = e as ProjectFacilityModel;
      final facilityId = model.facilityId;
      final isUuid = facilityId.contains('-') && !facilityId.startsWith('F-');
      return DropdownItem(
        code: facilityId,
        name: isUuid
            ? facilityId
            : localizations.translate('FAC_$facilityId'),
      );
    }).toList());

    return BaseReactiveFieldWrapper(
      formControlName: formKey,
      schema: fieldSchema,
      builder: (field) {
        // Read selected value from the form control (source of truth)
        var selectedValue = _getCurrentValue(field.control);

        // For return flow, auto-prefill delivery team if no value yet
        if (isReturnFlow &&
            isFromField &&
            hasDeliveryTeamInConfig &&
            (selectedValue == null || selectedValue.isEmpty)) {
          selectedValue = deliveryTeamCode;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            field.control.value = deliveryTeamCode;
            context.read<FormsBloc>().add(
                  FormsEvent.updateField(
                    schemaKey: pageSchema,
                    context: context,
                    key: formKey,
                    value: deliveryTeamCode,
                  ),
                );
          });
        }

        // For ISSUED/DISPATCHED, auto-prefill the from field with current facility
        if (isFromField &&
            (transactionType == 'DISPATCHED' ||
                transactionType == 'ISSUED') &&
            (selectedValue == null || selectedValue.isEmpty) &&
            facilities.isNotEmpty) {
          final currentFacility = facilities.first.code;
          selectedValue = currentFacility;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            field.control.value = currentFacility;
            context.read<FormsBloc>().add(
                  FormsEvent.updateField(
                    schemaKey: pageSchema,
                    context: context,
                    key: formKey,
                    value: currentFacility,
                  ),
                );
          });
        }

        final selectedOption = (selectedValue != null && selectedValue.isNotEmpty)
            ? DropdownItem(
                code: selectedValue,
                name: _getDisplayName(selectedValue, deliveryTeamCode),
              )
            : null;

        // Make from field read-only for ISSUED/DISPATCHED
        final isReadOnlyFrom = isFromField &&
            (transactionType == 'DISPATCHED' ||
                transactionType == 'ISSUED');

        return LabeledField(
          label: labelFromSchema != null
              ? localizations.translate(labelFromSchema)
              : localizations.translate("SELECT_FACILITY"),
          capitalizedFirstLetter: false,
          isRequired: true,
          child: DigitDropdown(
            key: ValueKey('dropdown_${formKey}_$selectedValue'),
            errorMessage: field.errorText,
            emptyItemText: localizations.translate('NOT_FOUND'),
            items: facilities,
            selectedOption: selectedOption,
            readOnly: isReadOnlyFrom,
            onSelect: (value) {
              field.control.value = value.code;

              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      schemaKey: pageSchema,
                      context: context,
                      key: formKey,
                      value: value.code,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
