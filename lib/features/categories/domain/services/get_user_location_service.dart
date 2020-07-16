import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';

class GetUserLocationService extends Service<Position, NoParams> {
  @override
  Future<Either<Failure, Position>> exec(NoParams params) async {
    final geolocator = Geolocator();

    // final geoPermission = await geolocator.isLocationServiceEnabled();
    // if (!geoPermission) {
      
    // }

    try {
      final userPosition = await geolocator.getCurrentPosition();

      return Right(userPosition);
    } catch (e) {
      return Left(GeolocatorAccessFailure());
    }
  }

}