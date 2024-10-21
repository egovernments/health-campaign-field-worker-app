import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitIntegerFormPicker extends StatelessWidget {
  final double? minimum;
  final double? maximum;
  final bool incrementer;
  final String? hint;
  final String label;
  final FormGroup form;
  final bool? decimal;
  final String formControlName;
  final bool readOnly;
  const DigitIntegerFormPicker({
    super.key,
    this.minimum,
    this.maximum,
    required this.incrementer,
    required this.formControlName,
    this.hint,
    required this.form,
    required this.label,
    this.decimal,
    this.readOnly = false,
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
            readOnly: readOnly,
          ));
    }

    return LabeledField(
        label: label,
        padding: const EdgeInsets.only(top: kPadding * 2),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        child: IntrinsicHeight(
          child: Row(
            children: [
              _buildButton(
                context,
                border: Border(
                  left: _borderSide,
                  bottom: _borderSide,
                  top: _borderSide,
                ),
                icon: Icons.remove,
                onPressed: () => minimum != null
                    ? form.control(formControlName).value > minimum ||
                            form.control(formControlName).value == null
                        ? form.control(formControlName).value -=
                            decimal != null ? .5 : 1
                        : decimal != null
                            ? 0.5
                            : 1
                    : form.control(formControlName).value -=
                        decimal != null ? .5 : 1,
              ),
              Expanded(
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
              _buildButton(context,
                  border: Border(
                    right: _borderSide,
                    bottom: _borderSide,
                    top: _borderSide,
                  ),
                  icon: Icons.add,
                  onPressed: () => form.control(formControlName).value +=
                      decimal != null ? .5 : 1),
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
      AspectRatio(
        aspectRatio: 1,
        child: Material(
          shape: border,
          color: Theme.of(context).colorScheme.background,
          child: InkWell(onTap: onPressed, child: Icon(icon)),
        ),
      );

  BorderSide get _borderSide => const BorderSide(width: 0.8);
}
