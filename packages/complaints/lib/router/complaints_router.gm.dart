// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:complaints/blocs/localization/app_localization.dart' as _i14;
import 'package:complaints/models/pgr_complaints.dart' as _i15;
import 'package:complaints/pages/complaints_acknowledgement.dart' as _i2;
import 'package:complaints/pages/inbox/complaints_details_view.dart' as _i4;
import 'package:complaints/pages/inbox/complaints_inbox.dart' as _i6;
import 'package:complaints/pages/inbox/complaints_inbox_filter.dart' as _i5;
import 'package:complaints/pages/inbox/complaints_inbox_search.dart' as _i7;
import 'package:complaints/pages/inbox/complaints_inbox_sort.dart' as _i8;
import 'package:complaints/pages/inbox/complaints_inbox_wrapper.dart' as _i9;
import 'package:complaints/pages/registration/complaint_type.dart' as _i1;
import 'package:complaints/pages/registration/complaints_details.dart' as _i3;
import 'package:complaints/pages/registration/complaints_location.dart' as _i10;
import 'package:complaints/pages/registration/complaints_registration_wrapper.dart'
    as _i11;
import 'package:flutter/material.dart' as _i13;

abstract class $ComplaintsRoute extends _i12.AutoRouterModule {
  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ComplaintTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintTypeRouteArgs>(
          orElse: () => const ComplaintTypeRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ComplaintTypePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsAcknowledgementRouteArgs>(
          orElse: () => const ComplaintsAcknowledgementRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ComplaintsAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsRouteArgs>(
          orElse: () => const ComplaintsDetailsRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComplaintsDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxFilterRouteArgs>(
          orElse: () => const ComplaintsInboxFilterRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ComplaintsInboxSearchPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSortRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSortRouteArgs>(
          orElse: () => const ComplaintsInboxSortRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ComplaintsInboxWrapperPage(),
      );
    },
    ComplaintsLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsLocationRouteArgs>(
          orElse: () => const ComplaintsLocationRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ComplaintsLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsRegistrationWrapperRouteArgs>(
          orElse: () => const ComplaintsRegistrationWrapperRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i11.ComplaintsRegistrationWrapperPage(
          key: args.key,
          pgrServiceModel: args.pgrServiceModel,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ComplaintTypePage]
class ComplaintTypeRoute extends _i12.PageRouteInfo<ComplaintTypeRouteArgs> {
  ComplaintTypeRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintTypeRoute.name,
          args: ComplaintTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintTypeRoute';

  static const _i12.PageInfo<ComplaintTypeRouteArgs> page =
      _i12.PageInfo<ComplaintTypeRouteArgs>(name);
}

class ComplaintTypeRouteArgs {
  const ComplaintTypeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintTypeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends _i12.PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsAcknowledgementRoute';

  static const _i12.PageInfo<ComplaintsAcknowledgementRouteArgs> page =
      _i12.PageInfo<ComplaintsAcknowledgementRouteArgs>(name);
}

class ComplaintsAcknowledgementRouteArgs {
  const ComplaintsAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ComplaintsDetailsPage]
class ComplaintsDetailsRoute
    extends _i12.PageRouteInfo<ComplaintsDetailsRouteArgs> {
  ComplaintsDetailsRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsRoute.name,
          args: ComplaintsDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsRoute';

  static const _i12.PageInfo<ComplaintsDetailsRouteArgs> page =
      _i12.PageInfo<ComplaintsDetailsRouteArgs>(name);
}

class ComplaintsDetailsRouteArgs {
  const ComplaintsDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends _i12.PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    _i13.Key? key,
    required _i15.PgrServiceModel complaint,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const _i12.PageInfo<ComplaintsDetailsViewRouteArgs> page =
      _i12.PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final _i13.Key? key;

  final _i15.PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [_i5.ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends _i12.PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxFilterRoute';

  static const _i12.PageInfo<ComplaintsInboxFilterRouteArgs> page =
      _i12.PageInfo<ComplaintsInboxFilterRouteArgs>(name);
}

class ComplaintsInboxFilterRouteArgs {
  const ComplaintsInboxFilterRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxFilterRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i6.ComplaintsInboxPage]
class ComplaintsInboxRoute
    extends _i12.PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const _i12.PageInfo<ComplaintsInboxRouteArgs> page =
      _i12.PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends _i12.PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSearchRoute';

  static const _i12.PageInfo<ComplaintsInboxSearchRouteArgs> page =
      _i12.PageInfo<ComplaintsInboxSearchRouteArgs>(name);
}

class ComplaintsInboxSearchRouteArgs {
  const ComplaintsInboxSearchRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSearchRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.ComplaintsInboxSortPage]
class ComplaintsInboxSortRoute
    extends _i12.PageRouteInfo<ComplaintsInboxSortRouteArgs> {
  ComplaintsInboxSortRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSortRoute.name,
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSortRoute';

  static const _i12.PageInfo<ComplaintsInboxSortRouteArgs> page =
      _i12.PageInfo<ComplaintsInboxSortRouteArgs>(name);
}

class ComplaintsInboxSortRouteArgs {
  const ComplaintsInboxSortRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSortRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i9.ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends _i12.PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ComplaintsLocationPage]
class ComplaintsLocationRoute
    extends _i12.PageRouteInfo<ComplaintsLocationRouteArgs> {
  ComplaintsLocationRoute({
    _i13.Key? key,
    _i14.ComplaintsLocalization? appLocalizations,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsLocationRoute.name,
          args: ComplaintsLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsLocationRoute';

  static const _i12.PageInfo<ComplaintsLocationRouteArgs> page =
      _i12.PageInfo<ComplaintsLocationRouteArgs>(name);
}

class ComplaintsLocationRouteArgs {
  const ComplaintsLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i13.Key? key;

  final _i14.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i11.ComplaintsRegistrationWrapperPage]
class ComplaintsRegistrationWrapperRoute
    extends _i12.PageRouteInfo<ComplaintsRegistrationWrapperRouteArgs> {
  ComplaintsRegistrationWrapperRoute({
    _i13.Key? key,
    _i15.PgrServiceModel? pgrServiceModel,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ComplaintsRegistrationWrapperRoute.name,
          args: ComplaintsRegistrationWrapperRouteArgs(
            key: key,
            pgrServiceModel: pgrServiceModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsRegistrationWrapperRoute';

  static const _i12.PageInfo<ComplaintsRegistrationWrapperRouteArgs> page =
      _i12.PageInfo<ComplaintsRegistrationWrapperRouteArgs>(name);
}

class ComplaintsRegistrationWrapperRouteArgs {
  const ComplaintsRegistrationWrapperRouteArgs({
    this.key,
    this.pgrServiceModel,
  });

  final _i13.Key? key;

  final _i15.PgrServiceModel? pgrServiceModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationWrapperRouteArgs{key: $key, pgrServiceModel: $pgrServiceModel}';
  }
}
