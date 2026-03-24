import 'package:auto_route/auto_route.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/json_forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../widgets/localized.dart';
import '../helper/form_builder_helper.dart';
import '../helper/validator_helper.dart';
import '../models/property_schema/property_schema.dart';
import '../models/schema_object/schema_object.dart';
import '../utils/screen_protection_manager.dart';
import '../utils/utils.dart';
import '../widgets/multi_entity_tab_view.dart';

@RoutePage()
class FormsRenderPage extends LocalizedStatefulWidget {
  final String pageName;
  final Map<String, dynamic>? defaultValues;
  final String currentSchemaKey;
  final List<Map<String, Widget>>? customComponents;
  final bool isSummary;
  final bool isEdit;
  final Map<String, dynamic>? navigationParams;
  final VoidCallback? onSecondaryAction;

  const FormsRenderPage({
    super.key,
    super.appLocalizations,
    @QueryParam() this.currentSchemaKey = '',
    @PathParam() required this.pageName,
    @QueryParam() this.isEdit = false,
    this.customComponents,
    this.defaultValues,
    this.navigationParams,
    @QueryParam() this.isSummary = false,
    this.onSecondaryAction,
  });

  @override
  State<FormsRenderPage> createState() => _FormsRenderPageState();
}

class _FormsRenderPageState extends LocalizedState<FormsRenderPage> {
  bool _hasInitializedProtection = false;
  bool _isSubmitting = false;

  /// GlobalKey to access MultiEntityTabViewState for programmatic tab navigation
  final GlobalKey<MultiEntityTabViewState> _multiEntityTabKey =
      GlobalKey<MultiEntityTabViewState>();

  /// Unique identifier for this form page instance in the protection manager
  String get _protectionPageId =>
      'form_${widget.currentSchemaKey}_${widget.pageName}';

  @override
  void initState() {
    super.initState();
    // Register with protection manager with initial false state
    // Will be updated once we know the actual preventScreenCapture value from schema
    ScreenProtectionManager().registerPage(_protectionPageId, false);
  }

  @override
  void dispose() {
    // Unregister from protection manager
    ScreenProtectionManager().unregisterPage(_protectionPageId);
    super.dispose();
  }

