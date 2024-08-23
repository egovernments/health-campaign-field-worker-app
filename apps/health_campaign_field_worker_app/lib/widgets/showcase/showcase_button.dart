import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:flutter/material.dart';

import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'config/showcase_constants.dart';

class ShowcaseButton extends LocalizedStatefulWidget {
  final Iterable<GlobalKey>? showcaseFor;

  const ShowcaseButton({super.key, this.showcaseFor});

  @override
  LocalizedState<ShowcaseButton> createState() => _ShowcaseButtonState();
}

class _ShowcaseButtonState extends LocalizedState<ShowcaseButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        if (widget.showcaseFor?.isNotEmpty == true) {
          ShowcaseWidget.of(context).startShowCase(
            widget.showcaseFor!.toList(),
          );

          return;
        }

        final current = context.router.current.name;
        final paths = _showcasePathsForRoute(current);

        if (paths == null) return;
        if (paths.isEmpty) return;

        ShowcaseWidget.of(context).startShowCase(paths.toList());
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              kPadding,
              kPadding,
              kPadding / 2,
              kPadding,
            ),
            child: Text(
              AppLocalizations.of(context).translate(i18.common.coreCommonHelp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.help_outline),
        ],
      ),
    );
  }

  Iterable<GlobalKey>? _showcasePathsForRoute(String routeName) {
    switch (routeName) {
      case "ManageStocksRoute":
        return selectStockShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case "WarehouseDetailsRoute":
        return warehouseDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case "StockReconciliationRoute":
        return stockReconciliationShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );

      default:
        return null;
    }
  }
}
