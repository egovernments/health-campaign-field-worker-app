import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_flutter_typeahead/reactive_flutter_typeahead.dart';

class DigitSearchDropdown<T> extends StatelessWidget {
  final Iterable<T> Function(Iterable<T> items, String pattern)
      suggestionsCallback;
  final String label;
  final T? initialValue;
  final Iterable<T> menuItems;
  final String formControlName;
  final bool isRequired;
  final ValueChanged<T>? onChanged;
  final String Function(T value) valueMapper;
  final Map<String, String Function(Object object)>? validationMessages;

  const DigitSearchDropdown({
    Key? key,
    required this.suggestionsCallback,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label${isRequired ? ' *' : ''}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          ReactiveTypeAhead(
            formControlName: formControlName,
            stringify: valueMapper,
            debounceDuration: const Duration(milliseconds: 100),
            suggestionsCallback: (pattern) => suggestionsCallback(
              menuItems,
              pattern,
            ),
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(kPadding * 2),
                child: Text(
                  valueMapper(item),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
