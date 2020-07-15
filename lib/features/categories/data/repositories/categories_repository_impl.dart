import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/categories_repository.dart';
import '../datasources/categories_remote_datasource.dart';
import '../models/categories_model.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource _remoteDatasource;

  CategoriesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, CategoriesModel>> getAllCategories() async {
    try {
      final remoteData = await _remoteDatasource.getAllCategories();

      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
