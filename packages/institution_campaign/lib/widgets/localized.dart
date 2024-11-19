import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final InstitutionCampaignLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late InstitutionCampaignLocalization _localizations;

  InstitutionCampaignLocalization get localizations => _localizations;

  set localizations(InstitutionCampaignLocalization localizations) {
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
        widget.appLocalizations ?? InstitutionCampaignLocalization.of(context);
    super.didChangeDependencies();
  }
}
