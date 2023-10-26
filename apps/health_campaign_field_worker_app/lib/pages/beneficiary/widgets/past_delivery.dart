import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/project/project.dart';
import '../../../models/data_model.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';

// This function builds a table with the given data and headers
Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<ProductVariantModel>? variant,
  IndividualModel? individualModel,
) {
  // Calculate the current cycle. If deliverInterventionState.cycle is negative, set it to 0.
  final currentCycle =
      deliverInterventionState.cycle >= 0 ? deliverInterventionState.cycle : 0;

  // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
  final currentDose =
      deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;
  final localizations = AppLocalizations.of(context);

  // Defining a list of table headers for resource popup
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

  return Container(
    padding: const EdgeInsets.only(
      left: kPadding,
      bottom: kPadding,
      right: kPadding,
      top: kPadding / 2,
    ),
    // [TODO - need to set the height of the card based on the number of items]
    height: MediaQuery.of(context).size.height / 3.6,
    width: MediaQuery.of(context).size.width / 1.25,
    child: BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        // BlocBuilder to get project data based on the current cycle and dose
        final item = projectState.projectType!.cycles![currentCycle - 1]
            .deliveries![currentDose - 1];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            DigitTableCard(
              topPadding: const EdgeInsets.only(top: 0.0),
              padding: const EdgeInsets.only(bottom: kPadding / 2),
              fraction: 2.5,
              element: {
                localizations.translate(
                  i18.beneficiaryDetails.beneficiaryAge,
                  //[TODO: Condition need to be handled in generic way,]
                ): '${fetchProductVariant(item, individualModel)?.condition?.split('<=age<').first} - ${fetchProductVariant(item, individualModel)?.condition?.split('<=age<').last} months',
              },
            ),
            const Divider(),
            // Build the DigitTable with the data
            DigitTable(
              headerList: headerListResource,
              tableData: [
                ...fetchProductVariant(item, individualModel)!
                    .productVariants!
                    .map(
                  (e) {
                    // Retrieve the SKU value for the product variant.
                    final value = variant!
                        .firstWhere(
                          (element) => element.id == e.productVariantId,
                        )
                        .sku;
                    final quantity = e.quantity;

                    return TableDataRow([
                      // Display the dose information in the first column if it's the first row,
                      // otherwise, display an empty cell.

                      fetchProductVariant(item, individualModel)!
                                  .productVariants
                                  ?.indexOf(e) ==
                              0
                          ? TableData(
                              '${localizations.translate(i18.beneficiaryDetails.beneficiaryDeliveryText)} ${deliverInterventionState.dose}',
                              cellKey: 'dose',
                            )
                          : TableData(''),
                      // Display the SKU value in the second column.
                      TableData(
                        '$quantity - ${localizations.translate(value.toString())}',
                        cellKey: 'resources',
                      ),
                    ]);
                  },
                ),
              ],
              columnWidth: 140,
              height: ((fetchProductVariant(item, individualModel)!
                                  .productVariants ??
                              [])
                          .length +
                      1) *
                  59.5,
            ),
          ],
        );
      },
    ),
  );
}
