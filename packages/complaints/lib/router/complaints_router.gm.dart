// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:complaints/blocs/localization/app_localization.dart' as _i10;
import 'package:complaints/pages/inbox/complaints_details_view.dart' as _i1;
import 'package:complaints/pages/inbox/complaints_inbox.dart' as _i3;
import 'package:complaints/pages/inbox/complaints_inbox_filter.dart' as _i2;
import 'package:complaints/pages/inbox/complaints_inbox_search.dart' as _i4;
import 'package:complaints/pages/inbox/complaints_inbox_sort.dart' as _i5;
import 'package:complaints/pages/inbox/complaints_inbox_wrapper.dart' as _i6;
import 'package:digit_data_model/data_model.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

abstract class $ComplaintsRoute extends _i7.AutoRouterModule {
  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxFilterRouteArgs>(
          orElse: () => const ComplaintsInboxFilterRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ComplaintsInboxSearchPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSortRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSortRouteArgs>(
          orElse: () => const ComplaintsInboxSortRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ComplaintsInboxWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends _i7.PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    _i8.Key? key,
    required _i9.PgrServiceModel complaint,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const _i7.PageInfo<ComplaintsDetailsViewRouteArgs> page =
      _i7.PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final _i8.Key? key;

  final _i9.PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [_i2.ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends _i7.PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    _i8.Key? key,
    _i10.ComplaintsLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxFilterRoute';

  static const _i7.PageInfo<ComplaintsInboxFilterRouteArgs> page =
      _i7.PageInfo<ComplaintsInboxFilterRouteArgs>(name);
}

class ComplaintsInboxFilterRouteArgs {
  const ComplaintsInboxFilterRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxFilterRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ComplaintsInboxPage]
class ComplaintsInboxRoute extends _i7.PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    _i8.Key? key,
    _i10.ComplaintsLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const _i7.PageInfo<ComplaintsInboxRouteArgs> page =
      _i7.PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends _i7.PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    _i8.Key? key,
    _i10.ComplaintsLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSearchRoute';

  static const _i7.PageInfo<ComplaintsInboxSearchRouteArgs> page =
      _i7.PageInfo<ComplaintsInboxSearchRouteArgs>(name);
}

class ComplaintsInboxSearchRouteArgs {
  const ComplaintsInboxSearchRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSearchRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ComplaintsInboxSortPage]
class ComplaintsInboxSortRoute
    extends _i7.PageRouteInfo<ComplaintsInboxSortRouteArgs> {
  ComplaintsInboxSortRoute({
    _i8.Key? key,
    _i10.ComplaintsLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSortRoute.name,
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSortRoute';

  static const _i7.PageInfo<ComplaintsInboxSortRouteArgs> page =
      _i7.PageInfo<ComplaintsInboxSortRouteArgs>(name);
}

class ComplaintsInboxSortRouteArgs {
  const ComplaintsInboxSortRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSortRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i6.ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends _i7.PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
