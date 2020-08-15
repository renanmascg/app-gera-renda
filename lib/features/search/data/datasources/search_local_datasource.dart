import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/shared/shared_preferences/shared_keys.dart'
    as pref_constants;
import '../../../../core/shared/shared_preferences/shared_preferences.dart';

abstract class SearchLocalRepository {
  Future<void> saveRecentSearch(String query);
}

class SearchLocalRepositoryImpl implements SearchLocalRepository {
  final CustomSharedPreferences customPreferences;

  SearchLocalRepositoryImpl({@required this.customPreferences});

  @override
  Future<void> saveRecentSearch(String query) async {
    try {
      final listQuery =
          await customPreferences.getStringList(pref_constants.RECENT_QUERYS);

      listQuery.insert(0, query);

      final listEnd = listQuery.length <= 10 ? listQuery.length : 10;
      final top10RecentSearches = listQuery.sublist(0, listEnd);

      await customPreferences.setStringList(
          pref_constants.RECENT_QUERYS, top10RecentSearches);
    } catch (e) {
      throw LocalSaveException();
    }
  }
}
