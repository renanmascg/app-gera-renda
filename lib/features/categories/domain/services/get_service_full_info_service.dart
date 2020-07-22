import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/service_full_info/service_full_info_model.dart';
import '../repository/categories_repository.dart';

class GetServiceFullInfoService extends Service<ServiceFullInfo, GeoIdParams> {
  final CategoriesRepository repository;

  GetServiceFullInfoService({this.repository});

  @override
  Future<Either<Failure, ServiceFullInfo>> exec(GeoIdParams params) async {
    final serviceOrFailure = await repository.getServiceFullInfo(
        id: params.id, lat: params.latitude, long: params.longitude);

    return serviceOrFailure;
  }
}

class GeoIdParams {
  final String id;
  final double latitude;
  final double longitude;

  GeoIdParams({this.id, this.latitude, this.longitude});
}
