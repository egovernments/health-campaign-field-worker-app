import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_form/survey_form.dart';

import '../router/survey_form_router.gm.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        footer: DigitCard(
            cardType: CardType.primary,
            margin: const EdgeInsets.only(top: spacer2),
            children: [
              DigitButton(
                type: DigitButtonType.primary,
                label: localizations.translate(
                  i18.common.coreCommonContinue,
                ),
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                onPressed: () => context.router.push(SurveyFormViewRoute()),
              ),
            ]),
        children: [
          DigitCard(
              margin: const EdgeInsets.all(spacer2),
              cardType: CardType.primary, children: [
            Text(
              localizations.translate(
                i18.surveyForm.surveyFormDetailLabel,
              ),
              style: textTheme.headingXl,
            ),
            LabeledField(
              label: localizations.translate(
                i18.surveyForm.surveyFormdate,
              ),
              child: DigitDateFormInput(
                readOnly: true,
                editable: false,
                initialValue: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                controller: TextEditingController(
                  text: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                ),
              ),
            ),
            LabeledField(
              label: localizations.translate(
                i18.householdLocation.administrationAreaFormLabel,
              ),
              child: DigitTextFormInput(
                readOnly: true,
                initialValue: localizations
                    .translate(SurveyFormSingleton().boundary!.code.toString()),
                controller: TextEditingController(
                  text: localizations.translate(
                      SurveyFormSingleton().boundary!.code.toString()),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
