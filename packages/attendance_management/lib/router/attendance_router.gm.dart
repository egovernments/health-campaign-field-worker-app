// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:attendance_management/blocs/app_localization.dart' as _i4;
import 'package:attendance_management/widgets/attendance_acknowledgement.dart'
    as _i1;
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

abstract class $AttendanceRoute extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AttendanceAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceAcknowledgementRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
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
    }
  };
}

/// generated route for
/// [_i1.AttendanceAcknowledgementPage]
class AttendanceAcknowledgementRoute
    extends _i2.PageRouteInfo<AttendanceAcknowledgementRouteArgs> {
  AttendanceAcknowledgementRoute({
    _i3.Key? key,
    _i4.AttendanceLocalization? appLocalizations,
    required String label,
    String? subLabel,
    String? description,
    _i3.Widget? descriptionWidget,
    void Function()? action,
    String? actionLabel,
    bool enableBackToSearch = true,
    void Function()? secondaryAction,
    String? secondaryLabel,
    List<_i2.PageRouteInfo>? children,
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

  static const _i2.PageInfo<AttendanceAcknowledgementRouteArgs> page =
      _i2.PageInfo<AttendanceAcknowledgementRouteArgs>(name);
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

  final _i3.Key? key;

  final _i4.AttendanceLocalization? appLocalizations;

  final String label;

  final String? subLabel;

  final String? description;

  final _i3.Widget? descriptionWidget;

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
