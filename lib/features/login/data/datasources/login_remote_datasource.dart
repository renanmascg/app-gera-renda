import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/custom_dio.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDatasource {
  Future<LoginModel> signInUser({String email, String password});
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final CustomDio customDio;

  LoginRemoteDatasourceImpl({@required this.customDio});

  @override
  Future<LoginModel> signInUser({String email, String password}) async {
    try {
      final response = await customDio.dio.post('/sessions', data: {
        "email": email,
        "password": password,
      });

      return LoginModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }
}
