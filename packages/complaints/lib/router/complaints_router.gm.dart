// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:complaints/blocs/localization/app_localization.dart' as _i11;
import 'package:complaints/models/pgr_complaints.dart' as _i12;
import 'package:complaints/pages/complaints_acknowledgement.dart' as _i1;
import 'package:complaints/pages/inbox/complaints_details_view.dart' as _i2;
import 'package:complaints/pages/inbox/complaints_inbox.dart' as _i5;
import 'package:complaints/pages/inbox/complaints_inbox_dialog.dart' as _i3;
import 'package:complaints/pages/inbox/complaints_inbox_filter.dart' as _i4;
import 'package:complaints/pages/inbox/complaints_inbox_search.dart' as _i6;
import 'package:complaints/pages/inbox/complaints_inbox_sort.dart' as _i7;
import 'package:complaints/pages/inbox/complaints_inbox_wrapper.dart' as _i8;
import 'package:complaints/utils/constants.dart' as _i13;
import 'package:flutter/foundation.dart' as _i15;
import 'package:flutter/material.dart' as _i10;
import 'package:reactive_forms/reactive_forms.dart' as _i14;

abstract class $ComplaintsRoute extends _i9.AutoRouterModule {
  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    ComplaintsAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsAcknowledgementRouteArgs>(
          orElse: () => const ComplaintsAcknowledgementRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ComplaintsAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxDialogRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxDialogRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComplaintsInboxDialogPage(
          key: args.key,
          type: args.type,
          buildForm: args.buildForm,
          buildFields: args.buildFields,
          titleKey: args.titleKey,
          ctaKey: args.ctaKey,
          onSubmit: args.onSubmit,
        ),
      );
    },
    ComplaintsInboxFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxFilterRouteArgs>(
          orElse: () => const ComplaintsInboxFilterRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ComplaintsInboxSearchPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSortRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSortRouteArgs>(
          orElse: () => const ComplaintsInboxSortRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ComplaintsInboxWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends _i9.PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    _i10.Key? key,
    _i11.ComplaintsLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsAcknowledgementRoute';

  static const _i9.PageInfo<ComplaintsAcknowledgementRouteArgs> page =
      _i9.PageInfo<ComplaintsAcknowledgementRouteArgs>(name);
}

class ComplaintsAcknowledgementRouteArgs {
  const ComplaintsAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends _i9.PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    _i10.Key? key,
    required _i12.PgrServiceModel complaint,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const _i9.PageInfo<ComplaintsDetailsViewRouteArgs> page =
      _i9.PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final _i10.Key? key;

  final _i12.PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [_i3.ComplaintsInboxDialogPage]
class ComplaintsInboxDialogRoute
    extends _i9.PageRouteInfo<ComplaintsInboxDialogRouteArgs> {
  ComplaintsInboxDialogRoute({
    _i10.Key? key,
    required _i13.ComplaintsInboxDialogType type,
    required _i14.FormGroup Function() buildForm,
    required _i10.Widget Function(
      _i10.BuildContext,
      _i14.FormGroup,
    ) buildFields,
    required String titleKey,
    required String ctaKey,
    required void Function(
      _i10.BuildContext,
      _i14.FormGroup,
    ) onSubmit,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxDialogRoute.name,
          args: ComplaintsInboxDialogRouteArgs(
            key: key,
            type: type,
            buildForm: buildForm,
            buildFields: buildFields,
            titleKey: titleKey,
            ctaKey: ctaKey,
            onSubmit: onSubmit,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxDialogRoute';

  static const _i9.PageInfo<ComplaintsInboxDialogRouteArgs> page =
      _i9.PageInfo<ComplaintsInboxDialogRouteArgs>(name);
}

class ComplaintsInboxDialogRouteArgs {
  const ComplaintsInboxDialogRouteArgs({
    this.key,
    required this.type,
    required this.buildForm,
    required this.buildFields,
    required this.titleKey,
    required this.ctaKey,
    required this.onSubmit,
  });

  final _i10.Key? key;

  final _i13.ComplaintsInboxDialogType type;

  final _i14.FormGroup Function() buildForm;

  final _i10.Widget Function(
    _i10.BuildContext,
    _i14.FormGroup,
  ) buildFields;

  final String titleKey;

  final String ctaKey;

  final void Function(
    _i10.BuildContext,
    _i14.FormGroup,
  ) onSubmit;

  @override
  String toString() {
    return 'ComplaintsInboxDialogRouteArgs{key: $key, type: $type, buildForm: $buildForm, buildFields: $buildFields, titleKey: $titleKey, ctaKey: $ctaKey, onSubmit: $onSubmit}';
  }
}

/// generated route for
/// [_i4.ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends _i9.PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    _i10.Key? key,
    _i11.ComplaintsLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxFilterRoute';

  static const _i9.PageInfo<ComplaintsInboxFilterRouteArgs> page =
      _i9.PageInfo<ComplaintsInboxFilterRouteArgs>(name);
}

class ComplaintsInboxFilterRouteArgs {
  const ComplaintsInboxFilterRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxFilterRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ComplaintsInboxPage]
class ComplaintsInboxRoute extends _i9.PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    _i15.Key? key,
    _i11.ComplaintsLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const _i9.PageInfo<ComplaintsInboxRouteArgs> page =
      _i9.PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i11.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i6.ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends _i9.PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    _i10.Key? key,
    _i11.ComplaintsLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSearchRoute';

  static const _i9.PageInfo<ComplaintsInboxSearchRouteArgs> page =
      _i9.PageInfo<ComplaintsInboxSearchRouteArgs>(name);
}

class ComplaintsInboxSearchRouteArgs {
  const ComplaintsInboxSearchRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSearchRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.ComplaintsInboxSortPage]
class ComplaintsInboxSortRoute
    extends _i9.PageRouteInfo<ComplaintsInboxSortRouteArgs> {
  ComplaintsInboxSortRoute({
    _i10.Key? key,
    _i11.ComplaintsLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSortRoute.name,
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSortRoute';

  static const _i9.PageInfo<ComplaintsInboxSortRouteArgs> page =
      _i9.PageInfo<ComplaintsInboxSortRouteArgs>(name);
}

class ComplaintsInboxSortRouteArgs {
  const ComplaintsInboxSortRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSortRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends _i9.PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
