import 'package:flutter/cupertino.dart';

import '/blocs/localization/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final ComplaintsLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late ComplaintsLocalization _localizations;

  ComplaintsLocalization get localizations => _localizations;

  set localizations(ComplaintsLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? ComplaintsLocalization.of(context);
    super.didChangeDependencies();
  }
}
