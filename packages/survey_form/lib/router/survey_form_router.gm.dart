// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:survey_form/blocs/app_localization.dart' as _i9;
import 'package:survey_form/pages/acknowledgement.dart' as _i1;
import 'package:survey_form/pages/survey_form.dart' as _i6;
import 'package:survey_form/pages/survey_form_boundary_view.dart' as _i2;
import 'package:survey_form/pages/survey_form_preview.dart' as _i3;
import 'package:survey_form/pages/survey_form_view.dart' as _i4;
import 'package:survey_form/pages/survey_form_wrapper.dart' as _i5;
import 'package:survey_form/survey_form.dart' as _i10;

abstract class $SurveyFormRoute extends _i7.AutoRouterModule {
  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SurveyFormAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyFormAcknowledgementRouteArgs>(
          orElse: () => const SurveyFormAcknowledgementRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SurveyFormAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    SurveyFormBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyFormBoundaryViewRouteArgs>(
          orElse: () => const SurveyFormBoundaryViewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SurveyFormBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SurveyFormPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyFormPreviewRouteArgs>(
          orElse: () => const SurveyFormPreviewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SurveyFormPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SurveyFormViewRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyFormViewRouteArgs>(
          orElse: () => const SurveyFormViewRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SurveyFormViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SurveyFormWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyFormWrapperRouteArgs>(
          orElse: () => const SurveyFormWrapperRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SurveyFormWrapperPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    SurveyformRoute.name: (routeData) {
      final args = routeData.argsAs<SurveyformRouteArgs>(
          orElse: () => const SurveyformRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SurveyformPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SurveyFormAcknowledgementPage]
class SurveyFormAcknowledgementRoute
    extends _i7.PageRouteInfo<SurveyFormAcknowledgementRouteArgs> {
  SurveyFormAcknowledgementRoute({
    _i8.Key? key,
    _i9.SurveyFormLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormAcknowledgementRoute.name,
          args: SurveyFormAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormAcknowledgementRoute';

  static const _i7.PageInfo<SurveyFormAcknowledgementRouteArgs> page =
      _i7.PageInfo<SurveyFormAcknowledgementRouteArgs>(name);
}

class SurveyFormAcknowledgementRouteArgs {
  const SurveyFormAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final _i8.Key? key;

  final _i9.SurveyFormLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'SurveyFormAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [_i2.SurveyFormBoundaryViewPage]
class SurveyFormBoundaryViewRoute
    extends _i7.PageRouteInfo<SurveyFormBoundaryViewRouteArgs> {
  SurveyFormBoundaryViewRoute({
    _i8.Key? key,
    _i10.SurveyFormLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormBoundaryViewRoute.name,
          args: SurveyFormBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormBoundaryViewRoute';

  static const _i7.PageInfo<SurveyFormBoundaryViewRouteArgs> page =
      _i7.PageInfo<SurveyFormBoundaryViewRouteArgs>(name);
}

class SurveyFormBoundaryViewRouteArgs {
  const SurveyFormBoundaryViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyFormBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.SurveyFormPreviewPage]
class SurveyFormPreviewRoute
    extends _i7.PageRouteInfo<SurveyFormPreviewRouteArgs> {
  SurveyFormPreviewRoute({
    _i8.Key? key,
    _i10.SurveyFormLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormPreviewRoute.name,
          args: SurveyFormPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormPreviewRoute';

  static const _i7.PageInfo<SurveyFormPreviewRouteArgs> page =
      _i7.PageInfo<SurveyFormPreviewRouteArgs>(name);
}

class SurveyFormPreviewRouteArgs {
  const SurveyFormPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyFormPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.SurveyFormViewPage]
class SurveyFormViewRoute extends _i7.PageRouteInfo<SurveyFormViewRouteArgs> {
  SurveyFormViewRoute({
    _i8.Key? key,
    _i10.SurveyFormLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormViewRoute.name,
          args: SurveyFormViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormViewRoute';

  static const _i7.PageInfo<SurveyFormViewRouteArgs> page =
      _i7.PageInfo<SurveyFormViewRouteArgs>(name);
}

class SurveyFormViewRouteArgs {
  const SurveyFormViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyFormViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.SurveyFormWrapperPage]
class SurveyFormWrapperRoute
    extends _i7.PageRouteInfo<SurveyFormWrapperRouteArgs> {
  SurveyFormWrapperRoute({
    _i8.Key? key,
    bool isEditing = false,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormWrapperRoute.name,
          args: SurveyFormWrapperRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormWrapperRoute';

  static const _i7.PageInfo<SurveyFormWrapperRouteArgs> page =
      _i7.PageInfo<SurveyFormWrapperRouteArgs>(name);
}

class SurveyFormWrapperRouteArgs {
  const SurveyFormWrapperRouteArgs({
    this.key,
    this.isEditing = false,
  });

  final _i8.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'SurveyFormWrapperRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i6.SurveyformPage]
class SurveyformRoute extends _i7.PageRouteInfo<SurveyformRouteArgs> {
  SurveyformRoute({
    _i8.Key? key,
    _i10.SurveyFormLocalization? appLocalizations,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyformRoute.name,
          args: SurveyformRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyformRoute';

  static const _i7.PageInfo<SurveyformRouteArgs> page =
      _i7.PageInfo<SurveyformRouteArgs>(name);
}

class SurveyformRouteArgs {
  const SurveyformRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i8.Key? key;

  final _i10.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyformRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
