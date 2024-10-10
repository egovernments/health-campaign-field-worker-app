import 'package:flutter/material.dart';
import '../blocs/localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final ComponentLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late ComponentLocalization _localizations;

  ComponentLocalization get localizations => _localizations;

  set localizations(ComponentLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? ComponentLocalization.of(context);
    super.didChangeDependencies();
  }
}