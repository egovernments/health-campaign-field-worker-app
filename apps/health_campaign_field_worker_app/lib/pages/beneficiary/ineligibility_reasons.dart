import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class IneligibilityReasonsPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final String projectBeneficiaryClientRefId;
  final IndividualModel individual;

  const IneligibilityReasonsPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
    required this.projectBeneficiaryClientRefId,
    required this.individual,
  });

  @override
  State<IneligibilityReasonsPage> createState() =>
      _IneligibilityReasonsPageState();
}

class _IneligibilityReasonsPageState
    extends LocalizedState<IneligibilityReasonsPage> {
  List<bool> ineleigibilityReasonValues = [];
  List<String> ineleigibilityReasons = [];
  bool stateChanged = false;
  bool reasonsSelected = true;
  static const _ineligibleReason = "ineligibleReason";
  bool isReasonSubmitted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ProductVariantBlocWrapper(
      child: BlocBuilder<ProductVariantBloc, ProductVariantState>(
        builder: (context, productState) {
          return productState.maybeWhen(
            orElse: () => const Offstage(),
            fetched: (productVariants) {
              return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                builder: (context, state) {
                  return BlocBuilder<DeliverInterventionBloc,
                      DeliverInterventionState>(
                    builder: (context, deliveryState) {
                      return Scaffold(
                        body: state.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ReactiveFormBuilder(
                                form: buildForm,
                                builder: (context, form, child) =>
                                    ScrollableContent(
                                  header: const BackNavigationHelpHeaderWidget(
                                    showHelp: false,
                                  ),
                                  footer: SizedBox(
                                    height: 120,
                                    child: DigitCard(
                                      child: DigitElevatedButton(
                                        onPressed: isReasonSubmitted
                                            ? null
                                            : () async {
                                                if (form
                                                        .control(
                                                            _ineligibleReason)
                                                        .value !=
                                                    null) {
                                                  setState(() {
                                                    reasonsSelected = true;
                                                  });
                                                  final router = context.router;

                                                  final shouldSubmit =
                                                      await DigitDialog.show<
                                                          bool>(
                                                    context,
                                                    options: DigitDialogOptions(
                                                      titleText: localizations
                                                          .translate(
                                                        i18.ineligibilityReasons
                                                            .dialogTitle,
                                                      ),
                                                      contentText: localizations
                                                          .translate(
                                                        i18.ineligibilityReasons
                                                            .dialogContent,
                                                      ),
                                                      primaryAction:
                                                          DigitDialogActions(
                                                        label: localizations
                                                            .translate(
                                                          i18.common
                                                              .coreCommonSubmit,
                                                        ),
                                                        action: (ctx) {
                                                          isReasonSubmitted =
                                                              true;
                                                          final dynamic reason =
                                                              form
                                                                  .control(
                                                                    _ineligibleReason,
                                                                  )
                                                                  .value;

                                                          final clientReferenceId =
                                                              IdGen
                                                                  .i.identifier;
                                                          context
                                                              .read<
                                                                  DeliverInterventionBloc>()
                                                              .add(
                                                                DeliverInterventionSubmitEvent(
                                                                  TaskModel(
                                                                    projectBeneficiaryClientReferenceId:
                                                                        widget
                                                                            .projectBeneficiaryClientRefId,
                                                                    clientReferenceId:
                                                                        clientReferenceId,
                                                                    tenantId: envConfig
                                                                        .variables
                                                                        .tenantId,
                                                                    rowVersion:
                                                                        1,
                                                                    auditDetails:
                                                                        AuditDetails(
                                                                      createdBy:
                                                                          context
                                                                              .loggedInUserUuid,
                                                                      createdTime:
                                                                          context
                                                                              .millisecondsSinceEpoch(),
                                                                    ),
                                                                    projectId:
                                                                        context
                                                                            .projectId,
                                                                    status: Status
                                                                        .beneficiaryIneligible
                                                                        .toValue(),
                                                                    clientAuditDetails:
                                                                        ClientAuditDetails(
                                                                      createdBy:
                                                                          context
                                                                              .loggedInUserUuid,
                                                                      createdTime:
                                                                          context
                                                                              .millisecondsSinceEpoch(),
                                                                      lastModifiedBy:
                                                                          context
                                                                              .loggedInUserUuid,
                                                                      lastModifiedTime:
                                                                          context
                                                                              .millisecondsSinceEpoch(),
                                                                    ),
                                                                    additionalFields:
                                                                        TaskAdditionalFields(
                                                                      version:
                                                                          1,
                                                                      fields: [
                                                                        AdditionalField(
                                                                          'taskStatus',
                                                                          Status
                                                                              .beneficiaryIneligible
                                                                              .toValue(),
                                                                        ),
                                                                        AdditionalField(
                                                                          'ineligibleReasons',
                                                                          reason
                                                                              .toString(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    address: widget
                                                                        .individual
                                                                        .address
                                                                        ?.first
                                                                        .copyWith(
                                                                      relatedClientReferenceId:
                                                                          clientReferenceId,
                                                                      id: null,
                                                                    ),
                                                                  ),
                                                                  false,
                                                                  context
                                                                      .boundary,
                                                                ),
                                                              );
                                                          Navigator.of(
                                                            context,
                                                            rootNavigator: true,
                                                          ).pop(true);
                                                        },
                                                      ),
                                                      secondaryAction:
                                                          DigitDialogActions(
                                                        label: localizations
                                                            .translate(
                                                          i18.common
                                                              .coreCommonCancel,
                                                        ),
                                                        action: (context) =>
                                                            Navigator.of(
                                                          context,
                                                          rootNavigator: true,
                                                        ).pop(false),
                                                      ),
                                                    ),
                                                  );

                                                  if (shouldSubmit ?? false) {
                                                    final reloadState =
                                                        context.read<
                                                            HouseholdOverviewBloc>();
                                                    Future.delayed(
                                                      const Duration(
                                                        milliseconds: 1000,
                                                      ),
                                                      () {
                                                        reloadState.add(
                                                          HouseholdOverviewReloadEvent(
                                                            projectId: context
                                                                .projectId,
                                                            projectBeneficiaryType:
                                                                context
                                                                    .beneficiaryType,
                                                          ),
                                                        );
                                                      },
                                                    ).then(
                                                      (value) {
                                                        context.router
                                                            .popAndPush(
                                                          HouseholdAcknowledgementRoute(
                                                            enableViewHousehold:
                                                                true,
                                                          ),
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  setState(() {
                                                    reasonsSelected = false;
                                                  });
                                                }
                                              },
                                        child: Center(
                                          child: Text(
                                            localizations.translate(
                                              i18.common.coreCommonNext,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  children: [
                                    DigitCard(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  localizations.translate(
                                                    i18.ineligibilityReasons
                                                        .ineligibilityReasonsLabel,
                                                  ),
                                                  style: theme
                                                      .textTheme.displayMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '${localizations.translate(
                                                  i18.ineligibilityReasons
                                                      .selectReasonsLabel,
                                                )}*',
                                                style: theme
                                                    .textTheme.headlineSmall,
                                              ),
                                            ),
                                          ),
                                          BlocBuilder<AppInitializationBloc,
                                              AppInitializationState>(
                                            builder: (context, state) =>
                                                state.maybeWhen(
                                              orElse: () => const Offstage(),
                                              initialized:
                                                  (appConfiguration, _) {
                                                final ineleigibilityReasonOptions =
                                                    appConfiguration
                                                            .ineligibilityReasonsSchisto ??
                                                        <IneligibilityReasons>[];
                                                ineleigibilityReasons =
                                                    ineleigibilityReasonOptions
                                                        .map((e) => e.code)
                                                        .toList();

                                                for (var _
                                                    in ineleigibilityReasonOptions) {
                                                  ineleigibilityReasonValues
                                                      .add(false);
                                                }

                                                final List<KeyValue>
                                                    ineleigibilityReasonList =
                                                    (ineleigibilityReasonOptions ??
                                                            [])
                                                        .map(
                                                          (e) => KeyValue(
                                                            e.code,
                                                            e.code,
                                                          ),
                                                        )
                                                        .toList();

                                                return DigitRadioButtonList<
                                                    KeyValue>(
                                                  labelStyle: DigitTheme
                                                      .instance
                                                      .mobileTheme
                                                      .textTheme
                                                      .bodyLarge,
                                                  formControlName:
                                                      _ineligibleReason,
                                                  valueMapper: (val) =>
                                                      localizations
                                                          .translate(val.label),
                                                  options:
                                                      ineleigibilityReasonList,
                                                  isRequired: true,
                                                  errorMessage:
                                                      localizations.translate(
                                                    i18.common
                                                        .corecommonRequired,
                                                  ),
                                                  onValueChange: (val) {
                                                    form
                                                        .control(
                                                          _ineligibleReason,
                                                        )
                                                        .value = val;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Offstage(
                                            offstage: reasonsSelected,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                localizations.translate(
                                                  i18.common
                                                      .coreCommonRequiredItems,
                                                ),
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.error,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _ineligibleReason: FormControl<KeyValue>(value: null),
    });
  }
}
