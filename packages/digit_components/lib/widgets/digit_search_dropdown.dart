import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_flutter_typeahead/reactive_flutter_typeahead.dart';

import 'digit_reactive_type_ahead.dart';

class DigitSearchDropdown<T> extends StatefulWidget {
  final Iterable<T> Function(Iterable<T> items, String pattern)
      suggestionsCallback;
  final SuggestionSelectionCallback<T>? onSuggestionSelected;
  final String label;
  final T? initialValue;
  final String? initialValueText;
  final Iterable<T> menuItems;
  final String formControlName;
  final bool isRequired;
  final bool isEnableSearch;
  final VoidCallback? onChanged;
  final String Function(T value) valueMapper;
  final Map<String, String Function(Object object)>? validationMessages;
  final EdgeInsets? padding;

  const DigitSearchDropdown({
    Key? key,
    required this.suggestionsCallback,
    this.onSuggestionSelected,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
    this.initialValueText,
    this.padding,
    this.isEnableSearch = true,
  }) : super(key: key);

  @override
  _DigitSearchDropdownState<T> createState() => _DigitSearchDropdownState<T>();
}

class _DigitSearchDropdownState<T> extends State<DigitSearchDropdown<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.label}${widget.isRequired ? ' *' : ''}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: kPadding),
          DigitReactiveTypeAhead<T, T>(
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 42),
                  suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 24,
                      )),
                ),
              ),
              formControlName: widget.formControlName,
              stringify: widget.valueMapper,
              suggestionsBoxVerticalOffset: 0,
              initialValue: widget.initialValue,
              initialValueText: widget.initialValueText,
              onSuggestionSelected: widget.onSuggestionSelected,
              suggestionsCallback:  widget.isEnableSearch ? (pattern) => widget.suggestionsCallback(
                    widget.menuItems,
                    pattern,
                  ) : (pattern) => widget.suggestionsCallback(
                widget.menuItems,
                '',
              ),
              hideKeyboard: !widget.isEnableSearch,
              itemBuilder: (context, item) {
                return Padding(
                  padding: const EdgeInsets.all(kPadding * 2),
                  child: Text(
                    widget.valueMapper(item),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
              noItemsFoundBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(kPadding * 2),
                  child: Text(
                    'No items found!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
