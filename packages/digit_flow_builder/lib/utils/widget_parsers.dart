import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

/// Centralized utility class for parsing widget configuration strings into Flutter enums.
///
/// This class provides static methods to convert string values from JSON configurations
/// into their corresponding Flutter/Digit UI enum types. Having these parsers in one place
/// ensures consistency across all widget implementations and reduces code duplication.
class WidgetParsers {
  // Private constructor to prevent instantiation
  WidgetParsers._();

  // ============================================================================
  // Button-related parsers
  // ============================================================================

  /// Parses a string into a [DigitButtonType].
  ///
  /// Supported values:
  /// - 'primary' -> DigitButtonType.primary
  /// - 'secondary' -> DigitButtonType.secondary
  /// - 'tertiary' -> DigitButtonType.tertiary
  ///
  /// Defaults to [DigitButtonType.primary] if the value is null or unrecognized.
  static DigitButtonType parseButtonType(String? type) {
    switch (type) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary;
    }
  }

  static TagType parseTagType(String? type) {
    switch (type) {
      case 'success':
        return TagType.success;
      case 'error':
        return TagType.error;
      default:
        return TagType.monochrome;
    }
  }

  /// Parses a string into a [DigitButtonSize].
  ///
  /// Supported values:
  /// - 'small' -> DigitButtonSize.small
  /// - 'medium' -> DigitButtonSize.medium
  /// - 'large' -> DigitButtonSize.large
  ///
  /// Defaults to [DigitButtonSize.large] if the value is null or unrecognized.
  static DigitButtonSize parseButtonSize(String? size) {
    switch (size) {
      case 'small':
        return DigitButtonSize.small;
      case 'medium':
        return DigitButtonSize.medium;
      case 'large':
        return DigitButtonSize.large;
      default:
        return DigitButtonSize.large;
    }
  }

  // ============================================================================
  // Card-related parsers
  // ============================================================================

  /// Parses a string into a [CardType].
  ///
  /// Supported values:
  /// - 'primary' -> CardType.primary
  /// - 'secondary' -> CardType.secondary
  ///
  /// Defaults to [CardType.primary] if the value is null or unrecognized.
  static CardType parseCardType(String? type) {
    switch ((type ?? '').toLowerCase()) {
      case 'primary':
        return CardType.primary;
      case 'secondary':
        return CardType.secondary;
      default:
        return CardType.primary;
    }
  }

  // ============================================================================
  // Layout alignment parsers (shared by Row, Button, and other widgets)
  // ============================================================================

  /// Parses a string into a [MainAxisSize].
  ///
  /// Supported values:
  /// - 'max' -> MainAxisSize.max (expand to fill available space)
  /// - 'min' -> MainAxisSize.min (shrink to fit content)
  ///
  /// Defaults to [MainAxisSize.min] if the value is null or unrecognized.
  static MainAxisSize parseMainAxisSize(String? size) {
    switch (size) {
      case 'max':
        return MainAxisSize.max;
      case 'min':
        return MainAxisSize.min;
      default:
        return MainAxisSize.min;
    }
  }

  /// Parses a string into a [MainAxisAlignment].
  ///
  /// Supported values:
  /// - 'start' -> MainAxisAlignment.start (align children to the start)
  /// - 'center' -> MainAxisAlignment.center (align children to the center)
  /// - 'end' -> MainAxisAlignment.end (align children to the end)
  /// - 'spaceBetween' -> MainAxisAlignment.spaceBetween (space evenly with no space at edges)
  ///
  /// Defaults to [MainAxisAlignment.start] if the value is null or unrecognized.
  static MainAxisAlignment parseMainAxisAlignment(String? alignment) {
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      default:
        return MainAxisAlignment.center;
    }
  }

  // ============================================================================
  // Spacing/Padding helpers
  // ============================================================================

  /// Wraps a widget with bottom padding if `bottomGap` is specified in properties.
  ///
  /// Use this in components to add spacing below themselves. When the component
  /// is hidden (returns SizedBox.shrink()), no padding is applied.
  ///
  /// Usage in widget build method:
  /// ```dart
  /// return WidgetParsers.wrapWithBottomGap(
  ///   MyWidget(...),
  ///   json['properties'],
  /// );
  /// ```
  static Widget wrapWithBottomGap(
      Widget child, Map<String, dynamic>? properties) {
    if (properties == null) return child;

    final bottomGap = properties['bottomGap'];
    if (bottomGap == null) return child;

    final double gap = bottomGap is num ? bottomGap.toDouble() : 0;
    if (gap <= 0) return child;

    return Padding(
      padding: EdgeInsets.only(bottom: gap),
      child: child,
    );
  }

  static double parseSize(String? size) {
    switch (size) {
      case 'spacer1':
        return spacer1;
      case 'spacer2':
        return spacer2;
      case 'spacer3':
        return spacer3;
      case 'spacer4':
        return spacer4;
      case 'spacer5':
        return spacer5;
      case 'spacer6':
        return spacer6;
      case 'spacer7':
        return spacer7;
      case 'spacer8':
        return spacer8;
      case 'spacer9':
        return spacer9;
      case 'spacer10':
        return spacer10;
      case 'spacer11':
        return spacer11;
      case 'spacer12':
        return spacer12;
      default:
        return 0;
    }
  }

  static TextStyle? parseTextStyle(BuildContext context, String? styleKey) {
    if (styleKey == null) return null;

    final digitTextTheme = Theme.of(context).digitTextTheme(context);

    switch (styleKey) {
      // Heading styles
      case 'headingXl':
        return digitTextTheme.headingXl;
      case 'headingL':
        return digitTextTheme.headingL;
      case 'headingM':
        return digitTextTheme.headingM;
      case 'headingS':
        return digitTextTheme.headingS;
      // Body styles
      case 'bodyL':
        return digitTextTheme.bodyL;
      case 'bodyS':
        return digitTextTheme.bodyS;
      // Caption styles
      case 'captionL':
        return digitTextTheme.captionL;
      case 'captionS':
        return digitTextTheme.captionS;
      // Label style
      case 'label':
        return digitTextTheme.label;
      default:
        return null;
    }
  }
}
