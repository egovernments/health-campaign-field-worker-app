// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:collection/collection.dart' as _i5;
import 'package:digit_forms_engine/blocs/app_localization.dart' as _i4;
import 'package:digit_forms_engine/pages/forms_render.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.FormsRenderPage]
class FormsRenderRoute extends _i2.PageRouteInfo<FormsRenderRouteArgs> {
  FormsRenderRoute({
    _i3.Key? key,
    _i4.FormLocalization? appLocalizations,
    String currentSchemaKey = '',
    required String pageName,
    bool isEdit = false,
    List<Map<String, _i3.Widget>>? customComponents,
    Map<String, dynamic>? defaultValues,
    Map<String, dynamic>? navigationParams,
    bool isSummary = false,
    void Function({Map<String, dynamic>? popupData})? onSecondaryAction,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          FormsRenderRoute.name,
          args: FormsRenderRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            currentSchemaKey: currentSchemaKey,
            pageName: pageName,
            isEdit: isEdit,
            customComponents: customComponents,
            defaultValues: defaultValues,
            navigationParams: navigationParams,
            isSummary: isSummary,
            onSecondaryAction: onSecondaryAction,
          ),
          rawPathParams: {'pageName': pageName},
          rawQueryParams: {
            'currentSchemaKey': currentSchemaKey,
            'isEdit': isEdit,
            'isSummary': isSummary,
          },
          initialChildren: children,
        );

  static const String name = 'FormsRenderRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<FormsRenderRouteArgs>(
        orElse: () => FormsRenderRouteArgs(
          currentSchemaKey: queryParams.getString('currentSchemaKey', ''),
          pageName: pathParams.getString('pageName'),
          isEdit: queryParams.getBool('isEdit', false),
          isSummary: queryParams.getBool('isSummary', false),
        ),
      );
      return _i1.FormsRenderPage(
        key: args.key,
        appLocalizations: args.appLocalizations,
        currentSchemaKey: args.currentSchemaKey,
        pageName: args.pageName,
        isEdit: args.isEdit,
        customComponents: args.customComponents,
        defaultValues: args.defaultValues,
        navigationParams: args.navigationParams,
        isSummary: args.isSummary,
        onSecondaryAction: args.onSecondaryAction,
      );
    },
  );
}

class FormsRenderRouteArgs {
  const FormsRenderRouteArgs({
    this.key,
    this.appLocalizations,
    this.currentSchemaKey = '',
    required this.pageName,
    this.isEdit = false,
    this.customComponents,
    this.defaultValues,
    this.navigationParams,
    this.isSummary = false,
    this.onSecondaryAction,
  });

  final _i3.Key? key;

  final _i4.FormLocalization? appLocalizations;

  final String currentSchemaKey;

  final String pageName;

  final bool isEdit;

  final List<Map<String, _i3.Widget>>? customComponents;

  final Map<String, dynamic>? defaultValues;

  final Map<String, dynamic>? navigationParams;

  final bool isSummary;

  final void Function({Map<String, dynamic>? popupData})? onSecondaryAction;

  @override
  String toString() {
    return 'FormsRenderRouteArgs{key: $key, appLocalizations: $appLocalizations, currentSchemaKey: $currentSchemaKey, pageName: $pageName, isEdit: $isEdit, customComponents: $customComponents, defaultValues: $defaultValues, navigationParams: $navigationParams, isSummary: $isSummary, onSecondaryAction: $onSecondaryAction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FormsRenderRouteArgs) return false;
    return key == other.key &&
        appLocalizations == other.appLocalizations &&
        currentSchemaKey == other.currentSchemaKey &&
        pageName == other.pageName &&
        isEdit == other.isEdit &&
        const _i5.ListEquality().equals(
          customComponents,
          other.customComponents,
        ) &&
        const _i5.MapEquality().equals(defaultValues, other.defaultValues) &&
        const _i5.MapEquality().equals(
          navigationParams,
          other.navigationParams,
        ) &&
        isSummary == other.isSummary;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appLocalizations.hashCode ^
      currentSchemaKey.hashCode ^
      pageName.hashCode ^
      isEdit.hashCode ^
      const _i5.ListEquality().hash(customComponents) ^
      const _i5.MapEquality().hash(defaultValues) ^
      const _i5.MapEquality().hash(navigationParams) ^
      isSummary.hashCode;
}
