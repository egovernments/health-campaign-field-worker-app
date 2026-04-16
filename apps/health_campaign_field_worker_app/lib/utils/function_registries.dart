import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/entities/roles_type.dart';
import 'extensions/extensions.dart';

class FunctionRegistries {
  final BuildContext context;

  FunctionRegistries(this.context);

  void registerAll() {
    _registerGenerateFunctions();
    _registerInventoryFunctions();
    _registerTransactionFunctions();
    _registerFacilityFunctions();
    _registerStockFunctions();
    _registerViewTransactionFunctions();
  }

  void _registerGenerateFunctions() {
    FunctionRegistry.register('generateUniqueMaterialNoteNumber',
        (args, stateData) {
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      String userUuid = context.loggedInUserUuid;
      String combinedId = '$userUuid$timestamp';
      List<int> bytes = utf8.encode(combinedId);
      Digest sha256Hash = sha256.convert(bytes);
      String hashString = sha256Hash.toString();
      String uniqueId = hashString.substring(0, 12).toUpperCase();
      String formattedUniqueId = uniqueId.replaceAllMapped(
        RegExp(r'.{1,4}'),
        (match) => '${match.group(0)}-',
      );
      formattedUniqueId =
          formattedUniqueId.substring(0, formattedUniqueId.length - 1);
      if (kDebugMode) {
        print('uniqueId : $formattedUniqueId');
      }
      return formattedUniqueId;
    });
  }

  void _registerInventoryFunctions() {
    FunctionRegistry.register('getQuantityLabel', (args, stateData) {
      if (args.isEmpty) return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';
      final sku = args.first?.toString() ?? '';
      if (sku.trim().toString() == 'SPAQ - 250 mg' ||
          sku.trim().toString() == 'SPAQ - 500 mg') {
        return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';
      }
      return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';
    });

    FunctionRegistry.register('getStockQuantityLabel', (args, stateData) {
      if (args.isEmpty) return 'APPONE_INVENTORY_QUANTITY_LABEL';
      final stockEntryType = args.first?.toString().toUpperCase() ?? '';
      const labels = {
        'RECEIPT': 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL',
        'RETURNED': 'APPONE_INVENTORY_QUANTITY_RETURNED_LABEL',
        'ISSUED': 'APPONE_INVENTORY_QUANTITY_SENT_LABEL',
        'DISPATCH': 'APPONE_INVENTORY_QUANTITY_SENT_LABEL',
        'LOSS': 'APPONE_INVENTORY_QUANTITY_LOST_LABEL',
        'DAMAGED': 'APPONE_INVENTORY_QUANTITY_DAMAGED_LABEL'
      };
      return labels[stockEntryType] ?? 'APPONE_INVENTORY_QUANTITY_LABEL';
    });

    FunctionRegistry.register('getReportTitle', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';
      const titles = {
        'receipt': 'INVENTORY_REPORT_DETAILS_RECEIPT_REPORT_TITLE',
        'dispatch': 'INVENTORY_REPORT_DETAILS_DISPATCH_REPORT_TITLE',
        'returned': 'INVENTORY_REPORT_DETAILS_RETURNED_REPORT_TITLE',
        'damage': 'INVENTORY_REPORT_DETAILS_DAMAGE_REPORT_TITLE',
        'loss': 'INVENTORY_REPORT_DETAILS_LOSS_REPORT_TITLE',
        'reconciliation': 'INVENTORY_REPORT_DETAILS_RECONCILIATION_REPORT_TITLE'
      };
      return titles[reportType] ?? '';
    });

