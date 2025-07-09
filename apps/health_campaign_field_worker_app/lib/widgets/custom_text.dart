import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/forms/forms.dart';

class CustomText extends StatelessWidget {


  const CustomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: DigitTextFormInput(
        onChange: (value){
          // context.read<FormsBloc>().add(
          //    // FormsEvent.updateField(key: "customText", value: value),
          // );
        },
      )
    );
  }
}
