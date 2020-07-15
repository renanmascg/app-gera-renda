import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/categories_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoriesModel>> getAllCategories();
}