import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dob_picker.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/utils/utils.dart';

import '../router/app_router.dart';

class CustomScanner extends StatelessWidget {
  const CustomScanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DigitScannerBloc, DigitScannerState>(
      listener: (context, state) {
        if(state.qrCodes.isNotEmpty) {
          context.read<FormsBloc>().add(
            FormsEvent.updateField(
              key: 'scanner',
              value: state.qrCodes.first,
            ),
          );
        }
      },
      builder: (context, state) {

        final formState = context.read<FormsBloc>().state;

        final scannerLabel = getScannerLabel(formState.schema, 'scanner');
        return state.qrCodes.isNotEmpty ?
        LabelValueSummary(
          withDivider: false,
          items: [
            LabelValueItem(
              label: 'Voucher code',
              value: state.qrCodes.first,
              labelFlex: 5,
              padding: EdgeInsets.zero,
            ),
          ],
        )
            : DigitButton(
          size: DigitButtonSize.large,
          label: scannerLabel ?? 'scanner',
          onPressed: () async {
            context.read<DigitScannerBloc>().add(
              const DigitScannerEvent.handleScanner(),
            );
            context.router.push(DigitScannerRoute(
              quantity: 1,
              isGS1code: false,
              singleValue: true,
            ));
          },
          type: DigitButtonType.secondary,
          prefixIcon: Icons.qr_code,
          mainAxisSize: MainAxisSize.max,
        );
      }
    );
  }
}


