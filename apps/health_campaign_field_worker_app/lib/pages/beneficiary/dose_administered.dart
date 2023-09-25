import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/molecules/digit_table.dart';
import 'package:digit_components/widgets/molecules/digit_table_card.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/project/project.dart';
import '../../models/entities/product_variant.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class DoseAdministeredPage extends LocalizedStatefulWidget {
  const DoseAdministeredPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<DoseAdministeredPage> createState() => _DoseAdministeredPageState();
}

class _DoseAdministeredPageState extends LocalizedState<DoseAdministeredPage> {
  static const _doseAdministeredKey = 'doseAdministered';
  bool doseAdministered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;

    final headerListResource = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
        cellKey: 'resources',
      ),
    ];

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) => ScrollableContent(
          header: const Column(children: [
            BackNavigationHelpHeaderWidget(),
          ]),
          footer: SizedBox(
            height: 85,
            child: DigitCard(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
              child: DigitElevatedButton(
                onPressed: () {
                  router.push(DeliverInterventionRoute());
                },
                child: Center(
                  child: Text(
                    localizations.translate(i18.common.coreCommonNext),
                  ),
                ),
              ),
            ),
          ),
          children: [
            DigitCard(
              child: Column(
                children: [
                  Text(
                    localizations.translate(
                      i18.deliverIntervention.wasTheDoseAdministered,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                  DigitRadioButtonList<KeyValue>(
                    labelStyle:
                        DigitTheme.instance.mobileTheme.textTheme.headlineSmall,
                    formControlName: _doseAdministeredKey,
                    valueMapper: (val) => localizations.translate(val.label),
                    options: Constants.yesNo,
                    isRequired: true,
                    onValueChange: (val) {
                      setState(() {
                        doseAdministered = val.key;
                      });
                    },
                  ),
                ],
              ),
            ),
            DigitCard(
              child: Column(
                children: [
                  Text(
                    localizations.translate(
                      i18.beneficiaryDetails.reourcesTobeProvided,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                  DigitTableCard(
                    element: {
                      localizations.translate(
                        i18.beneficiaryDetails.beneficiaryAge,
                      ): "2",
                    },
                  ),
                  const Divider(),
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, projectState) {
                      final bloc =
                          context.read<DeliverInterventionBloc>().state;
                      int getCurrentCycle = bloc.cycle;
                      int getCurrentDose = bloc.dose;
                      List<ProductVariantModel>? variant;

                      List<TableDataRow> tableDataRows = projectState
                          .projectType!.cycles![getCurrentCycle].deliveries!
                          .asMap()
                          .entries
                          .where((entry) => entry.key >= getCurrentDose)
                          .where((entry) =>
                              entry.value.deliveryStrategy == "INDIRECT")
                          .map((entry) {
                        int doseIndex =
                            entry.key + 1; // Adjusting for 1-based indexing

                        return TableDataRow([
                          TableData(
                            'Dose $doseIndex',
                            cellKey: 'dose',
                          ),
                          TableData(
                            entry.value.productVariants
                                    ?.map((e) => e.productVariantId)
                                    .toList()
                                    .join(
                                      "+",
                                    ) ??
                                "",
                            cellKey: 'resources',
                          ),
                        ]);
                      }).toList();

                      return DigitTable(
                        headerList: headerListResource,
                        tableData:
                            tableDataRows, // Use the updated tableDataRows

                        leftColumnWidth: 130,
                        rightColumnWidth: headerListResource.length * 17 * 6,
                        height: MediaQuery.of(context).size.height / 5,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{
      _doseAdministeredKey: FormControl<KeyValue>(value: null),
    });
  }
}
