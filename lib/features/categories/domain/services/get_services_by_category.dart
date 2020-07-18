import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/services_model.dart';
import '../repository/categories_repository.dart';

class GetServicesByCategoryService
    implements Service<ServicesModel, GeoCategoryParams> {
  final CategoriesRepository repository;

  GetServicesByCategoryService({@required this.repository});

  @override
  Future<Either<Failure, ServicesModel>> exec(GeoCategoryParams params) async {
    final categoriesParams = await repository.getServicesByCategory(
      categoryId: params.categoryId,
      lat: params.latitude,
      long: params.longitude,
      distance: params.distance,
    );

    return categoriesParams;
  }
}

class GeoCategoryParams {
  final double latitude;
  final double longitude;
  final double distance;
  final String categoryId;

  GeoCategoryParams({
    @required this.latitude,
    @required this.longitude,
    @required this.distance,
    @required this.categoryId,
  });
}
