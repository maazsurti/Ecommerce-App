import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences prefs;
  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
     return await prefs.setBool(key, value);
  }

  T getValue<T>(Keys key, T defaultValue) {
    final dynamic value = prefs.get(key.toString());
    if (value != null && value is T) {
      return value;
    } else {
      return defaultValue;
    }
  }
}

enum Keys { isLaunchedForTheFirstTime }
