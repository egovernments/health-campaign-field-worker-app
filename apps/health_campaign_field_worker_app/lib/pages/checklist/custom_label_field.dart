import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/utils/utils.dart';

class CustomLabeledField extends StatelessWidget {
  final Widget child;
  final String? label;
  final String? description;
  final bool isRequired;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? padding;
  final bool preferToolTipBelow;
  final String? infoText;
  final TooltipTriggerMode tooltipTriggerMode;
  final bool wrapLabelText;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool capitalizedFirstLetter;
  final bool labelInline;
  final bool charCondition;

  const CustomLabeledField({
    super.key,
    required this.child,
    this.label,
    this.description,
    this.labelStyle,
    this.descriptionStyle,
    this.padding,
    this.isRequired = false,
    this.infoText,
    this.preferToolTipBelow = false,
    this.tooltipTriggerMode = TooltipTriggerMode.tap,
    this.wrapLabelText = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.capitalizedFirstLetter = true,
    this.labelInline = true,
    this.charCondition = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    /// Capitalize the first letter of the label if required
    final processedLabel =
        capitalizedFirstLetter ? convertInToSentenceCase(label) : label;

    bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);

    if (isMobile || !labelInline) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Wrap(
              children: [
                RichText(
                  text: TextSpan(
                    text: charCondition
                        ? processedLabel
                        : processedLabel!.length > 64
                            ? '${processedLabel.substring(0, 64)}...'
                            : processedLabel,
                    style: labelStyle ??
                        textTheme.label.copyWith(
                          color: theme.colorTheme.text.primary,
                          overflow: TextOverflow.ellipsis,
                        ),
                    children: isRequired
                        ? [
                            TextSpan(
                              text: ' *',
                              style: textTheme.label.copyWith(
                                color: theme.colorTheme.alert.error,
                              ),
                            ),
                          ]
                        : [],
                  ),
                  maxLines: wrapLabelText ? 5 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (infoText != null) const SizedBox(width: spacer1),
                if (infoText != null)
                  Tooltip(
                    message: infoText,
                    preferBelow: preferToolTipBelow,
                    triggerMode: tooltipTriggerMode,
                    child: const Icon(
                      Icons.info_outline,
                      size: spacer4,
                    ),
                  ),
              ],
            ),
          if (label != null)
            const SizedBox(
              height: spacer1,
            ),
          if (description != null)
            Text(
              description!,
              style: descriptionStyle ?? textTheme.bodyS,
            ),
          child,
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (label != null)
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: wrapLabelText
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      processedLabel ?? "",
                      // processedLabel!.length > 64
                      //     ? '${processedLabel.substring(0, 64)}...'
                      //     : processedLabel,
                      maxLines: wrapLabelText ? 5 : 1,
                      style: textTheme.label.copyWith(
                        color: theme.colorTheme.text.primary,
                        overflow: wrapLabelText
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (isRequired)
                    Text(
                      ' *',
                      style: textTheme.label.copyWith(
                        color: theme.colorTheme.alert.error,
                      ),
                    ),
                  if (infoText != null) const SizedBox(width: spacer1),
                  if (infoText != null)
                    Tooltip(
                      message: infoText,
                      preferBelow: preferToolTipBelow,
                      triggerMode: tooltipTriggerMode,
                      child: Icon(
                        Icons.info_outline,
                        size: spacer5,
                        color: theme.colorTheme.text.secondary,
                      ),
                    ),
                ],
              ),
            ),
          if (label != null)
            const SizedBox(
              width: spacer4,
            ),
          Flexible(
            flex: 1, // Use flex to allocate remaining space for the child
            child: child,
          ),
        ],
      );
    }
  }
}
