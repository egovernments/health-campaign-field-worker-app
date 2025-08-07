// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:digit_forms_engine/blocs/app_localization.dart' as _i4;
import 'package:digit_forms_engine/pages/forms_render.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $FormsRoute extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    FormsRenderRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<FormsRenderRouteArgs>(
          orElse: () => FormsRenderRouteArgs(
                currentSchemaKey: queryParams.getString(
                  'currentSchemaKey',
                  '',
                ),
                pageName: pathParams.getString('pageName'),
                isEdit: queryParams.getBool(
                  'isEdit',
                  false,
                ),
                isView: queryParams.getBool(
                  'isView',
                  false,
                ),
                isSummary: queryParams.getBool(
                  'isSummary',
                  false,
                ),
              ));
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FormsRenderPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          currentSchemaKey: args.currentSchemaKey,
          pageName: args.pageName,
          isEdit: args.isEdit,
          isView: args.isView,
          customComponents: args.customComponents,
          defaultValues: args.defaultValues,
          isSummary: args.isSummary,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.FormsRenderPage]
class FormsRenderRoute extends _i2.PageRouteInfo<FormsRenderRouteArgs> {
  FormsRenderRoute({
    _i3.Key? key,
    _i4.FormLocalization? appLocalizations,
    String currentSchemaKey = '',
    required String pageName,
    bool isEdit = false,
    bool isView = false,
    List<Map<String, _i3.Widget>>? customComponents,
    Map<String, dynamic>? defaultValues,
    bool isSummary = false,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          FormsRenderRoute.name,
          args: FormsRenderRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            currentSchemaKey: currentSchemaKey,
            pageName: pageName,
            isEdit: isEdit,
            isView: isView,
            customComponents: customComponents,
            defaultValues: defaultValues,
            isSummary: isSummary,
          ),
          rawPathParams: {'pageName': pageName},
          rawQueryParams: {
            'currentSchemaKey': currentSchemaKey,
            'isEdit': isEdit,
            'isView': isView,
            'isSummary': isSummary,
          },
          initialChildren: children,
        );

  static const String name = 'FormsRenderRoute';

  static const _i2.PageInfo<FormsRenderRouteArgs> page =
      _i2.PageInfo<FormsRenderRouteArgs>(name);
}

class FormsRenderRouteArgs {
  const FormsRenderRouteArgs({
    this.key,
    this.appLocalizations,
    this.currentSchemaKey = '',
    required this.pageName,
    this.isEdit = false,
    this.isView = false,
    this.customComponents,
    this.defaultValues,
    this.isSummary = false,
  });

  final _i3.Key? key;

  final _i4.FormLocalization? appLocalizations;

  final String currentSchemaKey;

  final String pageName;

  final bool isEdit;

  final bool isView;

  final List<Map<String, _i3.Widget>>? customComponents;

  final Map<String, dynamic>? defaultValues;

  final bool isSummary;

  @override
  String toString() {
    return 'FormsRenderRouteArgs{key: $key, appLocalizations: $appLocalizations, currentSchemaKey: $currentSchemaKey, pageName: $pageName, isEdit: $isEdit, isView: $isView, customComponents: $customComponents, defaultValues: $defaultValues, isSummary: $isSummary}';
  }
}
