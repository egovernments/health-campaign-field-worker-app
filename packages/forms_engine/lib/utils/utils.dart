import '../blocs/app_localization.dart';
import '../models/property_schema/property_schema.dart';
import '../models/schema_object/schema_object.dart';
import 'package:uuid/uuid.dart';

class Constants {

  static RegExp mobileNumberRegExp =
  RegExp(r'^(?=.{10}$)[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  final String dateFormat = 'dd/MM/yyyy';
  final String communityHealthWorker = 'Community Health Worker';
  final String deliveryTeam = 'Delivery Team';
  final String notAvailable = 'N/A';
  final String dateTimeExtFormat = 'dd-MM-yyyy';
  final String dateMonthYearFormat = 'dd MMM yyyy';
  static const String checklistViewDateFormat = 'dd/MM/yyyy hh:mm a';
}

/// `IdGen` is a singleton class that generates unique identifiers.
/// It uses the `Uuid` package to generate version 1 UUIDs.
class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a version 1 UUID and returns it as a string.
  String get identifier => uuid.v1();
}

String? translateIfPresent(String? key, FormLocalization localizations) {
  if (key == null) return null;
  return localizations.translate(key);
}