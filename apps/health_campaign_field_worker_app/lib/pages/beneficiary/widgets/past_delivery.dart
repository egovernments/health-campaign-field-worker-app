import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/project/project.dart';
import '../../../models/entities/product_variant.dart';
import '../../../utils/i18_key_constants.dart' as i18;

Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<TableHeader> headerListResource,
  List<ProductVariantModel>? variant,
) {
  final currentCycle = deliverInterventionState.cycle;
  final currentDose =
      deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;
  final localizations = AppLocalizations.of(context);

  return SizedBox(
    height: 400,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
            final item = projectState
                .projectType!.cycles![currentCycle].deliveries![currentDose];
            final tableData =
                item.productVariants?.asMap().entries.map((entry) {
              final index = entry.key;
              final productVariant = entry.value;
              final value = variant
                  ?.where((element) =>
                      element.id == productVariant.productVariantId)
                  .firstOrNull
                  ?.id;

              final rowTableData = [
                TableData(
                  index == 0
                      ? 'Dose ${projectState.projectType!.cycles![currentCycle].deliveries!.indexOf(item) + 1}'
                      : '',
                  cellKey: 'dose',
                ),
                TableData(
                  value.toString(),
                  cellKey: 'resources',
                ),
              ];

              return TableDataRow(
                rowTableData,
              );
            }).toList();

            return DigitTable(
              headerList: headerListResource,
              tableData: tableData ?? [],
              leftColumnWidth: 130,
              rightColumnWidth: headerListResource.length * 17 * 5,
              height: ((item.productVariants ?? []).length + 1) * 57,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            );
          },
        ),
      ],
    ),
  );
}
