import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: DigitTextFormInput(
            // onChange: (value){
            //   context.read<FormsBloc>().add(
            //      FormsEvent.updateField(key: "customText", value: value),
            //   );
            // },
            ));
  }
}
