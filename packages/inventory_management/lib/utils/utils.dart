// Importing necessary packages and modules
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/data/repositories/local/stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/entities/inventory_transport_type.dart';

/// This class contains custom validators for form controls.
class CustomValidator {
  /// Validates that the control's value is a valid stock count.
  /// The value must be a non-negative integer less than or equal to 10000.
  static Map<String, dynamic>? validStockCount(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return {'required': true};
    }

    var parsed = int.tryParse(control.value) ?? 0;
    if (parsed < 0) {
      return {'min': true};
    } else if (parsed > 10000) {
      return {'max': true};
    }

    return null;
  }
}

// This is a singleton class for inventory operations.
class InventorySingleton {
  static final InventorySingleton _singleton = InventorySingleton._internal();

  // Factory constructor that returns the singleton instance.
  factory InventorySingleton() {
    return _singleton;
  }

  // Private constructor for the singleton pattern.
  InventorySingleton._internal();

  // Instance of the InventoryListener.

  // Various properties related to the inventory.
  String _projectId = '';
  UserModel? _loggedInUser;
  String? _loggedInUserUuid = '';
  String? _boundaryName = '';
  BoundaryModel? _boundaryModel;
  String? _tenantId = '';
  bool _isDistributor = false;
  bool _isWareHouseMgr = false;
  List<InventoryTransportTypes>? _transportType = [];
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  bool _isLgaUser = false;
  bool _isCDD = false;
  bool _isHFU = false;
  bool _isHealthFacilitySupervisor = false;
  bool _isCommunityDistributor = false;

