import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final ReferralReconLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late ReferralReconLocalization _localizations;

  ReferralReconLocalization get localizations => _localizations;

  set localizations(ReferralReconLocalization localizations) {
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
        widget.appLocalizations ?? ReferralReconLocalization.of(context);
    super.didChangeDependencies();
  }
}
