import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';


abstract class LocalizedStatefulWidget extends StatefulWidget {
  final AttendanceLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late AttendanceLocalization _localizations;

  AttendanceLocalization get localizations => _localizations;

  set localizations(AttendanceLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? AttendanceLocalization.of(context);
    super.didChangeDependencies();
  }
}
