import 'package:auto_route/auto_route.dart';
import 'package:checklist/checklist.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_text_field.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../router/checklist_router.gm.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class ChecklistBoundaryViewPage extends LocalizedStatefulWidget {
  const ChecklistBoundaryViewPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistBoundaryViewPage> createState() =>
      _ChecklistBoundaryViewPageState();
}

class _ChecklistBoundaryViewPageState
    extends State<ChecklistBoundaryViewPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = ChecklistLocalization.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        footer: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => context.router.push(ChecklistViewRoute()),
            child: Text(localizations.translate(
              i18.common.coreCommonContinue,
            )),
          ),
        ),
        children: [
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localizations.translate(
                    i18.checklist.checklistDetailLabel,
                  ),
                  style: theme.textTheme.displayMedium,
                ),
                DigitTextField(
                  readOnly: true,
                  label: localizations.translate(
                    i18.checklist.checklistdate,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.date_range_outlined,
                    ),
                  ),
                  controller: TextEditingController(
                    text: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                  ),
                ),
                DigitTextField(
                  readOnly: true,
                  label: localizations.translate(
                    i18.householdLocation.administrationAreaFormLabel,
                  ),
                  controller: TextEditingController(
                    text: localizations
                        .translate(ChecklistSingleton().boundary!.code.toString()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
