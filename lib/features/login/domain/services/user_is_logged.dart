import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../../../core/shared/shared_preferences/shared_keys.dart';
import '../../../../core/shared/shared_preferences/shared_preferences.dart';
import '../../data/models/login_model.dart';
import '../repository/login_repository.dart';

class UserIsLoggedService extends Service<bool, NoParams> {
  final CustomSharedPreferences customSharedPreferences;
  final LoginRepository loginRepository;

  UserIsLoggedService({
    @required this.customSharedPreferences,
    @required this.loginRepository,
  });

  @override
  Future<Either<Failure, bool>> exec(NoParams params) async {
    final token = await _getToken();

    if (token.isEmpty) {
      return Left(NoTokenFailure());
    }

    final validOrFailure = await loginRepository.validateToken(token: token);

    return validOrFailure;
  }

  Future<String> _getToken() async {
    final loginModelString =
        await customSharedPreferences.getPreferenceString(USER_INFO);

    if (loginModelString.isEmpty) {
      return '';
    }

    final loginModel = LoginModel.fromJson(
        json.decode(loginModelString) as Map<String, dynamic>);

    return loginModel.token;
  }
}
