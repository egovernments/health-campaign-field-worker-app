import 'dart:math';

import 'package:digit_data_model/data/repositories/package_repository/local/stock.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/stock_calculation_utils.dart';
import '../../utils/utils.dart';
import '../localized.dart';

class StockBalanceCard extends LocalizedStatefulWidget {
  const StockBalanceCard({super.key, super.appLocalizations});

  @override
  State<StockBalanceCard> createState() => _StockBalanceCardState();
}

class _StockBalanceCardState extends LocalizedState<StockBalanceCard> {
  List<FacilityModel> _facilities = [];
  FacilityModel? _selectedFacility;
  List<ProductVariantModel> _productVariants = [];
  Map<String, double> _stockBalances = {};
  double _minThreshold = 100;
  double _maxThreshold = 500;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadThresholds();
    _loadData();
  }

  void _loadThresholds() {
    try {
      context.read<AppInitializationBloc>().state.maybeWhen(
            initialized: (appConfiguration, _, __) {
              try {
                final config = appConfiguration.stockThresholdConfig;
                if (config != null &&
                    config.minThreshold > 0 &&
                    config.maxThreshold > 0) {
                  _minThreshold = config.minThreshold;
                  _maxThreshold = config.maxThreshold;
                }
              } catch (_) {
                // stockThresholdConfig not initialized — use defaults
              }
            },
            orElse: () {},
          );
    } catch (_) {}
  }

  Future<void> _loadData() async {
    try {
      // Get project facilities
      final projectFacilityRepo = context.read<
          LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();
      final projectFacilities = await projectFacilityRepo.search(
        ProjectFacilitySearchModel(projectId: [context.projectId]),
      );

      // Filter to only show current level facilities
      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      // Get facility details for names
      final facilityIds = currentFacilities.map((pf) => pf.facilityId).toList();
      final facilityRepo =
          context.read<LocalRepository<FacilityModel, FacilitySearchModel>>();
      final facilities = await facilityRepo.search(
        FacilitySearchModel(id: facilityIds),
      );

      // Get project resources to know which product variants
      final projectResourceRepo = context.read<
          LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>>();
      final projectResources = await projectResourceRepo.search(
        ProjectResourceSearchModel(projectId: [context.projectId]),
      );

      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();

      // Get product variant details for display names
      final productVariantRepo = context.read<
          LocalRepository<ProductVariantModel, ProductVariantSearchModel>>();
      final productVariants = await productVariantRepo.search(
        ProductVariantSearchModel(id: productVariantIds),
      );

      if (!mounted) return;

      final previousFacilityId = _selectedFacility?.id;
      final autoSelectedFacility = facilities.isNotEmpty
          ? (previousFacilityId != null
              ? facilities.firstWhere(
                  (f) => f.id == previousFacilityId,
                  orElse: () => facilities.first,
                )
              : facilities.first)
          : null;

      setState(() {
        _facilities = facilities;
        _productVariants = productVariants;
        _selectedFacility = autoSelectedFacility;
        _isLoading = false;
      });

      if (autoSelectedFacility != null) {
        _setupStockListener(autoSelectedFacility.id);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _setupStockListener(String facilityId) {
    final stockRepo =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;

    stockRepo.listenToChanges(
      query: StockSearchModel(receiverId: [facilityId]),
      listener: (receivedStocks) async {
        if (!mounted) return;

        // Also fetch sent stocks to calculate complete balance
        final sentStocks = await stockRepo.search(
          StockSearchModel(senderId: facilityId),
        );

        // Deduplicate by clientReferenceId
        final allStocksMap = <String, StockModel>{};
        for (final stock in receivedStocks) {
          allStocksMap[stock.clientReferenceId] = stock;
        }
        for (final stock in sentStocks) {
          allStocksMap[stock.clientReferenceId] = stock;
        }
        final allStocks = allStocksMap.values.toList();

        final productIds = _productVariants.map((pv) => pv.id).toList();
        final balances = StockCalculationUtils.calculateStockInHandForProducts(
          stockList: allStocks,
          facilityId: facilityId,
          productIds: productIds,
          loggedInUserUuid: context.loggedInUserUuid,
        );

        if (mounted) {
          setState(() {
            _stockBalances = balances;
          });
        }
      },
    );
  }

  Color _getColorForBalance(double balance) {
    if (balance < _minThreshold) return Colors.red;
    if (balance > _maxThreshold) return const Color(0xFF0B6623);
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading || _productVariants.isEmpty) {
      return const SizedBox.shrink();
    }

    return DigitCard(
      margin: const EdgeInsets.all(spacer2),
      children: [
        // Facility selector (only show if multiple facilities)
        if (_facilities.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: spacer2),
            child: DigitDropdown(
              emptyItemText: localizations.translate('NO_FACILITIES_FOUND'),
              items: _facilities
                  .map((f) => DropdownItem(
                        name: localizations.translate(f.id),
                        code: f.id,
                      ))
                  .toList(),
              selectedOption: _selectedFacility != null
                  ? DropdownItem(
                      name: localizations.translate(_selectedFacility!.id),
                      code: _selectedFacility!.id,
                    )
                  : null,
              onSelect: (value) {
                final selected = _facilities.firstWhere(
                  (f) => f.id == value.code,
                );
                setState(() {
                  _selectedFacility = selected;
                });
                _setupStockListener(selected.id);
              },
            ),
          ),

        // Title
        Padding(
          padding: const EdgeInsets.only(bottom: spacer1),
          child: Center(
            child: Text(
              localizations.translate(i18.home.stockBalanceLabel),
              style: theme.digitTextTheme(context).bodyL.copyWith(
                color: theme.colorTheme.text.primary
              ),
            ),
          ),
        ),

        // Per-commodity stock balance bars
        ..._productVariants.map((product) {
          final balance = _stockBalances[product.id] ?? 0.0;
          final color = _getColorForBalance(balance);
          final progress =
              _maxThreshold > 0 ? min(balance / _maxThreshold, 1.0) : 0.0;
          final displayName =
              localizations.translate(product.sku ?? product.id);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: spacer1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: max(progress, 0.0),
                  backgroundColor: theme.colorTheme.generic.background,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 7.0,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(spacer1),
                    left: Radius.circular(spacer1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: spacer1),
                  child: Text(
                    '${balance.toInt()} $displayName',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
