// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:delivery/blocs/app_localization.dart' as _i21;
import 'package:delivery/blocs/search_households/search_households.dart'
    as _i24;
import 'package:delivery/models/entities/task.dart' as _i26;
import 'package:delivery/pages/beneficiary/beneficiary_checklist.dart' as _i1;
import 'package:delivery/pages/beneficiary/beneficiary_details.dart' as _i3;
import 'package:delivery/pages/beneficiary/beneficiary_wrapper.dart' as _i5;
import 'package:delivery/pages/beneficiary/deliver_intervention.dart' as _i4;
import 'package:delivery/pages/beneficiary/delivery_summary_page.dart' as _i6;
import 'package:delivery/pages/beneficiary/dose_administered.dart' as _i8;
import 'package:delivery/pages/beneficiary/facility_selection.dart' as _i9;
import 'package:delivery/pages/beneficiary/household_overview.dart' as _i11;
import 'package:delivery/pages/beneficiary/record_past_delivery_details.dart'
    as _i12;
import 'package:delivery/pages/beneficiary/refer_beneficiary.dart' as _i13;
import 'package:delivery/pages/beneficiary/refused_delivery.dart' as _i14;
import 'package:delivery/pages/beneficiary/side_effects.dart' as _i16;
import 'package:delivery/pages/beneficiary/widgets/household_acknowledgement_delivery.dart'
    as _i10;
import 'package:delivery/pages/beneficiary/widgets/splash_acknowledgement.dart'
    as _i17;
import 'package:delivery/pages/beneficiary_delivery/beneficiary_delivery_wrapper.dart'
    as _i2;
import 'package:delivery/pages/delivery_wrapper.dart' as _i7;
import 'package:delivery/pages/search_beneficiary.dart' as _i15;
import 'package:delivery/pages/summary_page.dart' as _i18;
import 'package:digit_data_model/data_model.dart' as _i25;
import 'package:flutter/foundation.dart' as _i20;
import 'package:flutter/material.dart' as _i22;
import 'package:registration/blocs/beneficiary_registration/beneficiary_registration.dart'
    as _i23;

abstract class $DeliveryRoute extends _i19.AutoRouterModule {
  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    BeneficiaryChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryChecklistRouteArgs>(
          orElse: () => const BeneficiaryChecklistRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BeneficiaryChecklistPage(
          key: args.key,
          beneficiaryClientRefId: args.beneficiaryClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryDeliveryWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDeliveryWrapperRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i2.BeneficiaryDeliveryWrapperPage(
          key: args.key,
          initialState: args.initialState,
        )),
      );
    },
    BeneficiaryDetailsDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDetailsDeliveryRouteArgs>(
          orElse: () => const BeneficiaryDetailsDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BeneficiaryDetailsDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverInterventionRouteArgs>(
          orElse: () => const DeliverInterventionRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    DeliveryBeneficiaryWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryBeneficiaryWrapperRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeliveryBeneficiaryWrapperPage(
          key: args.key,
          wrapper: args.wrapper,
          isEditing: args.isEditing,
        ),
      );
    },
    DeliverySummaryRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverySummaryRouteArgs>(
          orElse: () => const DeliverySummaryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeliverySummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DeliveryWrapperRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DeliveryWrapperPage(),
      );
    },
    DoseAdministeredRoute.name: (routeData) {
      final args = routeData.argsAs<DoseAdministeredRouteArgs>(
          orElse: () => const DoseAdministeredRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DoseAdministeredPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    FacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<FacilitySelectionRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.FacilitySelectionPage(
          key: args.key,
          facilities: args.facilities,
        ),
      );
    },
    HouseholdAcknowledgementDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementDeliveryRouteArgs>(
          orElse: () => const HouseholdAcknowledgementDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.HouseholdAcknowledgementDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    HouseholdOverviewDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewDeliveryRouteArgs>(
          orElse: () => const HouseholdOverviewDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.HouseholdOverviewDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    RecordPastDeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordPastDeliveryDetailsRouteArgs>(
          orElse: () => const RecordPastDeliveryDetailsRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RecordPastDeliveryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
        ),
      );
    },
    ReferBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReferBeneficiaryRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ReferBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          projectBeneficiaryClientRefId: args.projectBeneficiaryClientRefId,
        ),
      );
    },
    RefusedDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<RefusedDeliveryRouteArgs>(
          orElse: () => const RefusedDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.RefusedDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SearchBeneficiaryDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryDeliveryRouteArgs>(
          orElse: () => const SearchBeneficiaryDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SearchBeneficiaryDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SideEffectsRoute.name: (routeData) {
      final args = routeData.argsAs<SideEffectsRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.SideEffectsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
          isEditing: args.isEditing,
        ),
      );
    },
    SplashAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<SplashAcknowledgementRouteArgs>(
          orElse: () => const SplashAcknowledgementRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.SplashAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableBackToSearch: args.enableBackToSearch,
        ),
      );
    },
    SummaryDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryDeliveryRouteArgs>(
          orElse: () => const SummaryDeliveryRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.SummaryDeliveryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BeneficiaryChecklistPage]
