// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:transit_post/pages/transit_post_acknowledgment.dart' as _i1;
import 'package:transit_post/pages/transit_post_record_vaccination.dart' as _i2;
import 'package:transit_post/pages/transit_post_selection.dart' as _i3;
import 'package:transit_post/pages/transit_post_wrapper.dart' as _i4;

abstract class $TransitPostRoute extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    TransitPostAcknowledgmentRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.TransitPostAcknowledgmentPage(),
      );
    },
    TransitPostRecordVaccinationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TransitPostRecordVaccinationPage(),
      );
    },
    TransitPostSelectionRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TransitPostSelectionPage(),
      );
    },
    TransitPostWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TransitPostWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.TransitPostAcknowledgmentPage]
class TransitPostAcknowledgmentRoute extends _i5.PageRouteInfo<void> {
  const TransitPostAcknowledgmentRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TransitPostAcknowledgmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostAcknowledgmentRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TransitPostRecordVaccinationPage]
class TransitPostRecordVaccinationRoute extends _i5.PageRouteInfo<void> {
  const TransitPostRecordVaccinationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TransitPostRecordVaccinationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostRecordVaccinationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TransitPostSelectionPage]
class TransitPostSelectionRoute extends _i5.PageRouteInfo<void> {
  const TransitPostSelectionRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TransitPostSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostSelectionRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TransitPostWrapperPage]
class TransitPostWrapperRoute extends _i5.PageRouteInfo<void> {
  const TransitPostWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TransitPostWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
