import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/models/entities/registration_delivery_enums.dart';
import 'package:registration_delivery/utils/constants.dart';

import '../../router/registration_delivery_router.gm.dart';
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
          ServiceChecklistEvent(
            value: Random().nextInt(100).toString(),
            submitTriggered: true,
          ),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
          builder: (context, state) {
            state.mapOrNull(
              serviceDefinitionFetch: (value) {
                selectedServiceDefinition = value.serviceDefinitionList
                    .where((element) => element.code.toString().contains(
                        '${RegistrationDeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.iec.toValue()}'))
                    .toList()
                    .first;

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
                    BackNavigationHelpHeaderWidget(
                      showHelp: false,
                      handleBack: () {
                        //TODO: direct go back is not working, need to check
                        Navigator.pop(context);
                      },
                    ),
                  ]),
                  enableFixedButton: true,
                  footer: DigitCard(
                    margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                    padding:
                        const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: DigitElevatedButton(
                      onPressed: () async {
                        // TODO: Submit checklist
                        final router = context.router;
                        submitTriggered = true;

                        context.read<ServiceBloc>().add(
                              const ServiceChecklistEvent(
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
                        List<ServiceAttributesModel> attributes = [];
                        for (int i = 0; i < controller.length; i++) {
                          final attribute = initialAttributes;
                          attributes.add(ServiceAttributesModel(
                            attributeCode: '${attribute?[i].code}',
                            dataType: attribute?[i].dataType,
                            clientReferenceId: IdGen.i.identifier,
                            referenceId: widget.beneficiaryClientRefId,
                            value: attribute?[i].dataType != 'SingleValueList'
                                ? controller[i]
                                        .text
                                        .toString()
                                        .trim()
                                        .isNotEmpty
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
                                  createdAt:
                                      DigitDateUtils.getDateFromTimestamp(
                                    DateTime.now()
                                        .toLocal()
                                        .millisecondsSinceEpoch,
                                    dateFormat:
                                        Constants.checklistViewDateFormat,
                                  ),
                                  tenantId: selectedServiceDefinition!.tenantId,
                                  clientId:
                                      widget.beneficiaryClientRefId.toString(),
                                  serviceDefId: selectedServiceDefinition?.id,
                                  attributes: attributes,
                                  rowVersion: 1,
                                  accountId:
                                      RegistrationDeliverySingleton().projectId,
                                  additionalDetails:
                                  {
                                   "boundaryCode": RegistrationDeliverySingleton()
                                        .boundary
                                        ?.code
                                  },
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        DateTime.now().millisecondsSinceEpoch,
                                  ),
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        DateTime.now().millisecondsSinceEpoch,
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid!,
                                    lastModifiedTime:
                                        DateTime.now().millisecondsSinceEpoch,
                                  ),
                                ),
                              ),
                            );

                        DigitDialog.show<bool>(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(i18
                                .deliverIntervention
                                .beneficiaryChecklistDialogTitle),
                            titlePadding: const EdgeInsets.only(top: kPadding),
                            barrierDismissible: false,
                            enableRecordPast: true,
                            dialogPadding: const EdgeInsets.fromLTRB(
                              kPadding,
                              kPadding,
                              kPadding,
                              0,
                            ),
                            contentPadding: EdgeInsets.zero,
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.common.coreCommonYes,
                              ),
                              action: (ctx) {
                                Navigator.of(ctx).pop();
                                ctx.router.push(
                                  DeliverInterventionRoute(),
                                );
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.common.coreCommonNo,
                              ),
                              action: (ctx) {
                                Navigator.of(ctx).pop();
                                ctx.router.push(
                                  RefusedDeliveryRoute(),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      child: Text(
                        localizations.translate(i18.common.coreCommonSubmit),
                      ),
                    ),
                  ),
                  children: [
                    Form(
                      key: checklistFormKey, //assigning key to form
                      child: DigitCard(
                        padding: EdgeInsets.zero,
                        child: Column(children: [
                          ...initialAttributes!.map((
                            e,
                          ) {
                            int index = (initialAttributes ?? []).indexOf(e);

                            return Column(children: [
                              if (e.dataType == 'String' &&
                                  !(e.code ?? '').contains('.')) ...[
                                DigitTextField(
                                  onChange: (value) {
                                    checklistFormKey.currentState?.validate();
                                  },
                                  isRequired: false,
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
                                    '${selectedServiceDefinition?.code}.${e.code}',
                                  ),
                                ),
                              ] else if (e.dataType == 'Number' &&
                                  !(e.code ?? '').contains('.')) ...[
                                DigitTextField(
                                  onChange: (value) {
                                    checklistFormKey.currentState?.validate();
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
                                              .translate("${e.code}_REGEX");
                                    }

                                    return null;
                                  },
                                  controller: controller[index],
                                  label: '${localizations.translate(
                                        '${value.selectedServiceDefinition?.code}.${e.code}',
                                      ).trim()} ${e.required == true ? '*' : ''}',
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
                                    return Column(
                                      children: e.values!
                                          .map((e) => DigitCheckboxTile(
                                                label: e,
                                                value: controller[index]
                                                    .text
                                                    .split('.')
                                                    .contains(e),
                                                onChanged: (value) {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceChecklistEvent(
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
                              ] else if (e.dataType == 'Boolean') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
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
                                              errorMessage: (!validFields &&
                                                      (controller[index].text ==
                                                          ''))
                                                  ? localizations.translate(i18
                                                      .common
                                                      .corecommonRequired)
                                                  : null,
                                              initialSelection:
                                                  controller[index].text ==
                                                          'true'
                                                      ? [true]
                                                      : controller[index]
                                                                  .text ==
                                                              'false'
                                                          ? [false]
                                                          : [],
                                              options: const [true, false],
                                              onSelectionChanged: (curValue) {
                                                if (curValue.isNotEmpty) {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceChecklistEvent(
                                                          value: curValue
                                                              .toString(),
                                                          submitTriggered:
                                                              submitTriggered,
                                                        ),
                                                      );
                                                  setState(() {
                                                    controller[index].value =
                                                        TextEditingValue(
                                                      text: curValue.first
                                                          .toString(),
                                                    );
                                                  });
                                                } else {
                                                  controller[index].value =
                                                      const TextEditingValue(
                                                    text: '',
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
}
