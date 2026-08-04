import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String isFirstLaunchKey = 'isFirstLaunch';
  static const String userSelectedLocale = 'userSelectedLocale';
  static const String tenantIdOverrideKey = 'tenantIdOverride';

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

  String? get getTenantIdOverride =>
      sharedPreferences.getString(tenantIdOverrideKey);

  Future<void> setTenantIdOverride(String tenantId) async {
    await sharedPreferences.setString(tenantIdOverrideKey, tenantId);
  }

  Future<void> clearTenantIdOverride() async {
    await sharedPreferences.remove(tenantIdOverrideKey);
  }
}
