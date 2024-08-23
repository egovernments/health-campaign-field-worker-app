// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:checklist/blocs/app_localization.dart' as _i9;
import 'package:checklist/checklist.dart' as _i10;
import 'package:checklist/pages/acknowledgement.dart' as _i1;
import 'package:checklist/pages/checklist.dart' as _i3;
import 'package:checklist/pages/checklist_boundary_view.dart' as _i2;
import 'package:checklist/pages/checklist_preview.dart' as _i4;
import 'package:checklist/pages/checklist_view.dart' as _i5;
import 'package:checklist/pages/checklist_wrapper.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $CheckListRoute extends _i7.AutoRouterModule {
  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChecklistAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistAcknowledgementRouteArgs>(
          orElse: () => const ChecklistAcknowledgementRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChecklistAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    ChecklistBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistBoundaryViewRouteArgs>(
          orElse: () => const ChecklistBoundaryViewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChecklistBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistRouteArgs>(
          orElse: () => const ChecklistRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistPreviewRouteArgs>(
          orElse: () => const ChecklistPreviewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistViewRouteArgs>(
          orElse: () => const ChecklistViewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChecklistViewPage(
          key: args.key,
          referralClientRefId: args.referralClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistWrapperRouteArgs>(
          orElse: () => const ChecklistWrapperRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChecklistWrapperPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChecklistAcknowledgementPage]
class ChecklistAcknowledgementRoute
    extends _i7.PageRouteInfo<ChecklistAcknowledgementRouteArgs> {
  ChecklistAcknowledgementRoute({
    _i8.Key? key,
    _i9.ChecklistLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistAcknowledgementRoute.name,
          args: ChecklistAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistAcknowledgementRoute';

  static const _i7.PageInfo<ChecklistAcknowledgementRouteArgs> page =
      _i7.PageInfo<ChecklistAcknowledgementRouteArgs>(name);
}

class ChecklistAcknowledgementRouteArgs {
  const ChecklistAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final _i8.Key? key;

  final _i9.ChecklistLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'ChecklistAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [_i2.ChecklistBoundaryViewPage]
class ChecklistBoundaryViewRoute
    extends _i7.PageRouteInfo<ChecklistBoundaryViewRouteArgs> {
  ChecklistBoundaryViewRoute({
    _i8.Key? key,
    _i10.ChecklistLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistBoundaryViewRoute.name,
          args: ChecklistBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistBoundaryViewRoute';

  static const _i7.PageInfo<ChecklistBoundaryViewRouteArgs> page =
      _i7.PageInfo<ChecklistBoundaryViewRouteArgs>(name);
}

class ChecklistBoundaryViewRouteArgs {
  const ChecklistBoundaryViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ChecklistPage]
class ChecklistRoute extends _i7.PageRouteInfo<ChecklistRouteArgs> {
  ChecklistRoute({
    _i8.Key? key,
    _i10.ChecklistLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistRoute.name,
          args: ChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistRoute';

  static const _i7.PageInfo<ChecklistRouteArgs> page =
      _i7.PageInfo<ChecklistRouteArgs>(name);
}

class ChecklistRouteArgs {
  const ChecklistRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ChecklistPreviewPage]
class ChecklistPreviewRoute
    extends _i7.PageRouteInfo<ChecklistPreviewRouteArgs> {
  ChecklistPreviewRoute({
    _i8.Key? key,
    _i10.ChecklistLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistPreviewRoute.name,
          args: ChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistPreviewRoute';

  static const _i7.PageInfo<ChecklistPreviewRouteArgs> page =
      _i7.PageInfo<ChecklistPreviewRouteArgs>(name);
}

class ChecklistPreviewRouteArgs {
  const ChecklistPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ChecklistViewPage]
class ChecklistViewRoute extends _i7.PageRouteInfo<ChecklistViewRouteArgs> {
  ChecklistViewRoute({
    _i8.Key? key,
    String? referralClientRefId,
    _i10.ChecklistLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistViewRoute.name,
          args: ChecklistViewRouteArgs(
            key: key,
            referralClientRefId: referralClientRefId,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistViewRoute';

  static const _i7.PageInfo<ChecklistViewRouteArgs> page =
      _i7.PageInfo<ChecklistViewRouteArgs>(name);
}

class ChecklistViewRouteArgs {
  const ChecklistViewRouteArgs({
    this.key,
    this.referralClientRefId,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final String? referralClientRefId;

  final _i10.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistViewRouteArgs{key: $key, referralClientRefId: $referralClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i6.ChecklistWrapperPage]
class ChecklistWrapperRoute
    extends _i7.PageRouteInfo<ChecklistWrapperRouteArgs> {
  ChecklistWrapperRoute({
    _i8.Key? key,
    bool isEditing = false,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChecklistWrapperRoute.name,
          args: ChecklistWrapperRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistWrapperRoute';

  static const _i7.PageInfo<ChecklistWrapperRouteArgs> page =
      _i7.PageInfo<ChecklistWrapperRouteArgs>(name);
}

class ChecklistWrapperRouteArgs {
  const ChecklistWrapperRouteArgs({
    this.key,
    this.isEditing = false,
  });

  final _i8.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'ChecklistWrapperRouteArgs{key: $key, isEditing: $isEditing}';
  }
}
