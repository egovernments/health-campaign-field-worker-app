import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';


abstract class LocalizedStatefulWidget extends StatefulWidget {
  final ChecklistLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late ChecklistLocalization _localizations;

  ChecklistLocalization get localizations => _localizations;

  set localizations(ChecklistLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? ChecklistLocalization.of(context);
    super.didChangeDependencies();
  }
}
