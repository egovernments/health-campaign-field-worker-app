import 'package:digit_data_model/blocs/project_facility/project_facility.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
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
  static const _pageKey = 'referralDetails';

  @override
  void initState() {
    // TODO: implement initState
    context.read<ProjectFacilityBloc>().add(ProjectFacilityLoadEvent(
        query: ProjectFacilitySearchModel(
            projectId: [ReferralReconSingleton().projectId])));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectFacilityBloc, ProjectFacilityState>(
      listener: (BuildContext context, ProjectFacilityState state) {},
      builder: (context, state) {
        // Replace this with actual state shape that contains evaluation keys
        // final evaluationKeys = state.facilities
        //         .where((e) => e.id != 'N/A' && e.id != 'Delivery Team')
        //         .toList();

        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          fetched: (projectFacilities) {
            return ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return ReactiveWrapperField<String>(
                  formControlName: _evaluationKey,
                  validationMessages: {
                    'required': (_) =>
                        localizations.translate(i18.common.corecommonRequired),
                  },
                  showErrors: (control) => control.invalid && control.touched,
                  builder: (field) {
                    return LabeledField(
                      isRequired: true,
                      label: localizations.translate("Evaluation Key"),
                      child: Dropdown(
                        readOnly: false,
                        selectedOption: _mapItems(projectFacilities).firstWhere(
                          (item) =>
                              item.code == form.control(_evaluationKey).value,
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
                                  // pageKey: _pageKey,
                                  key: _evaluationKey,
                                  value: val.code,
                                ),
                              );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  FormGroup buildForm() {
    return fb.group({
      _evaluationKey: FormControl<String>(
        value: '',
        validators: [Validators.required],
      )
    });
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
