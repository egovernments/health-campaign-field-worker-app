// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i8;

import 'package:attendance_management/attendance_management.dart' as _i10;
import 'package:attendance_management/blocs/app_localization.dart' as _i7;
import 'package:attendance_management/models/entities/attendance_register.dart'
    as _i9;
import 'package:attendance_management/pages/manage_attendance.dart' as _i3;
import 'package:attendance_management/pages/mark_attendance.dart' as _i4;
import 'package:attendance_management/pages/session_select.dart' as _i2;
import 'package:attendance_management/widgets/attendance_acknowledgement.dart'
    as _i1;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

abstract class $AttendanceRoute extends _i5.RootStackRouter {
  $AttendanceRoute({super.navigatorKey});

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
          icon: args.icon,
          color: args.color,
          enableBackToSearch: args.enableBackToSearch,
          secondaryAction: args.secondaryAction,
          secondaryLabel: args.secondaryLabel,
        ),
      );
    },
    AttendanceDateSessionSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDateSessionSelectionRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AttendanceDateSessionSelectionPage(
          registers: args.registers,
          registerID: args.registerID,
          key: args.key,
          appLocalizations: args.appLocalizations,
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
          exitTime: args.exitTime,
          entryTime: args.entryTime,
          dateTime: args.dateTime,
          attendees: args.attendees,
          registerId: args.registerId,
          tenantId: args.tenantId,
          session: args.session,
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
    _i6.IconData? icon,
    _i8.Color? color,
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
            icon: icon,
            color: color,
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
    this.icon,
    this.color,
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

  final _i6.IconData? icon;

  final _i8.Color? color;

  final bool enableBackToSearch;

  final void Function()? secondaryAction;

  final String? secondaryLabel;

  @override
  String toString() {
    return 'AttendanceAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, label: $label, subLabel: $subLabel, description: $description, descriptionWidget: $descriptionWidget, action: $action, actionLabel: $actionLabel, icon: $icon, color: $color, enableBackToSearch: $enableBackToSearch, secondaryAction: $secondaryAction, secondaryLabel: $secondaryLabel}';
  }
}

/// generated route for
/// [_i2.AttendanceDateSessionSelectionPage]
class AttendanceDateSessionSelectionRoute
    extends _i5.PageRouteInfo<AttendanceDateSessionSelectionRouteArgs> {
  AttendanceDateSessionSelectionRoute({
    required List<_i9.AttendanceRegisterModel> registers,
    required String registerID,
    _i6.Key? key,
    _i7.AttendanceLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
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

  static const _i5.PageInfo<AttendanceDateSessionSelectionRouteArgs> page =
      _i5.PageInfo<AttendanceDateSessionSelectionRouteArgs>(name);
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

  final _i6.Key? key;

  final _i7.AttendanceLocalization? appLocalizations;

  @override
  String toString() {
    return 'AttendanceDateSessionSelectionRouteArgs{registers: $registers, registerID: $registerID, key: $key, appLocalizations: $appLocalizations}';
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
    required int exitTime,
    required int entryTime,
    required DateTime dateTime,
    required List<_i10.AttendeeModel> attendees,
    required String registerId,
    required String tenantId,
    int? session,
    _i6.Key? key,
    _i10.AttendanceLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MarkAttendanceRoute.name,
          args: MarkAttendanceRouteArgs(
            exitTime: exitTime,
            entryTime: entryTime,
            dateTime: dateTime,
            attendees: attendees,
            registerId: registerId,
            tenantId: tenantId,
            session: session,
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
    required this.exitTime,
    required this.entryTime,
    required this.dateTime,
    required this.attendees,
    required this.registerId,
    required this.tenantId,
    this.session,
    this.key,
    this.appLocalizations,
  });

  final int exitTime;

  final int entryTime;

  final DateTime dateTime;

  final List<_i10.AttendeeModel> attendees;

  final String registerId;

  final String tenantId;

  final int? session;

  final _i6.Key? key;

  final _i10.AttendanceLocalization? appLocalizations;

  @override
  String toString() {
    return 'MarkAttendanceRouteArgs{exitTime: $exitTime, entryTime: $entryTime, dateTime: $dateTime, attendees: $attendees, registerId: $registerId, tenantId: $tenantId, session: $session, key: $key, appLocalizations: $appLocalizations}';
  }
}
