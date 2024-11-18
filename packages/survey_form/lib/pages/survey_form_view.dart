import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_components/blocs/location/location.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/utils/utils.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_checkbox_tile.dart';
import 'package:digit_components/widgets/digit_dialog.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/digit_text_field.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:survey_form/survey_form.dart';
import 'package:survey_form/utils/extensions/context_utility.dart';

import '../router/survey_form_router.gm.dart';
import '../utils/constants.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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
  bool triggerLocalization = false;
  List<TextEditingController> controller = [];
  List<TextEditingController> additionalController = [];
  List<AttributesModel>? initialAttributes;
  ServiceDefinitionModel? selectedServiceDefinition;
  bool isControllersInitialized = false;
  List<int> visibleSurveyFormIndexes = [];
  GlobalKey<FormState> surveyFormKey = GlobalKey<FormState>();

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
                  footer: BlocListener<LocationBloc, LocationState>(
                    listener: (context, state) async {
                      if (state.accuracy != null && triggerLocalization) {
                        if (!mounted) return;
                        triggerLocalization = false;
                        final router = context.router;
                        // close the location capturing `dialog`
                        DigitComponentsUtils().hideDialog(context);

                        // Wait for the location to be obtained
                        final locationState =
                            context.read<LocationBloc>().state;
                        double? latitude = locationState.latitude;
                        double? longitude = locationState.longitude;

                        final shouldSubmit = await DigitDialog.show(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(
                              i18.surveyForm.surveyFormDialogLabel,
                            ),
                            content: Text(localizations.translate(
                              i18.surveyForm.surveyFormDialogDescription,
                            )),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.surveyForm.surveyFormDialogPrimaryAction,
                              ),
                              action: (ctx) {
                                final referenceId = IdGen.i.identifier;
                                List<ServiceAttributesModel> attributes = [];
                                for (int i = 0; i < controller.length; i++) {
                                  final attribute = initialAttributes;
                                  attributes.add(ServiceAttributesModel(
                                    auditDetails: AuditDetails(
                                      createdBy: SurveyFormSingleton()
                                          .loggedInUserUuid,
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
                                            : (attribute?[i].dataType !=
                                                    'Number'
                                                ? ''
                                                : '0')
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
                                                            3) ||
                                                    attribute?[i]
                                                            .values
                                                            ?.length ==
                                                        4) &&
                                                controller[i].text ==
                                                    attribute?[i]
                                                        .values?[1]
                                                        .trim()
                                            ? additionalController[i]
                                                    .text
                                                    .toString()
                                                    .isEmpty
                                                ? null
                                                : additionalController[i]
                                                    .text
                                                    .toString()
                                            : null,
                                    additionalFields:
                                        ServiceAttributesAdditionalFields(
                                      version: 1,
                                      fields: [
                                        AdditionalField(
                                          'latitude',
                                          latitude,
                                        ),
                                        AdditionalField(
                                          'longitude',
                                          longitude,
                                        ),
                                      ],
                                    ),
                                  ));
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
                                          accountId:
                                              SurveyFormSingleton().projectId,
                                          auditDetails: AuditDetails(
                                            createdBy: SurveyFormSingleton()
                                                .loggedInUserUuid,
                                            createdTime: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          ),
                                          clientAuditDetails:
                                              ClientAuditDetails(
                                            createdBy: SurveyFormSingleton()
                                                .loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                            lastModifiedBy:
                                                SurveyFormSingleton()
                                                    .loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          additionalFields:
                                              ServiceAdditionalFields(
                                            version: 1,
                                            fields: [
                                              AdditionalField(
                                                'latitude',
                                                latitude,
                                              ),
                                              AdditionalField(
                                                'longitude',
                                                longitude,
                                              ),
                                              AdditionalField(
                                                'localityCode',
                                                SurveyFormSingleton()
                                                    .boundary
                                                    ?.code,
                                              ),
                                            ],
                                          ),
                                          additionalDetails: {
                                            "boundaryCode":
                                                SurveyFormSingleton()
                                                    .boundary
                                                    ?.code,
                                            'lat': latitude,
                                            'lng': longitude,
                                          },
                                        ),
                                      ),
                                    );

                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(true);
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.surveyForm.surveyFormDialogSecondaryAction,
                              ),
                              action: (context) {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(false);
                              },
                            ),
                          ),
                        );
                        if (shouldSubmit ?? false) {
                          router.navigate(SurveyformRoute());
                          router.push(SurveyFormAcknowledgementRoute());
                        }
                      }
                    },
                    child: DigitCard(
                      margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                      padding:
                          const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                      child: DigitElevatedButton(
                        onPressed: () async {
                          submitTriggered = true;

                          context.read<ServiceBloc>().add(
                                const ServiceSurveyFormEvent(
                                  value: '',
                                  submitTriggered: true,
                                ),
                              );
                          final isValid =
                              surveyFormKey.currentState?.validate();
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

                          triggerLocalization = true;

                          // Request location from LocationBloc
                          context
                              .read<LocationBloc>()
                              .add(const LocationEvent.load());
                          DigitComponentsUtils().showLocationCapturingDialog(
                            context,
                            localizations
                                .translate(i18.common.locationCapturing),
                            DigitSyncDialogType.inProgress,
                          );
                        },
                        child: Text(
                          localizations.translate(i18.common.coreCommonSubmit),
                        ),
                      ),
                    ),
                  ),
                  children: [
                    Form(
                      key: surveyFormKey, //assigning key to form
                      child: DigitCard(
                        child: Column(children: [
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
                            String code = e.code ?? '';
                            String? description = e.additionalDetails?.entries
                                .where((a) => a.key == 'helpText')
                                .first
                                .value;
                            int index = (initialAttributes ?? []).indexOf(e);
                            return Column(children: [
                              if (e.dataType == 'String' &&
                                  !(e.code ?? '').contains('.')) ...[
                                DigitTextField(
                                  onChange: (value) {
                                    surveyFormKey.currentState?.validate();
                                  },
                                  isRequired: true,
                                  controller: controller[index],
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                      "[a-zA-Z0-9]",
                                    )),
                                  ],
                                  validator: (value) {
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
                                  label: localizations.translate(
                                    '${value.selectedServiceDefinition?.code}.$code',
                                  ),
                                  description: description != null
                                      ? localizations.translate(
                                          '${value.selectedServiceDefinition?.code}.$description',
                                        )
                                      : null,
                                ),
                              ] else if (e.dataType == 'Number' &&
                                  !(code).contains('.')) ...[
                                DigitTextField(
                                  autoValidation:
                                      AutovalidateMode.onUserInteraction,
                                  onChange: (value) {
                                    surveyFormKey.currentState?.validate();
                                  },
                                  textStyle: theme.textTheme.headlineMedium,
                                  textInputType: TextInputType.number,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                      "[0-9]",
                                    )),
                                  ],
                                  validator: (value) {
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
                                              .translate("${code}_REGEX");
                                    }

                                    return null;
                                  },
                                  controller: controller[index],
                                  label: '${localizations.translate(
                                        '${value.selectedServiceDefinition?.code}.$code',
                                      ).trim()} ${e.required == true ? '*' : ''}',
                                  description: description != null
                                      ? localizations.translate(
                                          '${value.selectedServiceDefinition?.code}.$description',
                                        )
                                      : description,
                                ),
                              ] else if (e.dataType == 'MultiValueList' &&
                                  !(code).contains('.')) ...[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(kPadding * 2),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${localizations.translate(
                                            '${value.selectedServiceDefinition?.code}.$code',
                                          )} ${e.required == true ? '*' : ''}',
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                        if (description != null)
                                          Text(
                                            '${localizations.translate(
                                              '${value.selectedServiceDefinition?.code}.$description',
                                            )} ${e.required == true ? '*' : ''}',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                BlocBuilder<ServiceBloc, ServiceState>(
                                  builder: (context, state) {
                                    // Validation logic to check if required field is empty
                                    final hasError = (e.required == true &&
                                        controller[index].text.isEmpty &&
                                        submitTriggered);

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Checkbox options
                                        Column(
                                          children: e.values!
                                              .map((item) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: kPadding * 2),
                                                    child: DigitCheckboxTile(
                                                      label: item,
                                                      value: controller[index]
                                                          .text
                                                          .split('.')
                                                          .contains(item),
                                                      onChanged: (value) {
                                                        context
                                                            .read<ServiceBloc>()
                                                            .add(
                                                              ServiceSurveyFormEvent(
                                                                value: item
                                                                    .toString(),
                                                                submitTriggered:
                                                                    submitTriggered,
                                                              ),
                                                            );

                                                        // Split the controller text into a list of values
                                                        var val =
                                                            controller[index]
                                                                .text
                                                                .split('.')
                                                                .where((v) => v
                                                                    .trim()
                                                                    .isNotEmpty)
                                                                .toList();
                                                        if (val
                                                            .contains(item)) {
                                                          val.remove(item);
                                                        } else {
                                                          val.add(item);
                                                        }

                                                        // Update the controller with the selected values
                                                        controller[index]
                                                                .value =
                                                            TextEditingController
                                                                .fromValue(
                                                          TextEditingValue(
                                                            text: val.join('.'),
                                                          ),
                                                        ).value;

                                                        // If the field is required and no option is selected, trigger validation
                                                        if (e.required ==
                                                                true &&
                                                            val.isEmpty) {
                                                          submitTriggered =
                                                              true;
                                                        }
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                        // Error message display if validation fails
                                        Offstage(
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
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ] else if (e.dataType == 'SingleValueList') ...[
                                if (!(code).contains('.'))
                                  DigitCard(
                                    child: _buildSurveyForm(
                                      e,
                                      index,
                                      value.selectedServiceDefinition,
                                      context,
                                    ),
                                  ),
                              ] else if (e.dataType == 'Boolean') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    child: Column(
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
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<ServiceBloc, ServiceState>(
                                          builder: (context, state) {
                                            return SelectionBox<bool>(
                                              //label: e,
                                              allowMultipleSelection: false,
                                              width: 110,
                                              valueMapper: (value) {
                                                return value
                                                    ? localizations.translate(
                                                        i18.common
                                                            .coreCommonYes,
                                                      )
                                                    : localizations.translate(
                                                        i18.common.coreCommonNo,
                                                      );
                                              },
                                              initialSelection:
                                                  controller[index].text ==
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
                                              ], // TODO: need to update
                                              onSelectionChanged: (curValue) {
                                                if (curValue.isNotEmpty) {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceSurveyFormEvent(
                                                          value: curValue
                                                              .toString(),
                                                          submitTriggered:
                                                              submitTriggered,
                                                        ),
                                                      );
                                                  controller[index].value =
                                                      TextEditingValue(
                                                    text: curValue.first
                                                        .toString(),
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ]);
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ]),
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
              child: Column(
                children: [
                  Text(
                    '${localizations.translate(
                      '${selectedServiceDefinition?.code}.${item.code}',
                    )} ${item.required == true ? '*' : ''}',
                    style: theme.textTheme.headlineSmall,
                  ),
                  if (item.additionalDetails != null &&
                      (item.additionalDetails ?? {}).keys.contains('helpText'))
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        localizations.translate(
                          '${selectedServiceDefinition?.code}.${item.additionalDetails?.entries.where((a) => a.key == 'helpText').first.value}',
                        ),
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w100),
                      ),
                    ),
                ],
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
                        item.trim().toUpperCase(),
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
                          child: DigitTextField(
                            maxLength: 1000,
                            isRequired: true,
                            controller: additionalController[index],
                            label: localizations.translate(
                              '${selectedServiceDefinition?.code}.${item.code}.ADDITIONAL_FIELD',
                            ),
                            validator: (value1) {
                              if (value1 == null || value1 == '') {
                                return localizations.translate(
                                  i18.common.coreCommonReasonRequired,
                                );
                              }

                              return null;
                            },
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
        child: DigitTextField(
          maxLength: 1000,
          onChange: (value) {
            surveyFormKey.currentState?.validate();
          },
          isRequired: item.required ?? true,
          controller: controller[index],
          inputFormatter: [
            FilteringTextInputFormatter.allow(RegExp(
              "[a-zA-Z0-9 ]",
            )),
          ],
          validator: (value) {
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
          label: localizations.translate(
            '${selectedServiceDefinition?.code}.${item.code}',
          ),
        ),
      );
    } else if (item.dataType == 'Number') {
      return DigitTextField(
        onChange: (value) {
          surveyFormKey.currentState?.validate();
        },
        textStyle: theme.textTheme.headlineMedium,
        textInputType: TextInputType.number,
        inputFormatter: [
          FilteringTextInputFormatter.allow(RegExp(
            "[0-9]",
          )),
        ],
        validator: (value) {
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
        controller: controller[index],
        label: '${localizations.translate(
              '${selectedServiceDefinition?.code}.${item.code}',
            ).trim()} ${item.required == true ? '*' : ''}',
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
                    .map((e) => DigitCheckboxTile(
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
              return SelectionBox<bool>(
                //label: e,
                allowMultipleSelection: false,
                width: 110,
                valueMapper: (value) {
                  return value ? 'Yes' : 'No';
                },
                initialSelection: const [false],
                options: const [true, false],
                onSelectionChanged: (value) {
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
                : const DigitColors().white,
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
      builder: (context) => DigitDialog(
        options: DigitDialogOptions(
          titleText: localizations.translate(
            i18.surveyForm.surveyFormBackDialogLabel,
          ),
          content: Text(localizations.translate(
            i18.surveyForm.surveyFormBackDialogDescription,
          )),
          primaryAction: DigitDialogActions(
            label: localizations
                .translate(i18.surveyForm.surveyFormBackDialogPrimaryAction),
            action: (ctx) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(true);
            },
          ),
          secondaryAction: DigitDialogActions(
            label: localizations
                .translate(i18.surveyForm.surveyFormBackDialogSecondaryAction),
            action: (context) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(false);
            },
          ),
        ),
      ),
    );

    return shouldNavigateBack ?? false;
  }
}
