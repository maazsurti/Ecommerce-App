import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences prefs;
  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }
}
