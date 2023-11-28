import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/atoms/searchable_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitReactiveSearchDropdown<T> extends StatefulWidget {
  final String label;
  final List<T> menuItems;
  final FormGroup form;
  final String formControlName;
  final bool isRequired;
  final String Function(T value) valueMapper;
  final String? validationMessage;
  final EdgeInsets? padding;
  final void Function(dynamic)? onSelected;
  final String emptyText;

  const DigitReactiveSearchDropdown({
    Key? key,
    required this.label,
    required this.form,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.validationMessage,
    this.padding,
    this.onSelected,
    this.emptyText = 'No Matches Found',
  }) : super(key: key);

  @override
  _DigitReactiveSearchDropdownState<T> createState() =>
      _DigitReactiveSearchDropdownState<T>();
}

class _DigitReactiveSearchDropdownState<T>
    extends State<DigitReactiveSearchDropdown<T>> {
  SearchDropdownEditingController<T>? controller =
      SearchDropdownEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
      label: '${widget.label}${widget.isRequired ? '*' : ''}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchDropdownFormField<T>(
            form: widget.form,
            controller: controller,
            formControlName: widget.formControlName,
            emptyText: widget.emptyText,
            displayItemFn: (dynamic str) => Text(
              str != null ? widget.valueMapper(str) : '',
              style: const TextStyle(fontSize: 14),
            ),
            findFn: (dynamic str) async => widget.menuItems,
            filterFn: (dynamic item, str) => widget
                .valueMapper(item)
                .toLowerCase()
                .contains(str.toLowerCase()),
            dropdownItemSeparator: const DigitDivider(),
            dropdownItemFn:
                (dynamic item, position, focused, selected, onTap) => ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.valueMapper(item),
                    style: TextStyle(
                        color: selected
                            ? DigitTheme.instance.colorScheme.secondary
                            : DigitTheme.instance.colorScheme.onSurface,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              dense: true,
              style: ListTileStyle.list,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              tileColor: focused
                  ? DigitTheme.instance.colorScheme.surface
                  : Colors.transparent,
              onTap: () {
                widget.form.control(widget.formControlName).value = item;
                onTap();
                if (widget.onSelected != null) {
                  widget.onSelected!(item);
                }
              },
            ),
            onFieldTap: () {
              widget.form.control(widget.formControlName).value = null;
              if (widget.isRequired) {
                widget.form
                    .control(widget.formControlName)
                    .setErrors({'': true});
              }
            },
          ),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              final formControl = widget.form.control(widget.formControlName);
              if (formControl.hasErrors) {
                return Text(
                  widget.validationMessage ?? '',
                  style: TextStyle(
                    color: DigitTheme.instance.colorScheme.error,
                    fontSize: 12,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
