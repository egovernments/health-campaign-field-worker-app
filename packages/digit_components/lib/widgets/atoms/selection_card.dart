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
  final bool equalWidthOptions;

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
    this.equalWidthOptions = false,
  }) : super(key: key);

  @override
  _SelectionBoxState<T> createState() => _SelectionBoxState<T>();
}

class _SelectionBoxState<T> extends State<SelectionBox<T>> {
  final List<T> _selectedOptions = [];
  double? _maxOptionWidth;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelection != null) {
      _selectedOptions.addAll(widget.initialSelection!);
    }

    if (widget.equalWidthOptions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculateMaxOptionWidth();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.equalWidthOptions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculateMaxOptionWidth();
      });
    }
  }
  @override
  void didUpdateWidget(covariant SelectionBox<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSelection != oldWidget.initialSelection) {
      setState(() {
        _selectedOptions.clear();
        _selectedOptions.addAll(widget.initialSelection ?? []);
      });
    }
  }

  void _calculateMaxOptionWidth() {
    double maxWidth = 0;

    for (var option in widget.options) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: widget.valueMapper(option),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const DigitColors().woodsmokeBlack,
          )
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      if (textPainter.size.width > maxWidth) {
        maxWidth = textPainter.size.width;
      }
    }

    setState(() {
      _maxOptionWidth = maxWidth + kPadding * 5; /// Add padding
    });
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
        width: widget.equalWidthOptions ? _maxOptionWidth : widget.width,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                widget.valueMapper(option),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: isSelected
                    ? textTheme.bodyLarge?.copyWith(
                  color: const DigitColors().white,
                  fontWeight: FontWeight.w700,
                )
                    : textTheme.bodyLarge?.copyWith(
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
            padding: const EdgeInsets.all(kPadding * 2),
            decoration: BoxDecoration(
              color: const DigitColors().alabasterWhite,
              borderRadius: BorderRadius.circular(kPadding / 2),
              border: Border.all(
                color: widget.errorMessage != null ?const DigitColors().lavaRed: const DigitColors().quillGray,
                width: 1,
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
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
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  widget.errorMessage!,
                  style: textTheme.bodySmall?.copyWith(
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
