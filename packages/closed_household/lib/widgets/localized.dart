import 'package:flutter/material.dart';
import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final ClosedHouseholdLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late ClosedHouseholdLocalization _localizations;

  ClosedHouseholdLocalization get localizations => _localizations;

  set localizations(ClosedHouseholdLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? ClosedHouseholdLocalization.of(context);
    super.didChangeDependencies();
  }
}
