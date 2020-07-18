import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/custom_dio.dart';
import '../models/categories_model.dart';
import '../models/services_model.dart';

abstract class CategoriesRemoteDatasource {
  Future<CategoriesModel> getAllCategories();

  Future<ServicesModel> getAllNearMeServices(
      {double lat, double long, double distance});

  Future<ServicesModel> getServicesByCategory(
      {double lat, double long, double distance, String categoryId});
}

class CategorioesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final CustomDio customDio;

  CategorioesRemoteDatasourceImpl({@required this.customDio});

  @override
  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await customDio.dio.get('/categories');

      return CategoriesModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ServicesModel> getAllNearMeServices(
      {double lat, double long, double distance}) async {
    try {
      final response = await customDio.dio.post('/services/near-me',
          data: {"lat": lat, "long": long, "distance": distance});

      return ServicesModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ServicesModel> getServicesByCategory(
      {double lat, double long, double distance, String categoryId}) async {
    try {
      final response = await customDio.dio.post('/services/categorie-service', data: {
        "lat": lat,
        "long": long,
        "distance": distance,
        "categorieId": categoryId,
      });

      return ServicesModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }
}
