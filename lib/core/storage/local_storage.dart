import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<bool> setString(String key, String value) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  Future<String> getString(String key) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }

  Future<bool> setInt(String key, int value) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? 0;
  }

  Future<bool> remove(String key) async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
