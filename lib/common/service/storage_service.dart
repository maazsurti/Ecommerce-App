import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences prefs;

  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  setBool(String key, bool value) async {
    return prefs.setBool(key, value);
  }

  setValue(String key, String value) async {
    return prefs.setString(key, value);
  }

  T getValue<T>(Keys key, T defaultValue) {
    final dynamic value = prefs.get(key.toString());
    if (value != null && value is T) {
      return value;
    } else {
      return defaultValue;
    }
  }

  bool get isFirstLaunch {
    final bool isFirstLaunch =
        prefs.getBool(Keys.isLaunchedForTheFirstTime.name) ?? false;
    if (isFirstLaunch == true) {
      prefs.setBool(Keys.isLaunchedForTheFirstTime.name, false);
    }
    return getValue(Keys.isLaunchedForTheFirstTime, false);
  }

  bool get isUserLoggedIn {
    final bool isUserLoggedIn =
        prefs.getBool(Keys.isUserLoggedIn.name) ?? false;
    return isUserLoggedIn;
  }
}

enum Keys { isLaunchedForTheFirstTime, isUserLoggedIn }
