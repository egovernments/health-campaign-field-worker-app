import 'package:collection/collection.dart';
import 'package:digit_components/utils/app_logger.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Constants {
  static const String localizationApiPath = 'localization/messages/v1/_search';
  static const String checklistPreviewDateFormat = 'dd MMMM yyyy';
  static const String defaultDateFormat = 'dd/MM/yyyy';
  static const String defaultDateTimeFormat = 'dd/MM/yyyy hh:mm a';
  static const String checklistViewDateFormat = 'dd/MM/yyyy hh:mm a';
  static const String healthFacilityChecklistPrefix = 'HF_RF';
}

const String noResultSvg = 'assets/icons/svg/no_result.svg';
const String myChecklistSvg = 'assets/icons/svg/mychecklist.svg';

enum DigitProgressDialogType {
  inProgress,
  dataFound,
  success,
  failed,
  insufficientStorage,
  checkFailed,
  pendingSync,
}

// class DownloadBeneficiary {
//   String title;
//   String projectId;
//   String boundary;
//   String boundaryName;
//   int? pendingSyncCount;
//   int? syncCount;
//   int? totalCount;
//   String? content;
//   int? batchSize;
//   String? primaryButtonLabel;
//   String? secondaryButtonLabel;
//   String? prefixLabel;
//   String? suffixLabel;
//   AppConfiguration? appConfiguartion;
//   DownloadBeneficiary({
//     required this.title,
//     required this.projectId,
//     required this.boundary,
//     required this.boundaryName,
//     this.appConfiguartion,
//     this.pendingSyncCount,
//     this.batchSize,
//     this.syncCount,
//     this.totalCount,
//     this.content,
//     this.primaryButtonLabel,
//     this.secondaryButtonLabel,
//     this.prefixLabel,
//     this.suffixLabel,
//   });
// }
