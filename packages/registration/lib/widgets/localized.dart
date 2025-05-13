import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final RegistrationDeliveryLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late RegistrationDeliveryLocalization _localizations;

  RegistrationDeliveryLocalization get localizations => _localizations;

  set localizations(RegistrationDeliveryLocalization localizations) {
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
        widget.appLocalizations ?? RegistrationDeliveryLocalization.of(context);
    super.didChangeDependencies();
  }
}
