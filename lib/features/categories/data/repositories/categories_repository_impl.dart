import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/categories_repository.dart';
import '../datasources/categories_remote_datasource.dart';
import '../models/categories_model.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource remoteDatasource;

  CategoriesRepositoryImpl({@required this.remoteDatasource});

  @override
  Future<Either<Failure, CategoriesModel>> getAllCategories() async {
    try {
      final remoteData = await remoteDatasource.getAllCategories();

      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
