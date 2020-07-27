import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/login_model.dart';
import '../repository/login_repository.dart';

class CreateUserService implements Service<LoginModel, CreateUserParams> {
  final LoginRepository loginRepository;

  CreateUserService({@required this.loginRepository});

  @override
  Future<Either<Failure, LoginModel>> exec(CreateUserParams params) async {
    final failureOrCreated = await loginRepository.create(
      email: params.email,
      password: params.password,
      name: params.name,
    );

    return failureOrCreated;
  }
}

class CreateUserParams {
  final String name;
  final String email;
  final String password;

  CreateUserParams({
    @required this.name,
    @required this.email,
    @required this.password,
  });
}
