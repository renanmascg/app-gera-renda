import 'package:flutter_gera_renda/core/error/exceptions.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/custom_dio.dart';
import '../models/search_result_model.dart';

abstract class SearchRemoteDatasource {
  Future<SearchResultModel> searchRemote({
    @required String keyword,
    @required double lat,
    @required double long,
  });
}

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  final CustomDio customDio;

  SearchRemoteDatasourceImpl({@required this.customDio});

  @override
  Future<SearchResultModel> searchRemote({
    String keyword,
    double lat,
    double long,
  }) async {
    try {
      final response = await customDio.dio.post('/services/find',
          data: {"lat": lat, "long": long, "keyword": keyword});

      return SearchResultModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }
}
