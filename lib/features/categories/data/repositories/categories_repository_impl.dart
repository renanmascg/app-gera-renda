import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/categories_repository.dart';
import '../datasources/categories_remote_datasource.dart';
import '../models/categories_model.dart';
import '../models/services_model.dart';

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

  @override
  Future<Either<Failure, ServicesModel>> getAllNearMeServices(
      {double lat, double long, double distance}) async {
    try {
      final nearServices = await remoteDatasource.getAllNearMeServices(
        lat: lat,
        long: long,
        distance: distance,
      );

      return Right(nearServices);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ServicesModel>> getServicesByCategory(
      {double lat, double long, double distance, String categoryId}) async {
    try {
      final categoryServices = await remoteDatasource.getServicesByCategory(
        lat: lat,
        long: long,
        distance: distance,
        categoryId: categoryId
      );

      return Right(categoryServices);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