class BeneficiaryChecklistRoute
    extends _i19.PageRouteInfo<BeneficiaryChecklistRouteArgs> {
  BeneficiaryChecklistRoute({
    _i20.Key? key,
    String? beneficiaryClientRefId,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          BeneficiaryChecklistRoute.name,
          args: BeneficiaryChecklistRouteArgs(
            key: key,
            beneficiaryClientRefId: beneficiaryClientRefId,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryChecklistRoute';

  static const _i19.PageInfo<BeneficiaryChecklistRouteArgs> page =
      _i19.PageInfo<BeneficiaryChecklistRouteArgs>(name);
}

class BeneficiaryChecklistRouteArgs {
  const BeneficiaryChecklistRouteArgs({
    this.key,
    this.beneficiaryClientRefId,
    this.appLocalizations,
  });

  final _i20.Key? key;

  final String? beneficiaryClientRefId;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryChecklistRouteArgs{key: $key, beneficiaryClientRefId: $beneficiaryClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.BeneficiaryDeliveryWrapperPage]
class BeneficiaryDeliveryWrapperRoute
    extends _i19.PageRouteInfo<BeneficiaryDeliveryWrapperRouteArgs> {
  BeneficiaryDeliveryWrapperRoute({
    _i22.Key? key,
    required _i23.BeneficiaryRegistrationState initialState,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          BeneficiaryDeliveryWrapperRoute.name,
          args: BeneficiaryDeliveryWrapperRouteArgs(
            key: key,
            initialState: initialState,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDeliveryWrapperRoute';

  static const _i19.PageInfo<BeneficiaryDeliveryWrapperRouteArgs> page =
      _i19.PageInfo<BeneficiaryDeliveryWrapperRouteArgs>(name);
}

class BeneficiaryDeliveryWrapperRouteArgs {
  const BeneficiaryDeliveryWrapperRouteArgs({
    this.key,
    required this.initialState,
  });

  final _i22.Key? key;

  final _i23.BeneficiaryRegistrationState initialState;

  @override
  String toString() {
    return 'BeneficiaryDeliveryWrapperRouteArgs{key: $key, initialState: $initialState}';
  }
}

/// generated route for
/// [_i3.BeneficiaryDetailsDeliveryPage]
class BeneficiaryDetailsDeliveryRoute
    extends _i19.PageRouteInfo<BeneficiaryDetailsDeliveryRouteArgs> {
  BeneficiaryDetailsDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          BeneficiaryDetailsDeliveryRoute.name,
          args: BeneficiaryDetailsDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDetailsDeliveryRoute';

  static const _i19.PageInfo<BeneficiaryDetailsDeliveryRouteArgs> page =
      _i19.PageInfo<BeneficiaryDetailsDeliveryRouteArgs>(name);
}

class BeneficiaryDetailsDeliveryRouteArgs {
  const BeneficiaryDetailsDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryDetailsDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.DeliverInterventionPage]
class DeliverInterventionRoute
    extends _i19.PageRouteInfo<DeliverInterventionRouteArgs> {
  DeliverInterventionRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    bool isEditing = false,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DeliverInterventionRoute.name,
          args: DeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliverInterventionRoute';

  static const _i19.PageInfo<DeliverInterventionRouteArgs> page =
      _i19.PageInfo<DeliverInterventionRouteArgs>(name);
}

class DeliverInterventionRouteArgs {
  const DeliverInterventionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'DeliverInterventionRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i5.DeliveryBeneficiaryWrapperPage]
class DeliveryBeneficiaryWrapperRoute
    extends _i19.PageRouteInfo<DeliveryBeneficiaryWrapperRouteArgs> {
  DeliveryBeneficiaryWrapperRoute({
    _i22.Key? key,
    required _i24.HouseholdMemberDeliveryWrapper wrapper,
    bool isEditing = false,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DeliveryBeneficiaryWrapperRoute.name,
          args: DeliveryBeneficiaryWrapperRouteArgs(
            key: key,
            wrapper: wrapper,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliveryBeneficiaryWrapperRoute';

  static const _i19.PageInfo<DeliveryBeneficiaryWrapperRouteArgs> page =
      _i19.PageInfo<DeliveryBeneficiaryWrapperRouteArgs>(name);
}

class DeliveryBeneficiaryWrapperRouteArgs {
  const DeliveryBeneficiaryWrapperRouteArgs({
    this.key,
    required this.wrapper,
    this.isEditing = false,
  });

  final _i22.Key? key;

  final _i24.HouseholdMemberDeliveryWrapper wrapper;

  final bool isEditing;

  @override
  String toString() {
    return 'DeliveryBeneficiaryWrapperRouteArgs{key: $key, wrapper: $wrapper, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i6.DeliverySummaryPage]
class DeliverySummaryRoute
    extends _i19.PageRouteInfo<DeliverySummaryRouteArgs> {
  DeliverySummaryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DeliverySummaryRoute.name,
          args: DeliverySummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliverySummaryRoute';

  static const _i19.PageInfo<DeliverySummaryRouteArgs> page =
      _i19.PageInfo<DeliverySummaryRouteArgs>(name);
}

class DeliverySummaryRouteArgs {
  const DeliverySummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'DeliverySummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.DeliveryWrapperPage]
class DeliveryWrapperRoute extends _i19.PageRouteInfo<void> {
  const DeliveryWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DeliveryWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryWrapperRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DoseAdministeredPage]
class DoseAdministeredRoute
    extends _i19.PageRouteInfo<DoseAdministeredRouteArgs> {
  DoseAdministeredRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DoseAdministeredRoute.name,
          args: DoseAdministeredRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DoseAdministeredRoute';

  static const _i19.PageInfo<DoseAdministeredRouteArgs> page =
      _i19.PageInfo<DoseAdministeredRouteArgs>(name);
}

class DoseAdministeredRouteArgs {
  const DoseAdministeredRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'DoseAdministeredRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i9.FacilitySelectionPage]
class FacilitySelectionRoute
    extends _i19.PageRouteInfo<FacilitySelectionRouteArgs> {
  FacilitySelectionRoute({
    _i22.Key? key,
    required List<_i25.FacilityModel> facilities,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          FacilitySelectionRoute.name,
          args: FacilitySelectionRouteArgs(
            key: key,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'FacilitySelectionRoute';

  static const _i19.PageInfo<FacilitySelectionRouteArgs> page =
      _i19.PageInfo<FacilitySelectionRouteArgs>(name);
}

class FacilitySelectionRouteArgs {
  const FacilitySelectionRouteArgs({
    this.key,
    required this.facilities,
  });

  final _i22.Key? key;

  final List<_i25.FacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [_i10.HouseholdAcknowledgementDeliveryPage]
class HouseholdAcknowledgementDeliveryRoute
    extends _i19.PageRouteInfo<HouseholdAcknowledgementDeliveryRouteArgs> {
  HouseholdAcknowledgementDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          HouseholdAcknowledgementDeliveryRoute.name,
          args: HouseholdAcknowledgementDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdAcknowledgementDeliveryRoute';

  static const _i19.PageInfo<HouseholdAcknowledgementDeliveryRouteArgs> page =
      _i19.PageInfo<HouseholdAcknowledgementDeliveryRouteArgs>(name);
}

class HouseholdAcknowledgementDeliveryRouteArgs {
  const HouseholdAcknowledgementDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'HouseholdAcknowledgementDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [_i11.HouseholdOverviewDeliveryPage]
class HouseholdOverviewDeliveryRoute
    extends _i19.PageRouteInfo<HouseholdOverviewDeliveryRouteArgs> {
  HouseholdOverviewDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          HouseholdOverviewDeliveryRoute.name,
          args: HouseholdOverviewDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdOverviewDeliveryRoute';

  static const _i19.PageInfo<HouseholdOverviewDeliveryRouteArgs> page =
      _i19.PageInfo<HouseholdOverviewDeliveryRouteArgs>(name);
}

class HouseholdOverviewDeliveryRouteArgs {
  const HouseholdOverviewDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i12.RecordPastDeliveryDetailsPage]
class RecordPastDeliveryDetailsRoute
    extends _i19.PageRouteInfo<RecordPastDeliveryDetailsRouteArgs> {
  RecordPastDeliveryDetailsRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i26.TaskModel>? tasks,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          RecordPastDeliveryDetailsRoute.name,
          args: RecordPastDeliveryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordPastDeliveryDetailsRoute';

  static const _i19.PageInfo<RecordPastDeliveryDetailsRouteArgs> page =
      _i19.PageInfo<RecordPastDeliveryDetailsRouteArgs>(name);
}

class RecordPastDeliveryDetailsRouteArgs {
  const RecordPastDeliveryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.tasks,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final List<_i26.TaskModel>? tasks;

  @override
  String toString() {
    return 'RecordPastDeliveryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks}';
  }
}

/// generated route for
/// [_i13.ReferBeneficiaryPage]
class ReferBeneficiaryRoute
    extends _i19.PageRouteInfo<ReferBeneficiaryRouteArgs> {
  ReferBeneficiaryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    bool isEditing = false,
    required String projectBeneficiaryClientRefId,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ReferBeneficiaryRoute.name,
          args: ReferBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            projectBeneficiaryClientRefId: projectBeneficiaryClientRefId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferBeneficiaryRoute';

  static const _i19.PageInfo<ReferBeneficiaryRouteArgs> page =
      _i19.PageInfo<ReferBeneficiaryRouteArgs>(name);
}

class ReferBeneficiaryRouteArgs {
  const ReferBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    required this.projectBeneficiaryClientRefId,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final bool isEditing;

  final String projectBeneficiaryClientRefId;

  @override
  String toString() {
    return 'ReferBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, projectBeneficiaryClientRefId: $projectBeneficiaryClientRefId}';
  }
}

/// generated route for
/// [_i14.RefusedDeliveryPage]
class RefusedDeliveryRoute
    extends _i19.PageRouteInfo<RefusedDeliveryRouteArgs> {
  RefusedDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          RefusedDeliveryRoute.name,
          args: RefusedDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'RefusedDeliveryRoute';

  static const _i19.PageInfo<RefusedDeliveryRouteArgs> page =
      _i19.PageInfo<RefusedDeliveryRouteArgs>(name);
}

class RefusedDeliveryRouteArgs {
  const RefusedDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'RefusedDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i15.SearchBeneficiaryDeliveryPage]
class SearchBeneficiaryDeliveryRoute
    extends _i19.PageRouteInfo<SearchBeneficiaryDeliveryRouteArgs> {
  SearchBeneficiaryDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SearchBeneficiaryDeliveryRoute.name,
          args: SearchBeneficiaryDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBeneficiaryDeliveryRoute';

  static const _i19.PageInfo<SearchBeneficiaryDeliveryRouteArgs> page =
      _i19.PageInfo<SearchBeneficiaryDeliveryRouteArgs>(name);
}

class SearchBeneficiaryDeliveryRouteArgs {
  const SearchBeneficiaryDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SearchBeneficiaryDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i16.SideEffectsPage]
class SideEffectsRoute extends _i19.PageRouteInfo<SideEffectsRouteArgs> {
  SideEffectsRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    required List<_i26.TaskModel> tasks,
    bool isEditing = false,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SideEffectsRoute.name,
          args: SideEffectsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'SideEffectsRoute';

  static const _i19.PageInfo<SideEffectsRouteArgs> page =
      _i19.PageInfo<SideEffectsRouteArgs>(name);
}

class SideEffectsRouteArgs {
  const SideEffectsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.tasks,
    this.isEditing = false,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final List<_i26.TaskModel> tasks;

  final bool isEditing;

  @override
  String toString() {
    return 'SideEffectsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i17.SplashAcknowledgementPage]
class SplashAcknowledgementRoute
    extends _i19.PageRouteInfo<SplashAcknowledgementRouteArgs> {
  SplashAcknowledgementRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    bool? enableBackToSearch,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SplashAcknowledgementRoute.name,
          args: SplashAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableBackToSearch: enableBackToSearch,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashAcknowledgementRoute';

  static const _i19.PageInfo<SplashAcknowledgementRouteArgs> page =
      _i19.PageInfo<SplashAcknowledgementRouteArgs>(name);
}

class SplashAcknowledgementRouteArgs {
  const SplashAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableBackToSearch,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  final bool? enableBackToSearch;

  @override
  String toString() {
    return 'SplashAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableBackToSearch: $enableBackToSearch}';
  }
}

/// generated route for
/// [_i18.SummaryDeliveryPage]
class SummaryDeliveryRoute
    extends _i19.PageRouteInfo<SummaryDeliveryRouteArgs> {
  SummaryDeliveryRoute({
    _i22.Key? key,
    _i21.DeliveryLocalization? appLocalizations,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SummaryDeliveryRoute.name,
          args: SummaryDeliveryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryDeliveryRoute';

  static const _i19.PageInfo<SummaryDeliveryRouteArgs> page =
      _i19.PageInfo<SummaryDeliveryRouteArgs>(name);
}

class SummaryDeliveryRouteArgs {
  const SummaryDeliveryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i22.Key? key;

  final _i21.DeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'SummaryDeliveryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
