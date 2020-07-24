import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> signInUser({
    @required String email,
    @required String password,
  });

  Future<Either<Failure, LoginModel>> create({
    @required String name,
    @required String email,
    @required String password,
  });

  Future<Either<Failure, LoginModel>> validateToken({
    @required String token,
  });
}
