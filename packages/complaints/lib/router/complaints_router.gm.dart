// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:complaints/blocs/localization/app_localization.dart' as _i15;
import 'package:complaints/models/pgr_complaints.dart' as _i16;
import 'package:complaints/pages/complaints_acknowledgement.dart' as _i2;
import 'package:complaints/pages/inbox/complaints_details_view.dart' as _i4;
import 'package:complaints/pages/inbox/complaints_inbox.dart' as _i7;
import 'package:complaints/pages/inbox/complaints_inbox_dialog.dart' as _i5;
import 'package:complaints/pages/inbox/complaints_inbox_filter.dart' as _i6;
import 'package:complaints/pages/inbox/complaints_inbox_search.dart' as _i8;
import 'package:complaints/pages/inbox/complaints_inbox_sort.dart' as _i9;
import 'package:complaints/pages/inbox/complaints_inbox_wrapper.dart' as _i10;
import 'package:complaints/pages/registration/complaint_type.dart' as _i1;
import 'package:complaints/pages/registration/complaints_details.dart' as _i3;
import 'package:complaints/pages/registration/complaints_location.dart' as _i11;
import 'package:complaints/pages/registration/complaints_registration_wrapper.dart'
    as _i12;
import 'package:complaints/utils/constants.dart' as _i17;
import 'package:flutter/material.dart' as _i14;
import 'package:reactive_forms/reactive_forms.dart' as _i18;

