import 'package:digit_ui_components/digit_components.dart';
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
        return MainAxisAlignment.start;
    }
  }
}
