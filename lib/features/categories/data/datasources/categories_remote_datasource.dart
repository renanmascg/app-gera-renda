import '../../../../core/error/exceptions.dart';
import '../../../../core/network/custom_dio.dart';
import '../models/categories_model.dart';

abstract class CategoriesRemoteDatasource {
  Future<CategoriesModel> getAllCategories();
}

class CategorioesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final CustomDio customDio;

  CategorioesRemoteDatasourceImpl(this.customDio);

  @override
  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await customDio.dio.get('/categories');

      return CategoriesModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }
}
