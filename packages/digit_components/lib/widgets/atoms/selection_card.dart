import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class SelectionBox<T> extends StatefulWidget {
  final double? width;
  final String? errorMessage;
  final List<T> options;
  final String? title;
  final Function(List<T>) onSelectionChanged;
  final List<T>? initialSelection;
  final bool allowMultipleSelection;
  final String Function(T) valueMapper;
  final bool isRequired;

  const SelectionBox({
    Key? key,
    this.width,
    this.title,
    this.errorMessage,
    required this.options,
    required this.onSelectionChanged,
    this.initialSelection,
    this.allowMultipleSelection = true,
    required this.valueMapper,
    this.isRequired = false,
  }) : super(key: key);

  @override
  _SelectionBoxState<T> createState() => _SelectionBoxState<T>();
}

class _SelectionBoxState<T> extends State<SelectionBox<T>> {
  final List<T> _selectedOptions = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialSelection != null) {
      _selectedOptions.addAll(widget.initialSelection!);
    }
  }

  void _onOptionTap(T option) {
    setState(() {
      if (widget.allowMultipleSelection) {
        if (_selectedOptions.contains(option)) {
          _selectedOptions.remove(option);
        } else {
          _selectedOptions.add(option);
        }
      } else {
        if (_selectedOptions.contains(option)) {
          _selectedOptions.clear();
        } else {
          _selectedOptions.clear();
          _selectedOptions.add(option);
        }
      }
    });
    widget.onSelectionChanged(_selectedOptions);
  }

  Widget _buildOption(T option) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isSelected = _selectedOptions.contains(option);

    return GestureDetector(
      onTap: () => _onOptionTap(option),
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(
            vertical: kPadding, horizontal: kPadding * 2),
        decoration: BoxDecoration(
          color: isSelected
              ? const DigitColors().burningOrange
              : const DigitColors().white,
          borderRadius: BorderRadius.circular(kPadding / 2),
          border: Border.all(
            color: const DigitColors().quillGray,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                widget.valueMapper(option),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: isSelected
                    ? textTheme.bodyMedium?.copyWith(
                        color: const DigitColors().white,
                        fontWeight: FontWeight.w700,
                      )
                    : textTheme.bodyMedium?.copyWith(
                        color: const DigitColors().woodsmokeBlack,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledField(
          label: widget.title,
          isRequired: widget.isRequired,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(kPadding * 3),
            decoration: BoxDecoration(
              color: const DigitColors().alabasterWhite,
              borderRadius: BorderRadius.circular(kPadding / 2),
              border: Border.all(
                color: const DigitColors().quillGray,
                width: 1,
              ),
            ),
            child: Wrap(
              spacing: kPadding * 3,
              runSpacing: kPadding * 3,
              children: widget.options.map(_buildOption).toList(),
            ),
          ),
        ),
        const SizedBox(height: kPadding / 2),
        if (widget.errorMessage != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: kPadding * 2,
                    width: kPadding * 2,
                    child: Icon(
                      Icons.info,
                      color: const DigitColors().lavaRed,
                      size: kPadding * 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: kPadding / 2),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  widget.errorMessage!,
                  style: textTheme.bodyLarge?.copyWith(
                    color: const DigitColors().lavaRed,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