abstract class $ComplaintsRoute extends _i13.AutoRouterModule {
  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    ComplaintTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintTypeRouteArgs>(
          orElse: () => const ComplaintTypeRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
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
      return _i13.AutoRoutePage<dynamic>(
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
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComplaintsDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxDialogRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxDialogRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ComplaintsInboxDialogPage(
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
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ComplaintsInboxSearchPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSortRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSortRouteArgs>(
          orElse: () => const ComplaintsInboxSortRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ComplaintsInboxWrapperPage(),
      );
    },
    ComplaintsLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsLocationRouteArgs>(
          orElse: () => const ComplaintsLocationRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ComplaintsLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsRegistrationWrapperRouteArgs>(
          orElse: () => const ComplaintsRegistrationWrapperRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(
            child: _i12.ComplaintsRegistrationWrapperPage(
          key: args.key,
          pgrServiceModel: args.pgrServiceModel,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ComplaintTypePage]
class ComplaintTypeRoute extends _i13.PageRouteInfo<ComplaintTypeRouteArgs> {
  ComplaintTypeRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintTypeRoute.name,
          args: ComplaintTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintTypeRoute';

  static const _i13.PageInfo<ComplaintTypeRouteArgs> page =
      _i13.PageInfo<ComplaintTypeRouteArgs>(name);
}

class ComplaintTypeRouteArgs {
  const ComplaintTypeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintTypeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends _i13.PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsAcknowledgementRoute';

  static const _i13.PageInfo<ComplaintsAcknowledgementRouteArgs> page =
      _i13.PageInfo<ComplaintsAcknowledgementRouteArgs>(name);
}

class ComplaintsAcknowledgementRouteArgs {
  const ComplaintsAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ComplaintsDetailsPage]
class ComplaintsDetailsRoute
    extends _i13.PageRouteInfo<ComplaintsDetailsRouteArgs> {
  ComplaintsDetailsRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsRoute.name,
          args: ComplaintsDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsRoute';

  static const _i13.PageInfo<ComplaintsDetailsRouteArgs> page =
      _i13.PageInfo<ComplaintsDetailsRouteArgs>(name);
}

class ComplaintsDetailsRouteArgs {
  const ComplaintsDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends _i13.PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    _i14.Key? key,
    required _i16.PgrServiceModel complaint,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const _i13.PageInfo<ComplaintsDetailsViewRouteArgs> page =
      _i13.PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final _i14.Key? key;

  final _i16.PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [_i5.ComplaintsInboxDialogPage]
class ComplaintsInboxDialogRoute
    extends _i13.PageRouteInfo<ComplaintsInboxDialogRouteArgs> {
  ComplaintsInboxDialogRoute({
    _i14.Key? key,
    required _i17.ComplaintsInboxDialogType type,
    required _i18.FormGroup Function() buildForm,
    required _i14.Widget Function(
      _i14.BuildContext,
      _i18.FormGroup,
    ) buildFields,
    required String titleKey,
    required String ctaKey,
    required void Function(
      _i14.BuildContext,
      _i18.FormGroup,
    ) onSubmit,
    List<_i13.PageRouteInfo>? children,
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

  static const _i13.PageInfo<ComplaintsInboxDialogRouteArgs> page =
      _i13.PageInfo<ComplaintsInboxDialogRouteArgs>(name);
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

  final _i14.Key? key;

  final _i17.ComplaintsInboxDialogType type;

  final _i18.FormGroup Function() buildForm;

  final _i14.Widget Function(
    _i14.BuildContext,
    _i18.FormGroup,
  ) buildFields;

  final String titleKey;

  final String ctaKey;

  final void Function(
    _i14.BuildContext,
    _i18.FormGroup,
  ) onSubmit;

  @override
  String toString() {
    return 'ComplaintsInboxDialogRouteArgs{key: $key, type: $type, buildForm: $buildForm, buildFields: $buildFields, titleKey: $titleKey, ctaKey: $ctaKey, onSubmit: $onSubmit}';
  }
}

/// generated route for
/// [_i6.ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends _i13.PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxFilterRoute';

  static const _i13.PageInfo<ComplaintsInboxFilterRouteArgs> page =
      _i13.PageInfo<ComplaintsInboxFilterRouteArgs>(name);
}

class ComplaintsInboxFilterRouteArgs {
  const ComplaintsInboxFilterRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxFilterRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.ComplaintsInboxPage]
class ComplaintsInboxRoute
    extends _i13.PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const _i13.PageInfo<ComplaintsInboxRouteArgs> page =
      _i13.PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends _i13.PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSearchRoute';

  static const _i13.PageInfo<ComplaintsInboxSearchRouteArgs> page =
      _i13.PageInfo<ComplaintsInboxSearchRouteArgs>(name);
}

class ComplaintsInboxSearchRouteArgs {
  const ComplaintsInboxSearchRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSearchRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i9.ComplaintsInboxSortPage]
class ComplaintsInboxSortRoute
    extends _i13.PageRouteInfo<ComplaintsInboxSortRouteArgs> {
  ComplaintsInboxSortRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSortRoute.name,
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSortRoute';

  static const _i13.PageInfo<ComplaintsInboxSortRouteArgs> page =
      _i13.PageInfo<ComplaintsInboxSortRouteArgs>(name);
}

class ComplaintsInboxSortRouteArgs {
  const ComplaintsInboxSortRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSortRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i10.ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends _i13.PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ComplaintsLocationPage]
class ComplaintsLocationRoute
    extends _i13.PageRouteInfo<ComplaintsLocationRouteArgs> {
  ComplaintsLocationRoute({
    _i14.Key? key,
    _i15.ComplaintsLocalization? appLocalizations,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsLocationRoute.name,
          args: ComplaintsLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsLocationRoute';

  static const _i13.PageInfo<ComplaintsLocationRouteArgs> page =
      _i13.PageInfo<ComplaintsLocationRouteArgs>(name);
}

class ComplaintsLocationRouteArgs {
  const ComplaintsLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i14.Key? key;

  final _i15.ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i12.ComplaintsRegistrationWrapperPage]
class ComplaintsRegistrationWrapperRoute
    extends _i13.PageRouteInfo<ComplaintsRegistrationWrapperRouteArgs> {
  ComplaintsRegistrationWrapperRoute({
    _i14.Key? key,
    _i16.PgrServiceModel? pgrServiceModel,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ComplaintsRegistrationWrapperRoute.name,
          args: ComplaintsRegistrationWrapperRouteArgs(
            key: key,
            pgrServiceModel: pgrServiceModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsRegistrationWrapperRoute';

  static const _i13.PageInfo<ComplaintsRegistrationWrapperRouteArgs> page =
      _i13.PageInfo<ComplaintsRegistrationWrapperRouteArgs>(name);
}

class ComplaintsRegistrationWrapperRouteArgs {
  const ComplaintsRegistrationWrapperRouteArgs({
    this.key,
    this.pgrServiceModel,
  });

  final _i14.Key? key;

  final _i16.PgrServiceModel? pgrServiceModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationWrapperRouteArgs{key: $key, pgrServiceModel: $pgrServiceModel}';
  }
}
