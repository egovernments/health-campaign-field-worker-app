import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomDigitIntegerFormPicker extends StatelessWidget {
  final int? minimum;
  final int? maximum;
  final bool incrementer;
  final String? hint;
  final String label;
  final FormGroup form;
  final String formControlName;
  final double? buttonWidth;
  final void Function()? onChange;
  final bool readOnly;
  const CustomDigitIntegerFormPicker({
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
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    if (!incrementer) {
      return LabeledField(
          padding: const EdgeInsets.only(top: kPadding * 2),
          label: label,
          child: ReactiveTextField(
            readOnly: readOnly,
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
              _buildButton(context, readOnly,
                  border: Border(
                    left: _borderSide,
                    bottom: _borderSide,
                    top: _borderSide,
                  ),
                  icon: Icons.remove,
                  onPressed: readOnly
                      ? () {}
                      : () {
                          minimum != null
                              ? form.control(formControlName).value > minimum ||
                                      form.control(formControlName).value ==
                                          null
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
                    readOnly: readOnly,
                    textAlign: TextAlign.center,
                    formControlName: formControlName,
                    decoration: InputDecoration(
                      labelText: hint,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: readOnly
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors
                                  .black, // Change border color on focus based on readOnly
                        ),
                      ),
                      filled: true, // Always fill the background color
                      fillColor: readOnly
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors
                              .white, // Grayed-out background when readOnly is true
                    ),
                    keyboardType: TextInputType.number,
                    style:
                        TextStyle(color: readOnly ? Colors.grey : Colors.black),
                  ),
                ),
              ),
              _buildButton(context, readOnly,
                  border: Border(
                    right: _borderSide,
                    bottom: _borderSide,
                    top: _borderSide,
                  ),
                  icon: Icons.add,
                  onPressed: readOnly
                      ? null
                      : () {
                          if (maximum != null &&
                              form.control(formControlName).value == maximum) {
                            form.control(formControlName).value = maximum;
                          } else {
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
    BuildContext context,
    bool readOnly, {
    required Border border,
    required IconData icon,
    VoidCallback? onPressed,
  }) =>
      SizedBox(
        width: buttonWidth ?? 100,
        height: kPadding * 5,
        child: Material(
          shape: border,
          color: readOnly
              ? Colors.white
              : Theme.of(context).colorScheme.background,
          child: InkWell(onTap: onPressed, child: Icon(icon)),
        ),
      );

  BorderSide get _borderSide => const BorderSide(width: 0.8);
}
