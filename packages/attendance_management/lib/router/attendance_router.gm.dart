// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:attendance_management/attendance_management.dart' as _i12;
import 'package:attendance_management/blocs/app_localization.dart' as _i8;
import 'package:attendance_management/models/entities/attendance_register.dart'
    as _i9;
import 'package:attendance_management/models/entities/scanned_individual_data.dart'
    as _i11;
import 'package:attendance_management/pages/manage_attendance.dart' as _i4;
import 'package:attendance_management/pages/mark_attendance.dart' as _i5;
import 'package:attendance_management/pages/session_select.dart' as _i2;
import 'package:attendance_management/widgets/attendance_acknowledgement.dart'
    as _i1;
import 'package:attendance_management/widgets/attendance_qr_scanner.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i7;

abstract class $AttendanceRoute extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AttendanceAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceAcknowledgementRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
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
    AttendanceDateSessionSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDateSessionSelectionRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AttendanceDateSessionSelectionPage(
          registers: args.registers,
          registerID: args.registerID,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    AttendanceDigitScannerRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDigitScannerRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AttendanceDigitScannerPage(
          key: args.key,
          registerModel: args.registerModel,
          onScanResult: args.onScanResult,
          quantity: args.quantity,
          singleValue: args.singleValue,
          isGS1code: args.isGS1code,
        ),
      );
    },
    ManageAttendanceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ManageAttendancePage(),
      );
    },
    MarkAttendanceRoute.name: (routeData) {
      final args = routeData.argsAs<MarkAttendanceRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MarkAttendancePage(
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
    extends _i6.PageRouteInfo<AttendanceAcknowledgementRouteArgs> {
  AttendanceAcknowledgementRoute({
    _i7.Key? key,
    _i8.AttendanceLocalization? appLocalizations,
    required String label,
    String? subLabel,
    String? description,
    _i7.Widget? descriptionWidget,
    void Function()? action,
    String? actionLabel,
    bool enableBackToSearch = true,
    void Function()? secondaryAction,
    String? secondaryLabel,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<AttendanceAcknowledgementRouteArgs> page =
      _i6.PageInfo<AttendanceAcknowledgementRouteArgs>(name);
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

  final _i7.Key? key;

  final _i8.AttendanceLocalization? appLocalizations;

  final String label;

  final String? subLabel;

  final String? description;

  final _i7.Widget? descriptionWidget;

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
/// [_i2.AttendanceDateSessionSelectionPage]
class AttendanceDateSessionSelectionRoute
    extends _i6.PageRouteInfo<AttendanceDateSessionSelectionRouteArgs> {
  AttendanceDateSessionSelectionRoute({
    required List<_i9.AttendanceRegisterModel> registers,
    required String registerID,
    _i7.Key? key,
    _i8.AttendanceLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AttendanceDateSessionSelectionRoute.name,
          args: AttendanceDateSessionSelectionRouteArgs(
            registers: registers,
            registerID: registerID,
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDateSessionSelectionRoute';

  static const _i6.PageInfo<AttendanceDateSessionSelectionRouteArgs> page =
      _i6.PageInfo<AttendanceDateSessionSelectionRouteArgs>(name);
}

class AttendanceDateSessionSelectionRouteArgs {
  const AttendanceDateSessionSelectionRouteArgs({
    required this.registers,
    required this.registerID,
    this.key,
    this.appLocalizations,
  });

  final List<_i9.AttendanceRegisterModel> registers;

  final String registerID;

  final _i7.Key? key;

  final _i8.AttendanceLocalization? appLocalizations;

  @override
  String toString() {
    return 'AttendanceDateSessionSelectionRouteArgs{registers: $registers, registerID: $registerID, key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.AttendanceDigitScannerPage]
class AttendanceDigitScannerRoute
    extends _i6.PageRouteInfo<AttendanceDigitScannerRouteArgs> {
  AttendanceDigitScannerRoute({
    _i10.Key? key,
    required _i9.AttendanceRegisterModel registerModel,
    required void Function(
      _i11.ScannedIndividualDataModel,
      _i3.AttendanceValidationResult,
    ) onScanResult,
    required int quantity,
    bool singleValue = false,
    required bool isGS1code,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AttendanceDigitScannerRoute.name,
          args: AttendanceDigitScannerRouteArgs(
            key: key,
            registerModel: registerModel,
            onScanResult: onScanResult,
            quantity: quantity,
            singleValue: singleValue,
            isGS1code: isGS1code,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDigitScannerRoute';

  static const _i6.PageInfo<AttendanceDigitScannerRouteArgs> page =
      _i6.PageInfo<AttendanceDigitScannerRouteArgs>(name);
}

class AttendanceDigitScannerRouteArgs {
  const AttendanceDigitScannerRouteArgs({
    this.key,
    required this.registerModel,
    required this.onScanResult,
    required this.quantity,
    this.singleValue = false,
    required this.isGS1code,
  });

  final _i10.Key? key;

  final _i9.AttendanceRegisterModel registerModel;

  final void Function(
    _i11.ScannedIndividualDataModel,
    _i3.AttendanceValidationResult,
  ) onScanResult;

  final int quantity;

  final bool singleValue;

  final bool isGS1code;

  @override
  String toString() {
    return 'AttendanceDigitScannerRouteArgs{key: $key, registerModel: $registerModel, onScanResult: $onScanResult, quantity: $quantity, singleValue: $singleValue, isGS1code: $isGS1code}';
  }
}

/// generated route for
/// [_i4.ManageAttendancePage]
class ManageAttendanceRoute extends _i6.PageRouteInfo<void> {
  const ManageAttendanceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ManageAttendanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAttendanceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MarkAttendancePage]
class MarkAttendanceRoute extends _i6.PageRouteInfo<MarkAttendanceRouteArgs> {
  MarkAttendanceRoute({
    required _i12.AttendanceRegisterModel registerModel,
    _i7.Key? key,
    _i12.AttendanceLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<MarkAttendanceRouteArgs> page =
      _i6.PageInfo<MarkAttendanceRouteArgs>(name);
}

class MarkAttendanceRouteArgs {
  const MarkAttendanceRouteArgs({
    required this.registerModel,
    this.key,
    this.appLocalizations,
  });

  final _i12.AttendanceRegisterModel registerModel;

  final _i7.Key? key;

  final _i12.AttendanceLocalization? appLocalizations;

  @override
  String toString() {
    return 'MarkAttendanceRouteArgs{registerModel: $registerModel, key: $key, appLocalizations: $appLocalizations}';
  }
}
