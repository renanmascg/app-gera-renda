import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/search_result_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResultModel>> search({
    @required String keyword,
    @required double lat,
    @required double long,
  });
}
