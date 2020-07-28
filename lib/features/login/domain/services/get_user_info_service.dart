import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../../../core/shared/shared_preferences/shared_keys.dart';
import '../../../../core/shared/shared_preferences/shared_preferences.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';

class GetUserInfoService extends Service<UserModel, NoParams> {
  final CustomSharedPreferences customSharedPreferences;

  GetUserInfoService({@required this.customSharedPreferences});

  @override
  Future<Either<Failure, UserModel>> exec(NoParams params) async {
    final loginModelString =
        await customSharedPreferences.getPreferenceString(USER_INFO);

    if (loginModelString.isEmpty) {
      return Left(NoTokenFailure());
    }

    final loginModel = LoginModel.fromJson(
        json.decode(loginModelString) as Map<String, dynamic>);

    return Right(loginModel.user);
  }
}