    FunctionRegistry.register('getTransactingPartyLabel', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';
      const labels = {
        'receipt': 'INVENTORY_REPORT_DETAILS_RECEIPT_TRANSACTING_PARTY_LABEL',
        'dispatch': 'INVENTORY_REPORT_DETAILS_DISPATCH_TRANSACTING_PARTY_LABEL',
        'returned': 'INVENTORY_REPORT_DETAILS_RETURNED_TRANSACTING_PARTY_LABEL',
        'damage': 'INVENTORY_REPORT_DETAILS_DAMAGED_TRANSACTING_PARTY_LABEL',
        'loss': 'INVENTORY_REPORT_DETAILS_LOSS_TRANSACTING_PARTY_LABEL'
      };
      return labels[reportType] ?? '';
    });

    FunctionRegistry.register('getTransactingParty', (args, stateData) {
      if (args.length < 2) return '';
      final reportType = args[0]?.toString() ?? '';
      final item = args[1];
      if (item == null) return '';
      if (reportType == 'dispatch') {
        return item['receiverId']?.toString() ??
            item['receiverType']?.toString() ??
            '';
      }
      return item['senderId']?.toString() ??
          item['senderType']?.toString() ??
          '';
    });
  }

  void _registerTransactionFunctions() {
    FunctionRegistry.register('getTransactionType', (args, stateData) {
      if (args.isEmpty) return [];
      final reportType = args.first?.toString() ?? '';
      const types = {
        'receipt': ['RECEIVED'],
        'dispatch': ['DISPATCHED'],
        'returned': ['RECEIVED'],
        'damage': ['DISPATCHED'],
        'loss': ['DISPATCHED']
      };
      return types[reportType] ?? [];
    });

    FunctionRegistry.register('getTransactionReason', (args, stateData) {
      if (args.isEmpty) return [];
      final reportType = args.first?.toString() ?? '';
      const reasons = {
        'receipt': ['RECEIVED'],
        'dispatch': [],
        'returned': ['RETURNED'],
        'damage': ['DAMAGED_IN_STORAGE', 'DAMAGED_IN_TRANSIT'],
        'loss': ['LOST_IN_STORAGE', 'LOST_IN_TRANSIT']
      };
      return reasons[reportType] ?? [];
    });

    FunctionRegistry.register('getStockEntryType', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';
      const entryTypes = {
        'receipt': 'RECEIPT',
        'dispatch': 'ISSUED',
        'returned': 'RETURNED',
        'damage': 'DAMAGED',
        'loss': 'LOSS',
        'excess': 'EXCESS',
        'less': 'LESS',
      };
      return entryTypes[reportType] ?? '';
    });

    FunctionRegistry.register('getSenderOrReceiver', (args, stateData) {
      if (args.isEmpty) return 'receiverId';
      final reportType = args.first?.toString() ?? '';
      const senderTypes = {'dispatch', 'damage', 'loss'};
      return senderTypes.contains(reportType) ? 'senderId' : 'receiverId';
    });

    FunctionRegistry.register('getAuditFilterKey', (args, stateData) {
      if (args.isEmpty) return 'clientCreatedBy';
      final reportType = args.first?.toString() ?? '';
      return reportType == 'receipt' ? 'clientModifiedBy' : 'clientCreatedBy';
    });

    FunctionRegistry.register('getSecondaryType', (args, stateData) {
      if (args.isEmpty) return 'WAREHOUSE';
      final facilityFromWhich = args.first?.toString() ?? '';
      return facilityFromWhich == 'DELIVERY_TEAM' ? 'STAFF' : 'WAREHOUSE';
    });

    FunctionRegistry.register('getTransactionStatusType', (args, stateData) {
      if (args.isEmpty) return 'default';
      final transactionType = args.first?.toString().toUpperCase() ?? '';
      switch (transactionType) {
        case 'DISPATCHED':
          return 'warning';
        case 'RECEIVED':
          return 'success';
        case 'RETURNED':
          return 'info';
        case 'DAMAGED':
        case 'LOSS':
          return 'error';
        default:
          return 'default';
      }
    });
  }

  void _registerFacilityFunctions() {
    FunctionRegistry.register('getUserFacilityId', (args, stateData) {
      final isDistributor = context.loggedInUserRoles
          .where((role) => role.code == RolesType.distributor.toValue())
          .toList()
          .isNotEmpty;
      final isWareHouseMgr = context.loggedInUserRoles
          .where((role) => role.code == RolesType.warehouseManager.toValue())
          .toList()
          .isNotEmpty;
      if (isDistributor && !isWareHouseMgr) {
        return context.loggedInUserUuid ?? '';
      }
      try {
        List<Map<String, dynamic>>? projectFacilities;
        if (stateData?.modelMap != null) {
          projectFacilities = stateData!.modelMap['ProjectFacilityModel'];
        }
        if (projectFacilities == null || projectFacilities.isEmpty) {
          final manageStockState = FlowCrudStateRegistry().get('manageStock');
          final base = manageStockState?.base;
          if (base is CrudStateLoaded) {
            final pfModels = base.results['projectFacility'];
            if (pfModels != null && pfModels.isNotEmpty) {
              projectFacilities = pfModels
                  .whereType<ProjectFacilityModel>()
                  .map((pf) => <String, dynamic>{
                        'facilityId': pf.facilityId,
                      })
                  .toList();
            }
          }
        }
        if (projectFacilities == null || projectFacilities.isEmpty) {
          return '';
        }
        for (var facility in projectFacilities) {
          final facilityId = facility['facilityId']?.toString() ?? '';
          if (facilityId.isNotEmpty) {
            return facilityId;
          }
        }
        return '';
      } catch (e) {
        debugPrint('getUserFacilityId error: $e');
        return '';
      }
    });

    FunctionRegistry.register('getProjectFacilities', (args, stateData) {
      try {
        List<Map<String, dynamic>>? projectFacilities;
        if (stateData?.modelMap != null) {
          projectFacilities = stateData!.modelMap['ProjectFacilityModel'];
        }
        if (projectFacilities == null || projectFacilities.isEmpty) {
          final manageStockState = FlowCrudStateRegistry().get('manageStock');
          final base = manageStockState?.base;
          if (base is CrudStateLoaded) {
            final pfModels = base.results['projectFacility'];
            if (pfModels != null && pfModels.isNotEmpty) {
              projectFacilities = pfModels
                  .whereType<ProjectFacilityModel>()
                  .where((pf) {
                    final facilityLevel = pf.additionalFields?.fields
                        .where((f) => f.key == 'facilityLevel')
                        .firstOrNull
                        ?.value;
                    return facilityLevel == null || facilityLevel == 'current';
                  })
                  .map((pf) => <String, dynamic>{
                        'facilityId': pf.facilityId,
                      })
                  .toList();
            }
          }
        }
        if (projectFacilities == null || projectFacilities.isEmpty) {
          return <Map<String, dynamic>>[];
        }
        final filtered = projectFacilities.where((pf) {
          final additionalFields =
              pf['additionalFields'] as Map<String, dynamic>?;
          if (additionalFields == null) return true;
          final fields = additionalFields['fields'] as List?;
          if (fields == null) return true;
          for (final field in fields) {
            if (field is Map &&
                field['key'] == 'facilityLevel' &&
                field['value'] != null) {
              return field['value'] == 'current';
            }
          }
          return true;
        }).toList();
        return filtered
            .map((pf) => {
                  'code': pf['facilityId']?.toString() ?? '',
                  'name': 'FAC_${pf['facilityId']?.toString() ?? ''}',
                })
            .where((item) => item['code']!.isNotEmpty)
            .toList();
      } catch (e) {
        debugPrint('getProjectFacilities error: $e');
        return <Map<String, dynamic>>[];
      }
    });

    FunctionRegistry.register('getProjectProductVariantIds', (args, stateData) {
      try {
        List<Map<String, dynamic>>? productVariants;
        if (stateData?.modelMap != null) {
          productVariants = stateData!.modelMap['ProductVariantModel'];
        }
        if (productVariants == null || productVariants.isEmpty) {
          final manageStockState = FlowCrudStateRegistry().get('manageStock');
          final base = manageStockState?.base;
          if (base is CrudStateLoaded) {
            final pvModels = base.results['productVariant'];
            if (pvModels != null && pvModels.isNotEmpty) {
              productVariants = pvModels
                  .whereType<ProductVariantModel>()
                  .map((pv) => <String, dynamic>{'id': pv.id})
                  .toList();
            }
          }
        }
        if (productVariants == null || productVariants.isEmpty) {
          return '';
        }
        return productVariants
            .map((pv) => pv['id']?.toString() ?? '')
            .where((id) => id.isNotEmpty)
            .join(',');
      } catch (e) {
        debugPrint('getProjectProductVariantIds error: $e');
        return '';
      }
    });

    FunctionRegistry.register('getFacilityName', (args, stateData) {
      if (args.isEmpty) return '';
      final facilityId = args.first?.toString() ?? '';
      if (facilityId.isEmpty) return '';
      return 'FAC_$facilityId';
    });

    FunctionRegistry.register('hasResults', (args, stateData) {
      if (args.isEmpty) return false;
      final modelKey = args.first?.toString() ?? '';
      if (modelKey.isEmpty || stateData?.modelMap == null) return false;
      final results = stateData!.modelMap[modelKey];
      return results != null && results.isNotEmpty;
    });
  }

  void _registerStockFunctions() {
    FunctionRegistry.register('hasStockForDelivery', (args, stateData) {
      if (args.isEmpty) return true;
      final eligibleProducts = args.first;
      if (eligibleProducts == null) return true;
      List<dynamic> productList = [];
      if (eligibleProducts is List) {
        productList = eligibleProducts;
      } else if (eligibleProducts is Map) {
        productList = [eligibleProducts];
      }
      if (productList.isEmpty) return true;
      final cache = StockBalanceCache.instance;
      if (cache.facilityId.isEmpty) return true;
      final List<Map<String, dynamic>> insufficientProducts = [];
      for (final product in productList) {
        if (product is! Map) continue;
        final productVariantsList = product['ProductVariants'];
        if (productVariantsList is! List) continue;
        for (final variant in productVariantsList) {
          if (variant is! Map) continue;
          final productId = variant['productVariantId']?.toString();
          final productName =
              variant['name']?.toString() ?? productId ?? 'Unknown';
          if (productId == null || productId.isEmpty) continue;
          final quantity =
              double.tryParse(variant['quantity']?.toString() ?? '1') ?? 1.0;
          final key = productId;
          final balance = cache.cache[key] ?? 0.0;
          if (balance < quantity) {
            insufficientProducts.add({
              'name': productName,
              'required': quantity,
              'available': balance,
            });
          }
        }
      }
      if (insufficientProducts.isEmpty) {
        cache.setStockCheckResult(null);
        return true;
      }
      cache.setStockCheckResult({
        'key': 'INSUFFICIENT_STOCK',
        'products': insufficientProducts,
      });
      return false;
    });

    FunctionRegistry.register('getInsufficientStockMessage', (args, stateData) {
      final result = StockBalanceCache.instance.stockCheckResult;
      if (result is Map) {
        final key = result['key'] as String?;
        final products = result['products'] as List?;
        if (key == 'INSUFFICIENT_STOCK' && products != null) {
          String message = '';
          for (int i = 0; i < products.length; i++) {
            final p = products[i] as Map<String, dynamic>;
            final name = p['name'] ?? 'Unknown';
            final required = p['required'] ?? 0;
            final available = p['available'] ?? 0;
            message += '\n$name: $required REQUIRED, $available AVAILABLE';
          }
          return '$key$message';
        }
      }
      return '';
    });
  }

  void _registerViewTransactionFunctions() {
    String getStockEntryTypeFromFields(dynamic fields) {
      if (fields == null) return '';
      if (fields is List) {
        for (var field in fields) {
          if (field is Map && field['key'] == 'stockEntryType') {
            return field['value']?.toString().toUpperCase() ?? '';
          }
        }
      }
      return '';
    }

    FunctionRegistry.register('getFirstPagePartyLabel', (args, stateData) {
      if (args.isEmpty) return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      final stockEntryType = getStockEntryTypeFromFields(args.first);
      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return 'INVENTORY_SENDER_LABEL';
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return 'INVENTORY_RECEIVER_LABEL';
        default:
          return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      }
    });

    FunctionRegistry.register('getFirstPageParty', (args, stateData) {
      if (args.length < 3) return '';
      final stockEntryType = getStockEntryTypeFromFields(args[0]);
      final senderId = args[1]?.toString() ?? '';
      final receiverId = args[2]?.toString() ?? '';
      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return senderId;
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return receiverId;
        default:
          return senderId;
      }
    });

    FunctionRegistry.register('getSecondPagePartyLabel', (args, stateData) {
      if (args.isEmpty) return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      final stockEntryType = getStockEntryTypeFromFields(args.first);
      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return 'INVENTORY_RECEIVER_LABEL';
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return 'INVENTORY_SENDER_LABEL';
        default:
          return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      }
    });

    FunctionRegistry.register('getSecondPageParty', (args, stateData) {
      if (args.length < 3) return '';
      final stockEntryType = getStockEntryTypeFromFields(args[0]);
      final senderId = args[1]?.toString() ?? '';
      final receiverId = args[2]?.toString() ?? '';
      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return receiverId;
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return senderId;
        default:
          return receiverId;
      }
    });
  }
}

class StockBalanceCache {
  StockBalanceCache._();
  static final StockBalanceCache _instance = StockBalanceCache._();
  static StockBalanceCache get instance => _instance;

  String _facilityId = '';
  final Map<String, double> _cache = {};
  dynamic _stockCheckResult;

  String get facilityId => _facilityId;
  Map<String, double> get cache => _cache;
  dynamic get stockCheckResult => _stockCheckResult;

  void setCache(String facilityId, Map<String, double> cache) {
    _facilityId = facilityId;
    _cache.clear();
    _cache.addAll(cache);
    _stockCheckResult = null;
  }

  void setStockCheckResult(dynamic result) {
    _stockCheckResult = result;
  }

  void clear() {
    _facilityId = '';
    _cache.clear();
    _stockCheckResult = null;
  }
}

@Deprecated('Use StockBalanceCache.instance.setCache instead')
void setStockBalanceCache(String facilityId, Map<String, double> cache) {
  StockBalanceCache.instance.setCache(facilityId, cache);
}
