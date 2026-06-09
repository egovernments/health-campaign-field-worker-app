// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:collection/collection.dart' as _i10;
import 'package:flutter/material.dart' as _i8;
import 'package:survey_form/blocs/app_localization.dart' as _i9;
import 'package:survey_form/pages/acknowledgement.dart' as _i1;
import 'package:survey_form/pages/survey_form.dart' as _i6;
import 'package:survey_form/pages/survey_form_boundary_view.dart' as _i2;
import 'package:survey_form/pages/survey_form_preview.dart' as _i3;
import 'package:survey_form/pages/survey_form_view.dart' as _i4;
import 'package:survey_form/pages/survey_form_wrapper.dart' as _i5;
import 'package:survey_form/survey_form.dart' as _i11;

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

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyFormAcknowledgementRouteArgs>(
        orElse: () => const SurveyFormAcknowledgementRouteArgs(),
      );
      return _i1.SurveyFormAcknowledgementPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        isDataRecordSuccess: args.isDataRecordSuccess,
        label: args.label,
        description: args.description,
        descriptionTableData: args.descriptionTableData,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyFormAcknowledgementRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        isDataRecordSuccess == other.isDataRecordSuccess &&
        label == other.label &&
        description == other.description &&
        const _i10.MapEquality<String, dynamic>().equals(
          descriptionTableData,
          other.descriptionTableData,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      isDataRecordSuccess.hashCode ^
      label.hashCode ^
      description.hashCode ^
      const _i10.MapEquality<String, dynamic>().hash(descriptionTableData);
}

