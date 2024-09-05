import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/blocs/fetch_location_bloc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/utils/validators/validator.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:survey_form/survey_form.dart';
import 'package:survey_form/utils/extensions/context_utility.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/survey_form_router.gm.dart';
import '../utils/constants.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class SurveyFormViewPage extends LocalizedStatefulWidget {
  final String? referralClientRefId;

  const SurveyFormViewPage({
    Key? key,
    this.referralClientRefId,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<SurveyFormViewPage> createState() => SurveyFormViewPageState();
}

class SurveyFormViewPageState extends LocalizedState<SurveyFormViewPage> {
  String isStateChanged = '';
  var submitTriggered = false;
  List<TextEditingController> controller = [];
  List<TextEditingController> additionalController = [];
  List<AttributesModel>? initialAttributes;
  ServiceDefinitionModel? selectedServiceDefinition;
  bool isControllersInitialized = false;
  List<int> visibleSurveyFormIndexes = [];
  GlobalKey<FormState> surveyFormFormKey = GlobalKey<FormState>();

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

    bool isHealthFacilityWorker = SurveyFormSingleton().isHealthFacilityWorker;

    return WillPopScope(
      onWillPop: isHealthFacilityWorker && widget.referralClientRefId != null
          ? () async => false
          : () async => _onBackPressed(context),
      child: Scaffold(
        body: BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
          builder: (context, state) {
            state.mapOrNull(
              serviceDefinitionFetch: (value) {
                selectedServiceDefinition = value.selectedServiceDefinition;
                initialAttributes = value.selectedServiceDefinition?.attributes;
                if (!isControllersInitialized) {
                  initialAttributes?.forEach((e) {
                    controller.add(TextEditingController());
                    if (!(isHealthFacilityWorker &&
                        widget.referralClientRefId != null)) {
                      additionalController.add(TextEditingController());
                    }
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
                    if (!(isHealthFacilityWorker &&
                        widget.referralClientRefId != null))
                      const BackNavigationHelpHeaderWidget(),
                  ]),
                  enableFixedButton: true,
                  footer: DigitCard(
                    cardType: CardType.primary,
                    margin: const EdgeInsets.only(top: spacer2),
                    padding: const EdgeInsets.all(spacer2),
                    children: [Button(
                      label: localizations.translate(i18.common.coreCommonSubmit),
                      type: ButtonType.primary,
                      size: ButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                      onPressed: () async {
                        final router = context.router;
                        submitTriggered = true;

                        context.read<ServiceBloc>().add(
                              const ServiceSurveyFormEvent(
                                value: '',
                                submitTriggered: true,
                              ),
                            );
                        final isValid =
                            surveyFormFormKey.currentState?.validate();
                        if (!isValid!) {
                          return;
                        }
                        final itemsAttributes = initialAttributes;

                        for (int i = 0; i < controller.length; i++) {
                          if (itemsAttributes?[i].required == true &&
                              ((itemsAttributes?[i].dataType ==
                                          'SingleValueList' &&
                                      visibleSurveyFormIndexes
                                          .any((e) => e == i) &&
                                      (controller[i].text == '')) ||
                                  (itemsAttributes?[i].dataType !=
                                          'SingleValueList' &&
                                      (controller[i].text == '' &&
                                          !(isHealthFacilityWorker &&
                                              widget.referralClientRefId !=
                                                  null))))) {
                            return;
                          }
                        }

                        // Request location from LocationBloc
                        context.read<LocationBloc>().add(const LocationEvent.load());

                        // Wait for the location to be obtained
                        final locationState =
                            context.read<LocationBloc>().state;
                        double? latitude = locationState.latitude;
                        double? longitude = locationState.longitude;


                        final shouldSubmit = await showDialog(
                          context: context,
                          builder: (context)=>Popup(
                            type: PopUpType.simple,
                            title: localizations.translate(
                              i18.surveyForm.surveyFormDialogLabel,
                            ),
                            description: localizations.translate(
                              i18.surveyForm.surveyFormDialogDescription,
                            ),
                            actions: [
                              Button(
                                  label: localizations.translate(
                                    i18.surveyForm.surveyFormDialogPrimaryAction,
                                  ),
                                  onPressed: () {
                                    final referenceId = IdGen.i.identifier;
                                    List<ServiceAttributesModel> attributes = [];
                                    for (int i = 0; i < controller.length; i++) {
                                      final attribute = initialAttributes;
                                      attributes.add(ServiceAttributesModel(
                                        auditDetails: AuditDetails(
                                          createdBy: SurveyFormSingleton().loggedInUserUuid,
                                          createdTime:
                                          context.millisecondsSinceEpoch(),
                                        ),
                                        attributeCode: '${attribute?[i].code}',
                                        dataType: attribute?[i].dataType,
                                        clientReferenceId: IdGen.i.identifier,
                                        referenceId: isHealthFacilityWorker &&
                                            widget.referralClientRefId != null
                                            ? widget.referralClientRefId
                                            : referenceId,
                                        value: attribute?[i].dataType !=
                                            'SingleValueList'
                                            ? controller[i]
                                            .text
                                            .toString()
                                            .trim()
                                            .isNotEmpty
                                            ? controller[i].text.toString()
                                            : ''
                                            : visibleSurveyFormIndexes.contains(i)
                                            ? controller[i].text.toString()
                                            : i18.surveyForm.notSelectedKey,
                                        rowVersion: 1,
                                        tenantId: attribute?[i].tenantId,
                                        additionalDetails: isHealthFacilityWorker &&
                                            widget.referralClientRefId != null
                                            ? null
                                            : ((attribute?[i].values?.length == 2 ||
                                            attribute?[i]
                                                .values
                                                ?.length ==
                                                3) &&
                                            controller[i].text ==
                                                attribute?[i]
                                                    .values?[1]
                                                    .trim())
                                            ? additionalController[i]
                                            .text
                                            .toString()
                                            .isEmpty
                                            ? null
                                            : additionalController[i]
                                            .text
                                            .toString()
                                            : null,
                                        additionalFields: ServiceAttributesAdditionalFields(
                                          version: 1,
                                          fields: [
                                            AdditionalField(
                                              'latitude', latitude,
                                            ),
                                            AdditionalField(
                                              'longitude', longitude,
                                            ),
                                          ],
                                        ),
                                      )
                                      );
                                    }

                                    context.read<ServiceBloc>().add(
                                      ServiceCreateEvent(
                                        serviceModel: ServiceModel(
                                          createdAt: DigitDateUtils
                                              .getDateFromTimestamp(
                                            DateTime.now()
                                                .toLocal()
                                                .millisecondsSinceEpoch,
                                            dateFormat: Constants
                                                .SurveyFormViewDateFormat,
                                          ),
                                          tenantId: value
                                              .selectedServiceDefinition!
                                              .tenantId,
                                          clientId: isHealthFacilityWorker &&
                                              widget.referralClientRefId !=
                                                  null
                                              ? widget.referralClientRefId
                                              .toString()
                                              : referenceId,
                                          serviceDefId: value
                                              .selectedServiceDefinition?.id,
                                          attributes: attributes,
                                          rowVersion: 1,
                                          accountId: SurveyFormSingleton().projectId,
                                          auditDetails: AuditDetails(
                                            createdBy: SurveyFormSingleton().loggedInUserUuid,
                                            createdTime: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          ),
                                          clientAuditDetails:
                                          ClientAuditDetails(
                                            createdBy: SurveyFormSingleton().loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                            lastModifiedBy:
                                            SurveyFormSingleton().loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          additionalDetails:
                                          SurveyFormSingleton().boundary?.code,
                                        ),
                                      ),
                                    );

                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop(true);
                                  },
                                  type: ButtonType.primary, 
                                  size: ButtonSize.large
                              ),
                              Button(
                                  label: localizations.translate(
                                    i18.surveyForm.surveyFormDialogSecondaryAction,
                                  ),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop(false);
                                  }, 
                                  type: ButtonType.secondary, 
                                  size: ButtonSize.large
                              )
                            ]
                          ),
                        );
                        if (shouldSubmit ?? false) {
                          router.navigate(SurveyformRoute());
                          router.push(SurveyFormAcknowledgementRoute());
                        }
                      },
                    ),]
                  ),

                  children: [
                    Form(
                      key: surveyFormFormKey, //assigning key to form
                      child: DigitCard(
                        cardType: CardType.primary,
                        children: [Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              '${localizations.translate(
                                value.selectedServiceDefinition!.code
                                    .toString(),
                              )} ${localizations.translate(i18.surveyForm.surveyForm)}',
                              style: theme.textTheme.displayMedium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          ...initialAttributes!.map((
                            e,
                          ) {
                            int index = (initialAttributes ?? []).indexOf(e);
                            return Column(children: [
                              if (e.dataType == 'String' &&
                                  !(e.code ?? '').contains('.')) ...[
                                LabeledField(
                                  label: localizations.translate(
                                    '${value.selectedServiceDefinition?.code}.${e.code}',
                                  ),
                                  isRequired: e.required??false,
                                  child: DigitTextFormInput(
                                    onChange: (value) {
                                      surveyFormFormKey.currentState?.validate();
                                    },
                                    isRequired: e.required??false,
                                    controller: controller[index],
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                        "[a-zA-Z0-9]",
                                      )),
                                    ],
                                    validations: [
                                      Validator(
                                        ValidatorType.customFunction,
                                        controller[index].text,
                                        customValidation: (value) {
                                                              if (((value == null || value == '') &&
                                                              e.required == true)) {
                                                              return localizations
                                  .translate("${e.code}_REQUIRED");
                                                              }
                                                              if (e.regex != null) {
                                                              return (RegExp(e.regex!).hasMatch(value!))
                                                              ? null
                                  : localizations
                                  .translate("${e.code}_REGEX");
                                                              }
                                  
                                                              return null;
                                                              },
                                      ),
                                    ]
                                  ),
                                ),
                              ] else if (e.dataType == 'Number' &&
                                  !(e.code ?? '').contains('.')) ...[
                                LabeledField(
                                  label: '${localizations.translate(
                                    '${value.selectedServiceDefinition?.code}.${e.code}',
                                  ).trim()} ${e.required == true ? '*' : ''}',
                                  isRequired: e.required??false,
                                  child: DigitTextFormInput(
                                    onChange: (value) {
                                      surveyFormFormKey.currentState?.validate();
                                    },
                                    isRequired: e.required??false,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                        "[0-9]",
                                      )),
                                    ],
                                    validations: [
                                      Validator(
                                        ValidatorType.customFunction,
                                        controller[index].text,
                                        customValidation: (value) {
                                          if (((value == null || value == '') &&
                                              e.required == true)) {
                                            return localizations.translate(
                                              i18.common.corecommonRequired,
                                            );
                                          }
                                          if (e.regex != null) {
                                            return (RegExp(e.regex!).hasMatch(value!))
                                                ? null
                                                : localizations
                                                .translate("${e.code}_REGEX");
                                          }
                                  
                                          return null;
                                        },
                                      ),
                                    ],
                                    controller: controller[index],
                                  ),
                                ),
                              ] else if (e.dataType == 'MultiValueList' &&
                                  !(e.code ?? '').contains('.')) ...[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${localizations.translate(
                                            '${value.selectedServiceDefinition?.code}.${e.code}',
                                          )} ${e.required == true ? '*' : ''}',
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                BlocBuilder<ServiceBloc, ServiceState>(
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
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceSurveyFormEvent(
                                                          value: e.toString(),
                                                          submitTriggered:
                                                              submitTriggered,
                                                        ),
                                                      );
                                                  final String ele;
                                                  var val = controller[index]
                                                      .text
                                                      .split('.');
                                                  if (val.contains(e)) {
                                                    val.remove(e);
                                                    ele = val.join(".");
                                                  } else {
                                                    ele =
                                                        "${controller[index].text}.$e";
                                                  }
                                                  controller[index].value =
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
                              ]
                              else if (e.dataType == 'SingleValueList') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    cardType: CardType.primary,
                                    children: [_buildSurveyForm(
                                      e,
                                      index,
                                      value.selectedServiceDefinition,
                                      context,
                                    ),]
                                  ),
                              ]else if (e.dataType == 'Boolean') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    cardType: CardType.primary,
                                    children: [Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${localizations.translate(
                                                    '${selectedServiceDefinition?.code}.${e.code}',
                                                  )} ${e.required == true ? '*' : ''}',
                                                  style: theme.textTheme.headlineSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<ServiceBloc, ServiceState>(
                                          builder: (context, state) {
                                            return SelectionBox(
                                              //label: e,
                                              allowMultipleSelection: false,
                                              // width: 110,
                                              // initialSelection: controller[index].text=='true' ?  [true] : controller[index].text=='false' ?[false] : [],
                                              options: [
                                                SelectionOption(
                                                    name: localizations.translate(
                                                      i18.common.coreCommonYes,
                                                    ) ,
                                                    code: 'true',
                                                ),
                                                SelectionOption(
                                                  name: localizations.translate(
                                                    i18.common.coreCommonNo,
                                                  ) ,
                                                  code: 'false',
                                                )
                                              ],
                                              onSelectionChanged: (curValue) {
                                                if(curValue.isNotEmpty){
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                    ServiceSurveyFormEvent(
                                                      value: curValue.last.code,
                                                      submitTriggered:
                                                      submitTriggered,
                                                    ),
                                                  );
                                                  controller[index].value = TextEditingValue(
                                                    text: curValue.first.toString(),
                                                  );
                                                }

                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),]
                                  ),
                              ],
                            ]);
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ]),]
                      ),
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

  Widget _buildSurveyForm(
    AttributesModel item,
    int index,
    ServiceDefinitionModel? selectedServiceDefinition,
    BuildContext context,
  ) {
    bool isHealthFacilityWorker = SurveyFormSingleton().isHealthFacilityWorker;

    final theme = Theme.of(context);
    /* Check the data type of the attribute*/
    if (item.dataType == 'SingleValueList') {
      final childItems = getNextQuestions(
        item.code.toString(),
        initialAttributes ?? [],
      );
      List<int> excludedIndexes = [];

      // Ensure the current index is added to visible indexes and not excluded
      if (!visibleSurveyFormIndexes.contains(index) &&
          !excludedIndexes.contains(index)) {
        visibleSurveyFormIndexes.add(index);
      }

      // Determine excluded indexes
      for (int i = 0; i < (initialAttributes ?? []).length; i++) {
        if (!visibleSurveyFormIndexes.contains(i)) {
          excludedIndexes.add(i);
        }
      }

      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding here
              child: Text(
                '${localizations.translate(
                  '${selectedServiceDefinition?.code}.${item.code}',
                )} ${item.required == true ? '*' : ''}',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          Column(
            children: [
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  return RadioGroup<String>.builder(
                    groupValue: controller[index].text.trim(),
                    onChanged: (value) {
                      context.read<ServiceBloc>().add(
                            ServiceSurveyFormEvent(
                              value: Random().nextInt(100).toString(),
                              submitTriggered: submitTriggered,
                            ),
                          );
                      setState(() {
                        // Clear child controllers and update visibility
                        for (final matchingChildItem in childItems) {
                          final childIndex =
                              initialAttributes?.indexOf(matchingChildItem);
                          if (childIndex != null) {
                            // controller[childIndex].clear();
                            visibleSurveyFormIndexes
                                .removeWhere((v) => v == childIndex);
                          }
                        }

                        // Update the current controller's value
                        controller[index].value =
                            TextEditingController.fromValue(
                          TextEditingValue(
                            text: value!,
                          ),
                        ).value;

                        if (excludedIndexes.isNotEmpty) {
                          for (int i = 0; i < excludedIndexes.length; i++) {
                            // Clear excluded child controllers
                            if (item.dataType != 'SingleValueList') {
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
                    items: item.values != null
                        ? item.values!
                            .where((e) => e != i18.surveyForm.notSelectedKey)
                            .toList()
                        : [],
                    itemBuilder: (item) => RadioButtonBuilder(
                      localizations.translate(
                        'CORE_COMMON_${item.trim().toUpperCase()}',
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  return (controller[index].text == item.values?[1].trim() &&
                          !(isHealthFacilityWorker &&
                              widget.referralClientRefId != null))
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4.0,
                            bottom: 16,
                          ),
                          child: LabeledField(
                            label: localizations.translate(
                              '${selectedServiceDefinition?.code}.${item.code}.ADDITIONAL_FIELD',
                            ),
                            child: DigitTextFormInput(
                              maxLength: 1000,
                              isRequired: true,
                              controller: additionalController[index],
                              validations: [
                                Validator(
                                  ValidatorType.customFunction,
                                  additionalController[index].text,
                                  customValidation:     (value1) {
                                    if (value1 == null || value1 == '') {
                                      return localizations.translate(
                                        i18.common.coreCommonReasonRequired,
                                      );
                                    }

                                    return null;
                                  },
                                )
                              ] 
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  final hasError = (item.required == true &&
                      controller[index].text.isEmpty &&
                      submitTriggered);

                  return Offstage(
                    offstage: !hasError,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        localizations.translate(
                          i18.common.corecommonRequired,
                        ),
                        style: TextStyle(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          if (childItems.isNotEmpty &&
              controller[index].text.trim().isNotEmpty) ...[
            _buildNestedSurveyForm(
              item.code.toString(),
              index,
              controller[index].text.trim(),
              context,
            ),
          ],
        ],
      );
    } else if (item.dataType == 'String') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: LabeledField(
          label: localizations.translate(
            '${selectedServiceDefinition?.code}.${item.code}',
          ),
          child: DigitTextFormInput(
            maxLength: 1000,
            onChange: (value) {
              surveyFormFormKey.currentState?.validate();
            },
            isRequired: item.required ?? true,
            controller: controller[index],
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(
                "[a-zA-Z0-9 ]",
              )),
            ],
            validations: [
              Validator(
                ValidatorType.customFunction,
                  controller[index].text,
                customValidation: (value) {
                  if (((value == null || value == '') && item.required == true)) {
                    return localizations.translate("${item.code}_REQUIRED");
                  }
                  if (item.regex != null) {
                    return (RegExp(item.regex!).hasMatch(value!))
                        ? null
                        : localizations.translate("${item.code}_REGEX");
                  }

                  return null;
                },
              )
            ],
          ),
        ),
      );
    } else if (item.dataType == 'Number') {
      return LabeledField(
        label: '${localizations.translate(
          '${selectedServiceDefinition?.code}.${item.code}',
        ).trim()} ${item.required == true ? '*' : ''}',
        child: DigitTextFormInput(
          onChange: (value) {
            surveyFormFormKey.currentState?.validate();
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(
              "[0-9]",
            )),
          ],
          validations: [
            Validator(
              ValidatorType.customFunction,
                controller[index].text,
              customValidation: (value) {
                if (((value == null || value == '') && item.required == true)) {
                  return localizations.translate(
                    i18.common.corecommonRequired,
                  );
                }
                if (item.regex != null) {
                  return (RegExp(item.regex!).hasMatch(value!))
                      ? null
                      : localizations.translate("${item.code}_REGEX");
                }

                return null;
              },
            )
          ],
          controller: controller[index],
        ),
      );
    } else if (item.dataType == 'MultiValueList') {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    '${localizations.translate(
                      '${selectedServiceDefinition?.code}.${item.code}',
                    )} ${item.required == true ? '*' : ''}',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ServiceBloc, ServiceState>(
            builder: (context, state) {
              return Column(
                children: item.values!
                    .map((e) => DigitCheckbox(
                          label: e,
                          value: controller[index].text.split('.').contains(e),
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
        ],
      );
    } else if (item.dataType == 'Boolean') {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    '${localizations.translate(
                      '${selectedServiceDefinition?.code}.${item.code}',
                    )} ${item.required == true ? '*' : ''}',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ServiceBloc, ServiceState>(
            builder: (context, state) {
              return SelectionBox(
                //label: e,
                options: [
                  SelectionOption(
                      name: localizations.translate(
                        i18.common.coreCommonYes,
                      ),
                      code: "true"
                  ),
                  SelectionOption(
                      name: localizations.translate(
                        i18.common.coreCommonNo,
                      ),
                      code: "false"
                  ),
                ],
                allowMultipleSelection: false,
                width: 110,
                onSelectionChanged: (value) {
                  context.read<ServiceBloc>().add(
                        ServiceSurveyFormEvent(
                          value: value.last.code,
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
              );
            },
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // Function to build nested SurveyForm for child attributes
  Widget _buildNestedSurveyForm(
    String parentCode,
    int parentIndex,
    String parentControllerValue,
    BuildContext context,
  ) {
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
          Card(
            margin: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
            color: countDots(matchingChildItem.code ?? '') % 4 == 2
                ? const Color.fromRGBO(238, 238, 238, 1)
                : const DigitColors().light.primary1Bg,
            child: _buildSurveyForm(
              matchingChildItem,
              initialAttributes?.indexOf(matchingChildItem) ?? parentIndex,
              // Pass parentIndex here as we're building at the same level
              selectedServiceDefinition,
              context,
            ),
          ),
      ],
    );
  }

  // Function to get the next questions (child attributes) based on a parent code
  List<AttributesModel> getNextQuestions(
    String parentCode,
    List<AttributesModel> surveyFormItems,
  ) {
    final childCodePrefix = '$parentCode.';
    final nextSurveyForm = surveyFormItems.where((item) {
      return item.code!.startsWith(childCodePrefix) &&
          item.code?.split('.').length == parentCode.split('.').length + 2;
    }).toList();

    return nextSurveyForm;
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

  Future<bool> _onBackPressed(BuildContext context) async {
    bool? shouldNavigateBack = await showDialog<bool>(
      context: context,
      builder: (context) => Popup(
        title: localizations.translate(
          i18.surveyForm.surveyFormBackDialogLabel,
        ),
        type: PopUpType.simple,
        description: localizations.translate(
          i18.surveyForm.surveyFormBackDialogDescription,
        ),
        actions: [
          Button(
              label: localizations
                  .translate(i18.surveyForm.surveyFormBackDialogPrimaryAction),
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(true);
              },
              type: ButtonType.primary,
              size: ButtonSize.large
          ),
          Button(
              label: localizations
                  .translate(i18.surveyForm.surveyFormBackDialogSecondaryAction),
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(false);
              },
              type: ButtonType.secondary,
              size: ButtonSize.large
          )
        ],
      ),
    );

    return shouldNavigateBack ?? false;
  }
}
