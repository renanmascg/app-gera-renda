import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/services_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoriesModel>> getAllCategories();
  Future<Either<Failure, ServicesModel>> getAllNearMeServices(
      {double lat, double long, double distance});
  Future<Either<Failure, ServicesModel>> getServicesByCategory(
      {double lat, double long, double distance, String categoryId});
  
}
