import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDropdown extends StatelessWidget {
  final String label;
  final String? initialValue;
  final List<MenuItemModel> menuItems;
  final String formControlName;
  final bool isRequired;
  final ValueChanged<String?>? onChanged;
  final Map<String, String Function(Object object)>? validationMessages;

  const DigitDropdown({
    super.key,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ${isRequired ? ' *' : ''}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          ReactiveDropdownField(
            onChanged: (control) => onChanged?.call(control.value),
            validationMessages: validationMessages,
            formControlName: formControlName,
            items: menuItems.map((e) {
              return DropdownMenuItem(
                value: e.code,
                child: Text(e.name),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MenuItemModel {
  final String name;
  final String code;

  MenuItemModel(this.name, this.code);
}
