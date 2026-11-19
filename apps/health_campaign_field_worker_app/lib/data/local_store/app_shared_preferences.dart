import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String isFirstLaunchKey = 'isFirstLaunch';
  static const String userSelectedLocale = 'userSelectedLocale';
  static const String missedPlaceRolesKey = 'missedPlaceRoles';

  SharedPreferences? _sharedPreferences;

  SharedPreferences get sharedPreferences {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not initialized');
    }

    return _sharedPreferences!;
  }

  static final AppSharedPreferences _instance =
      AppSharedPreferences._internal();

  factory AppSharedPreferences() {
    return _instance;
  }

  AppSharedPreferences._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool get isFirstLaunch => sharedPreferences.getBool(isFirstLaunchKey) ?? true;

  String? get getSelectedLocale =>
      sharedPreferences.getString(userSelectedLocale);

  Future<void> appLaunchedFirstTime() async {
    await sharedPreferences.setBool(
      isFirstLaunchKey,
      false,
    );
  }

  Future<void> setSelectedLocale(String localeString) async {
    await sharedPreferences.setString(
      userSelectedLocale,
      localeString,
    );
  }

  /// Roles allowed to add a missed place (MDMS
  /// `HCM.ROLES_FOR_MISSED_PLACES`), saved at project selection.
  List<String> get missedPlaceRoles =>
      sharedPreferences.getStringList(missedPlaceRolesKey) ?? const [];

  Future<void> setMissedPlaceRoles(List<String> roles) async {
    await sharedPreferences.setStringList(missedPlaceRolesKey, roles);
  }
}
