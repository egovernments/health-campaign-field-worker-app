import 'package:flutter/cupertino.dart';

import '../blocs/app_localization.dart';


abstract class LocalizedStatefulWidget extends StatefulWidget {
  final AttendanceAppLocalizations? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late AttendanceAppLocalizations _localizations;

  AttendanceAppLocalizations get localizations => _localizations;

  set localizations(AttendanceAppLocalizations localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? AttendanceAppLocalizations.of(context);
    super.didChangeDependencies();
  }
}
