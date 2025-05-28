import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/localized.dart';

@RoutePage()
class FormsRenderPage extends LocalizedStatefulWidget {
  final String pageName;
  final Map<String, dynamic>? defaultValues;

  const FormsRenderPage({super.key, super.appLocalizations, @PathParam() required this.pageName, this.defaultValues,});

  @override
  State<FormsRenderPage> createState() => _FormsRenderPageState();
}

class _FormsRenderPageState extends LocalizedState<FormsRenderPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
            builder: (context, state) {
      final schemaObject = state.schema;
      if (schemaObject == null) {
        return const Center(child: CircularProgressIndicator());
      }

      final schema = schemaObject.pages[widget.pageName];

      if (schema == null) {
        return const Center(child: Text('Form not found'));
      }

      final index =
      schemaObject.pages.keys.toList().indexOf(widget.pageName);
      final showcaseKeys = <GlobalKey>[];

      return ReactiveFormBuilder(
        form: () => fb.group(
          JsonForms.getFormControls(schema, defaultValues: widget.defaultValues ?? {},),
        ),
        builder: (context, formGroup, child) => ScrollableContent(
          enableFixedDigitButton: true,
          header: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(spacer2),
                child: BackNavigationHelpHeaderWidget(
                    showBackNavigation: true,),
              ),
              SizedBox.shrink()
            ],
          ),
          footer: DigitCard(
            margin: const EdgeInsets.only(top: spacer2),
            children: [
              ReactiveFormConsumer(
                builder: (context, formGroup, child) => DigitButton(
                  label: (index) < schemaObject.pages.length - 1
                      ? localizations.translate(schema.actionLabel ?? 'Next')
                      : localizations.translate(schema.actionLabel ?? 'Submit'),
                  onPressed: () {
                    // 1. Get current page controls (keys)
                    final currentKeys = schema.properties?.keys ?? [];

                    // 2. Mark all current page controls as touched
                    for (final key in currentKeys) {
                      final control = formGroup.control(key);
                      control.markAsTouched();
                      if(control.validators.isNotEmpty && control.value == null && !control.validators.contains(Validators.required)) {
                        control.removeError('');
                        control.setValidators([]);
                        control.updateValueAndValidity();
                      }else{
                        control.updateValueAndValidity();
                      }

                    }

                    // 3. Check validity of just this page
                    final isCurrentPageValid = currentKeys.every((key) => formGroup.control(key).valid);

                    if (!isCurrentPageValid) return;

                    // 4. Proceed with value extraction and state update
                    final values = JsonForms.getFormValues(
                      formGroup,
                      schema,
                    );

                    final updatedPropertySchema = schema.copyWith(
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
                        ) ?? [],
                      ),
                    );

                    context.read<FormsBloc>().add(
                      FormsUpdateEvent(
                        schemaObject.copyWith(
                          pages: Map.fromEntries(
                            schemaObject.pages.entries.map(
                                  (entry) => MapEntry(
                                entry.key,
                                entry.key == widget.pageName
                                    ? updatedPropertySchema
                                    : entry.value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    if ((index) < schemaObject.pages.length - 1) {
                      context.router.push(FormsRenderRoute(
                        pageName: schemaObject.pages.entries
                            .elementAt(index + 1)
                            .key,
                        defaultValues: widget.defaultValues,
                      ));
                    } else {
                      // context.read<FormsBloc>().add(
                      //   FormsSubmitEvent(schemaObject),
                      // );
                      // Pop all form pages (FormsRenderRoute) and return to the caller
                      context.router.popUntil((route) {
                        return route.settings.name != FormsRenderRoute.name;
                      });
                    }
                  },
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large,
                  mainAxisSize: MainAxisSize.max,
                ),
              ),
            ],
          ),
          children: [
            DigitCard(
              margin: const EdgeInsets.symmetric(horizontal: spacer2),
              children: [
                if (schema.label != null)
                  ...[
                    Text(
                      localizations.translate(schema.label!),
                      style: Theme.of(context)
                          .digitTextTheme(context)
                          .headingXl
                          .copyWith(
                          color: Theme.of(context)
                              .colorTheme
                              .primary
                              .primary2),
                    ),
                    if(schema.description != null)
                      ...[
                        const SizedBox(height: spacer2,),
                        Text(
                        localizations.translate(schema.description!),
                        style: Theme.of(context)
                            .digitTextTheme(context)
                            .bodyS.copyWith(color: Theme.of(context).colorTheme.text.secondary),
                      ),],
                  ],
                JsonForms(
                  propertySchema: schema,
                  childrens: const [],
                  defaultValues: const {
                    // 'locality': context.boundary.code,
                  },
                )
              ],
            ),
            const SizedBox(height: spacer2,),
            Center(
              child: Text(
                'version ${schemaObject.version}.0.0',
                style: Theme.of(context).digitTextTheme(context).bodyXS.copyWith(
                    color: Theme.of(context).colorTheme.text.disabled
                ),
              ),
            )
          ],
        ),
      );
            },
            ),
    );
  }
}
