import 'package:dartz/dartz.dart';
import 'package:flutter_gera_renda/core/error/exceptions.dart';
import 'package:flutter_gera_renda/features/login/data/datasources/login_local_datasource.dart';
import 'package:flutter_gera_renda/features/login/data/datasources/login_remote_datasource.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repository/login_repository.dart';
import '../models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;
  final LoginLocalDatasource loginLocalDatasource;

  LoginRepositoryImpl({
    @required this.loginRemoteDatasource,
    @required this.loginLocalDatasource,
  });

  @override
  Future<Either<Failure, LoginModel>> create(
      {@required String name,
      @required String email,
      @required String password}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoginModel>> signInUser({
    @required String email,
    @required String password,
  }) async {
    try {
      final signedUser = await loginRemoteDatasource.signInUser(
          email: email, password: password);

      await loginLocalDatasource.saveUserData(signedUser);

      return Right(signedUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> validateToken({
    @required String token,
  }) {
    // TODO: implement validateToken
    throw UnimplementedError();
  }
}
