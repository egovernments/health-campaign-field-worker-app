import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';


abstract class LocalizedStatefulWidget extends StatefulWidget {
  final SurveyFormLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late SurveyFormLocalization _localizations;

  SurveyFormLocalization get localizations => _localizations;

  set localizations(SurveyFormLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? SurveyFormLocalization.of(context);
    super.didChangeDependencies();
  }
}
