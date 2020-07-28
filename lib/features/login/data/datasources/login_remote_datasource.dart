import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/custom_dio.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDatasource {
  Future<LoginModel> signInUser(
      {@required String email, @required String password});

  Future<LoginModel> createUser(
      {@required String email,
      @required String name,
      @required String password});

  Future<bool> validateToken({
    @required String token,
  });
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

  @override
  Future<LoginModel> createUser(
      {String email, String name, String password}) async {
    try {
      final response = await customDio.dio.post('/users',
          data: {"email": email, "password": password, "name": name});

      return LoginModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> validateToken({String token}) async {
    try {
      customDio.setNewHeaders({'Authorization': 'Bearer $token'});

      await customDio.dio.get('/sessions/validate-token');

      return true;
    } catch (e) {
      throw InvalidTokenException();
    }
  }
}
