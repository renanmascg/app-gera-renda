import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/shared/shared_preferences/shared_keys.dart' as pref_constants;
import '../../../../core/shared/shared_preferences/shared_preferences.dart';

abstract class SearchLocalRepository {
  final CustomSharedPreferences customPreferences;

  SearchLocalRepository({@required this.customPreferences});

  Future<void> saveRecentSearch(String query) async {
    try {
      await customPreferences.savePreferenceString(
          pref_constants.RECENT_QUERYS, query);
    } catch (e) {
      throw LocalSaveException();
    }
  }
}
