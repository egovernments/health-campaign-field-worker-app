import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/forms/forms.dart';

class DobPicker extends StatelessWidget {
  const DobPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DigitDobPicker(
      datePickerFormControl: 'dob',
      datePickerLabel: 'Date of Birth',
      ageFieldLabel: 'age',
      yearsHintLabel: 'years',
      monthsHintLabel: 'months',
      separatorLabel: 'or',
      yearsAndMonthsErrMsg: 'required',
      onChangeOfFormControl: (val){
        context.read<FormsBloc>().add(
              FormsEvent.updateField(key: "dobPicker", value: val.toString()),
            );
      },
    );
  }
}


