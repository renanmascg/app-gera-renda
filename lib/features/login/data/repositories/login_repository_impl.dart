import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/login_repository.dart';
import '../datasources/login_local_datasource.dart';
import '../datasources/login_remote_datasource.dart';
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
      @required String password}) async {
    try {
      final cretedUser = await loginRemoteDatasource.createUser(
        email: email,
        password: password,
        name: name,
      );

      await loginLocalDatasource.saveUserData(cretedUser);

      return Right(cretedUser);
    } on ServerException {
      return Left(ServerFailure());
    }
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
