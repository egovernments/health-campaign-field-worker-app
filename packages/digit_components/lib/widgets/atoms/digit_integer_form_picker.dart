import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitIntegerFormPicker extends StatelessWidget {
  final int? minimum;
  final int? maximum;
  final bool incrementer;
  final String? hint;
  final String label;
  final FormGroup form;
  final String formControlName;
  final double? buttonWidth;
  final void Function()? onChange;
  const DigitIntegerFormPicker({
    super.key,
    this.minimum,
    this.maximum,
    required this.incrementer,
    required this.formControlName,
    this.hint,
    required this.form,
    required this.label,
    this.buttonWidth,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    if (!incrementer) {
      return LabeledField(
          padding: const EdgeInsets.only(top: kPadding * 2),
          label: label,
          child: ReactiveTextField(
            formControlName: formControlName,
            decoration: InputDecoration(labelText: hint),
            keyboardType: TextInputType.number,
          ));
    }

    return LabeledField(
        label: label,
        padding: const EdgeInsets.only(top: kPadding * 2),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        child: IntrinsicHeight(
          child: Row(
            children: [
              _buildButton(context,
                  border: Border(
                    left: _borderSide,
                    bottom: _borderSide,
                    top: _borderSide,
                  ),
                  icon: Icons.remove, onPressed: () {
                minimum != null
                    ? form.control(formControlName).value > minimum ||
                            form.control(formControlName).value == null
                        ? form.control(formControlName).value -= 1
                        : 1
                    : form.control(formControlName).value -= 1;
                if (onChange != null) {
                  onChange!();
                }
              }),
              Expanded(
                child: SizedBox(
                  height: kPadding * 5,
                  child: ReactiveTextField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    formControlName: formControlName,
                    decoration: InputDecoration(
                      labelText: hint,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              _buildButton(context,
                  border: Border(
                    right: _borderSide,
                    bottom: _borderSide,
                    top: _borderSide,
                  ),
                  icon: Icons.add, onPressed: () {
                    if(maximum != null && form.control(formControlName).value == maximum) {
                      form.control(formControlName).value =maximum;
                    }else{
                      form.control(formControlName).value += 1;
                    }
                if (onChange != null) {
                  onChange!();
                }
              }),
            ],
          ),
        ));
  }

  Widget _buildButton(
    BuildContext context, {
    required Border border,
    required IconData icon,
    VoidCallback? onPressed,
  }) =>
      SizedBox(
        width: buttonWidth ?? 100,
        height: kPadding * 5,
        child: Material(
          shape: border,
          color: Theme.of(context).colorScheme.background,
          child: InkWell(onTap: onPressed, child: Icon(icon)),
        ),
      );

  BorderSide get _borderSide => const BorderSide(width: 0.8);
}