  Map<String, TemplateConfig>? _templateConfigs;
  String? _manageStockConfig;
  // Sets the initial data for the inventory.
  void setInitialData({
    String? loggedInUserUuid,
    required String projectId,
    required bool isDistributor,
    required bool isWareHouseMgr,
    List<InventoryTransportTypes>? transportTypes,
    UserModel? loggedInUser,
    required bool isLgaUser,
    required bool isCDD,
    required bool isHFU,
    required bool isHealthFacilitySupervisor,
    required bool isCommunityDistributor,
  }) {
    _projectId = projectId;
    _loggedInUserUuid = loggedInUserUuid;
    _transportType = transportTypes;
    _isDistributor = isDistributor;
    _isWareHouseMgr = isWareHouseMgr;
    _transportType = transportTypes;
    _loggedInUser = loggedInUser;
    _isLgaUser = isLgaUser;
    _isCDD = isCDD;
    _isHFU = isHFU;
    _isHealthFacilitySupervisor = isHealthFacilitySupervisor;
    _isCommunityDistributor = isCommunityDistributor;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

  void setBoundaryName({required String boundaryName}) {
    _boundaryName = boundaryName;
  }

  void setTenantId({required String tenantId}) {
    _tenantId = tenantId;
  }

  // Getters for the properties.
  get projectId => _projectId;
  get loggedInUserUuid => _loggedInUserUuid;
  get boundaryName => _boundaryName;
  BoundaryModel? get boundary => _boundaryModel;
  get isDistributor => _isDistributor;
  get isWareHouseMgr => _isWareHouseMgr;
  get transportType => _transportType;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;
  UserModel? get loggedInUser => _loggedInUser;

  get isLgaUser => _isLgaUser;

  get isCDD => _isCDD;
  get isHFU => _isHFU;
  get isHealthFacilitySupervisor => _isHealthFacilitySupervisor;
  get isCommunityDistributor => _isCommunityDistributor;

  // form config

  void setTemplateConfigs(Map<String, TemplateConfig> templateConfigs) {
    _templateConfigs = templateConfigs;
  }

  void setManageStockConfig(String registrationConfig) {
    _manageStockConfig = registrationConfig;
  }

  String? get manageStockConfig => _manageStockConfig;
  Map<String, TemplateConfig>? get templateConfigs => _templateConfigs;

  // end

  String formatDateFromMillis(int millis) {
    final date = DateTime.fromMillisecondsSinceEpoch(millis);
    final day = date.day.toString().padLeft(2, '0');
    final month = _monthShort(date.month);
    final year = date.year;
    return '$day $month $year';
  }

  String _monthShort(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

String getSecondaryPartyValue(StockModel? stock) {
  // Use a guard clause for null safety
  if (stock == null) return "";

  // For a RECEIPT, the other party is always the SENDER.
  if (stock.transactionType == "RECEIVED") {
    // This now correctly handles your case without checking senderType.
    return 'FAC_${stock.senderId}';
  }

  // For a DISPATCH, the other party is the RECEIVER.
  // Here we can keep the special logic for STAFF receivers.
  if (stock.transactionType == "DISPATCHED") {
    if (stock.receiverType == "STAFF") {
      return stock.additionalFields?.fields
              .firstWhereOrNull((e) => e.key == "distributorName")
              ?.value ??
          "Delivery Team";
    } else {
      return 'FAC_${stock.receiverId}';
    }
  }

  // Provide a sensible fallback for any other transaction types
  return 'FAC_${stock.receiverId ?? ''}';
}

class UniqueIdGeneration {
  Future<Set<String>> generateUniqueId({
    required String localityCode,
    required String loggedInUserId,
    required bool returnCombinedIds,
  }) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // Get the Android ID
    String androidId = androidInfo.serialNumber == 'unknown'
        ? androidInfo.id.replaceAll('.', '')
        : androidInfo.serialNumber;

    // Get current timestamp
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // Combine the Android ID with the timestamp
    String combinedId = '$loggedInUserId$androidId$localityCode$timestamp';

    // Generate SHA-256 hash
    List<int> bytes = utf8.encode(combinedId);
    Digest sha256Hash = sha256.convert(bytes);

    // Convert the hash to a 12-character string and make it uppercase
    String hashString = sha256Hash.toString();
    String uniqueId = hashString.substring(0, 12).toUpperCase();

    // Add a hyphen every 4 characters, except the last
    String formattedUniqueId = uniqueId.replaceAllMapped(
      RegExp(r'.{1,4}'),
      (match) => '${match.group(0)}-',
    );

    // Remove the last hyphen
    formattedUniqueId =
        formattedUniqueId.substring(0, formattedUniqueId.length - 1);

    if (kDebugMode) {
      print('uniqueId : $formattedUniqueId');
    }

    return returnCombinedIds
        ? {formattedUniqueId, combinedId}
        : {formattedUniqueId};
  }

  Future<Set<String>> generateUniqueMaterialNoteNumber({
    required String loggedInUserId,
    required bool returnCombinedIds,
  }) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    String androidId = androidInfo.serialNumber == 'unknown'
        ? androidInfo.id.replaceAll('.', '')
        : androidInfo.serialNumber;

    int timestamp = DateTime.now().millisecondsSinceEpoch;

    String combinedId = '$loggedInUserId$androidId$timestamp';

    // Generate SHA-256 hash
    List<int> bytes = utf8.encode(combinedId);
    Digest sha256Hash = sha256.convert(bytes);

    // Convert the hash to a 12-character string and make it uppercase
    String hashString = sha256Hash.toString();
    String uniqueId = hashString.substring(0, 12).toUpperCase();

    // Add a hyphen every 4 characters
    String formattedUniqueId = uniqueId.replaceAllMapped(
      RegExp(r'.{1,4}'),
      (match) => '${match.group(0)}-',
    );

    // Remove the last hyphen
    formattedUniqueId =
        formattedUniqueId.substring(0, formattedUniqueId.length - 1);

    if (kDebugMode) {
      print('uniqueId : $formattedUniqueId');
    }

    return returnCombinedIds
        ? {formattedUniqueId, combinedId}
        : {formattedUniqueId};
  }
}

class CustomStockMethods {
  Future<List<StockModel>> getStockBasedonProductVariantId(
      StockLocalRepository stockRepo, String productVariantId) async {
    final result = await stockRepo.search(
        StockSearchModel(productVariantId: productVariantId),
        InventorySingleton().loggedInUserUuid);
    return result;
  }
}

final Map<String, PageRouteInfo> routerMap = {
  'stock-acknowledgement': InventoryAcknowledgementRoute(),

  // Add more routes here
};
