import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
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
import 'package:form_data_transformer/src/transformer_service.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';

// import '../widgets/header/back_navigation_help_header.dart';
import '../data/transformer_config.dart';
import '../router/app_router.dart';
import '../utils/utils.dart';
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
    bool _hasProcessed = false;

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
            'scanner': const CustomScanner(),
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
              footer: BlocListener<FormsBloc, FormsState>(
                listener: (context, state) async {
                  // Check if formData is updated and perform the transformation
                  if (!_hasProcessed && state is FormsSubmittedState) {
                    _hasProcessed = true;
                    final formData = state.formData;

                    // Check if formData is null or empty
                    if (formData.isEmpty) return;

                    try {
                      // Get all models as a list
                      final modelsConfig = jsonConfig['beneficiaryRegistration']
                          ?['models'] as Map<String, dynamic>;

                      final formEntityMapper =
                          FormEntityMapper(config: jsonConfig);

                      final entities = formEntityMapper.mapFormToEntities(
                        formValues: formData,
                        modelsConfig: modelsConfig,
                        context: {
                          "project": context.selectedProject,
                          "user": context.loggedInUser,
                          "tenantId": context.selectedProject.tenantId,
                          "boundary": context.boundary,
                        },
                      );

                      // You now have a list of transformed models, so you can proceed with further processing
                      for (final entity in entities) {
                        final modelType = getDataModelTypeFromModel(entity);

                        final repository = RepositoryType.getLocalForType(
                          modelType,
                          [
                            context.read<
                              LocalRepository<IndividualModel,
                                  IndividualSearchModel>>(),
                            context.read<
                                LocalRepository<HouseholdModel,
                                    HouseholdSearchModel>>(),
                            context.read<
                                LocalRepository<HouseholdMemberModel,
                                    HouseholdMemberSearchModel>>(),
                            context.read<
                                LocalRepository<ProjectBeneficiaryModel,
                                    ProjectBeneficiarySearchModel>>(),
                            ],
                        );

                        await repository.create(entity);
                      }
                    } catch (e) {
                      // Handle any errors during the mapping process
                      print('Error: $e');
                    }
                  }
                },
                child: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
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
                                                  schemaObject.pages.entries
                                                      .map(
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
                                        // When form is completed, submit form and send data to the state
                                        context.read<FormsBloc>().add(
                                              FormsSubmitEvent(
                                                schemaObject, // Pass form values to the event
                                              ),
                                            );
                                        // context.read<FormsBloc>().add(
                                        //       const FormsCreateMappingEvent(),
                                        //     );
                                      }
                                    },
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                            ))
                  ],
                ),
              ),
              children: [
                DigitCard(
                  margin: const EdgeInsets.symmetric(horizontal: spacer2),
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
