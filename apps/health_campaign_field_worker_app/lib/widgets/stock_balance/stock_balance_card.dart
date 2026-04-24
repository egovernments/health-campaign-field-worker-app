import 'dart:math';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/stock.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../models/entities/roles_type.dart';
import '../../utils/function_registries.dart';
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
  bool _isDistributor = false;

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
      // Check if user is a distributor
      final isDistributor = context.loggedInUserRoles
          .any((role) => role.code == RolesType.distributor.toValue());

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
        _isDistributor = isDistributor;
      });

      // Distributors always use their UUID; others use facility ID
      final effectiveFacilityId =
          isDistributor ? context.loggedInUserUuid : autoSelectedFacility?.id;

      if (effectiveFacilityId != null) {
        // Load UserAction balances first (from deliveries) so UI shows them immediately
        _loadInitialBalances(effectiveFacilityId);
        _setupStockListener(effectiveFacilityId);
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
    final userActionRepo = context.read<UserActionLocalRepository>();

    final isDistributor = _isDistributor;
    final effectiveFacilityId =
        isDistributor ? context.loggedInUserUuid : facilityId;

    // Build balance keys for UserAction listener
    final balanceKeys = _productVariants
        .map((pv) => generateBalanceKey(effectiveFacilityId, pv.id))
        .toList();

    // Listen to StockModel changes
    stockRepo.listenToChanges(
      query: StockSearchModel(receiverId: facilityId),
      listener: (receivedStocks) async {
        if (!mounted) return;
        await _refreshBalances(stockRepo, userActionRepo, effectiveFacilityId);
      },
    );

    // Listen to UserAction changes (triggers when delivery creates/updates balance)
    if (balanceKeys.isNotEmpty) {
      userActionRepo.listenToChanges(
        clientReferenceIds: balanceKeys,
        listener: (actions) async {
          if (!mounted) return;
          await _refreshBalances(
              stockRepo, userActionRepo, effectiveFacilityId);
        },
      );
    }
  }

  Future<void> _loadInitialBalances(String effectiveFacilityId) async {
    final stockRepo =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;
    final userActionRepo = context.read<UserActionLocalRepository>();
    await _refreshBalances(stockRepo, userActionRepo, effectiveFacilityId);
  }

  Future<void> _refreshBalances(
    StockLocalRepository stockRepo,
    UserActionLocalRepository userActionRepo,
    String effectiveFacilityId,
  ) async {
    if (!mounted) return;

    // Fetch all stocks for this facility
    final receivedStocks = await stockRepo.search(
      StockSearchModel(receiverId: effectiveFacilityId),
    );
    final sentStocks = await stockRepo.search(
      StockSearchModel(senderId: effectiveFacilityId),
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
      facilityId: effectiveFacilityId,
      productIds: productIds,
      loggedInUserUuid: context.loggedInUserUuid,
      isDistributor: _isDistributor,
    );

    // Fetch UserAction records with saved stock balances (from delivery)
    final userActionBalances =
        await _loadUserActionBalances(userActionRepo, effectiveFacilityId);

    // Merge: UserAction balances take precedence (they include delivery deductions)
    final mergedBalances = <String, double>{
      ...balances,
      ...userActionBalances,
    };

    StockBalanceCache.instance.setCache(effectiveFacilityId, mergedBalances);
    if (mounted) {
      setState(() {
        _stockBalances = mergedBalances;
      });
    }
  }

  Future<Map<String, double>> _loadUserActionBalances(
    UserActionLocalRepository userActionRepo,
    String facilityId,
  ) async {
    final balances = <String, double>{};

    try {
      // Build balance keys for this facility
      final balanceKeys = _productVariants
          .map((pv) => generateBalanceKey(facilityId, pv.id))
          .toList();

      if (balanceKeys.isEmpty) return balances;

      // Search directly with clientReferenceIds
      final actions = await userActionRepo.search(
        UserActionSearchModel(clientReferenceId: balanceKeys),
      );

      for (final action in actions) {
        final fields = action.additionalFields?.fields;
        if (fields == null) continue;

        final productVariantId =
            fields.firstWhereOrNull((f) => f.key == 'productVariantId')?.value;
        final balanceStr =
            fields.firstWhereOrNull((f) => f.key == 'balance')?.value;

        if (productVariantId != null && balanceStr != null) {
          final balance = double.tryParse(balanceStr);
          if (balance != null) {
            balances[productVariantId] = balance;
          }
        }
      }
    } catch (e) {
      debugPrint('Error loading UserAction balances: $e');
    }

    return balances;
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
        // Facility selector (only show if multiple facilities and not distributor)
        if (_facilities.length > 1 && !_isDistributor)
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
              style: theme
                  .digitTextTheme(context)
                  .bodyL
                  .copyWith(color: theme.colorTheme.text.primary),
            ),
          ),
        ),

        // Per-commodity stock balance bars
        ..._productVariants.map((product) {
          final balance = max(_stockBalances[product.id] ?? 0.0, 0.0);
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
