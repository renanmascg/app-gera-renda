import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  final SharedPreferences sharedPreferences;

  CustomSharedPreferences({@required this.sharedPreferences});

  Future<void> savePreferenceString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  Future<String> getPreferenceString(String key) async {
    final pref = sharedPreferences.getString(key);
    return pref ?? '';
  }

  Future removePreference(String key) async {
    await sharedPreferences.remove(key);
  }

  Future setStringList(String key, List<String> list) async {
    await sharedPreferences.setStringList(key, list);
  }

  Future<List<String>> getStringList(String key) async {
    return sharedPreferences.getStringList(key);
  }
}
