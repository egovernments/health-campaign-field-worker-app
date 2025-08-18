// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:digit_data_model/data_model.dart' as _i10;
import 'package:flutter/foundation.dart' as _i11;
import 'package:flutter/material.dart' as _i8;
import 'package:referral_reconciliation/blocs/app_localization.dart' as _i9;
import 'package:referral_reconciliation/pages/acknowledgement.dart' as _i4;
import 'package:referral_reconciliation/pages/create_referral/reason_checklist_preview.dart'
    as _i3;
import 'package:referral_reconciliation/pages/create_referral/record_reason_checklist.dart'
    as _i2;
import 'package:referral_reconciliation/pages/project_facility/project_facility_selection.dart'
    as _i5;
import 'package:referral_reconciliation/pages/referral_wrapper_start.dart'
    as _i1;
import 'package:referral_reconciliation/pages/search_referral_reconciliations.dart'
    as _i6;

abstract class $ReferralReconciliationRoute extends _i7.AutoRouterModule {
  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HFReferralWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HFReferralWrapperPage(),
      );
    },
    ReferralReasonChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistRouteArgs>(
          orElse: () => const ReferralReasonChecklistRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ReferralReasonChecklistPage(
          key: args.key,
          referralClientRefId: args.referralClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReasonChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistPreviewRouteArgs>(
          orElse: () => const ReferralReasonChecklistPreviewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ReferralReasonChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReconAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReconAcknowledgementRouteArgs>(
          orElse: () => const ReferralReconAcknowledgementRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ReferralReconAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReconProjectFacilitySelectionRoute.name: (routeData) {
      final args =
          routeData.argsAs<ReferralReconProjectFacilitySelectionRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ReferralReconProjectFacilitySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          projectFacilities: args.projectFacilities,
        ),
      );
    },
    SearchReferralReconciliationsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchReferralReconciliationsRouteArgs>(
          orElse: () => const SearchReferralReconciliationsRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SearchReferralReconciliationsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HFReferralWrapperPage]
class HFReferralWrapperRoute extends _i7.PageRouteInfo<void> {
  const HFReferralWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HFReferralWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HFReferralWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ReferralReasonChecklistPage]
class ReferralReasonChecklistRoute
    extends _i7.PageRouteInfo<ReferralReasonChecklistRouteArgs> {
  ReferralReasonChecklistRoute({
    _i8.Key? key,
    String? referralClientRefId,
    _i9.ReferralReconLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ReferralReasonChecklistRoute.name,
          args: ReferralReasonChecklistRouteArgs(
            key: key,
            referralClientRefId: referralClientRefId,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReasonChecklistRoute';

  static const _i7.PageInfo<ReferralReasonChecklistRouteArgs> page =
      _i7.PageInfo<ReferralReasonChecklistRouteArgs>(name);
}

class ReferralReasonChecklistRouteArgs {
  const ReferralReasonChecklistRouteArgs({
    this.key,
    this.referralClientRefId,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final String? referralClientRefId;

  final _i9.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReasonChecklistRouteArgs{key: $key, referralClientRefId: $referralClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ReferralReasonChecklistPreviewPage]
class ReferralReasonChecklistPreviewRoute
    extends _i7.PageRouteInfo<ReferralReasonChecklistPreviewRouteArgs> {
  ReferralReasonChecklistPreviewRoute({
    _i8.Key? key,
    _i9.ReferralReconLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ReferralReasonChecklistPreviewRoute.name,
          args: ReferralReasonChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReasonChecklistPreviewRoute';

  static const _i7.PageInfo<ReferralReasonChecklistPreviewRouteArgs> page =
      _i7.PageInfo<ReferralReasonChecklistPreviewRouteArgs>(name);
}

class ReferralReasonChecklistPreviewRouteArgs {
  const ReferralReasonChecklistPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i9.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReasonChecklistPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ReferralReconAcknowledgementPage]
class ReferralReconAcknowledgementRoute
    extends _i7.PageRouteInfo<ReferralReconAcknowledgementRouteArgs> {
  ReferralReconAcknowledgementRoute({
    _i8.Key? key,
    _i9.ReferralReconLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ReferralReconAcknowledgementRoute.name,
          args: ReferralReconAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReconAcknowledgementRoute';

  static const _i7.PageInfo<ReferralReconAcknowledgementRouteArgs> page =
      _i7.PageInfo<ReferralReconAcknowledgementRouteArgs>(name);
}

class ReferralReconAcknowledgementRouteArgs {
  const ReferralReconAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i9.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReconAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ReferralReconProjectFacilitySelectionPage]
class ReferralReconProjectFacilitySelectionRoute
    extends _i7.PageRouteInfo<ReferralReconProjectFacilitySelectionRouteArgs> {
  ReferralReconProjectFacilitySelectionRoute({
    _i8.Key? key,
    _i9.ReferralReconLocalization? appLocalizations,
    required List<_i10.ProjectFacilityModel> projectFacilities,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ReferralReconProjectFacilitySelectionRoute.name,
          args: ReferralReconProjectFacilitySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            projectFacilities: projectFacilities,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReconProjectFacilitySelectionRoute';

  static const _i7.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>
      page = _i7.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>(name);
}

class ReferralReconProjectFacilitySelectionRouteArgs {
  const ReferralReconProjectFacilitySelectionRouteArgs({
    this.key,
    this.appLocalizations,
    required this.projectFacilities,
  });

  final _i8.Key? key;

  final _i9.ReferralReconLocalization? appLocalizations;

  final List<_i10.ProjectFacilityModel> projectFacilities;

  @override
  String toString() {
    return 'ReferralReconProjectFacilitySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations, projectFacilities: $projectFacilities}';
  }
}

/// generated route for
/// [_i6.SearchReferralReconciliationsPage]
class SearchReferralReconciliationsRoute
    extends _i7.PageRouteInfo<SearchReferralReconciliationsRouteArgs> {
  SearchReferralReconciliationsRoute({
    _i11.Key? key,
    _i9.ReferralReconLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SearchReferralReconciliationsRoute.name,
          args: SearchReferralReconciliationsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchReferralReconciliationsRoute';

  static const _i7.PageInfo<SearchReferralReconciliationsRouteArgs> page =
      _i7.PageInfo<SearchReferralReconciliationsRouteArgs>(name);
}

class SearchReferralReconciliationsRouteArgs {
  const SearchReferralReconciliationsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i11.Key? key;

  final _i9.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchReferralReconciliationsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
