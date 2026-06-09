// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:collection/collection.dart' as _i7;
import 'package:digit_scanner/blocs/app_localization.dart' as _i4;
import 'package:digit_scanner/models/scanner_validation.dart' as _i5;
import 'package:digit_scanner/pages/qr_scanner.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.DigitScannerPage]
class DigitScannerRoute extends _i2.PageRouteInfo<DigitScannerRouteArgs> {
  DigitScannerRoute({
    _i3.Key? key,
    _i4.ScannerLocalization? appLocalizations,
    int quantity = 1,
    bool isGS1code = false,
    bool singleValue = false,
    bool isEditEnabled = false,
    String? regex,
    List<_i5.ScannerValidation>? validations,
    List<String>? initialQrCodes,
    String? initialBarcodeData,
    String scannerId = 'default',
    _i6.Future<bool> Function(String)? duplicateCheckFn,
    String? duplicateCheckMessage,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DigitScannerRoute.name,
          args: DigitScannerRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            quantity: quantity,
            isGS1code: isGS1code,
            singleValue: singleValue,
            isEditEnabled: isEditEnabled,
            regex: regex,
            validations: validations,
            initialQrCodes: initialQrCodes,
            initialBarcodeData: initialBarcodeData,
            scannerId: scannerId,
            duplicateCheckFn: duplicateCheckFn,
            duplicateCheckMessage: duplicateCheckMessage,
          ),
          initialChildren: children,
        );

  static const String name = 'DigitScannerRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DigitScannerRouteArgs>(
        orElse: () => const DigitScannerRouteArgs(),
      );
      return _i1.DigitScannerPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        quantity: args.quantity,
        isGS1code: args.isGS1code,
        singleValue: args.singleValue,
        isEditEnabled: args.isEditEnabled,
        regex: args.regex,
        validations: args.validations,
        initialQrCodes: args.initialQrCodes,
        initialBarcodeData: args.initialBarcodeData,
        scannerId: args.scannerId,
        duplicateCheckFn: args.duplicateCheckFn,
        duplicateCheckMessage: args.duplicateCheckMessage,
      );
    },
  );
}

class DigitScannerRouteArgs {
  const DigitScannerRouteArgs({
    this.key,
    this.appLocalizations,
    this.quantity = 1,
    this.isGS1code = false,
    this.singleValue = false,
    this.isEditEnabled = false,
    this.regex,
    this.validations,
    this.initialQrCodes,
    this.initialBarcodeData,
    this.scannerId = 'default',
    this.duplicateCheckFn,
    this.duplicateCheckMessage,
  });

  final _i3.Key? key;

  final _i4.ScannerLocalization? appLocalizations;

  final int quantity;

  final bool isGS1code;

  final bool singleValue;

  final bool isEditEnabled;

  final String? regex;

  final List<_i5.ScannerValidation>? validations;

  final List<String>? initialQrCodes;

  final String? initialBarcodeData;

  final String scannerId;

  final _i6.Future<bool> Function(String)? duplicateCheckFn;

  final String? duplicateCheckMessage;

  @override
  String toString() {
    return 'DigitScannerRouteArgs{key: $key, appLocalizations: $appLocalizations, quantity: $quantity, isGS1code: $isGS1code, singleValue: $singleValue, isEditEnabled: $isEditEnabled, regex: $regex, validations: $validations, initialQrCodes: $initialQrCodes, initialBarcodeData: $initialBarcodeData, scannerId: $scannerId, duplicateCheckFn: $duplicateCheckFn, duplicateCheckMessage: $duplicateCheckMessage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DigitScannerRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        quantity == other.quantity &&
        isGS1code == other.isGS1code &&
        singleValue == other.singleValue &&
        isEditEnabled == other.isEditEnabled &&
        regex == other.regex &&
        const _i7.ListEquality().equals(validations, other.validations) &&
        const _i7.ListEquality().equals(initialQrCodes, other.initialQrCodes) &&
        initialBarcodeData == other.initialBarcodeData &&
        scannerId == other.scannerId &&
        duplicateCheckMessage == other.duplicateCheckMessage;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      quantity.hashCode ^
      isGS1code.hashCode ^
      singleValue.hashCode ^
      isEditEnabled.hashCode ^
      regex.hashCode ^
      const _i7.ListEquality().hash(validations) ^
      const _i7.ListEquality().hash(initialQrCodes) ^
      initialBarcodeData.hashCode ^
      scannerId.hashCode ^
      duplicateCheckMessage.hashCode;
}
