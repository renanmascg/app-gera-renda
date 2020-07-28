import 'dart:convert';

import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/shared/shared_preferences/shared_keys.dart'
    as constants;
import '../../../../core/shared/shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

abstract class LoginLocalDatasource {
  Future<void> saveUserData(LoginModel loginModel);

  Future<String> getSavedDataString(String str);
}

class LoginLocalDatasourceImpl implements LoginLocalDatasource {
  final CustomSharedPreferences sharedPreferences;

  LoginLocalDatasourceImpl({@required this.sharedPreferences});

  @override
  Future<void> saveUserData(LoginModel loginModel) async {
    try {
      await sharedPreferences.savePreferenceString(
        constants.USER_INFO,
        json.encode(loginModel.toJson()),
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> getSavedDataString(String str) {
    // TODO: implement getSavedDataString
    throw UnimplementedError();
  }
}
