import 'package:auto_route/auto_route.dart';
import 'package:digit_scanner/digit_scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widgets/header/back_navigation_help_header.dart';
import '../router/app_router.dart';
import '../widgets/custom_scanner.dart';
import '../widgets/custom_text.dart';
import '../widgets/dob_picker.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/showcase/showcase_button.dart';

@RoutePage()
class FormsPage extends StatelessWidget {
  final String pageName;

  const FormsPage({super.key, @PathParam() required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          final schemaObject = state.schema;
          if (schemaObject == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final schema = schemaObject.pages[pageName];

          if (schema == null) {
            return const Center(child: Text('Form not found'));
          }

          final index = schemaObject.pages.keys.toList().indexOf(pageName);
          final showcaseKeys = <GlobalKey>[];
          final Map<String, Widget> widgetMap = {
            'dobPicker': const DobPicker(),
            'customText': const CustomText(),
            'scanner':  const CustomScanner(),
          };
          return ReactiveFormBuilder(
            form: () => fb.group(
              JsonForms.getFormControls(schema, [widgetMap]),
            ),
            builder: (context, formGroup, child) => ScrollableContent(
              enableFixedDigitButton: true,
              header: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: BackNavigationHelpHeaderWidget(
                        showBackNavigation: true,
                        showHelp: false,
                        showcaseButton: ShowcaseButton(
                          showcaseFor: showcaseKeys.toSet().toList(),
                        )),
                  ),
                  const SizedBox.shrink()
                ],
              ),
              footer: DigitCard(
                margin: EdgeInsets.zero,
                children: [
                  ReactiveFormConsumer(
                      builder: (context, formGroup, child) => DigitButton(
                            label: (index) < schemaObject.pages.length - 1
                                ? 'Next'
                                : 'Submit',
                            onPressed: !formGroup.valid
                                ? () {}
                                : () {
                                    final values = JsonForms.getFormValues(
                                      formGroup,
                                      schema,
                                    );

                                    final updatedPropertySchema =
                                        schema.copyWith(
                                      properties: Map.fromEntries(
                                        schema.properties?.entries.map(
                                              (e) => values.containsKey(e.key)
                                                  ? MapEntry(
                                                      e.key,
                                                      e.value.copyWith(
                                                        value: values[e.key],
                                                      ),
                                                    )
                                                  : MapEntry(e.key, e.value),
                                            ) ??
                                            [],
                                      ),
                                    );

                                    context.read<FormsBloc>().add(
                                          FormsUpdateEvent(
                                            schemaObject.copyWith(
                                              pages: Map.fromEntries(
                                                schemaObject.pages.entries.map(
                                                  (entry) => MapEntry(
                                                    entry.key,
                                                    entry.key == pageName
                                                        ? updatedPropertySchema
                                                        : entry.value,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );

                                    if ((index) <
                                        schemaObject.pages.length - 1) {
                                      context.router.push(FormsRoute(
                                        pageName: schemaObject.pages.entries
                                            .elementAt(index + 1)
                                            .key,
                                      ));
                                    } else {
                                      context.read<FormsBloc>().add(
                                            const FormsCreateMappingEvent(),
                                          );
                                    }
                                  },
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                          ))
                ],
              ),
              children: [
                DigitCard(
                  margin: const EdgeInsets.all(spacer2),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (schema.label != null)
                          Text(
                            schema.label!,
                            style: Theme.of(context)
                                .digitTextTheme(context)
                                .headingXl
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorTheme
                                        .primary
                                        .primary2),
                          ),
                        JsonForms(
                          propertySchema: schema,
                          childrens: [widgetMap],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
