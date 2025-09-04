// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:complaints/blocs/localization/app_localization.dart' as _i8;
import 'package:complaints/models/pgr_complaints.dart' as _i9;
import 'package:complaints/pages/complaints_acknowledgement.dart' as _i1;
import 'package:complaints/pages/inbox/complaints_details_view.dart' as _i2;
import 'package:complaints/pages/inbox/complaints_inbox.dart' as _i4;
import 'package:complaints/pages/inbox/complaints_inbox_dialog.dart' as _i3;
import 'package:complaints/pages/inbox/complaints_inbox_wrapper.dart' as _i5;
import 'package:complaints/utils/constants.dart' as _i10;
import 'package:flutter/foundation.dart' as _i11;
import 'package:flutter/material.dart' as _i7;

abstract class $ComplaintsRoute extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ComplaintsAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsAcknowledgementRouteArgs>(
          orElse: () => const ComplaintsAcknowledgementRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ComplaintsAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxDialogRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxDialogRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComplaintsInboxDialogPage(
          key: args.key,
          type: args.type,
          titleKey: args.titleKey,
          ctaKey: args.ctaKey,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ComplaintsInboxWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends _i6.PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    _i7.Key? key,
    _i8.ComplaintsLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsAcknowledgementRoute';

  static const _i6.PageInfo<ComplaintsAcknowledgementRouteArgs> page =
      _i6.PageInfo<ComplaintsAcknowledgementRouteArgs>(name);
}

class ComplaintsAcknowledgementRouteArgs {
  const ComplaintsAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i7.Key? key;

  final _i8.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends _i6.PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    _i7.Key? key,
    required _i9.PgrServiceModel complaint,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const _i6.PageInfo<ComplaintsDetailsViewRouteArgs> page =
      _i6.PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final _i7.Key? key;

  final _i9.PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [_i3.ComplaintsInboxDialogPage]
class ComplaintsInboxDialogRoute
    extends _i6.PageRouteInfo<ComplaintsInboxDialogRouteArgs> {
  ComplaintsInboxDialogRoute({
    _i7.Key? key,
    required _i10.ComplaintsInboxDialogType type,
    required String titleKey,
    required String ctaKey,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxDialogRoute.name,
          args: ComplaintsInboxDialogRouteArgs(
            key: key,
            type: type,
            titleKey: titleKey,
            ctaKey: ctaKey,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxDialogRoute';

  static const _i6.PageInfo<ComplaintsInboxDialogRouteArgs> page =
      _i6.PageInfo<ComplaintsInboxDialogRouteArgs>(name);
}

class ComplaintsInboxDialogRouteArgs {
  const ComplaintsInboxDialogRouteArgs({
    this.key,
    required this.type,
    required this.titleKey,
    required this.ctaKey,
  });

  final _i7.Key? key;

  final _i10.ComplaintsInboxDialogType type;

  final String titleKey;

  final String ctaKey;

  @override
  String toString() {
    return 'ComplaintsInboxDialogRouteArgs{key: $key, type: $type, titleKey: $titleKey, ctaKey: $ctaKey}';
  }
}

/// generated route for
/// [_i4.ComplaintsInboxPage]
class ComplaintsInboxRoute extends _i6.PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    _i11.Key? key,
    _i8.ComplaintsLocalization? appLocalizations,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const _i6.PageInfo<ComplaintsInboxRouteArgs> page =
      _i6.PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i11.Key? key;

  final _i8.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends _i6.PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
