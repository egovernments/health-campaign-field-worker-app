import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final DashboardLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late DashboardLocalization _localizations;

  DashboardLocalization get localizations => _localizations;

  set localizations(DashboardLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations =
        widget.appLocalizations ?? DashboardLocalization.of(context);
    super.didChangeDependencies();
  }
}
