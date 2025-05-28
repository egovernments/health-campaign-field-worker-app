import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final RegistrationLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late RegistrationLocalization _localizations;

  RegistrationLocalization get localizations => _localizations;

  set localizations(RegistrationLocalization localizations) {
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
        widget.appLocalizations ?? RegistrationLocalization.of(context);
    super.didChangeDependencies();
  }
}
