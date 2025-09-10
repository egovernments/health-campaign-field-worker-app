// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:attendance_management/attendance_management.dart' as _i11;
import 'package:attendance_management/blocs/app_localization.dart' as _i7;
import 'package:attendance_management/models/entities/attendance_register.dart'
    as _i9;
import 'package:attendance_management/models/entities/scanned_individual_data.dart'
    as _i10;
import 'package:attendance_management/pages/manage_attendance.dart' as _i3;
import 'package:attendance_management/pages/mark_attendance.dart' as _i4;
import 'package:attendance_management/widgets/attendance_acknowledgement.dart'
    as _i1;
import 'package:attendance_management/widgets/attendance_qr_scanner.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i8;
import 'package:flutter/material.dart' as _i6;

abstract class $AttendanceRoute extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AttendanceAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceAcknowledgementRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AttendanceAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          label: args.label,
          subLabel: args.subLabel,
          description: args.description,
          descriptionWidget: args.descriptionWidget,
          action: args.action,
          actionLabel: args.actionLabel,
          enableBackToSearch: args.enableBackToSearch,
          secondaryAction: args.secondaryAction,
          secondaryLabel: args.secondaryLabel,
        ),
      );
    },
    AttendanceDigitScannerRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDigitScannerRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AttendanceDigitScannerPage(
          key: args.key,
          registerModel: args.registerModel,
          onScanResult: args.onScanResult,
          quantity: args.quantity,
          singleValue: args.singleValue,
          isGS1code: args.isGS1code,
          validations: args.validations,
          regex: args.regex,
          isEditEnabled: args.isEditEnabled,
        ),
      );
    },
    ManageAttendanceRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ManageAttendancePage(),
      );
    },
    MarkAttendanceRoute.name: (routeData) {
      final args = routeData.argsAs<MarkAttendanceRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MarkAttendancePage(
          registerModel: args.registerModel,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AttendanceAcknowledgementPage]
class AttendanceAcknowledgementRoute
    extends _i5.PageRouteInfo<AttendanceAcknowledgementRouteArgs> {
  AttendanceAcknowledgementRoute({
    _i6.Key? key,
    _i7.AttendanceLocalization? appLocalizations,
    required String label,
    String? subLabel,
    String? description,
    _i6.Widget? descriptionWidget,
    void Function()? action,
    String? actionLabel,
    bool enableBackToSearch = true,
    void Function()? secondaryAction,
    String? secondaryLabel,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AttendanceAcknowledgementRoute.name,
          args: AttendanceAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            label: label,
            subLabel: subLabel,
            description: description,
            descriptionWidget: descriptionWidget,
            action: action,
            actionLabel: actionLabel,
            enableBackToSearch: enableBackToSearch,
            secondaryAction: secondaryAction,
            secondaryLabel: secondaryLabel,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceAcknowledgementRoute';

  static const _i5.PageInfo<AttendanceAcknowledgementRouteArgs> page =
      _i5.PageInfo<AttendanceAcknowledgementRouteArgs>(name);
}

class AttendanceAcknowledgementRouteArgs {
  const AttendanceAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    required this.label,
    this.subLabel,
    this.description,
    this.descriptionWidget,
    this.action,
    this.actionLabel,
    this.enableBackToSearch = true,
    this.secondaryAction,
    this.secondaryLabel,
  });

  final _i6.Key? key;

  final _i7.AttendanceLocalization? appLocalizations;

  final String label;

  final String? subLabel;

  final String? description;

  final _i6.Widget? descriptionWidget;

  final void Function()? action;

  final String? actionLabel;

  final bool enableBackToSearch;

  final void Function()? secondaryAction;

  final String? secondaryLabel;

  @override
  String toString() {
    return 'AttendanceAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, label: $label, subLabel: $subLabel, description: $description, descriptionWidget: $descriptionWidget, action: $action, actionLabel: $actionLabel, enableBackToSearch: $enableBackToSearch, secondaryAction: $secondaryAction, secondaryLabel: $secondaryLabel}';
  }
}

/// generated route for
/// [_i2.AttendanceDigitScannerPage]
class AttendanceDigitScannerRoute
    extends _i5.PageRouteInfo<AttendanceDigitScannerRouteArgs> {
  AttendanceDigitScannerRoute({
    _i8.Key? key,
    required _i9.AttendanceRegisterModel registerModel,
    required void Function(
      _i10.ScannedIndividualDataModel,
      _i2.AttendanceValidationResult,
    ) onScanResult,
    int? quantity = 1,
    bool? singleValue = true,
    bool? isGS1code = false,
    List<dynamic>? validations,
    String? regex,
    bool isEditEnabled = false,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AttendanceDigitScannerRoute.name,
          args: AttendanceDigitScannerRouteArgs(
            key: key,
            registerModel: registerModel,
            onScanResult: onScanResult,
            quantity: quantity,
            singleValue: singleValue,
            isGS1code: isGS1code,
            validations: validations,
            regex: regex,
            isEditEnabled: isEditEnabled,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDigitScannerRoute';

  static const _i5.PageInfo<AttendanceDigitScannerRouteArgs> page =
      _i5.PageInfo<AttendanceDigitScannerRouteArgs>(name);
}

class AttendanceDigitScannerRouteArgs {
  const AttendanceDigitScannerRouteArgs({
    this.key,
    required this.registerModel,
    required this.onScanResult,
    this.quantity = 1,
    this.singleValue = true,
    this.isGS1code = false,
    this.validations,
    this.regex,
    this.isEditEnabled = false,
  });

  final _i8.Key? key;

  final _i9.AttendanceRegisterModel registerModel;

  final void Function(
    _i10.ScannedIndividualDataModel,
    _i2.AttendanceValidationResult,
  ) onScanResult;

  final int? quantity;

  final bool? singleValue;

  final bool? isGS1code;

  final List<dynamic>? validations;

  final String? regex;

  final bool isEditEnabled;

  @override
  String toString() {
    return 'AttendanceDigitScannerRouteArgs{key: $key, registerModel: $registerModel, onScanResult: $onScanResult, quantity: $quantity, singleValue: $singleValue, isGS1code: $isGS1code, validations: $validations, regex: $regex, isEditEnabled: $isEditEnabled}';
  }
}

/// generated route for
/// [_i3.ManageAttendancePage]
class ManageAttendanceRoute extends _i5.PageRouteInfo<void> {
  const ManageAttendanceRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ManageAttendanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAttendanceRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MarkAttendancePage]
class MarkAttendanceRoute extends _i5.PageRouteInfo<MarkAttendanceRouteArgs> {
  MarkAttendanceRoute({
    required _i11.AttendanceRegisterModel registerModel,
    _i6.Key? key,
    _i11.AttendanceLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MarkAttendanceRoute.name,
          args: MarkAttendanceRouteArgs(
            registerModel: registerModel,
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'MarkAttendanceRoute';

  static const _i5.PageInfo<MarkAttendanceRouteArgs> page =
      _i5.PageInfo<MarkAttendanceRouteArgs>(name);
}

class MarkAttendanceRouteArgs {
  const MarkAttendanceRouteArgs({
    required this.registerModel,
    this.key,
    this.appLocalizations,
  });

  final _i11.AttendanceRegisterModel registerModel;

  final _i6.Key? key;

  final _i11.AttendanceLocalization? appLocalizations;

  @override
  String toString() {
    return 'MarkAttendanceRouteArgs{registerModel: $registerModel, key: $key, appLocalizations: $appLocalizations}';
  }
}
