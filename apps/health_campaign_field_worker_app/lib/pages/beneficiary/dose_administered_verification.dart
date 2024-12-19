import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/details_card.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../router/app_router.dart';
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

@RoutePage()
class DoseAdministeredVerificationPage extends LocalizedStatefulWidget {
  final IndividualModel? selectedIndividual;
  final HouseholdModel householdModel;
  const DoseAdministeredVerificationPage({
    required this.householdModel,
    required this.selectedIndividual,
    super.key,
    super.appLocalizations,
  });

  @override
  State<DoseAdministeredVerificationPage> createState() =>
      _DoseAdministeredVerificationPageState();
}

class _DoseAdministeredVerificationPageState
    extends LocalizedState<DoseAdministeredVerificationPage> {
  List<String> informationBullets = [
    i18.deliverIntervention.informationBulletOne,
    i18.deliverIntervention.informationBulletTwo,
    i18.deliverIntervention.informationBulletThree,
    i18.deliverIntervention.informationBulletFour,
  ];

  final clickedStatus = ValueNotifier<bool>(false);

  @override
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    // Define a list of TableHeader objects for the header of a table

    return ProductVariantBlocWrapper(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: BlocBuilder<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            builder: (context, state) {
              var beneficiaryName =
                  ('${widget.selectedIndividual?.name?.givenName ?? "-"}'
                          " "
                          '${widget.selectedIndividual?.name?.familyName ?? "-"}')
                      .toString();

              return ReactiveFormBuilder(
                form: () => buildForm(context),
                builder: (context, form, child) => ScrollableContent(
                  enableFixedButton: true,
                  header: const Column(children: [
                    BackNavigationHelpHeaderWidget(
                      showBackNavigation: false,
                      showHelp: false,
                    ),
                  ]),
                  footer: DigitCard(
                    margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                    padding:
                        const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: ValueListenableBuilder(
                      valueListenable: clickedStatus,
                      builder: (context, bool isClicked, _) {
                        return DigitElevatedButton(
                          onPressed: isClicked
                              ? null
                              : () {
                                  form.markAllAsTouched();

                                  if (!form.valid) {
                                    return;
                                  } else {
                                    context
                                        .read<SearchBlocWrapper>()
                                        .searchHouseholdsBloc
                                        .add(
                                          SearchHouseholdsEvent
                                              .searchByHousehold(
                                            householdModel:
                                                widget.householdModel,
                                            projectId:
                                                RegistrationDeliverySingleton()
                                                    .projectId!,
                                            isProximityEnabled: false,
                                          ),
                                        );
                                    context.router.popAndPush(
                                        CustomBeneficiaryAcknowledgementRoute(
                                            enableViewHousehold: true));
                                  }
                                },
                          child: Center(
                            child: Text(
                              localizations
                                  .translate(i18.common.coreCommonNext),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  children: [
                    DigitCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kPadding),
                            child: Text(
                              localizations.translate(
                                i18.deliverIntervention.wasTheDoseAdministered,
                              ),
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _buildTextRow(
                                "1. ${localizations.translate(
                                  i18.deliverIntervention.doseGivenCareGiver,
                                )}",
                                // hardcoded the value here as per the text requirement
                                {Constants.curlyBraces: Constants.intTwo},
                                theme,
                              ),
                              _buildTextRow(
                                ("2. ${localizations.translate(
                                  i18.deliverIntervention
                                      .infoWrittenInChildCard,
                                )}"),
                                {
                                  Constants.curlyBraces: beneficiaryName,
                                },
                                theme,
                              ),
                              _buildTextRow(
                                "3. ${localizations.translate(
                                  i18.deliverIntervention.healthTalkGivenOnSPAQ,
                                )}",
                                {},
                                theme,
                              ),
                              ...getbulletPoints(informationBullets, theme),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextRow(
    String text,
    Map<String, String> replacements,
    ThemeData theme,
  ) {
    List<TextSpan> textSpans = _createTextSpans(text, replacements, theme);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kPadding,
        kPadding * 2,
        kPadding,
        kPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontStyle: theme.textTheme.bodyLarge!.fontStyle,
                      fontWeight: theme.textTheme.bodyLarge!.fontWeight,
                      letterSpacing: theme.textTheme.bodyLarge!.letterSpacing,
                      fontSize: 18,
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                    children: textSpans,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<TextSpan> _createTextSpans(
    String text,
    Map<String, String> replacements,
    ThemeData theme,
  ) {
    final spans = <TextSpan>[];
    int start = 0;

    while (start < text.length) {
      int minIndex = text.length;
      String? foundPlaceholder;

      // Find the next placeholder in the text
      for (final placeholder in replacements.keys) {
        final index = text.indexOf(placeholder, start);
        if (index != -1 && index < minIndex) {
          minIndex = index;
          foundPlaceholder = placeholder;
        }
      }

      if (foundPlaceholder != null) {
        final placeholderIndex = text.indexOf(foundPlaceholder, start);

        // Add text before the placeholder
        if (placeholderIndex > start) {
          spans.add(TextSpan(text: text.substring(start, placeholderIndex)));
        }

        // Add the replacement text with styling
        spans.add(TextSpan(
          text: replacements[foundPlaceholder],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));

        // Update the start index
        start = placeholderIndex + foundPlaceholder.length;
      } else {
        // No more placeholders, add the rest of the text
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
    }

    return spans;
  }

// Info : return information bullet points
  List<Widget> getbulletPoints(
      List<String> informationBullets, ThemeData theme) {
    return informationBullets
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(kPadding * 2.5, 0, 0, 0),
              child: _buildTextRow(localizations.translate(e), {}, theme),
            ))
        .toList();
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{});
  }
}
