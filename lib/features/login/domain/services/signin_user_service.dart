import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/login_model.dart';
import '../repository/login_repository.dart';

class SigninUserService implements Service<LoginModel, SigninParams> {
  final LoginRepository loginRepository;

  SigninUserService({@required this.loginRepository});

  @override
  Future<Either<Failure, LoginModel>> exec(SigninParams params) async {
    final failureOrLogin = await loginRepository.signInUser(
        email: params.email, password: params.password);

    return failureOrLogin;
  }
}

class SigninParams {
  final String email;
  final String password;

  SigninParams({
    @required this.email,
    @required this.password,
  });
}
