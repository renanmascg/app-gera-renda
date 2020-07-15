import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/categories_model.dart';
import '../repository/categories_repository.dart';

class GetAllCategoriesService implements Service<CategoriesModel,NoParams> {

  final CategoriesRepository repository;

  GetAllCategoriesService({this.repository});
  
  @override
  Future<Either<Failure, CategoriesModel>> exec(NoParams params) async {
    final allCategories = await repository.getAllCategories();

    return allCategories;
  }
  
}