/// generated route for
/// [_i2.SurveyFormBoundaryViewPage]
class SurveyFormBoundaryViewRoute
    extends _i7.PageRouteInfo<SurveyFormBoundaryViewRouteArgs> {
  SurveyFormBoundaryViewRoute({
    _i8.Key? key,
    _i11.SurveyFormLocalization? appLocalizations,
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

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyFormBoundaryViewRouteArgs>(
        orElse: () => const SurveyFormBoundaryViewRouteArgs(),
      );
      return _i2.SurveyFormBoundaryViewPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class SurveyFormBoundaryViewRouteArgs {
  const SurveyFormBoundaryViewRouteArgs({this.key, this.appLocalizations});

  final _i8.Key? key;

  final _i11.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyFormBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyFormBoundaryViewRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}

/// generated route for
/// [_i3.SurveyFormPreviewPage]
class SurveyFormPreviewRoute
    extends _i7.PageRouteInfo<SurveyFormPreviewRouteArgs> {
  SurveyFormPreviewRoute({
    _i8.Key? key,
    _i11.SurveyFormLocalization? appLocalizations,
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

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyFormPreviewRouteArgs>(
        orElse: () => const SurveyFormPreviewRouteArgs(),
      );
      return _i3.SurveyFormPreviewPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class SurveyFormPreviewRouteArgs {
  const SurveyFormPreviewRouteArgs({this.key, this.appLocalizations});

  final _i8.Key? key;

  final _i11.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyFormPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyFormPreviewRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}

/// generated route for
/// [_i4.SurveyFormViewPage]
class SurveyFormViewRoute extends _i7.PageRouteInfo<SurveyFormViewRouteArgs> {
  SurveyFormViewRoute({
    _i8.Key? key,
    _i11.SurveyFormLocalization? appLocalizations,
    bool hideFooter = false,
    bool hideHeader = false,
    bool hideBackAlert = false,
    String? checklistType,
    bool useScaffold = true,
    DateTime? age,
    String? gender,
    bool isChild = false,
    _i11.ServiceModel? initialService,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SurveyFormViewRoute.name,
          args: SurveyFormViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            hideFooter: hideFooter,
            hideHeader: hideHeader,
            hideBackAlert: hideBackAlert,
            checklistType: checklistType,
            useScaffold: useScaffold,
            age: age,
            gender: gender,
            isChild: isChild,
            initialService: initialService,
          ),
          initialChildren: children,
        );

  static const String name = 'SurveyFormViewRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyFormViewRouteArgs>(
        orElse: () => const SurveyFormViewRouteArgs(),
      );
      return _i4.SurveyFormViewPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        hideFooter: args.hideFooter,
        hideHeader: args.hideHeader,
        hideBackAlert: args.hideBackAlert,
        checklistType: args.checklistType,
        useScaffold: args.useScaffold,
        age: args.age,
        gender: args.gender,
        isChild: args.isChild,
        initialService: args.initialService,
      );
    },
  );
}

class SurveyFormViewRouteArgs {
  const SurveyFormViewRouteArgs({
    this.key,
    this.appLocalizations,
    this.hideFooter = false,
    this.hideHeader = false,
    this.hideBackAlert = false,
    this.checklistType,
    this.useScaffold = true,
    this.age,
    this.gender,
    this.isChild = false,
    this.initialService,
  });

  final _i8.Key? key;

  final _i11.SurveyFormLocalization? appLocalizations;

  final bool hideFooter;

  final bool hideHeader;

  final bool hideBackAlert;

  final String? checklistType;

  final bool useScaffold;

  final DateTime? age;

  final String? gender;

  final bool isChild;

  final _i11.ServiceModel? initialService;

  @override
  String toString() {
    return 'SurveyFormViewRouteArgs{key: $key, appLocalizations: $appLocalizations, hideFooter: $hideFooter, hideHeader: $hideHeader, hideBackAlert: $hideBackAlert, checklistType: $checklistType, useScaffold: $useScaffold, age: $age, gender: $gender, isChild: $isChild, initialService: $initialService}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyFormViewRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        hideFooter == other.hideFooter &&
        hideHeader == other.hideHeader &&
        hideBackAlert == other.hideBackAlert &&
        checklistType == other.checklistType &&
        useScaffold == other.useScaffold &&
        age == other.age &&
        gender == other.gender &&
        isChild == other.isChild &&
        initialService == other.initialService;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      hideFooter.hashCode ^
      hideHeader.hashCode ^
      hideBackAlert.hashCode ^
      checklistType.hashCode ^
      useScaffold.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      isChild.hashCode ^
      initialService.hashCode;
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
          args: SurveyFormWrapperRouteArgs(key: key, isEditing: isEditing),
          initialChildren: children,
        );

  static const String name = 'SurveyFormWrapperRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyFormWrapperRouteArgs>(
        orElse: () => const SurveyFormWrapperRouteArgs(),
      );
      return _i5.SurveyFormWrapperPage(
        key: args.key,
        isEditing: args.isEditing,
      );
    },
  );
}

class SurveyFormWrapperRouteArgs {
  const SurveyFormWrapperRouteArgs({this.key, this.isEditing = false});

  final _i8.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'SurveyFormWrapperRouteArgs{key: $key, isEditing: $isEditing}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyFormWrapperRouteArgs) return false;
    return key == other.key && isEditing == other.isEditing;
  }

  @override
  int get hashCode => key.hashCode ^ isEditing.hashCode;
}

/// generated route for
/// [_i6.SurveyformPage]
class SurveyformRoute extends _i7.PageRouteInfo<SurveyformRouteArgs> {
  SurveyformRoute({
    _i8.Key? key,
    _i11.SurveyFormLocalization? appLocalizations,
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

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyformRouteArgs>(
        orElse: () => const SurveyformRouteArgs(),
      );
      return _i6.SurveyformPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
      );
    },
  );
}

class SurveyformRouteArgs {
  const SurveyformRouteArgs({this.key, this.appLocalizations});

  final _i8.Key? key;

  final _i11.SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'SurveyformRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyformRouteArgs) return false;
    return key == other.key && appLocalizations == other.appLocalizations;
  }

  @override
  int get hashCode => key.hashCode ^ appLocalizations.hashCode;
}
