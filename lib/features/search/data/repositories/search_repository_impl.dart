import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repository/search_repository.dart';
import '../datasources/search_local_datasource.dart';
import '../datasources/search_remote_datasource.dart';
import '../models/search_result_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalRepository localRepository;
  final SearchRemoteDatasource remoteDatasource;

  SearchRepositoryImpl({
    @required this.localRepository,
    @required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, SearchResultModel>> search({
    String keyword,
    double lat,
    double long,
  }) async {
    try {
      await localRepository.saveRecentSearch(keyword);

      final searchResult = await remoteDatasource.searchRemote(
        keyword: keyword,
        lat: lat,
        long: long,
      );

      return Right(searchResult);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> recentKeywords() async {
    try {
      final words = await localRepository.getRecentSearch();

      return Right(words);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
