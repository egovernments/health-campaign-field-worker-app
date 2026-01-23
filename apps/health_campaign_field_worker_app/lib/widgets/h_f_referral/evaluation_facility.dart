import 'package:digit_data_model/blocs/project_facility/project_facility.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/helper/validation_message_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/utils.dart';
import '../localized.dart';

class EvaluationKeyDropDown extends LocalizedStatefulWidget {
  final String schemaName;
  final String formControlName;
  const EvaluationKeyDropDown({
    super.key,
    super.appLocalizations,
    required this.schemaName,
    required this.formControlName,
  });

  @override
  _EvaluationKeyDropDownState createState() => _EvaluationKeyDropDownState();
}

class _EvaluationKeyDropDownState
    extends LocalizedState<EvaluationKeyDropDown> {
  static const _evaluationKey = 'evaluationFacility';
  static const _facilityIdKey = 'facilityId';
  static const _projectFacilityIdKey = 'projectFacilityId';

  @override
  void initState() {
    super.initState();

    context.read<ProjectFacilityBloc>().add(ProjectFacilityLoadEvent(
        query: ProjectFacilitySearchModel(
            projectId: [context.selectedProject.id])));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectFacilityBloc, ProjectFacilityState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildDropdown(context, []),
          fetched: (projectFacilities) =>
              _buildDropdown(context, projectFacilities),
        );
      },
    );
  }

  Widget _buildDropdown(
      BuildContext context, List<ProjectFacilityModel> projectFacilities) {
    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;
    bool isRequiredFromSchema = false;
    dynamic validationMessages;

    final pages = context
            .read<FormsBloc>()
            .state
            .cachedSchemas[widget.schemaName]
            ?.pages ??
        context.read<FormsBloc>().state.cachedSchemas["REFERRAL_CREATE"]?.pages;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == widget.formControlName) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          if (schema.validations != null) {
            validationMessages =
                buildValidationMessages(schema.validations, localizations);
            for (final validation in schema.validations!) {
              if (validation.type == "required" && validation.value == true) {
                isRequiredFromSchema = true;
                break;
              }
            }
          }
          return;
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!, [...pathSoFar, key]);
          if (labelFromSchema != null || isReadOnlyFromSchema) return;
        }
      }
    }

    if (pages != null) {
      walk(pages, []);
    }

    return ReactiveWrapperField<dynamic>(
      formControlName: widget.formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final form = ReactiveForm.of(context) as FormGroup;

        return LabeledField(
          isRequired: isRequiredFromSchema,
          label: localizations.translate(labelFromSchema ?? ""),
          child: Dropdown(
            readOnly: isReadOnlyFromSchema,
            selectedOption: _mapItems(projectFacilities).firstWhere(
              (item) => item.code == form.control(widget.formControlName).value,
              orElse: () => const DropdownItem(name: '', code: ''),
            ),
            errorMessage: field.errorText,
            items: _mapItems(projectFacilities),
            onSelect: (val) {
              form.control(widget.formControlName).markAsTouched();
              form.control(widget.formControlName).value = val.code;

              // Store the projectFacilityId (val.code is projectFacilityId)
              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      context: context,
                      schemaKey: widget.schemaName,
                      key: widget.formControlName,
                      value: val.code,
                    ),
                  );

              // For REFER_BENEFICIARY, also store separate facilityId and projectFacilityId
              // so transformer can map them to different entities
              if (widget.schemaName == "REFER_BENEFICIARY") {
                final facilityId = _getFacilityIdForProjectFacility(
                    projectFacilities, val.code);

                // Store facilityId for Referral entity
                context.read<FormsBloc>().add(
                      FormsEvent.updateField(
                        context: context,
                        schemaKey: widget.schemaName,
                        key: _facilityIdKey,
                        value: facilityId,
                      ),
                    );

                // Store projectFacilityId for HFReferral entity
                context.read<FormsBloc>().add(
                      FormsEvent.updateField(
                        context: context,
                        schemaKey: widget.schemaName,
                        key: _projectFacilityIdKey,
                        value: val.code,
                      ),
                    );
              }
            },
          ),
        );
      },
    );
  }

  List<DropdownItem> _mapItems(List<ProjectFacilityModel> keys) {
    return keys
        .map((key) => DropdownItem(
              name: key.facilityId,
              // Store projectFacilityId (key.id) as the code
              // facilityId will be stored separately via onSelect
              code: key.id,
            ))
        .toList();
  }

  /// Get the facilityId for a given projectFacilityId from the list
  String? _getFacilityIdForProjectFacility(
      List<ProjectFacilityModel> projectFacilities, String? projectFacilityId) {
    if (projectFacilityId == null) return null;
    final facility =
        projectFacilities.where((f) => f.id == projectFacilityId).firstOrNull;
    return facility?.facilityId;
  }
}
