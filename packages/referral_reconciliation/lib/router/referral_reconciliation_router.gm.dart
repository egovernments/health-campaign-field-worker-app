// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:digit_data_model/data_model.dart' as _i13;
import 'package:flutter/material.dart' as _i10;
import 'package:referral_reconciliation/blocs/app_localization.dart' as _i12;
import 'package:referral_reconciliation/models/entities/hf_referral.dart'
    as _i11;
import 'package:referral_reconciliation/pages/acknowledgement.dart' as _i6;
import 'package:referral_reconciliation/pages/create_referral/create_hf_referral_wrapper.dart'
    as _i1;
import 'package:referral_reconciliation/pages/create_referral/reason_checklist_preview.dart'
    as _i5;
import 'package:referral_reconciliation/pages/create_referral/record_facility_details.dart'
    as _i3;
import 'package:referral_reconciliation/pages/create_referral/record_reason_checklist.dart'
    as _i4;
import 'package:referral_reconciliation/pages/create_referral/record_referral_details.dart'
    as _i2;
import 'package:referral_reconciliation/pages/project_facility/project_facility_selection.dart'
    as _i7;
import 'package:referral_reconciliation/pages/search_referral_reconciliations.dart'
    as _i8;

abstract class $ReferralReconciliationRoute extends _i9.AutoRouterModule {
  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HFCreateReferralWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HFCreateReferralWrapperRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HFCreateReferralWrapperPage(
          key: args.key,
          projectId: args.projectId,
          viewOnly: args.viewOnly,
          referralReconciliation: args.referralReconciliation,
          cycles: args.cycles,
        ),
      );
    },
    RecordReferralDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordReferralDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.RecordReferralDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          projectId: args.projectId,
          cycles: args.cycles,
        ),
      );
    },
    ReferralFacilityRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralFacilityRouteArgs>(
          orElse: () => const ReferralFacilityRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ReferralFacilityPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ReferralReasonChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistRouteArgs>(
          orElse: () => const ReferralReasonChecklistRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ReferralReasonChecklistPage(
          key: args.key,
          referralClientRefId: args.referralClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReasonChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistPreviewRouteArgs>(
          orElse: () => const ReferralReasonChecklistPreviewRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ReferralReasonChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ReferralReconAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReconAcknowledgementRouteArgs>(
          orElse: () => const ReferralReconAcknowledgementRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ReferralReconAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    ReferralReconProjectFacilitySelectionRoute.name: (routeData) {
      final args =
          routeData.argsAs<ReferralReconProjectFacilitySelectionRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ReferralReconProjectFacilitySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          projectFacilities: args.projectFacilities,
        ),
      );
    },
    SearchReferralReconciliationsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchReferralReconciliationsRouteArgs>(
          orElse: () => const SearchReferralReconciliationsRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SearchReferralReconciliationsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HFCreateReferralWrapperPage]
class HFCreateReferralWrapperRoute
    extends _i9.PageRouteInfo<HFCreateReferralWrapperRouteArgs> {
  HFCreateReferralWrapperRoute({
    _i10.Key? key,
    required String projectId,
    bool viewOnly = false,
    _i11.HFReferralModel? referralReconciliation,
    required List<String> cycles,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          HFCreateReferralWrapperRoute.name,
          args: HFCreateReferralWrapperRouteArgs(
            key: key,
            projectId: projectId,
            viewOnly: viewOnly,
            referralReconciliation: referralReconciliation,
            cycles: cycles,
          ),
          initialChildren: children,
        );

  static const String name = 'HFCreateReferralWrapperRoute';

  static const _i9.PageInfo<HFCreateReferralWrapperRouteArgs> page =
      _i9.PageInfo<HFCreateReferralWrapperRouteArgs>(name);
}

class HFCreateReferralWrapperRouteArgs {
  const HFCreateReferralWrapperRouteArgs({
    this.key,
    required this.projectId,
    this.viewOnly = false,
    this.referralReconciliation,
    required this.cycles,
  });

  final _i10.Key? key;

  final String projectId;

  final bool viewOnly;

  final _i11.HFReferralModel? referralReconciliation;

  final List<String> cycles;

  @override
  String toString() {
    return 'HFCreateReferralWrapperRouteArgs{key: $key, projectId: $projectId, viewOnly: $viewOnly, referralReconciliation: $referralReconciliation, cycles: $cycles}';
  }
}

/// generated route for
/// [_i2.RecordReferralDetailsPage]
class RecordReferralDetailsRoute
    extends _i9.PageRouteInfo<RecordReferralDetailsRouteArgs> {
  RecordReferralDetailsRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    bool isEditing = false,
    required String projectId,
    required List<String> cycles,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RecordReferralDetailsRoute.name,
          args: RecordReferralDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            projectId: projectId,
            cycles: cycles,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordReferralDetailsRoute';

  static const _i9.PageInfo<RecordReferralDetailsRouteArgs> page =
      _i9.PageInfo<RecordReferralDetailsRouteArgs>(name);
}

class RecordReferralDetailsRouteArgs {
  const RecordReferralDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    required this.projectId,
    required this.cycles,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  final bool isEditing;

  final String projectId;

  final List<String> cycles;

  @override
  String toString() {
    return 'RecordReferralDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, projectId: $projectId, cycles: $cycles}';
  }
}

/// generated route for
/// [_i3.ReferralFacilityPage]
class ReferralFacilityRoute
    extends _i9.PageRouteInfo<ReferralFacilityRouteArgs> {
  ReferralFacilityRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    bool isEditing = false,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ReferralFacilityRoute.name,
          args: ReferralFacilityRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralFacilityRoute';

  static const _i9.PageInfo<ReferralFacilityRouteArgs> page =
      _i9.PageInfo<ReferralFacilityRouteArgs>(name);
}

class ReferralFacilityRouteArgs {
  const ReferralFacilityRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'ReferralFacilityRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i4.ReferralReasonChecklistPage]
class ReferralReasonChecklistRoute
    extends _i9.PageRouteInfo<ReferralReasonChecklistRouteArgs> {
  ReferralReasonChecklistRoute({
    _i10.Key? key,
    String? referralClientRefId,
    _i12.ReferralReconLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<ReferralReasonChecklistRouteArgs> page =
      _i9.PageInfo<ReferralReasonChecklistRouteArgs>(name);
}

class ReferralReasonChecklistRouteArgs {
  const ReferralReasonChecklistRouteArgs({
    this.key,
    this.referralClientRefId,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final String? referralClientRefId;

  final _i12.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReasonChecklistRouteArgs{key: $key, referralClientRefId: $referralClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ReferralReasonChecklistPreviewPage]
class ReferralReasonChecklistPreviewRoute
    extends _i9.PageRouteInfo<ReferralReasonChecklistPreviewRouteArgs> {
  ReferralReasonChecklistPreviewRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ReferralReasonChecklistPreviewRoute.name,
          args: ReferralReasonChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReasonChecklistPreviewRoute';

  static const _i9.PageInfo<ReferralReasonChecklistPreviewRouteArgs> page =
      _i9.PageInfo<ReferralReasonChecklistPreviewRouteArgs>(name);
}

class ReferralReasonChecklistPreviewRouteArgs {
  const ReferralReasonChecklistPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'ReferralReasonChecklistPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i6.ReferralReconAcknowledgementPage]
class ReferralReconAcknowledgementRoute
    extends _i9.PageRouteInfo<ReferralReconAcknowledgementRouteArgs> {
  ReferralReconAcknowledgementRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ReferralReconAcknowledgementRoute.name,
          args: ReferralReconAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReconAcknowledgementRoute';

  static const _i9.PageInfo<ReferralReconAcknowledgementRouteArgs> page =
      _i9.PageInfo<ReferralReconAcknowledgementRouteArgs>(name);
}

class ReferralReconAcknowledgementRouteArgs {
  const ReferralReconAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'ReferralReconAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [_i7.ReferralReconProjectFacilitySelectionPage]
class ReferralReconProjectFacilitySelectionRoute
    extends _i9.PageRouteInfo<ReferralReconProjectFacilitySelectionRouteArgs> {
  ReferralReconProjectFacilitySelectionRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    required List<_i13.ProjectFacilityModel> projectFacilities,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>
      page = _i9.PageInfo<ReferralReconProjectFacilitySelectionRouteArgs>(name);
}

class ReferralReconProjectFacilitySelectionRouteArgs {
  const ReferralReconProjectFacilitySelectionRouteArgs({
    this.key,
    this.appLocalizations,
    required this.projectFacilities,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  final List<_i13.ProjectFacilityModel> projectFacilities;

  @override
  String toString() {
    return 'ReferralReconProjectFacilitySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations, projectFacilities: $projectFacilities}';
  }
}

/// generated route for
/// [_i8.SearchReferralReconciliationsPage]
class SearchReferralReconciliationsRoute
    extends _i9.PageRouteInfo<SearchReferralReconciliationsRouteArgs> {
  SearchReferralReconciliationsRoute({
    _i10.Key? key,
    _i12.ReferralReconLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SearchReferralReconciliationsRoute.name,
          args: SearchReferralReconciliationsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchReferralReconciliationsRoute';

  static const _i9.PageInfo<SearchReferralReconciliationsRouteArgs> page =
      _i9.PageInfo<SearchReferralReconciliationsRouteArgs>(name);
}

class SearchReferralReconciliationsRouteArgs {
  const SearchReferralReconciliationsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i12.ReferralReconLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchReferralReconciliationsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
