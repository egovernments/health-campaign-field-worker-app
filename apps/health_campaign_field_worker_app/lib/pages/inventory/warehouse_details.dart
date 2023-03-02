import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../manage_stocks.dart';

class WarehouseDetailsPage extends LocalizedStatefulWidget {
  final StockDetailsPage stockDetailsPage;

  const WarehouseDetailsPage({
    required this.stockDetailsPage,
    super.key,
    super.appLocalizations,
  });

  @override
  State<WarehouseDetailsPage> createState() => _WarehouseDetailsPageState();
}

class _WarehouseDetailsPageState extends LocalizedState<WarehouseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: SizedBox(
              height: 90,
              child: DigitCard(
                child: DigitElevatedButton(
                  onPressed: () {
                    if (form.valid) {
                      // TODO: Complete implementation
                      switch (widget.stockDetailsPage) {
                        case StockDetailsPage.received:
                          context.router.push(StockReceivedDetailsRoute());
                          break;
                        case StockDetailsPage.issued:
                          context.router.push(StockIssuedDetailsRoute());
                          break;
                        case StockDetailsPage.returned:
                          context.router.push(StockReturnedDetailsRoute());
                          break;
                        case StockDetailsPage.damaged:
                          context.router.push(StockDamagedDetailsRoute());
                          break;
                        case StockDetailsPage.lost:
                          context.router.push(StockLostDetailsRoute());
                          break;
                      }
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                  child: Center(
                    child: Text(localizations
                        .translate(i18.householdDetails.actionLabel)),
                  ),
                ),
              ),
            ),
            children: [
              DigitCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      localizations.translate(
                        i18.warehouseDetails.warehouseDetailsLabel,
                      ),
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitDateFormPicker(
                        isEnabled: false,
                        formControlName: 'dateOfReceipt',
                        label: localizations.translate(
                          i18.warehouseDetails.dateOfReceipt,
                        ),
                        isRequired: false,
                      ),
                      DigitTextFormField(
                        formControlName: 'administrativeUnit',
                        label: localizations.translate(
                          i18.warehouseDetails.administrativeUnit,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    DigitDropdown(
                      label: localizations.translate(
                        i18.warehouseDetails.warehouseNameId,
                      ),
                      initialValue: '',
                      menuItems: [MenuItemModel('', '')],
                      onChanged: (value) {
                        // TODO: Complete implementation
                      },
                      formControlName: 'warehouseName',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        'dateOfReceipt': FormControl<DateTime>(value: DateTime.now()),
        'administrativeUnit': FormControl<String>(value: ''),
        'warehouseName': FormControl<String>(value: ''),
      });
}
