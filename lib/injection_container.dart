import 'package:get_it/get_it.dart';

import 'core/network/custom_dio.dart';
import 'features/categories/data/datasources/categories_remote_datasource.dart';
import 'features/categories/data/repositories/categories_repository_impl.dart';
import 'features/categories/domain/repository/categories_repository.dart';
import 'features/categories/domain/services/get_all_categories_service.dart';
import 'features/categories/presentation/mobx/categories/categories_store.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // Register MOBX
  serviceLocator.registerLazySingleton(
      () => CategoriesStore(getAllCategoriesService: serviceLocator()));

  // Services
  serviceLocator.registerLazySingleton(
      () => GetAllCategoriesService(repository: serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(remoteDatasource: serviceLocator()));

  // Datasources
  serviceLocator.registerLazySingleton<CategoriesRemoteDatasource>(
      () => CategorioesRemoteDatasourceImpl(customDio: serviceLocator()));

  // Core
  serviceLocator.registerLazySingleton(() => CustomDio());
}
