import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  SharedPreferences _preferences;

  Future<void> init(SharedPreferences sharedPreferences) async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> savePreferenceString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<String> getPreferenceString(String key) async {
    final pref = _preferences.getString(key);
    return pref ?? '';
  }
}
