import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String isFirstLaunchKey = 'isFirstLaunch';

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

  Future<void> appLaunchedFirstTime() async {
    await sharedPreferences.setBool(
      isFirstLaunchKey,
      false,
    );
  }
}
