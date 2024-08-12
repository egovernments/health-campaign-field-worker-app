// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:checklist/blocs/app_localization.dart' as _i8;
import 'package:checklist/pages/checklist.dart' as _i2;
import 'package:checklist/pages/checklist_boundary_view.dart' as _i1;
import 'package:checklist/pages/checklist_preview.dart' as _i3;
import 'package:checklist/pages/checklist_view.dart' as _i4;
import 'package:checklist/pages/checklist_wrapper.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i7;

abstract class $CheckListRoute extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ChecklistBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistBoundaryViewRouteArgs>(
          orElse: () => const ChecklistBoundaryViewRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChecklistBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistRouteArgs>(
          orElse: () => const ChecklistRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistPreviewRouteArgs>(
          orElse: () => const ChecklistPreviewRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ChecklistViewPage(),
      );
    },
    ChecklistWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistWrapperRouteArgs>(
          orElse: () => const ChecklistWrapperRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChecklistWrapperPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChecklistBoundaryViewPage]
class ChecklistBoundaryViewRoute
    extends _i6.PageRouteInfo<ChecklistBoundaryViewRouteArgs> {
  ChecklistBoundaryViewRoute({
    _i7.Key? key,
    _i8.ChecklistLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ChecklistBoundaryViewRoute.name,
          args: ChecklistBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistBoundaryViewRoute';

  static const _i6.PageInfo<ChecklistBoundaryViewRouteArgs> page =
      _i6.PageInfo<ChecklistBoundaryViewRouteArgs>(name);
}

class ChecklistBoundaryViewRouteArgs {
  const ChecklistBoundaryViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i7.Key? key;

  final _i8.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ChecklistPage]
class ChecklistRoute extends _i6.PageRouteInfo<ChecklistRouteArgs> {
  ChecklistRoute({
    _i7.Key? key,
    _i8.ChecklistLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ChecklistRoute.name,
          args: ChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistRoute';

  static const _i6.PageInfo<ChecklistRouteArgs> page =
      _i6.PageInfo<ChecklistRouteArgs>(name);
}

class ChecklistRouteArgs {
  const ChecklistRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i7.Key? key;

  final _i8.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ChecklistPreviewPage]
class ChecklistPreviewRoute
    extends _i6.PageRouteInfo<ChecklistPreviewRouteArgs> {
  ChecklistPreviewRoute({
    _i9.Key? key,
    _i8.ChecklistLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ChecklistPreviewRoute.name,
          args: ChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistPreviewRoute';

  static const _i6.PageInfo<ChecklistPreviewRouteArgs> page =
      _i6.PageInfo<ChecklistPreviewRouteArgs>(name);
}

class ChecklistPreviewRouteArgs {
  const ChecklistPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i9.Key? key;

  final _i8.ChecklistLocalization? appLocalizations;

  @override
  String toString() {
    return 'ChecklistPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ChecklistViewPage]
class ChecklistViewRoute extends _i6.PageRouteInfo<void> {
  const ChecklistViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ChecklistViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChecklistViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChecklistWrapperPage]
class ChecklistWrapperRoute
    extends _i6.PageRouteInfo<ChecklistWrapperRouteArgs> {
  ChecklistWrapperRoute({
    _i7.Key? key,
    bool isEditing = false,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ChecklistWrapperRoute.name,
          args: ChecklistWrapperRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistWrapperRoute';

  static const _i6.PageInfo<ChecklistWrapperRouteArgs> page =
      _i6.PageInfo<ChecklistWrapperRouteArgs>(name);
}

class ChecklistWrapperRouteArgs {
  const ChecklistWrapperRouteArgs({
    this.key,
    this.isEditing = false,
  });

  final _i7.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'ChecklistWrapperRouteArgs{key: $key, isEditing: $isEditing}';
  }
}
