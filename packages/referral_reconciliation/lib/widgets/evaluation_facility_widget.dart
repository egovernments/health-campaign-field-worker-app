import 'package:digit_data_model/blocs/project_facility/project_facility.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/utils/i18_key_constants.dart' as i18;
import 'package:referral_reconciliation/utils/utils.dart';
import 'package:referral_reconciliation/widgets/localized.dart';

class EvaluationKeyDropDown extends LocalizedStatefulWidget {
  const EvaluationKeyDropDown({
    super.key,
    super.appLocalizations,
  });

  @override
  State<EvaluationKeyDropDown> createState() => _EvaluationKeyDropDownState();
}

class _EvaluationKeyDropDownState
    extends LocalizedState<EvaluationKeyDropDown> {
  static const _evaluationKey = 'evaluationFacilityKey';
  static const _schemaKey = 'HFREFERALFLOW';

  @override
  void initState() {
    super.initState();

    context.read<ProjectFacilityBloc>().add(ProjectFacilityLoadEvent(
        query: ProjectFacilitySearchModel(
            projectId: [ReferralReconSingleton().projectId])));
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
    final isView =
        context.findAncestorWidgetOfExactType<FormsRenderPage>()?.isView ??
            false;

    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;

    final pages =
        context.read<FormsBloc>().state.cachedSchemas[_schemaKey]?.pages;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == _evaluationKey) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
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
      formControlName: _evaluationKey,
      validationMessages: {
        'required': (_) =>
            localizations.translate(i18.common.corecommonRequired),
      },
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final form = ReactiveForm.of(context) as FormGroup;

        return LabeledField(
          isRequired: isReadOnlyFromSchema,
          label: localizations.translate(labelFromSchema ?? ""),
          child: Dropdown(
            readOnly: isView,
            selectedOption: _mapItems(projectFacilities).firstWhere(
              (item) => item.code == form.control(_evaluationKey).value,
              orElse: () => const DropdownItem(name: '', code: ''),
            ),
            errorMessage: field.errorText,
            items: _mapItems(projectFacilities),
            onSelect: (val) {
              form.control(_evaluationKey).markAsTouched();
              form.control(_evaluationKey).value = val.code;

              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      schemaKey: _schemaKey,
                      key: _evaluationKey,
                      value: val.code,
                    ),
                  );
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
              code: key.facilityId,
            ))
        .toList();
  }
}
