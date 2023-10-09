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

  return SizedBox(
    // [TODO - need to set the height of the card based on the number of items]
    height: 280,
    width: 500,
    child: BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        // BlocBuilder to get project data based on the current cycle and dose
        final item = fetchDeliveries(
          projectState.projectType!.cycles![currentCycle - 1].deliveries,
          individualModel,
        )![currentDose - 1];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DigitTableCard(
              element: {
                localizations.translate(
                  i18.beneficiaryDetails.beneficiaryAge,
                  //[TODO: Condition need to be handled in generic way,]
                ): '${item.doseCriteria?.condition?.split('<=age<').first} - ${item.doseCriteria?.condition?.split('<=age<').last} months',
              },
            ),
            // const Divider(),

            // Build the DigitTable with the data
            DigitTable(
              headerList: headerListResource,
              tableData: [
                ...item.doseCriteria!.productVariants!.map(
                  (e) {
                    // Retrieve the SKU value for the product variant.
                    final value = variant!
                        .firstWhere(
                          (element) => element.id == e.productVariantId,
                        )
                        .sku;

                    return TableDataRow([
                      // Display the dose information in the first column if it's the first row,
                      // otherwise, display an empty cell.

                      item.doseCriteria?.productVariants?.indexOf(e) == 0
                          ? TableData(
                              'Dose ${deliverInterventionState.dose}',
                              cellKey: 'dose',
                            )
                          : TableData(''),
                      // Display the SKU value in the second column.
                      TableData(
                        localizations.translate(value.toString()),
                        cellKey: 'resources',
                      ),
                    ]);
                  },
                ),
              ],
              leftColumnWidth: 130,
              rightColumnWidth: headerListResource.length * 20 * 5,
              height:
                  ((item.doseCriteria?.productVariants ?? []).length + 1) * 60,
            ),
          ],
        );
      },
    ),
  );
}
