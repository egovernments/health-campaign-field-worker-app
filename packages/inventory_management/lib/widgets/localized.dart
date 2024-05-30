import 'package:flutter/material.dart';

import '../blocs/app_localization.dart';


abstract class LocalizedStatefulWidget extends StatefulWidget {
  final InventoryLocalization? appLocalizations;

  const LocalizedStatefulWidget({
    super.key,
    this.appLocalizations,
  });
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late InventoryLocalization _localizations;

  InventoryLocalization get localizations => _localizations;

  set localizations(InventoryLocalization localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? InventoryLocalization.of(context);
    super.didChangeDependencies();
  }
}
