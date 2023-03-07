import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/facility/facility.dart';
import '../../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../../data/network_manager.dart';
import '../../../models/data_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/facility_wrapper/facility_wrapper.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class StockReconciliationPage extends LocalizedStatefulWidget {
  const StockReconciliationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockReconciliationPage> createState() =>
      _StockReconciliationPageState();
}

class _StockReconciliationPageState
    extends LocalizedState<StockReconciliationPage> {
  static const _facilityKey = 'facility';
  static const _productVariantKey = 'productVariant';

  FormGroup _form() {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<MenuItemModel>(
        validators: [Validators.required],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final networkManager = context.read<NetworkManager>();

    return FacilityBlocWrapper(
      child: BlocBuilder<StockReconciliationBloc, StockReconciliationState>(
        bloc: StockReconciliationBloc(
          stockRepository:
              networkManager.repository<StockModel, StockSearchModel>(context),
          stockReconciliationRepository: networkManager.repository<
              StockReconciliationModel,
              StockReconciliationSearchModel>(context),
          StockReconciliationState(
            dateOfReconciliation: DateTime.now(),
          ),
        ),
        builder: (ctx, stockState) {
          return ReactiveFormBuilder(
            form: _form,
            builder: (context, form, child) {
              return Scaffold(
                body: ScrollableContent(
                  header: Column(children: const [
                    BackNavigationHelpHeaderWidget(),
                  ]),
                  footer: SizedBox(
                    height: 90,
                    child: DigitCard(
                      child: DigitElevatedButton(
                        onPressed: !form.valid
                            ? null
                            : () {
                                form.markAllAsTouched();
                                if (!form.valid) return;
                              },
                        child: Center(
                          child: Text(
                            localizations.translate(
                              i18.common.coreCommonSubmit,
                            ),
                          ),
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
                              i18.stockReconciliationDetails
                                  .reconciliationPageTitle,
                            ),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          BlocBuilder<FacilityBloc, FacilityState>(
                            builder: (context, state) {
                              return DigitSearchDropdown<FacilityModel>(
                                label: localizations.translate(
                                  i18.stockReconciliationDetails.facilityLabel,
                                ),
                                // onChanged: (value) {
                                //   ctx.read<StockReconciliationBloc>().add(
                                //         StockReconciliationSelectFacilityEvent(
                                //           value,
                                //         ),
                                //       );
                                // },
                                suggestionsCallback: (items, pattern) {
                                  return items
                                      .where((e) => e.id.contains(pattern));
                                },
                                menuItems: state.maybeWhen(
                                  orElse: () => [],
                                  fetched: (facilities) => facilities,
                                ),
                                formControlName: _facilityKey,
                                valueMapper: (value) => value.id,
                              );
                            },
                          ),
                          DigitDropdown<MenuItemModel>(
                            formControlName: _productVariantKey,
                            label: localizations.translate(
                              i18.stockReconciliationDetails.productLabel,
                            ),
                            onChanged: (value) {
                              ctx.read<StockReconciliationBloc>().add(
                                    StockReconciliationSelectProductEvent(
                                      value.code,
                                    ),
                                  );
                            },
                            valueMapper: (value) {
                              return localizations.translate(value.name);
                            },
                            menuItems: tempProductVariants,
                            validationMessages: {
                              'required': (object) => 'Field is required',
                            },
                          ),
                          DigitTableCard(
                            fraction: 2.5,
                            gap: kPadding,
                            element: {
                              localizations.translate(i18
                                      .stockReconciliationDetails
                                      .dateOfReconciliation):
                                  DateFormat('dd MMMM yyyy').format(
                                stockState.dateOfReconciliation,
                              ),
                            },
                          ),
                          const DigitDivider(),
                          DigitTableCard(
                            element: {
                              localizations.translate(i18
                                  .stockReconciliationDetails
                                  .stockReceived): stockState.stockReceived,
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
