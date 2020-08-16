import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../../data/models/search_result_model.dart';
import '../repository/search_repository.dart';

class GetRecentKeywodsService
    implements Service<SearchResultModel, SearchParams> {
  final SearchRepository repository;

  GetRecentKeywodsService({@required this.repository});

  @override
  Future<Either<Failure, SearchResultModel>> exec(SearchParams params) async {
    try {
      final userPosition = await Geolocator().getCurrentPosition();
      final searchResult = await repository.search(
        keyword: params.keyword,
        lat: userPosition.latitude,
        long: userPosition.longitude,
      );

      return searchResult;
    } catch (e) {
      return Left(GeolocationFailure());
    }
  }
}

class SearchParams {
  final String keyword;

  SearchParams({@required this.keyword});
}
