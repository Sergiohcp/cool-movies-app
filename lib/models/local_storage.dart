import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<String?> getItem(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    return value;
  }

  static Future<void> setItem(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