  /// Update screen protection based on the current page's preventScreenCapture flag
  void _updateScreenProtection(bool? preventScreenCapture) {
    // Update the protection manager with the actual protection requirement
    ScreenProtectionManager()
        .updatePageProtection(_protectionPageId, preventScreenCapture == true);
    _hasInitializedProtection = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          final schemaObject = state.cachedSchemas[widget.currentSchemaKey];
          if (schemaObject == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (widget.isSummary) {
            return _buildSummaryPage(context, schemaObject);
          }

          final schema = schemaObject.pages[widget.pageName];

          // Update screen protection based on current page's preventScreenCapture flag (only once)
          if (!_hasInitializedProtection) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _updateScreenProtection(schema?.preventScreenCapture);
            });
          }

          if (schema == null) {
            return const Center(child: Text('Form not found'));
          }

          final index =
              schemaObject.pages.keys.toList().indexOf(widget.pageName);
          final showcaseKeys = <GlobalKey>[];

          // Register pages for cross-page validation
          registerPagesForValidation(
              widget.currentSchemaKey, schemaObject.pages);

          // Register navigation params for dynamic validation values
          if (widget.navigationParams != null) {
            registerNavigationParams(
                widget.currentSchemaKey, widget.navigationParams!);
          }

          // Check if this page should render as multi-entity tabs
          if (schema.multiEntityConfig != null) {
            return _buildMultiEntityTabPage(context, schema, schemaObject);
          }

          return Provider<Map<String, dynamic>>.value(
            value: widget.defaultValues ?? {},
            child: ReactiveFormBuilder(
                form: () => fb.group(
                      JsonForms.getFormControls(
                        schema,
                        defaultValues: widget.defaultValues ?? {},
                        schemaKey: widget.currentSchemaKey,
                      ),
                    ),
                builder: (context, formGroup, child) {
                  return ScrollableContent(
                    enableFixedDigitButton: true,
                    header: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(spacer2),
                          child: BackNavigationHelpHeaderWidget(
                            showBackNavigation: true,
                          ),
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
                                ? localizations
                                    .translate(schema.actionLabel ?? 'Next')
                                : localizations
                                    .translate(schema.actionLabel ?? 'Submit'),
                            onPressed: () async {
                              // Prevent multiple simultaneous submissions
                              if (_isSubmitting) return;

                              // Set flag synchronously FIRST to block rapid taps
                              _isSubmitting = true;

                              // Then update UI
                              setState(() {});

                              // Add small delay to allow custom component to update schema data
                              await Future.delayed(
                                  const Duration(milliseconds: 200));

                              // 1. Get visible keys only (skip hidden fields and fields with visibility conditions)
                              final currentKeys = schema.properties?.entries
                                      .where((entry) {
                                        final isStaticHidden =
                                            isHidden(entry.value);
                                        final includeInForm =
                                            entry.value.includeInForm == true;

                                        // Check if field is hidden by visibility condition
                                        final hasDynamicVisibility =
                                            entry.value.visibilityCondition !=
                                                null;
                                        bool isDynamicallyHidden = false;

                                        if (hasDynamicVisibility) {
                                          final formState =
                                              context.read<FormsBloc>().state;
                                          final currentPageKey =
                                              widget.pageName;
                                          final currentSchemaKey =
                                              widget.currentSchemaKey;

                                          final values =
                                              buildVisibilityEvaluationContext(
                                            currentPageKey: currentPageKey,
                                            currentForm: formGroup,
                                            pages: formState
                                                .cachedSchemas[
                                                    currentSchemaKey]!
                                                .pages,
                                            navigationParams:
                                                widget.navigationParams,
                                          );

                                          isDynamicallyHidden =
                                              !evaluateVisibilityExpression(
                                            entry.value.visibilityCondition!
                                                .expression,
                                            values,
                                          );
                                        }

                                        final isVisible = !isStaticHidden &&
                                            !isDynamicallyHidden;
                                        return isVisible || includeInForm;
                                      })
                                      .map((entry) => entry.key)
                                      // Filter out keys that don't have a corresponding form control
                                      .where((key) => formGroup.contains(key))
                                      .toList() ??
                                  [];

                              // 2. Mark all visible controls as touched and revalidate
                              for (final key in currentKeys) {
                                final control = formGroup.control(key);
                                control.markAsTouched();
                                // control.updateValueAndValidity();
                              }

                              final hasErrors = currentKeys.any((key) {
                                final control = formGroup.control(key);
                                return control.errors.isNotEmpty;
                              });

                              if (hasErrors) {
                                _isSubmitting = false;
                                setState(() {});
                                return;
                              }

                              // 3. Check validity of just the visible controls
                              final isCurrentPageValid = currentKeys
                                  .every((key) => formGroup.control(key).valid);

                              if (!isCurrentPageValid) {
                                _isSubmitting = false;
                                setState(() {});
                                return;
                              }

                              // 4. Proceed with value extraction and state update
                              final values = JsonForms.getFormValues(
                                formGroup,
                                schema,
                              );

                              // Update existing properties and add entity-specific fields
                              final updatedProperties =
                                  Map<String, PropertySchema>.from(
                                schema.properties?.map(
                                      (key, prop) => values.containsKey(key)
                                          ? MapEntry(
                                              key,
                                              prop.copyWith(
                                                value: values[key],
                                              ),
                                            )
                                          : MapEntry(key, prop),
                                    ) ??
                                    {},
                              );

                              // Add entity-specific fields (e.g., fieldName_item_0) that aren't in the schema
                              for (final entry in values.entries) {
                                if (entry.key.contains('_item_') &&
                                    !updatedProperties.containsKey(entry.key)) {
                                  // Create a minimal property schema for the entity-specific field
                                  updatedProperties[entry.key] = PropertySchema(
                                    type: PropertySchemaType.string,
                                    value: entry.value,
                                    hidden: true,
                                    // Hide from UI rendering
                                    includeInForm: true, // Include in form data
                                  );
                                }
                              }

                              final updatedPropertySchema = schema.copyWith(
                                properties: updatedProperties,
                              );

                              context.read<FormsBloc>().add(
                                    FormsUpdateEvent(
                                      schemaKey: widget.currentSchemaKey,
                                      schema: schemaObject.copyWith(
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

                              final currentPage =
                                  schemaObject.pages.entries.elementAt(index);

                              // Check submitCondition - if true, submit form directly
                              final submitCondition =
                                  currentPage.value.submitCondition;
                              if (submitCondition != null) {
                                final submitEvalContext =
                                    buildVisibilityEvaluationContext(
                                  currentPageKey: widget.pageName,
                                  currentForm: formGroup,
                                  pages: schemaObject.pages,
                                  navigationParams: widget.navigationParams,
                                );
                                // Add isEdit to context
                                submitEvalContext['isEdit'] = widget.isEdit;

                                final shouldSubmit =
                                    evaluateVisibilityExpression(
                                  submitCondition.expression,
                                  submitEvalContext,
                                );

                                if (shouldSubmit) {
                                  context.read<FormsBloc>().add(
                                      FormsSubmitEvent(
                                          isEdit: widget.isEdit,
                                          schemaKey: widget.currentSchemaKey));
                                  // Pop all form pages
                                  context.router.popUntil((route) {
                                    return route.settings.name !=
                                        FormsRenderRoute.name;
                                  });
                                  return;
                                }
                              }

                              final conditionalNavigateList =
                                  currentPage.value.conditionalNavigateTo;

                              // Evaluate conditionalNavigateTo (if present)
                              if (conditionalNavigateList != null) {
                                for (final conditionItem
                                    in conditionalNavigateList) {
                                  final condition = conditionItem.condition;
                                  final navigateTo = conditionItem.navigateTo;

                                  final formState =
                                      context.read<FormsBloc>().state;
                                  final currentPageKey = widget.pageName;

                                  final currentSchemaKey =
                                      widget.currentSchemaKey;

                                  final values =
                                      buildVisibilityEvaluationContext(
                                    currentPageKey: currentPageKey,
                                    currentForm: formGroup,
                                    pages: formState
                                        .cachedSchemas[currentSchemaKey]!.pages,
                                    navigationParams: widget.navigationParams,
                                  );

                                  // Evaluate condition - use direct isEdit check for isEdit conditions
                                  // since FormulaParser doesn't handle dot notation well
                                  bool isConditionTrue;
                                  if (condition == 'isEdit == true' ||
                                      condition ==
                                          'navigation.isEdit == true') {
                                    isConditionTrue = widget.isEdit == true;
                                  } else if (condition == 'isEdit == false' ||
                                      condition ==
                                          'navigation.isEdit == false') {
                                    isConditionTrue = widget.isEdit == false;
                                  } else {
                                    isConditionTrue = evaluateSingleCondition(
                                        condition, values);
                                  }

                                  if (isConditionTrue) {
                                    final targetPageName =
                                        navigateTo.name as String?;
                                    final targetPageType =
                                        navigateTo.type as String?;

                                    // Handle form navigation
                                    if (targetPageName != null &&
                                        targetPageType == 'form') {
                                      context.router.push(FormsRenderRoute(
                                        isEdit: widget.isEdit,
                                        customComponents:
                                            widget.customComponents,
                                        currentSchemaKey:
                                            widget.currentSchemaKey,
                                        pageName: targetPageName,
                                        defaultValues: widget.defaultValues,
                                        navigationParams:
                                            widget.navigationParams,
                                      ));
                                      _isSubmitting = false;
                                      return; // Skip default logic
                                    }

                                    // Handle direct form submission (skip remaining pages)
                                    if (targetPageType == 'submit') {
                                      context.read<FormsBloc>().add(
                                          FormsSubmitEvent(
                                              isEdit: widget.isEdit,
                                              schemaKey:
                                                  widget.currentSchemaKey));
                                      // Pop all form pages
                                      context.router.popUntil((route) {
                                        return route.settings.name !=
                                            FormsRenderRoute.name;
                                      });
                                      return; // Skip default logic
                                    }
                                  }
                                }
                              }

                              final pages = schemaObject.pages;
                              final currentPageKey =
                                  pages.entries.elementAt(index).key;
                              final currentOrder =
                                  pages[currentPageKey]?.order ?? 0;

// Find the next page with an integer order > currentOrder.floor()
                              final nextPageEntry = pages.entries.where((e) {
                                final order = e.value.order;
                                return order != null &&
                                    order > currentOrder &&
                                    order % 1 ==
                                        0; // Only integers (e.g. 6.0, not 5.1)
                              }).toList()
                                ..sort((a, b) =>
                                    a.value.order!.compareTo(b.value.order!));

                              if (nextPageEntry.isNotEmpty) {
                                context.router.push(FormsRenderRoute(
                                    isEdit: widget.isEdit,
                                    customComponents: widget.customComponents,
                                    currentSchemaKey: widget.currentSchemaKey,
                                    pageName: nextPageEntry.first.key,
                                    defaultValues: widget.defaultValues,
                                    navigationParams: widget.navigationParams));
                                _isSubmitting = false;
                              } else {
                                if (schemaObject.summary) {
                                  context.router.push(FormsRenderRoute(
                                      customComponents: widget.customComponents,
                                      currentSchemaKey: widget.currentSchemaKey,
                                      pageName: '',
                                      isEdit: widget.isEdit,
                                      isSummary: true,
                                      defaultValues: widget.defaultValues,
                                      navigationParams:
                                          widget.navigationParams));
                                  _isSubmitting = false;
                                } else {
                                  final contextValue =
                                      buildVisibilityEvaluationContext(
                                    currentPageKey: currentPageKey,
                                    currentForm: formGroup,
                                    pages: schemaObject.pages,

                                    /// TODO: fix hardcode not null condition
                                  );
                                  if (schema.showAlertPopUp != null) {
                                    showCustomPopup(
                                      context: context,
                                      builder: (BuildContext ctx) => Popup(
                                          title: localizations.translate(
                                              _resolveTemplate(
                                                  schema.showAlertPopUp!.title,
                                                  schema.showAlertPopUp
                                                      ?.conditions,
                                                  contextValue)!),
                                          description: localizations.translate(
                                              _resolveTemplate(
                                                      translateIfPresent(
                                                          schema.showAlertPopUp
                                                              ?.description,
                                                          localizations),
                                                      schema.showAlertPopUp
                                                          ?.conditions,
                                                      contextValue) ??
                                                  ""),

                                          /// FIXME: need to send null as empty string will take space
                                          actions: [
                                            DigitButton(
                                                label: localizations.translate(
                                                    schema.showAlertPopUp!
                                                        .primaryActionLabel),
                                                onPressed: () {
                                                  context.read<FormsBloc>().add(
                                                      FormsSubmitEvent(
                                                          isEdit: widget.isEdit,
                                                          schemaKey: widget
                                                              .currentSchemaKey));
                                                  // Pop all form pages (FormsRenderRoute)
                                                  Navigator.of(
                                                    ctx,
                                                    rootNavigator: true,
                                                  ).pop();
                                                  context.router
                                                      .popUntil((route) {
                                                    return route
                                                            .settings.name !=
                                                        FormsRenderRoute.name;
                                                  });
                                                },
                                                type: DigitButtonType.primary,
                                                size: DigitButtonSize.large),
                                            DigitButton(
                                                label: localizations.translate(
                                                    schema.showAlertPopUp!
                                                        .secondaryActionLabel),
                                                onPressed: () {
                                                  Navigator.of(
                                                    ctx,
                                                    rootNavigator: true,
                                                  ).pop();
                                                  _isSubmitting = false;
                                                  setState(() {});
                                                },
                                                type: DigitButtonType.secondary,
                                                size: DigitButtonSize.large)
                                          ]),
                                    ).then((_) {
                                      // Reset flag if popup dismissed without submitting
                                      // (e.g. tapping outside the popup)
                                      if (_isSubmitting) {
                                        _isSubmitting = false;
                                        setState(() {});
                                      }
                                    });
                                  } else {
                                    context.read<FormsBloc>().add(
                                        FormsSubmitEvent(
                                            isEdit: widget.isEdit,
                                            schemaKey:
                                                widget.currentSchemaKey));
                                    // Pop all form pages (FormsRenderRoute)

                                    /// FIXME: NOT BACKWARD COMPATIBLE
                                    context.router.popUntil((route) {
                                      return route.settings.name !=
                                          FormsRenderRoute.name;
                                    });
                                  }
                                }
                              }
                            },
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                          ),
                        ),
                        if (schema.secondaryActionLabel != null &&
                            widget.onSecondaryAction != null)
                          Padding(
                            padding: const EdgeInsets.only(top: spacer1),
                            child: DigitButton(
                              label: localizations
                                  .translate(schema.secondaryActionLabel!),
                              onPressed: widget.onSecondaryAction!,
                              type: DigitButtonType.tertiary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                            ),
                          ),
                      ],
                    ),
                    children: [
                      if (_hasDisplayOnlyProperties(schema))
                        ...[
                        _buildDisplayOnlyCard(context, schema),
                          const SizedBox(height: spacer4,)
                      ],
                      DigitCard(
                        margin: const EdgeInsets.symmetric(
                          horizontal: spacer2,
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 0,
                              ),
                              if (schema.label != null) ...[
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
                                if (schema.description != null &&
                                    translateIfPresent(schema.description,
                                            localizations) !=
                                        null &&
                                    localizations
                                        .translate(schema.description!)
                                        .trim()
                                        .isNotEmpty) ...[
                                  const SizedBox(
                                    height: spacer1,
                                  ),
                                  Text(
                                    localizations
                                        .translate(schema.description!),
                                    style: Theme.of(context)
                                        .digitTextTheme(context)
                                        .bodyS
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorTheme
                                                .text
                                                .secondary),
                                  ),
                                ],
                              ],
                            ],
                          ),
                          JsonForms(
                            propertySchema: schema,
                            pageName: widget.pageName,
                            currentSchemaKey: widget.currentSchemaKey,
                            childrens: widget.customComponents,
                            navigationParams: widget.navigationParams,
                            defaultValues: const {
                              // 'locality': context.boundary.code,
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: spacer2,
                      ),
                      Center(
                        child: Text(
                          'version ${schemaObject.version}',
                          style: Theme.of(context)
                              .digitTextTheme(context)
                              .bodyXS
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorTheme
                                      .text
                                      .disabled),
                        ),
                      )
                    ],
                  );
                }),
          );
        },
      ),
    );
  }

  String? _resolveTemplate(
    String? template,
    List<AlertCondition>? conditions,
    Map<String, dynamic> contextValues,
  ) {
    if (conditions == null || conditions.isEmpty) {
      return template;
    }

    // Find matching condition
    for (final condition in conditions) {
      // simple check: if contextValues contain a truthy match
      final isConditionTrue =
          evaluateSingleCondition(condition.expression, contextValues);

      if (isConditionTrue) {
        return template?.replaceAll(
            "{value}", localizations.translate(condition.value));
      }

      if (condition.expression == "DEFAULT") {
        return template?.replaceAll(
            "{value}", localizations.translate(condition.value));
      }
    }

    // fallback: return template unchanged
    return template;
  }

  /// Builds a multi-entity tab page for capturing same fields for multiple entities.
  Widget _buildMultiEntityTabPage(
    BuildContext context,
    PropertySchema schema,
    SchemaObject schemaObject,
  ) {
    final config = schema.multiEntityConfig!;

    // Get entities from the source page
    final sourcePage = schemaObject.pages[config.sourcePageKey];
    final sourceFieldValue =
        sourcePage?.properties?[config.sourceFieldKey]?.value;

    // Parse entities (could be List, dot-separated string, etc.)
    final List<dynamic> entities = _parseEntities(sourceFieldValue);

    if (entities.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text(
            localizations.translate('No entities selected'),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    final index = schemaObject.pages.keys.toList().indexOf(widget.pageName);

    return Scaffold(
      body: Provider<Map<String, dynamic>>.value(
        value: widget.defaultValues ?? {},
        child: ReactiveFormBuilder(
          form: () => fb.group(
            _buildMultiEntityFormControls(schema, entities),
          ),
          builder: (context, formGroup, child) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(spacer2),
                    child: BackNavigationHelpHeaderWidget(
                      showBackNavigation: true,
                    ),
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
                          ? localizations
                              .translate(schema.actionLabel ?? 'Next')
                          : localizations
                              .translate(schema.actionLabel ?? 'Submit'),
                      onPressed: () async {
                        // Prevent multiple simultaneous submissions
                        if (_isSubmitting) return;

                        // Set flag synchronously FIRST to block rapid taps
                        _isSubmitting = true;

                        // Then update UI
                        setState(() {});

                        // Add small delay to allow custom component to update schema data
                        await Future.delayed(const Duration(milliseconds: 200));

                        // Mark all controls as touched
                        formGroup.markAllAsTouched();

                        if (!formGroup.valid) {
                          // Find the first tab with errors
                          int? firstErrorTabIndex;
                          for (int i = 0; i < entities.length; i++) {
                            final entitySuffix = '_item_$i';
                            final hasErrorInTab =
                                formGroup.controls.entries.any(
                              (entry) =>
                                  entry.key.endsWith(entitySuffix) &&
                                  entry.value.errors.isNotEmpty,
                            );
                            if (hasErrorInTab) {
                              firstErrorTabIndex = i;
                              break;
                            }
                          }

                          // Navigate to the tab with errors
                          if (firstErrorTabIndex != null) {
                            _multiEntityTabKey.currentState
                                ?.goToTab(firstErrorTabIndex);
                          }

                          // Show error toast
                          final errorMessage = localizations
                              .translate('CORE_COMMON_VALIDATION_ERROR');
                          Toast.showToast(
                            context,
                            message:
                                errorMessage == 'CORE_COMMON_VALIDATION_ERROR'
                                    ? 'CORE_COMMON_VALIDATION_ERROR'
                                    : errorMessage,
                            type: ToastType.error,
                          );

                          _isSubmitting = false;
                          setState(() {});
                          return;
                        }

                        // Extract values and update schema
                        final values =
                            JsonForms.getFormValues(formGroup, schema);

                        // Update existing properties and add entity-specific fields
                        final updatedProperties =
                            Map<String, PropertySchema>.from(
                          schema.properties?.map(
                                (key, prop) => values.containsKey(key)
                                    ? MapEntry(
                                        key,
                                        prop.copyWith(
                                          value: values[key],
                                        ),
                                      )
                                    : MapEntry(key, prop),
                              ) ??
                              {},
                        );

                        // Add entity-specific fields (e.g., fieldName_item_0) that aren't in the schema
                        for (final entry in values.entries) {
                          if (entry.key.contains('_item_') &&
                              !updatedProperties.containsKey(entry.key)) {
                            // Create a minimal property schema for the entity-specific field
                            updatedProperties[entry.key] = PropertySchema(
                              type: PropertySchemaType.string,
                              value: entry.value,
                              hidden: true, // Hide from UI rendering
                              includeInForm: true, // Include in form data
                            );
                          }
                        }

                        final updatedPropertySchema = schema.copyWith(
                          properties: updatedProperties,
                        );

                        context.read<FormsBloc>().add(
                              FormsUpdateEvent(
                                schemaKey: widget.currentSchemaKey,
                                schema: schemaObject.copyWith(
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

                        // Navigate to next page or submit
                        final pages = schemaObject.pages;
                        final currentPageKey =
                            pages.entries.elementAt(index).key;
                        final currentOrder = pages[currentPageKey]?.order ?? 0;

                        final nextPageEntry = pages.entries.where((e) {
                          final order = e.value.order;
                          return order != null &&
                              order > currentOrder &&
                              order % 1 == 0;
                        }).toList()
                          ..sort((a, b) =>
                              a.value.order!.compareTo(b.value.order!));

                        if (nextPageEntry.isNotEmpty) {
                          context.router.push(FormsRenderRoute(
                            isEdit: widget.isEdit,
                            customComponents: widget.customComponents,
                            currentSchemaKey: widget.currentSchemaKey,
                            pageName: nextPageEntry.first.key,
                            defaultValues: widget.defaultValues,
                            navigationParams: widget.navigationParams,
                          ));
                          _isSubmitting = false;
                        } else {
                          context.read<FormsBloc>().add(
                                FormsSubmitEvent(
                                  isEdit: widget.isEdit,
                                  schemaKey: widget.currentSchemaKey,
                                ),
                              );
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
                  if (schema.secondaryActionLabel != null &&
                      widget.onSecondaryAction != null)
                    Padding(
                      padding: const EdgeInsets.only(top: spacer1),
                      child: DigitButton(
                        label: localizations
                            .translate(schema.secondaryActionLabel!),
                        onPressed: widget.onSecondaryAction!,
                        type: DigitButtonType.tertiary,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (schema.label != null) ...[
                          Text(
                            localizations.translate(schema.label!),
                            style: Theme.of(context)
                                .digitTextTheme(context)
                                .headingXl
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          if (schema.description != null) ...[
                            const SizedBox(height: spacer1),
                            Text(
                              localizations.translate(schema.description!),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                          const SizedBox(height: spacer2),
                        ],
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: entities.length == 1
                              ? _buildSingleEntityForm(schema, entities[0])
                              : MultiEntityTabView(
                                  key: _multiEntityTabKey,
                                  schema: schema,
                                  pageName: widget.pageName,
                                  currentSchemaKey: widget.currentSchemaKey,
                                  entities: entities,
                                  customComponents: widget.customComponents,
                                  navigationParams: widget.navigationParams,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Builds a form for a single entity without tabs.
  Widget _buildSingleEntityForm(PropertySchema schema, dynamic entity) {
    // Create a schema with renamed fields for the single entity (index 0)
    final entitySchema = _createSchemaForEntity(schema, 0);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(spacer2),
      child: JsonForms(
        propertySchema: entitySchema,
        pageName: widget.pageName,
        currentSchemaKey: widget.currentSchemaKey,
        childrens: widget.customComponents,
        navigationParams: {
          ...?widget.navigationParams,
          'currentEntityIndex': 0,
          'currentEntity': entity,
        },
        defaultValues: widget.defaultValues ?? {},
      ),
    );
  }

  /// Creates a modified schema where field names include the entity index suffix.
  PropertySchema _createSchemaForEntity(
      PropertySchema schema, int entityIndex) {
    final originalProperties = schema.properties ?? {};
    final modifiedProperties = <String, PropertySchema>{};
    final entitySuffix = '_item_$entityIndex';

    for (final entry in originalProperties.entries) {
      final fieldName = entry.key;
      final fieldSchema = entry.value;

      // Skip fields that have any entity suffix (e.g., _item_0, _item_1)
      // These are pre-created entity-specific fields handled separately
      if (RegExp(r'_item_\d+$').hasMatch(fieldName)) {
        // Only include if it matches THIS entity's suffix
        if (fieldName.endsWith(entitySuffix)) {
          modifiedProperties[fieldName] = fieldSchema;
        }
        continue;
      }

      // Skip readonly/hidden fields from renaming
      final shouldRename = fieldSchema.readOnly != true &&
          fieldSchema.hidden != true &&
          !fieldName.startsWith('_') &&
          fieldName != 'id';

      if (shouldRename) {
        // Check if a pre-created field with custom validation exists for this entity
        final targetFieldName = '$fieldName$entitySuffix';
        if (originalProperties.containsKey(targetFieldName)) {
          // Skip - the pre-created field will be added when we iterate to it
          continue;
        } else {
          // Rename field for this entity
          modifiedProperties[targetFieldName] = fieldSchema;
        }
      } else {
        // Keep as-is
        modifiedProperties[fieldName] = fieldSchema;
      }
    }

    return schema.copyWith(properties: modifiedProperties);
  }

  /// Parses entities from various value formats.
  List<dynamic> _parseEntities(dynamic value) {
    if (value == null) return [];

    if (value is List) return value;

    if (value is String && value.contains('.')) {
      return value.split('.').where((s) => s.trim().isNotEmpty).toList();
    }

    if (value is String && value.isNotEmpty) {
      return [value];
    }

    return [];
  }

  /// Builds form controls for all entities (all tabs).
  Map<String, AbstractControl<dynamic>> _buildMultiEntityFormControls(
    PropertySchema schema,
    List<dynamic> entities,
  ) {
    final Map<String, AbstractControl<dynamic>> controls = {};
    final originalProperties = schema.properties ?? {};

    debugPrint(
        'FormsRender: Building form controls for ${entities.length} entities');
    debugPrint(
        'FormsRender: Original properties: ${originalProperties.keys.toList()}');

    // Create controls for each entity
    for (int i = 0; i < entities.length; i++) {
      final entitySuffix = '_item_$i';

      for (final entry in originalProperties.entries) {
        final fieldName = entry.key;
        final fieldSchema = entry.value;

        // Skip fields that have any entity suffix (e.g., _item_0, _item_1)
        // These are pre-created entity-specific fields handled separately
        if (RegExp(r'_item_\d+$').hasMatch(fieldName)) {
          // Only create control if it matches THIS entity's suffix
          if (fieldName.endsWith(entitySuffix) &&
              !controls.containsKey(fieldName)) {
            controls[fieldName] = buildFormControl(
              fieldName,
              fieldSchema,
              schema,
              defaultValues: widget.defaultValues,
              schemaKey: widget.currentSchemaKey,
            );
            debugPrint(
                'FormsRender: Created control for pre-created field: $fieldName');
          }
          continue;
        }

        // Skip readonly/hidden fields from renaming
        final shouldRename = fieldSchema.readOnly != true &&
            fieldSchema.hidden != true &&
            !fieldName.startsWith('_') &&
            fieldName != 'id';

        if (shouldRename) {
          final suffixedFieldName = '$fieldName$entitySuffix';
          // Check if a pre-created field exists for this entity
          if (originalProperties.containsKey(suffixedFieldName)) {
            // Skip - the pre-created field control will be added when we iterate to it
            continue;
          }
          controls[suffixedFieldName] = buildFormControl(
            suffixedFieldName,
            fieldSchema,
            schema,
            defaultValues: widget.defaultValues,
            schemaKey: widget.currentSchemaKey,
          );
        } else {
          // Only add once (not per entity)
          if (!controls.containsKey(fieldName)) {
            controls[fieldName] = buildFormControl(
              fieldName,
              fieldSchema,
              schema,
              defaultValues: widget.defaultValues,
              schemaKey: widget.currentSchemaKey,
            );
          }
        }
      }
    }

    debugPrint('FormsRender: Final controls: ${controls.keys.toList()}');
    return controls;
  }

  Widget _buildSummaryPage(BuildContext context, SchemaObject schemaObject) {
    final shownPages = schemaObject.pages.entries.where((entry) {
      final pageSchema = entry.value;

      final values = pageSchema.properties?.values.map((field) => field.value);

      return values?.any((v) => v != null && v.toString().trim().isNotEmpty) ??
          false;
    }).toList();

    return ScrollableContent(
        enableFixedDigitButton: true,
        header: const Padding(
          padding: EdgeInsets.all(spacer2),
          child: BackNavigationHelpHeaderWidget(showBackNavigation: true),
        ),
        footer: DigitCard(
          margin: const EdgeInsets.only(top: spacer2),
          children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: localizations.translate('CORE_COMMON_SUBMIT'),
              onPressed: () async {
                // Prevent multiple simultaneous submissions
                if (_isSubmitting) return;

                // Set flag synchronously FIRST to block rapid taps
                _isSubmitting = true;

                // Then update UI
                setState(() {});

                // Add small delay to allow custom component to update schema data
                await Future.delayed(const Duration(milliseconds: 200));

                context.read<FormsBloc>().add(FormsSubmitEvent(
                    schemaKey: widget.currentSchemaKey, isEdit: widget.isEdit));

                // Pop all form pages (FormsRenderRoute)
                /// FIXME: NOT BACKWARD COMPATIBLE
                context.router.popUntil((route) {
                  return route.settings.name != FormsRenderRoute.name;
                });
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
            ),
          ],
        ),
        children: [
          for (final entry in shownPages)
            DigitCard(
              margin: const EdgeInsets.all(spacer2),
              children: [
                LabelValueSummary(
                  padding: EdgeInsets.zero,
                  heading:
                      localizations.translate(entry.value.label ?? entry.key),
                  headingStyle: Theme.of(context)
                      .digitTextTheme(context)
                      .headingL
                      .copyWith(
                        color: Theme.of(context).colorTheme.primary.primary2,
                      ),
                  items: _renderSummaryLabelValueItems(entry.value),
                ),
              ],
            ),
          const SizedBox(height: spacer2),
          Center(
            child: Text(
              'version ${schemaObject.version}',
              style: Theme.of(context).digitTextTheme(context).bodyXS.copyWith(
                    color: Theme.of(context).colorTheme.text.disabled,
                  ),
            ),
          ),
        ]);
  }

  List<LabelValueItem> _renderSummaryLabelValueItems(PropertySchema schema) {
    final properties = schema.properties ?? {};
    final currentLocale = Localizations.localeOf(context).toString();
    final dateFormatter = DateFormat('dd MMM yyyy', currentLocale);

    return properties.entries
        .where((entry) =>
            entry.value.includeInSummary != false && entry.value.hidden != true)
        .map((entry) {
      final label = localizations.translate(entry.value.label ?? entry.key);
      final rawValue = entry.value.value;

      String displayValue;

      if (rawValue is List) {
        displayValue = rawValue
            .map((e) => localizations.translate(e.toString()))
            .join(', ');
      } else if (rawValue is String && isDotSeparatedKey(rawValue)) {
        displayValue = rawValue
            .split('.')
            .map((e) => localizations.translate(e.trim()))
            .join(', ');
      } else if (rawValue is DateTime) {
        displayValue = dateFormatter.format(rawValue);
      } else if (rawValue is String && isDateTime(rawValue)) {
        displayValue = dateFormatter.format(DateTime.parse(rawValue));
      } else if (rawValue is String && isDateLike(rawValue)) {
        try {
          final parsed = parseDate(rawValue);
          displayValue = dateFormatter.format(parsed);
        } catch (_) {
          displayValue = localizations.translate(rawValue);
        }
      } else if (rawValue == null ||
          (rawValue is String && rawValue.trim().isEmpty) ||
          (rawValue is List && rawValue.isEmpty)) {
        // ✅ Null values show "--"
        displayValue = '--';
      } else {
        displayValue = localizations.translate(rawValue.toString());
      }

      return LabelValueItem(
        label: label,
        value: displayValue,
        isInline: true,
        labelFlex: 5,
        maxLines: 5,
        padding: const EdgeInsets.symmetric(vertical: spacer1),
      );
    }).toList();
  }

  bool _hasDisplayOnlyProperties(PropertySchema schema) {
    return schema.properties?.values.any((p) => p.displayOnly == true) ?? false;
  }

  Widget _buildDisplayOnlyCard(BuildContext context, PropertySchema schema) {
    final displayOnlyEntries = schema.properties!.entries
        .where((entry) => entry.value.displayOnly == true)
        .toList()
      ..sort((a, b) => (a.value.order ?? 0).compareTo(b.value.order ?? 0));

    // Build resolve context from navigation params and form defaults
    final resolveContext = <String, dynamic>{
      if (widget.navigationParams != null)
        'navigation': widget.navigationParams,
      if (widget.navigationParams != null) ...widget.navigationParams!,
      if (widget.defaultValues != null) ...widget.defaultValues!,
    };

    final items = displayOnlyEntries.map((entry) {
      final label = localizations.translate(entry.value.label ?? entry.key);
      final rawValue = entry.value.value;

      // Try to resolve template expressions like {{navigation.fieldName}}
      String? resolvedValue;
      if (rawValue != null && rawValue.toString().trim().isNotEmpty) {
        final valueStr = rawValue.toString();
        if (valueStr.contains('{{') && valueStr.contains('}}')) {
          final templateMatch = RegExp(r'\{\{([^}]+)\}\}').firstMatch(valueStr);
          if (templateMatch != null) {
            final path = templateMatch.group(1)!.trim();
            final parts = path.split('.');
            dynamic current = resolveContext;
            for (final part in parts) {
              if (current is Map && current.containsKey(part)) {
                current = current[part];
              } else {
                current = null;
                break;
              }
            }
            if (current != null && current is! Map && current is! List) {
              resolvedValue = current.toString();
            }
          }
        } else {
          resolvedValue = valueStr;
        }
      }

      // Also check if fieldName matches a key in navigation params or defaults
      if ((resolvedValue == null || resolvedValue.isEmpty) &&
          resolveContext.containsKey(entry.key)) {
        final val = resolveContext[entry.key];
        if (val != null && val is! Map && val is! List) {
          resolvedValue = val.toString();
        }
      }

      final displayValue =
          resolvedValue != null && resolvedValue.trim().isNotEmpty
              ? localizations.translate(resolvedValue)
              : '--';

      return LabelValueItem(
        label: label,
        value: displayValue,
        isInline: true,
        labelFlex: 5,
        maxLines: 3,
        padding: const EdgeInsets.symmetric(vertical: spacer1),
      );
    }).toList();

    return DigitCard(
      margin: const EdgeInsets.symmetric(horizontal: spacer2),
      children: [
        LabelValueSummary(
          padding: EdgeInsets.zero,
          heading: schema.label != null
              ? localizations.translate(schema.label!)
              : null,
          headingStyle:
              Theme.of(context).digitTextTheme(context).headingXl.copyWith(
                    color: Theme.of(context).colorTheme.primary.primary2,
                  ),
          items: items,
        ),
      ],
    );
  }
}
