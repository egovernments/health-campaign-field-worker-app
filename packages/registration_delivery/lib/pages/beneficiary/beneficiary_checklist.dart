import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/models/entities/registration_delivery_enums.dart';
import 'package:survey_form/survey_form.dart';

import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class BeneficiaryChecklistPage extends LocalizedStatefulWidget {
  final String? beneficiaryClientRefId;

  const BeneficiaryChecklistPage({
    super.key,
    this.beneficiaryClientRefId,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryChecklistPage> createState() =>
      _BeneficiaryChecklistPageState();
}

class _BeneficiaryChecklistPageState
    extends LocalizedState<BeneficiaryChecklistPage> {
  String isStateChanged = '';
  var submitTriggered = false;
  var validFields = true;
  List<TextEditingController> controller = [];
  List<TextEditingController> additionalController = [];
  List<AttributesModel>? initialAttributes;
  ServiceDefinitionModel? selectedServiceDefinition;
  bool isControllersInitialized = false;
  List<int> visibleChecklistIndexes = [];
  GlobalKey<FormState> checklistFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ServiceBloc>().add(
          ServiceSurveyFormEvent(
            value: Random().nextInt(100).toString(),
            submitTriggered: true,
          ),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
          builder: (context, state) {
            state.mapOrNull(
              serviceDefinitionFetch: (value) {
                selectedServiceDefinition = value.serviceDefinitionList
                    .where((element) => element.code.toString().contains(
                        '${RegistrationDeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.eligibility.toValue()}'))
                    .toList()
                    .firstOrNull;

                initialAttributes = selectedServiceDefinition?.attributes;
                if (!isControllersInitialized) {
                  initialAttributes?.forEach((e) {
                    controller.add(TextEditingController());
                  });

                  // Set the flag to true after initializing controllers
                  isControllersInitialized = true;
                }
              },
            );

            return state.maybeMap(
              orElse: () => Text(state.runtimeType.toString()),
              serviceDefinitionFetch: (value) {
                return ScrollableContent(
                  header: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: spacer2),
                      child: BackNavigationHelpHeaderWidget(
                        showHelp: false,
                        handleBack: () {
                          //TODO: direct go back is not working, need to check
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ]),
                  enableFixedDigitButton: true,
                  footer: DigitCard(
                      margin: const EdgeInsets.only(top: spacer2),
                      children: [
                        DigitButton(
                          label: localizations
                              .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () async {
                            submitTriggered = true;

                            context.read<ServiceBloc>().add(
                                  const ServiceSurveyFormEvent(
                                    value: '',
                                    submitTriggered: true,
                                  ),
                                );
                            final isValid =
                                checklistFormKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            final itemsAttributes = initialAttributes;
                            var validChecklist = true;

                            for (int i = 0; i < controller.length; i++) {
                              if (itemsAttributes?[i].required == true &&
                                  ((itemsAttributes?[i].dataType ==
                                              'SingleValueList' &&
                                          visibleChecklistIndexes
                                              .any((e) => e == i) &&
                                          (controller[i].text == '')) ||
                                      (itemsAttributes?[i].dataType !=
                                              'SingleValueList' &&
                                          (controller[i].text == '')))) {
                                return;
                              }
                              if (itemsAttributes?[i].required == true &&
                                  ((itemsAttributes?[i].dataType == 'Boolean' &&
                                      (controller[i].text == '')))) {
                                setState(() {
                                  validFields = false;
                                  validChecklist = false;
                                });
                              }
                            }

                            if (!validChecklist) {
                              return;
                            }

                            var decidedFlow = assessEligibility(
                                selectedServiceDefinition!, initialAttributes!);

                            showCustomPopup(
                                context: context,
                                builder: (popUpContext) => Popup(
                                        title: localizations.translate(i18
                                            .deliverIntervention.dialogTitle),
                                        type: PopUpType.simple,
                                        description: localizations
                                            .translate(
                                              i18.deliverIntervention
                                                  .beneficiaryChecklistDialogDescription,
                                            )
                                            .replaceFirst(
                                                '{}',
                                                localizations
                                                    .translate(decidedFlow)),
                                        actions: [
                                          DigitButton(
                                              label: localizations.translate(
                                                i18.beneficiaryDetails
                                                    .ctaProceed,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                DigitLoaders.overlayLoader(
                                                    context: context);
                                                createSubmitRequest(
                                                    decidedFlow: decidedFlow);
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                navigateToDecidedFlow(
                                                    context, decidedFlow);
                                              },
                                              capitalizeLetters: false,
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large),
                                          DigitButton(
                                              label: localizations.translate(
                                                i18.common.coreCommonCancel,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                              },
                                              capitalizeLetters: false,
                                              type: DigitButtonType.secondary,
                                              size: DigitButtonSize.large)
                                        ]));
                          },
                        ),
                      ]),
                  children: [
                    Form(
                      key: checklistFormKey, //assigning key to form
                      child: DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: spacer2),
                              child: Text(
                                '${localizations.translate(
                                  selectedServiceDefinition!.code.toString(),
                                )} ${localizations.translate(i18.checklist.checklist)}',
                                style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2
                                ),
                              ),
                            ),
                            ...initialAttributes!.map((
                              e,
                            ) {
                              String? description = e.additionalFields?.fields
                                  .where((a) => a.key == 'helpText')
                                  .firstOrNull
                                  ?.value;
                              int index = (initialAttributes ?? []).indexOf(e);

                              return Column(
                                  children: [
                                if (e.dataType == 'String' &&
                                    !(e.code ?? '').contains('.')) ...[
                                  FormField<String>(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (((value == null || value == '') &&
                                          e.required == true)) {
                                        return localizations
                                            .translate("${e.code}_REQUIRED");
                                      }
                                      if (e.regex != null) {
                                        return (RegExp(e.regex!)
                                                .hasMatch(value!))
                                            ? null
                                            : localizations
                                                .translate("${e.code}_REGEX");
                                      }

                                      return null;
                                    },
                                    builder: (field) => Column(
                                      children: [
                                        LabeledField(
                                          label: localizations.translate(
                                            '${selectedServiceDefinition?.code}.${e.code}',
                                          ),
                                          description: description != null
                                              ? localizations.translate(
                                                  '${value.selectedServiceDefinition?.code}.$description',
                                                )
                                              : null,
                                          labelStyle: textTheme.headingM.copyWith(
                                              color: theme.colorTheme.text.primary),
                                          descriptionStyle: textTheme.bodyS
                                              .copyWith(
                                              color: theme
                                                  .colorTheme.text.secondary),
                                          isRequired: e.required ?? false,
                                          capitalizedFirstLetter: false,
                                          child: DigitTextFormInput(
                                            onChange: (value) {
                                              field.didChange(value);
                                              controller[index].text = value;
                                              checklistFormKey.currentState
                                                  ?.validate();
                                            },
                                            isRequired: e.required ?? false,
                                            controller: controller[index],
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(
                                                "[a-zA-Z0-9]",
                                              )),
                                            ],
                                          ),
                                        ),
                                        const DigitDivider(),
                                      ],
                                    ),
                                  ),
                                ] else if (e.dataType == 'Number' &&
                                    !(e.code ?? '').contains('.')) ...[
                                  FormField<String>(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (((value == null || value == '') &&
                                          e.required == true)) {
                                        return localizations.translate(
                                          i18.common.corecommonRequired,
                                        );
                                      }
                                      if (e.regex != null) {
                                        return (RegExp(e.regex!)
                                                .hasMatch(value!))
                                            ? null
                                            : localizations
                                                .translate("${e.code}_REGEX");
                                      }

                                      return null;
                                    },
                                    builder: (field) => Column(
                                      children: [
                                        LabeledField(
                                          label: localizations
                                              .translate(
                                                '${value.selectedServiceDefinition?.code}.${e.code}',
                                              )
                                              .trim(),
                                          isRequired: e.required ?? false,
                                          capitalizedFirstLetter: false,
                                          labelStyle: textTheme.headingM.copyWith(
                                              color: theme.colorTheme.text.primary),
                                          descriptionStyle: textTheme.bodyS
                                              .copyWith(
                                                  color: theme
                                                      .colorTheme.text.secondary),
                                          description: description != null
                                              ? localizations.translate(
                                                  '${value.selectedServiceDefinition?.code}.$description',
                                                )
                                              : null,
                                          child: DigitTextFormInput(
                                            onChange: (value) {
                                              field.didChange(value);
                                              controller[index].text = value;
                                              checklistFormKey.currentState
                                                  ?.validate();
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(
                                                "[0-9]",
                                              )),
                                            ],
                                            controller: controller[index],
                                          ),
                                        ),
                                        const DigitDivider()
                                      ],
                                    ),
                                  ),
                                ] else if (e.dataType == 'SingleValueList') ...[
                                  if (!(e.code ?? '').contains('.'))
                                    _buildSurveyForm(
                                        e,
                                        index,
                                        selectedServiceDefinition,
                                        context,
                                        description)
                                ] else if (e.dataType == 'MultiValueList' &&
                                    !(e.code ?? '').contains('.')) ...[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(spacer2),
                                      child: Column(
                                        children: [
                                          LabeledField(
                                            label: localizations.translate(
                                              '${value.selectedServiceDefinition?.code}.${e.code}',
                                            ),
                                            description: description != null
                                                ? localizations.translate(
                                                    '${value.selectedServiceDefinition?.code}.$description',
                                                  )
                                                : null,
                                            labelStyle: textTheme.headingM.copyWith(
                                                color:
                                                    theme.colorTheme.text.primary),
                                            descriptionStyle: textTheme.bodyS
                                                .copyWith(
                                                    color: theme
                                                        .colorTheme.text.secondary),
                                            isRequired: e.required ?? false,
                                            child: BlocBuilder<ServiceBloc,
                                                ServiceState>(
                                              builder: (context, state) {
                                                return Column(
                                                  children: e.values!
                                                      .map((e) => DigitCheckbox(
                                                            label: e,
                                                            value: controller[index]
                                                                .text
                                                                .split('.')
                                                                .contains(e),
                                                            onChanged: (value) {
                                                              context
                                                                  .read<
                                                                      ServiceBloc>()
                                                                  .add(
                                                                    ServiceSurveyFormEvent(
                                                                      value: e
                                                                          .toString(),
                                                                      submitTriggered:
                                                                          submitTriggered,
                                                                    ),
                                                                  );
                                                              final String ele;
                                                              var val =
                                                                  controller[index]
                                                                      .text
                                                                      .split('.');
                                                              if (val.contains(e)) {
                                                                val.remove(e);
                                                                ele = val.join(".");
                                                              } else {
                                                                ele =
                                                                    "${controller[index].text}.$e";
                                                              }
                                                              controller[index]
                                                                      .value =
                                                                  TextEditingController
                                                                      .fromValue(
                                                                TextEditingValue(
                                                                  text: ele,
                                                                ),
                                                              ).value;
                                                            },
                                                          ))
                                                      .toList(),
                                                );
                                              },
                                            ),
                                          ),
                                          const DigitDivider(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ] else if (e.dataType == 'Boolean') ...[
                                  if (!(e.code ?? '').contains('.'))
                                    DigitCard(
                                        cardType: CardType.primary,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(spacer2),
                                              child: LabeledField(
                                                label: localizations.translate(
                                                  '${selectedServiceDefinition?.code}.${e.code}',
                                                ),
                                                capitalizedFirstLetter: false,
                                                description: description != null
                                                    ? localizations.translate(
                                                        '${value.selectedServiceDefinition?.code}.$description',
                                                      )
                                                    : null,
                                                labelStyle: textTheme.headingM
                                                    .copyWith(
                                                        color: theme.colorTheme
                                                            .text.primary),
                                                descriptionStyle:
                                                    textTheme.bodyS.copyWith(
                                                        color: theme.colorTheme
                                                            .text.secondary),
                                                isRequired: e.required ?? false,
                                                child: BlocBuilder<ServiceBloc,
                                                    ServiceState>(
                                                  builder: (context, state) {
                                                    return FormField<bool>(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator: (value) {
                                                        if (e.required ==
                                                                true &&
                                                            (controller[index]
                                                                        .text ==
                                                                    null ||
                                                                controller[index]
                                                                        .text ==
                                                                    '')) {
                                                          return localizations
                                                              .translate(
                                                            i18.common
                                                                .coreCommonReasonRequired,
                                                          );
                                                        }

                                                        return null;
                                                      },
                                                      builder: (field) =>
                                                          Column(
                                                            children: [
                                                              SelectionCard<bool>(
                                                                                                                      errorMessage:
                                                                field.errorText,
                                                                                                                      allowMultipleSelection:
                                                                false,
                                                                                                                      valueMapper: (value) {
                                                              return value
                                                                  ? localizations
                                                                      .translate(
                                                                      i18.common
                                                                          .coreCommonYes,
                                                                    )
                                                                  : localizations
                                                                      .translate(
                                                                      i18.common
                                                                          .coreCommonNo,
                                                                    );
                                                                                                                      },
                                                                                                                      initialSelection: controller[
                                                                            index]
                                                                        .text ==
                                                                    'true'
                                                                ? [true]
                                                                : controller[index]
                                                                            .text ==
                                                                        'false'
                                                                    ? [false]
                                                                    : [],
                                                                                                                      options: const [
                                                              true,
                                                              false
                                                                                                                      ],
                                                                                                                      onSelectionChanged:
                                                                (curValue) {
                                                              field.didChange(
                                                                  curValue.first);
                                                              if (curValue
                                                                  .isNotEmpty) {
                                                                context
                                                                    .read<
                                                                        ServiceBloc>()
                                                                    .add(
                                                                      ServiceSurveyFormEvent(
                                                                        value: curValue
                                                                            .toString(),
                                                                        submitTriggered:
                                                                            submitTriggered,
                                                                      ),
                                                                    );
                                                                controller[index]
                                                                        .value =
                                                                    TextEditingValue(
                                                                  text: curValue
                                                                      .first
                                                                      .toString(),
                                                                );
                                                              }
                                                                                                                      },
                                                                                                                    ),
                                                              const DigitDivider(),
                                                            ],
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                ],
                              ]);
                            }),
                          ]),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<AttributesModel> getNextQuestions(
    String parentCode,
    List<AttributesModel> checklistItems,
  ) {
    final childCodePrefix = '$parentCode.';
    final nextCheckLists = checklistItems.where((item) {
      return item.code!.startsWith(childCodePrefix) &&
          item.code?.split('.').length == parentCode.split('.').length + 2;
    }).toList();

    return nextCheckLists;
  }

  int countDots(String inputString) {
    int dotCount = 0;
    for (int i = 0; i < inputString.length; i++) {
      if (inputString[i] == '.') {
        dotCount++;
      }
    }

    return dotCount;
  }

  Widget _buildSurveyForm(
      AttributesModel item,
      int index,
      ServiceDefinitionModel? selectedServiceDefinition,
      BuildContext context,
      String? description) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    /* Check the data type of the attribute*/
    if (item.dataType == 'SingleValueList') {
      final childItems = getNextQuestions(
        item.code.toString(),
        initialAttributes ?? [],
      );
      List<int> excludedIndexes = [];

      // Ensure the current index is added to visible indexes and not excluded
      if (!visibleChecklistIndexes.contains(index) &&
          !excludedIndexes.contains(index)) {
        visibleChecklistIndexes.add(index);
      }

      // Determine excluded indexes
      for (int i = 0; i < (initialAttributes ?? []).length; i++) {
        if (!visibleChecklistIndexes.contains(i)) {
          excludedIndexes.add(i);
        }
      }

      return Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            LabeledField(
                charCondition: true,
                capitalizedFirstLetter: false,
                label: localizations.translate(
                  '${selectedServiceDefinition?.code}.${item.code}',
                ),
                description: description != null
                    ? localizations.translate(
                        '${selectedServiceDefinition?.code}.$description',
                      )
                    : null,
                labelStyle: textTheme.headingM
                    .copyWith(color: theme.colorTheme.text.primary),
                descriptionStyle: textTheme.bodyS
                    .copyWith(color: theme.colorTheme.text.secondary),
                isRequired: item.required ?? false,
                child: Column(children: [
                  BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      return Align(
                          alignment: Alignment.topLeft,
                          child: FormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value1) {
                                if (item.required == true &&
                                    (controller[index].text == null ||
                                        controller[index].text == '')) {
                                  return localizations.translate(
                                    i18.common.coreCommonReasonRequired,
                                  );
                                }

                                return null;
                              },
                              builder: (field) => RadioList(
                                    radioDigitButtons: item.values != null
                                        ? item.values!
                                            .where((e) =>
                                                e != i18.checklist.notSelectedKey)
                                            .toList()
                                            .map((item) => RadioButtonModel(
                                                  code: item,
                                                  name: localizations.translate(
                                                    '${selectedServiceDefinition?.code}.${item.trim()}',
                                                  ),
                                                ))
                                            .toList()
                                        : [],
                                    errorMessage: field.errorText,
                                    sentenceCaseEnabled: false,
                                    groupValue: controller[index].text.trim(),
                                    onChanged: (value) {
                                      field.didChange(value);
                                      context.read<ServiceBloc>().add(
                                            ServiceSurveyFormEvent(
                                              value:
                                                  Random().nextInt(100).toString(),
                                              submitTriggered: submitTriggered,
                                            ),
                                          );
                                      setState(() {
                                        // Clear child controllers and update visibility
                                        for (final matchingChildItem
                                            in childItems) {
                                          final childIndex = initialAttributes
                                              ?.indexOf(matchingChildItem);
                                          if (childIndex != null) {
                                            // controller[childIndex].clear();
                                            visibleChecklistIndexes.removeWhere(
                                                (v) => v == childIndex);
                                          }
                                        }

                                        // Update the current controller's value
                                        controller[index].value =
                                            TextEditingController.fromValue(
                                          TextEditingValue(
                                            text: value!.code,
                                          ),
                                        ).value;

                                        if (excludedIndexes.isNotEmpty) {
                                          for (int i = 0;
                                              i < excludedIndexes.length;
                                              i++) {
                                            // Clear excluded child controllers
                                            if (item.dataType !=
                                                'SingleValueList') {
                                              // controller[excludedIndexes[i]].value =
                                              //     TextEditingController.fromValue(
                                              //   const TextEditingValue(
                                              //     text: '',
                                              //   ),
                                              // ).value;
                                            }
                                          }
                                        }
                                        // Remove corresponding controllers based on the removed attributes
                                      });
                                    },
                                  )));
                    },
                  ),
                  BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      return (controller[index].text == item.values?[1].trim() &&
                              item.dataType != 'SingleValueList')
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: spacer1,
                                right: spacer1,
                                bottom: spacer4,
                              ),
                              child: FormField<String>(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value1) {
                                  if (item.required == true &&
                                      (additionalController[index].text == null ||
                                          additionalController[index].text == '')) {
                                    return localizations.translate(
                                      i18.common.coreCommonReasonRequired,
                                    );
                                  }

                                  return null;
                                },
                                builder: (field) {
                                  return LabeledField(
                                      label: localizations.translate(
                                        '${selectedServiceDefinition?.code}.${item.code}.ADDITIONAL_FIELD',
                                      ),
                                      description: description != null
                                          ? localizations.translate(
                                              '${selectedServiceDefinition?.code}.$description',
                                            )
                                          : null,
                                      labelStyle: textTheme.headingM.copyWith(
                                          color: theme.colorTheme.text.primary),
                                      descriptionStyle: textTheme.bodyS.copyWith(
                                          color: theme.colorTheme.text.secondary),
                                      isRequired: item.required ?? false,
                                      capitalizedFirstLetter: false,
                                      child: DigitTextFormInput(
                                        onChange: (value) {
                                          field.didChange(value);
                                          additionalController[index].text = value;
                                        },
                                        errorMessage: field.errorText,
                                        maxLength: 1000,
                                        charCount: true,
                                        controller: additionalController[index],
                                      ));
                                },
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                  if (childItems.isNotEmpty &&
                      controller[index].text.trim().isNotEmpty) ...[
                    _buildNestedSurveyForm(
                      item.code.toString(),
                      index,
                      controller[index].text.trim(),
                      context,
                      description,
                    ),
                  ],
                ])),
            const DigitDivider(),
          ],
        ),
      );
    } else if (item.dataType == 'String') {
      return FormField<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (((controller[index].text == '') && item.required == true)) {
              return localizations.translate("${item.code}_REQUIRED");
            }
            if (item.regex != null) {
              return (RegExp(item.regex!).hasMatch(controller[index].text!))
                  ? null
                  : localizations.translate("${item.code}_REGEX");
            }

            return null;
          },
          builder: (field) {
            return Column(
              children: [
                LabeledField(
                  label: localizations.translate(
                    '${selectedServiceDefinition?.code}.${item.code}',
                  ),
                  description: description != null
                      ? localizations.translate(
                          '${selectedServiceDefinition?.code}.$description',
                        )
                      : null,
                  labelStyle: textTheme.headingM
                      .copyWith(color: theme.colorTheme.text.primary),
                  descriptionStyle: textTheme.bodyS
                      .copyWith(color: theme.colorTheme.text.secondary),
                  isRequired: item.required ?? false,
                  capitalizedFirstLetter: false,
                  child: DigitTextFormInput(
                    maxLength: 1000,
                    charCount: true,
                    onChange: (value) {
                      field.didChange(value);
                      controller[index].text = value;
                    },
                    errorMessage: field.errorText,
                    controller: controller[index],
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                        "[a-zA-Z0-9 ]",
                      )),
                    ],
                  ),
                ),
                const DigitDivider(),
              ],
            );
          });
    } else if (item.dataType == 'Number') {
      return FormField<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (((controller[index].text == '') && item.required == true)) {
              return localizations.translate(
                i18.common.corecommonRequired,
              );
            }
            if (item.regex != null) {
              return (RegExp(item.regex!).hasMatch(controller[index].text!))
                  ? null
                  : localizations.translate("${item.code}_REGEX");
            }

            return null;
          },
          builder: (field) {
            return Column(
              children: [
                LabeledField(
                  label: localizations
                      .translate(
                        '${selectedServiceDefinition?.code}.${item.code}',
                      )
                      .trim(),
                  description: description != null
                      ? localizations.translate(
                          '${selectedServiceDefinition?.code}.$description',
                        )
                      : null,
                  labelStyle: textTheme.headingM
                      .copyWith(color: theme.colorTheme.text.primary),
                  descriptionStyle: textTheme.bodyS
                      .copyWith(color: theme.colorTheme.text.secondary),
                  isRequired: item.required ?? false,
                  capitalizedFirstLetter: false,
                  child: DigitTextFormInput(
                    onChange: (value) {
                      field.didChange(value);
                      controller[index].text = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                        "[0-9]",
                      )),
                    ],
                    errorMessage: field.errorText,
                    controller: controller[index],
                  ),
                ),
                const DigitDivider(),
              ],
            );
          });
    } else if (item.dataType == 'MultiValueList') {
      return Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(spacer2),
              child: LabeledField(
                label: localizations.translate(
                  '${selectedServiceDefinition?.code}.${item.code}',
                ),
                description: description != null
                    ? localizations.translate(
                        '${selectedServiceDefinition?.code}.$description',
                      )
                    : null,
                labelStyle: textTheme.headingM
                    .copyWith(color: theme.colorTheme.text.primary),
                descriptionStyle: textTheme.bodyS
                    .copyWith(color: theme.colorTheme.text.secondary),
                isRequired: item.required ?? false,
                capitalizedFirstLetter: false,
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    return Column(
                      children: item.values!
                          .map((e) => DigitCheckbox(
                                label: localizations.translate(
                                    '${selectedServiceDefinition?.code}.${e}'),
                                value:
                                    controller[index].text.split('.').contains(e),
                                onChanged: (value) {
                                  context.read<ServiceBloc>().add(
                                        ServiceSurveyFormEvent(
                                          value: e.toString(),
                                          submitTriggered: submitTriggered,
                                        ),
                                      );
                                  final String ele;
                                  var val = controller[index].text.split('.');
                                  if (val.contains(e)) {
                                    val.remove(e);
                                    ele = val.join(".");
                                  } else {
                                    ele = "${controller[index].text}.$e";
                                  }
                                  controller[index].value =
                                      TextEditingController.fromValue(
                                    TextEditingValue(
                                      text: ele,
                                    ),
                                  ).value;
                                },
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
            ),
            const DigitDivider(),
          ],
        ),
      );
    } else if (item.dataType == 'Boolean') {
      return Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(spacer2),
              child: LabeledField(
                label: localizations.translate(
                  '${selectedServiceDefinition?.code}.${item.code}',
                ),
                description: description != null
                    ? localizations.translate(
                        '${selectedServiceDefinition?.code}.$description',
                      )
                    : null,
                labelStyle: textTheme.headingM
                    .copyWith(color: theme.colorTheme.text.primary),
                descriptionStyle: textTheme.bodyS
                    .copyWith(color: theme.colorTheme.text.secondary),
                isRequired: item.required ?? false,
                capitalizedFirstLetter: false,
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    return FormField<bool>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (item.required == true &&
                            (controller[index].text == null ||
                                controller[index].text == '')) {
                          return localizations.translate(
                            i18.common.coreCommonReasonRequired,
                          );
                        }

                        return null;
                      },
                      builder: (field) => SelectionCard(
                        errorMessage: field.errorText,
                        allowMultipleSelection: false,
                        valueMapper: (value) {
                          return value
                              ? localizations.translate(
                                  i18.common.coreCommonYes,
                                )
                              : localizations.translate(
                                  i18.common.coreCommonNo,
                                );
                        },
                        initialSelection: const [false],
                        options: const [true, false],
                        onSelectionChanged: (value) {
                          field.didChange(value.first);
                          context.read<ServiceBloc>().add(
                                ServiceSurveyFormEvent(
                                  value: value.toString(),
                                  submitTriggered: submitTriggered,
                                ),
                              );
                          final String ele;
                          var val = controller[index].text.split('.');
                          if (val.contains(e)) {
                            val.remove(e);
                            ele = val.join(".");
                          } else {
                            ele = "${controller[index].text}.$e";
                          }
                          controller[index].value = TextEditingController.fromValue(
                            TextEditingValue(
                              text: ele,
                            ),
                          ).value;
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const DigitDivider(),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // Function to build nested SurveyForm for child attributes
  Widget _buildNestedSurveyForm(String parentCode, int parentIndex,
      String parentControllerValue, BuildContext context, String? description) {
    // Retrieve child items for the given parent code
    final childItems = getNextQuestions(
      parentCode,
      initialAttributes ?? [],
    );

    return Column(
      children: [
        // Build cards for each matching child attribute
        for (final matchingChildItem in childItems.where((childItem) =>
            childItem.code!.startsWith('$parentCode.$parentControllerValue.')))
          DigitCard(
            margin: const EdgeInsets.only(
                bottom: spacer2, left: spacer2, right: spacer2),
            cardType: CardType.secondary,
            children: [
              _buildSurveyForm(
                  matchingChildItem,
                  initialAttributes?.indexOf(matchingChildItem) ?? parentIndex,
                  // Pass parentIndex here as we're building at the same level
                  selectedServiceDefinition,
                  context,
                  description)
            ],
          ),
      ],
    );
  }

  String assessEligibility(ServiceDefinitionModel serviceDefinition,
      List<AttributesModel> initialAttributes) {
    Map<String, int> scores = {};
    String? precedenceFlowAnswer;
    Map<String, String> precedenceFlowMapping = {};

    var flows = serviceDefinition.additionalFields?.fields
        .firstWhere((element) => element.key == 'flow')
        .value;

    // Debugging: Print flows
    if (kDebugMode) {
      print('Flows: $flows');
    }

    // Initialize scores for each flow type
    for (var flowType in flows) {
      scores[flowType['type']] = 0;
    }

    // Get the precedence flow attribute if defined
    String? precedenceFlowCode = serviceDefinition.additionalFields?.fields
        .firstWhere((element) => element.key == 'precedenceFlow')
        .value;

    AttributesModel? precedenceAttribute =
        serviceDefinition.attributes?.firstWhereOrNull(
      (attribute) => attribute.code == precedenceFlowCode,
    );

    // Initialize a set to track processed inputs for all attributes
    Set<String> processedInputs = {};

    for (int i = 0; i < controller.length; i++) {
      AttributesModel attribute = initialAttributes[i];

      Map<String, dynamic>? pointsMapping = attribute.additionalFields?.fields
          .firstWhere((element) => element.key == 'pointsMapping')
          .value;

      String? input = controller[i].text.trim(); // Sanitize input
      String key =
          '${attribute.code}_$input'; // Combine attribute code and input for uniqueness

      if (input.isNotEmpty && pointsMapping?.containsKey(input) == true) {
        if (!processedInputs.contains(key)) {
          processedInputs
              .add(key); // Mark this attribute-input combination as processed

          var flowPoints = pointsMapping![input];

          flowPoints.forEach((flowType, points) {
            scores[flowType] =
                (scores[flowType] ?? 0) + (points as num).toInt();
          });

          // Assign precedenceFlowAnswer only for precedence attribute
          if (attribute.code == precedenceFlowCode &&
              precedenceFlowAnswer == null) {
            precedenceFlowAnswer = input;
          }

          // Debugging: Print flowPoints and updated scores
          if (kDebugMode) {
            print('Input: $input, Flow Points: $flowPoints');
            print('Updated Scores: $scores');
          }
        } else {
          if (kDebugMode) {
            print('Input already processed for attribute: $key');
          }
        }
      } else {
        if (kDebugMode) {
          print('No valid mapping or input for attribute: ${attribute.code}');
        }
      }
    }

    // After loop: check if precedenceFlowAnswer is null
    if (precedenceFlowAnswer == null) {
      if (kDebugMode) {
        print('No valid answer for precedence attribute was provided.');
      }
    }

    // Final scoring and precedence resolution
    if (kDebugMode) {
      print('Final Scores: $scores');
    }
    scores.forEach((key, value) {
      if (kDebugMode) {
        print('$key: $value');
      }
    });

    // Determine flows that meet the minimum score requirement
    List<dynamic> eligibleFlows = flows
        .where((flow) => scores[flow['type']]! >= flow['minScore'])
        .map((flow) => flow['type'])
        .toList();

    // Handle precedence if there are eligible flows and a tie occurs
    String finalFlow;
    if (eligibleFlows.length > 1 &&
        precedenceFlowAnswer != null &&
        precedenceFlowAnswer.isNotEmpty) {
      // Check if precedence flow is part of eligible flows
      String? precedenceFlowFromAnswer =
          precedenceFlowMapping[precedenceFlowAnswer];
      if (eligibleFlows.contains(precedenceFlowFromAnswer)) {
        finalFlow = precedenceFlowFromAnswer!;
      } else {
        finalFlow = finalFlow =
            scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      }
    } else if (eligibleFlows.isNotEmpty) {
      finalFlow = finalFlow =
          scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    } else {
      finalFlow =
          scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    }

    if (kDebugMode) {
      print('inputs: $controller');
      print('Eligible Flows: $eligibleFlows');
      print('Precedence attribute: $precedenceAttribute');
      print('Precedence Flow: $precedenceFlowAnswer');
      print('Precedence Flow Mapping: $precedenceFlowMapping');
      print('Final Flow: $finalFlow');
    }

    return finalFlow;
  }

  void createSubmitRequest({String? decidedFlow}) {
    List<ServiceAttributesModel> attributes = [];
    var referenceId = IdGen.i.identifier;
    for (int i = 0; i < controller.length; i++) {
      final attribute = initialAttributes;
      attributes.add(ServiceAttributesModel(
        attributeCode: '${attribute?[i].code}',
        dataType: attribute?[i].dataType,
        clientReferenceId: IdGen.i.identifier,
        referenceId: referenceId,
        value: attribute?[i].dataType != 'SingleValueList'
            ? controller[i].text.toString().trim().isNotEmpty
                ? controller[i].text.toString()
                : ''
            : visibleChecklistIndexes.contains(i)
                ? controller[i].text.toString()
                : i18.checklist.notSelectedKey,
        rowVersion: 1,
        tenantId: attribute?[i].tenantId,
        additionalDetails: null,
      ));
    }

    context.read<ServiceBloc>().add(
          ServiceCreateEvent(
            serviceModel: ServiceModel(
              createdAt: DigitDateUtils.getDateFromTimestamp(
                DateTime.now().toLocal().millisecondsSinceEpoch,
                dateFormat: Constants.checklistViewDateFormat,
              ),
              tenantId: selectedServiceDefinition?.tenantId,
              clientId: referenceId,
              serviceDefId: selectedServiceDefinition?.id,
              attributes: attributes,
              rowVersion: 1,
              accountId: RegistrationDeliverySingleton().projectId,
              additionalDetails: {
                "boundaryCode": RegistrationDeliverySingleton().boundary?.code
              },
              additionalFields: ServiceAdditionalFields(version: 1, fields: [
                AdditionalField(
                    'relatedClientReferenceId', widget.beneficiaryClientRefId),
                AdditionalField('localityCode',
                    RegistrationDeliverySingleton().boundary!.code),
                if (decidedFlow != null)
                  AdditionalField('decidedFlow', decidedFlow)
              ]),
              auditDetails: AuditDetails(
                createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
                createdTime: DateTime.now().millisecondsSinceEpoch,
              ),
              clientAuditDetails: ClientAuditDetails(
                createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
                createdTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedBy:
                    RegistrationDeliverySingleton().loggedInUserUuid!,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
              ),
            ),
          ),
        );
  }

  void navigateToDecidedFlow(BuildContext ctx, String decidedFlow) {
    final statusMap = {
      Status.beneficiaryRefused.toValue(): Status.beneficiaryRefused,
      Status.beneficiaryReferred.toValue(): Status.beneficiaryReferred,
      Status.toAdminister.toValue(): Status.toAdminister,
    };

    final status = statusMap[decidedFlow];

    switch (status) {
      case Status.beneficiaryRefused:
        ctx.router.navigate(RefusedDeliveryRoute());
        break;
      case Status.beneficiaryReferred:
        ctx.router.navigate(ReferBeneficiaryRoute(
            projectBeneficiaryClientRefId: widget.beneficiaryClientRefId!));
        break;
      case Status.toAdminister:
        ctx.router.navigate(BeneficiaryDetailsRoute());
        break;
      default:
        Navigator.of(ctx).pop();
        break;
    }
  }
}
