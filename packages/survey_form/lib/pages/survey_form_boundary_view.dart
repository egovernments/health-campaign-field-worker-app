import 'package:auto_route/auto_route.dart';
import 'package:survey_form/survey_form.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_text_field.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../router/survey_form_router.gm.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class SurveyFormBoundaryViewPage extends LocalizedStatefulWidget {
  const SurveyFormBoundaryViewPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<SurveyFormBoundaryViewPage> createState() =>
      SurveyFormBoundaryViewPageState();
}

class SurveyFormBoundaryViewPageState
    extends State<SurveyFormBoundaryViewPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = SurveyFormLocalization.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        footer: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => context.router.push(SurveyFormViewRoute()),
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
                    i18.surveyForm.surveyFormDetailLabel,
                  ),
                  style: theme.textTheme.displayMedium,
                ),
                DigitTextField(
                  readOnly: true,
                  label: localizations.translate(
                    i18.surveyForm.surveyFormdate,
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
                        .translate(SurveyFormSingleton().boundary!.code.toString()),
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
