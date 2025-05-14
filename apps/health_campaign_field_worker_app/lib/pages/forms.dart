import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_data_transformer/src/transformer_service.dart';
import '../blocs/entity_create/entity_create.dart';
import '../data/transformer_config.dart';
import '../router/app_router.dart';
import '../utils/utils.dart';
import '../widgets/custom_scanner.dart';
import '../widgets/custom_text.dart';
import '../widgets/dob_picker.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/showcase/showcase_button.dart';

@RoutePage()
class FormsPage extends LocalizedStatefulWidget {
  final String pageName;

  const FormsPage({super.key, super.appLocalizations, @PathParam() required this.pageName});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends LocalizedState<FormsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EntityCreateBloc, EntityCreateState>(

        listener: (context, state) {
          final isLastPage = context.read<FormsBloc>().state.schema?.pages.keys.last == widget.pageName;
          if (state is EntityCreatePersistedState && isLastPage) {
            context.router.push( AcknowledgementRoute(isDirectCreate:  true));
          }
        },
        child: BlocConsumer<FormsBloc, FormsState>(
      listener: (context, state) async {
        final isLastPage = state.schema?.pages.keys.last == widget.pageName;

        if ( state is FormsSubmittedState && isLastPage) {

          final formData = state.formData;
          if (formData.isEmpty) return;

          try {
            final modelsConfig = jsonConfig['beneficiaryRegistration']
            ?['models'] as Map<String, dynamic>;

            final formEntityMapper =
            FormEntityMapper(config: jsonConfig);

            final entities = formEntityMapper.mapFormToEntities(
              formValues: formData,
              modelsConfig: modelsConfig,
              context: {
                "projectId": context.selectedProject.id,
                "user": context.loggedInUser,
                "tenantId": context.selectedProject.tenantId,
                "selectedBoundaryCode": context.boundary.code, // converting in json format to match nested object value as passing model will cause issue
                'userUUID': context.loggedInUser.uuid,
              },
            );

            context.read<EntityCreateBloc>().add(
              EntityCreateEvent.create(entities: entities),
            );
            // Reset to prevent re-handling
            context.read<FormsBloc>().add(
              const FormsEvent.clearForm(), // or create a FormsResetEvent
            );
          } catch (e) {
            print('Error: $e');
          }
        }
      },
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
        final Map<String, Widget> widgetMap = {
          'dobPicker': const DobPicker(),
          'customText': const CustomText(),
          'scanner': const CustomScanner(),
        };

        return ReactiveFormBuilder(
          form: () => fb.group(
            JsonForms.getFormControls(schema, [widgetMap], defaultValues: {
            'locality': localizations.translate(context.boundary.code ?? ''),
            },),
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
              margin: const EdgeInsets.only(top: spacer2),
              children: [
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) => DigitButton(
                    label: (index) < schemaObject.pages.length - 1
                        ? localizations.translate(schema.actionLabel ?? 'Next')
                        : localizations.translate(schema.actionLabel ?? 'Submit'),
                    onPressed: !formGroup.valid
                        ? () {}
                        : () {
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
                        context.router.push(FormsRoute(
                          pageName: schemaObject.pages.entries
                              .elementAt(index + 1)
                              .key,
                        ));
                      } else {
                        context.read<FormsBloc>().add(
                          FormsSubmitEvent(schemaObject),
                        );
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
                    Text(
                      localizations.translate(schema.description!),
                      style: Theme.of(context)
                          .digitTextTheme(context)
                          .bodyS.copyWith(color: Theme.of(context).colorTheme.text.secondary),
                    ),
                  JsonForms(
                    propertySchema: schema,
                    childrens: [widgetMap],
                    defaultValues: {
                      'locality': context.boundary.code,
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
      ),
      ),
    );
  }
}
