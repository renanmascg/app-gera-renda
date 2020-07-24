import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  SharedPreferences _preferences;

  Future<void> savePreferenceString(String key, String value) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(key, value);
  }

  Future<String> getPreferenceString(String key) async {
    _preferences = await SharedPreferences.getInstance();
    final pref = _preferences.getString(key);
    return pref ?? '';
  }
}
