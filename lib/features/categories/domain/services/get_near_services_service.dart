import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/services_model.dart';
import '../repository/categories_repository.dart';

class GetNearServicesService extends Service<ServicesModel, GeoParams> {
  final CategoriesRepository repository;

  GetNearServicesService({@required this.repository});

  @override
  Future<Either<Failure, ServicesModel>> exec(GeoParams params) async {
    final serviceModelOrFailure = await repository.getAllNearMeServices(
      distance: params.distance,
      lat: params.latitude,
      long: params.longitude,
    );

    return serviceModelOrFailure;
  }
}

class GeoParams {
  final double latitude;
  final double longitude;
  final double distance;

  GeoParams({
    @required this.latitude,
    @required this.longitude,
    @required this.distance,
  });
}
